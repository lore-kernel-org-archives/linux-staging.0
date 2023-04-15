Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235581868
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 12:01:46 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id fy21so9195983ejb.9
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681560104; x=1684152104;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loYQo7M8BRPGuxyliqbEUne9rPks6JWwMjKdxM22SSs=;
        b=jGVB7otariHvjr7dnZp+PuOdufOikW2BI2GlBSWMchRZ/oWSZKSFOjFNHoRnRBMg1t
         nNAw7Wzxsi7+Lis/dyrW0cGw6pqTWLQ0u+Z3K3znc92K1AaKAolwEnuU3q1OKDkUhe5N
         NDbJ7VLGeiCuHcjkNpSrY+nMJ/YHAaI3rtL2S+9LaMhwqCbDFpmXzAI4pdZ1u6sL11bp
         IFPFDALNa4XEz0TQ8YVZEbW8cjsVaxW287NPOj7wdl/r3BEfulTpE2xkSaxhI1N+a6pN
         dmYUD/MJPssGuHVLPvmoNmAjP+7dESXdwTQ9SRRrOClps9xT1rf4icBZVBxjSgD+9ZBz
         TaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681560104; x=1684152104;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loYQo7M8BRPGuxyliqbEUne9rPks6JWwMjKdxM22SSs=;
        b=eqGWqNhGY0EEXxUi9QCgotx4OVjj//1rxI3/ULbKM2gf03FB5AyZmK4PWVk4Mces5E
         Sm8oBHi8kg+P9mmbE+oJGp4HKvXrk8li6Dp4f4/L3tM0lAOLJ4yfDqm/A1Xssdow8jpU
         GQZbRSFMDLThvspuLetWvXgVwyaRqPPGWvJXkkE+gYTyAXQ9UZuT06HR+NFxTbSauobl
         qrhDOVKCJTd099virSCcmgQFM8aTF/aRWXxBrjthCWCXtQ3H5TjC5kl3Yuwgs0a4XLhx
         q0burZRFL15PyGKGd0WCOAU8rGjYXEt6CMtxkQueehtDZDZUwPskPhU3kbuwMx7+RN1S
         qo3Q==
X-Gm-Message-State: AAQBX9f/LTwNDa5N4c54G68p/ueD3+MEMqfVNFVSfjAgL2ASnyt39FLC
	Bk3RLTCZttb022gmnUaKyQ==
X-Google-Smtp-Source: AKy350YmaFJs1/xmFhjwsAqRQVbz9nW/no3u7zgOjqOjWNPqPuCBTPhi2s2MDnm4zhfZCCNPVriEgw==
X-Received: by 2002:a17:906:b756:b0:94a:82ca:12e5 with SMTP id fx22-20020a170906b75600b0094a82ca12e5mr1872166ejb.45.1681560104212;
        Sat, 15 Apr 2023 05:01:44 -0700 (PDT)
Received: from koolguy (dslb-002-205-192-117.002.205.pools.vodafone-ip.de. [2.205.192.117])
        by smtp.gmail.com with ESMTPSA id wz4-20020a170906fe4400b0094eeda0df09sm1930184ejb.179.2023.04.15.05.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 05:01:43 -0700 (PDT)
Date: Sat, 15 Apr 2023 14:01:41 +0200
From: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: octeon: remove typedef declaration
Message-ID: <20230415120141.GA6585@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch.pl warning for enums.

Change typedef cvmx_helper_interface_mode_t to
enum cvmx_helper_interface_mode in ethernet.c

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
---
Changes in V2:
-Remove Alignment fixes from previous version.

 drivers/staging/octeon/ethernet.c     |  2 +-
 drivers/staging/octeon/octeon-stubs.h | 39 +++++++++++++--------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 9eee28f2940c..023b107e077a 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..58708a7f727a 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -213,14 +213,14 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -231,20 +231,20 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -252,7 +252,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 enum cvmx_pow_tag_type {
 	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
@@ -1265,8 +1265,7 @@ static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-								   interface)
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
 {
 	return 0;
 }
@@ -1342,11 +1341,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1356,13 +1355,13 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+				       enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
@@ -1381,12 +1380,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
-		uint64_t queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(uint64_t port,
+		    uint64_t queue, union cvmx_pko_command_word0 pko_command,
+		    union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.25.1

