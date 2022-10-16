
;; bloodfuse
;; <add a description here>

;; constants

(define-constant ERR_STX_TRANSFER u01)
;;

;; data maps and vars
(define-data-var price uint u100)
(define-data-var SUCCESS_MESSAGE (string-utf8 500) u"STX has been sent")
;;

;; private functions
;;

;; public functions
(define-public (send_stx (to (string-utf8 500)))
    (let ((cur-price (var-get price))
          (new-price (+ cur-price u10)))
        
        ;; pay the contract
        (unwrap! (stx-transfer? cur-price tx-sender (as-contract tx-sender)) (err ERR_STX_TRANSFER))

        ;; return the updated price
        (ok (var-get SUCCESS_MESSAGE))
    )
)

;;
