      SUBROUTINE VF_ZXMP_IRECVD(DBUF,N,ISRC,IREQ,IERR)

CD=== 概要 ===========================================================

CDT   VF_ZXMP_IRECVD:MPIマスク/1対1非ブロッキング受信/実数

C==== 宣言 ===========================================================

C     -- 大域型 --
      IMPLICIT INTEGER(I-N),DOUBLE PRECISION(A-H,O-Z)

C     -- 大域変数 --
      INCLUDE 'mpif.h'
      INCLUDE 'VF_A0PRM.h'
      INCLUDE 'VF_APARAI.h'

CD    -- 引数 --
CD    DBUF(N) : OUT : R*8 : 受信するデータ
CD    N       : IN  : I*4 : データの要素数
CD    ISRC    : IN  : I*4 : 送信元のランク
CD    IREQ    : OUT : I*4 : リクエスト
CD    IERR    : OUT : I*4 : 完了コード
      DIMENSION DBUF(N)

C==== 実行 ===========================================================

C     -- MPIルーチン --
      CALL MPI_IRECV(DBUF,N,MPI_DOUBLE_PRECISION,ISRC,0,
     &               MGCOMM,IREQ,IERR)

C     -- 実行文の終了 --
      GOTO 9999

C==== 終了 ===========================================================

 9999 CONTINUE
      RETURN
      END
