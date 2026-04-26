Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523222222C5
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777173066; cv=none; b=qnNdSIgH5FyfJt/fxpv2cqrSMZKoU2/NLNvlumn80ZnoiupksIETOrhL/LYlf1Km+UEW5ziKw/Sxt2NYYMUEES4WwvU+qth2+HUU5FxhuFp+ydmwi5XWJ2cwniGKwNNmEHLorRO4bU/Sk2P1jTYERkV26OLpxy5HrVlriF5jq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777173066; c=relaxed/simple;
	bh=bND4NZ92gkOhzz2yhi0CQGsTVGEBKQQPVVGPNQWwArA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXdLW67My+gxDzCcqDXy1dR5YDHRrxK+C5BU8ihzLKHVhN3CjTdNKuDsJUuBCSjpBC/SH9+ELuQLOiLUj3ESKRnM6nrIYYhWkJUuthLuvnBOxH7877dymFGoq37DfDC0pi3uPNwzU6S7cHGdlKJbWX6dMDEEBFOEsNfy2cIb2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1INfeZI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1INfeZI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad617d5b80so53143325ad.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 20:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777173064; x=1777777864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXNdM0nDs1ysyRJQ3ZFY4/74xWe4tcjuZYdpv/C1sCY=;
        b=Y1INfeZI9vifm5730qS0PJ5dcUxzBJCWZ+UbzLqx3W5gZeRrvKkoHCal/GQn8GZKab
         ULAbvauP0klxfrT/L60h1mmI14MVyFJSjGzFEUuI25rPVMUE1JLudIRHeavn+6v6d8gs
         52M+A2GnEj46DgNlXYNnK2BQ416O4GQLV8m8mImK1XIj+fP+cuYJ102DINzKFVuyC/G1
         SniJp+s2rtQg2NspGtdLoiTbNj9rdESBne5ie1Jx2XExWaK8xvY6bA/I2VTGZoCMkLD2
         5r4w2hV4m0xKI+OhYz3rE0gan9MiObRMdfheSbgITEVBSBYCairQT5knpTk7U4duRAZx
         vCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777173064; x=1777777864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXNdM0nDs1ysyRJQ3ZFY4/74xWe4tcjuZYdpv/C1sCY=;
        b=JIyZaLvNyYtr3MZTtRnpY/wpXoExR/RImiFumeZlBTpIqKBisosXKH5oDRhRtRJhqP
         1k5BvlNa1Ik9oPLddVwTksiyirnW0JXveSov6BfEgMnmpQmk8NfaDkC71RFlxQ7QxYE4
         MQMG8KQu4cIQVLZ4ndTNAni9EAQ3u//jjkBg7FiJH2puo9JkotaOwEGx22u+jRic0aNi
         4GVxKxmjAZMzAlOby3id1PE16xmUlKx9RY7e84Tu/KbFBynFviusjejyPnLbmancHXxb
         2/nQwckHiE3gyoVA8tf/HVuDkapWBf66bkz5GcCY8MYx9bhrv5jJqFVpYyCH1FYC6x0M
         6Kjw==
X-Forwarded-Encrypted: i=1; AFNElJ/wyh3D7IfoJFS8xSQTER1dGCMxbFuwpktkbyHvkfWayGCXZbFOOBiaTm9/7pXGxn/u1aV3nWX8r3hBsjLC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1NvG5KJ01NH4cXCRHniH59uiNr2Uov5HIiWlnW+84FfS7Mhdt
	GtkWgWxMJhlkiT5Tv1j3zBL+gVGqvtnvcDG05Es+aGNIQLobEFwtXW3t
X-Gm-Gg: AeBDietZAe266OWw0HvZVpNzZAT5JK3Inu4yOo8dkKXa6crVH2SBEkWFhylfvpw/jpC
	JnNthTGTg54p5S0fnruK4TmfkOM815IUuQjVaK01K07peU5tq+FTFv5vj2vqjGxXbcsob6Sz29z
	LYduwDJDHgBQNefmryTjyDrTByHf//Kuhe5ri7iyt2bUewmMUBmdpDkFW3MOHKYFVRMiFEn2cKY
	jZPDF0KyLPkjbD1ANUBD9SywOn6JME1mPr8z71YzpdQ1mw169mPOi5eSAtqRs7PBZgBW5klh9L6
	eETrSrAlxG1OVp/4qXPSufSN+JslL/oaOls97NIxBmmlxV/C0Mio8Ckm4M3QDo66XAqeYfQkJ31
	TK7ifj9IOq+gKKTKLk+PW0rm2atWodGC8xOdd6Ax9ph31awJmPJhSddpP/59fsnvJgwut3lDkqD
	2EYv/mgQt3gYX9nJQnSqQYLPO1rqJOe2eqZLGu3CohjkvorhrybXzpQceFed+R4MxN
X-Received: by 2002:a17:903:8c6:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2b5f9eddc7emr406105735ad.16.1777173064481;
        Sat, 25 Apr 2026 20:11:04 -0700 (PDT)
Received: from DESKTOP-R76JGJA.localdomain (vps-25d44ef0.vps.ovh.us. [2604:2dc0:202:300::22df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab405f3sm263701005ad.78.2026.04.25.20.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 20:11:03 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoelvis Oliveros <yoelvisoliveros@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: remove typedefs from octeon-stubs.h
Date: Sun, 26 Apr 2026 11:11:00 +0800
Message-ID: <20260426031100.97996-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style discourages the use of typedefs for
enums and structs. checkpatch reports seven "do not add new typedefs"
warnings on drivers/staging/octeon/octeon-stubs.h.

Drop the typedef wrappers in octeon-stubs.h and convert the affected
users in ethernet.c and octeon-ethernet.h to use the underlying
'enum cvmx_*' / 'struct cvmx_*' tags directly.

No functional change. Compile-tested with CONFIG_COMPILE_TEST=y and
CONFIG_OCTEON_ETHERNET=m on x86_64; both default and W=1 builds are
clean.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 drivers/staging/octeon/ethernet.c        |  6 +--
 drivers/staging/octeon/octeon-ethernet.h |  2 +-
 drivers/staging/octeon/octeon-stubs.h    | 48 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..d85a9991faf6 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
diff --git a/drivers/staging/octeon/octeon-ethernet.h b/drivers/staging/octeon/octeon-ethernet.h
index a6140705706f..d369c97c1332 100644
--- a/drivers/staging/octeon/octeon-ethernet.h
+++ b/drivers/staging/octeon/octeon-ethernet.h
@@ -57,7 +57,7 @@ struct octeon_ethernet {
 	struct net_device *netdev;
 	/*
 	 * Type of port. This is one of the enums in
-	 * cvmx_helper_interface_mode_t
+	 * cvmx_helper_interface_mode
 	 */
 	int imode;
 	/* PHY mode */
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 291eaffd2543..c39e7e307346 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -215,14 +215,14 @@ enum cvmx_fau_op_size {
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
@@ -233,20 +233,20 @@ typedef enum {
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
@@ -254,7 +254,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 enum cvmx_pow_tag_type {
 	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	u32 dropped_octets;
 	u32 dropped_packets;
 	u32 pci_raw_packets;
@@ -409,13 +409,13 @@ typedef struct {
 	u32 inb_packets;
 	u64 inb_octets;
 	u16 inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status {
 	u32 packets;
 	u64 octets;
 	u64 doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	u64 u64;
@@ -1260,14 +1260,14 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
@@ -1344,11 +1344,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					      enum cvmx_pow_wait wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1358,13 +1358,13 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					   enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
@@ -1383,12 +1383,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.43.0

