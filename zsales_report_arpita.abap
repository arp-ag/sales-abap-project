REPORT zsales_report_arpita.

TYPES: BEGIN OF ty_sales,
         vbeln TYPE vbak-vbeln,
         erdat TYPE vbak-erdat,
         kunnr TYPE vbak-kunnr,
         netwr TYPE vbak-netwr,
       END OF ty_sales.

DATA: it_sales    TYPE TABLE OF ty_sales,
      it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv,
      it_layout   TYPE slis_layout_alv.

SELECT-OPTIONS: so_date FOR vbak-erdat.

START-OF-SELECTION.

SELECT vbeln erdat kunnr netwr
  INTO TABLE it_sales
  FROM vbak
  WHERE erdat IN so_date
  UP TO 50 ROWS.

IF sy-subrc <> 0.
  MESSAGE 'No records found for selected input' TYPE 'I'.
  EXIT.
ENDIF.

DATA: lv_count TYPE i.
lv_count = LINES( it_sales ).

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'VBELN'.
wa_fieldcat-tabname   = 'IT_SALES'.
wa_fieldcat-seltext_m = 'Order ID'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'ERDAT'.
wa_fieldcat-tabname   = 'IT_SALES'.
wa_fieldcat-seltext_m = 'Order Date'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'KUNNR'.
wa_fieldcat-tabname   = 'IT_SALES'.
wa_fieldcat-seltext_m = 'Customer ID'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-fieldname = 'NETWR'.
wa_fieldcat-tabname   = 'IT_SALES'.
wa_fieldcat-seltext_m = 'Total Amount'.
wa_fieldcat-do_sum    = 'X'.
APPEND wa_fieldcat TO it_fieldcat.

it_layout-zebra = 'X'.
it_layout-colwidth_optimize = 'X'.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_program_name = sy-repid
    it_fieldcat    = it_fieldcat
    is_layout      = it_layout
  TABLES
    t_outtab       = it_sales.

IF sy-subrc <> 0.
  MESSAGE 'Error displaying report' TYPE 'E'.
ENDIF.
