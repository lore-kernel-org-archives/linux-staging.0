Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EDF18AF6
	for <linux-staging@lists.linux.dev>; Sun,  4 Feb 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707038529; cv=none; b=odALlNNlgZ37bQoua84cz9LnSBi+TgmFHZ5k27QdenVzEBchSbtTdB89USjhtHuAk0pBnY4ZRI8J45RWN4XWoLvWZp76NcggP6ZRiz1clYxVZQI1pkECx+TbfZo0smhRZ7g830rbjEz++Hyzz8HP+B8ln3St35UgVXSVT62V4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707038529; c=relaxed/simple;
	bh=t1qT+u62SVFYcZrdEHVwU6Z/UUXG+0fp+Ji8P+TLijY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJlYDGW7d1r9QBdf9s7iGUOUAH+KdrR3tTCBu3nsHDIvoWUL5G/Ln+ZzEYBGb60Jj7y2mJu76nQxmyqPRIkBxtdASUyH/KvYCcuHoJtQ/hvIaTrs7KgpF0kPAqFiToCBzzvrB0sXz0pwSWd2UyXGTFrEOoLgb/VJQrOP3UgU1Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrUh4BEv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrUh4BEv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a379ae4a150so17104766b.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Feb 2024 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707038526; x=1707643326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7telH8WoMZCFUj2oHNemi9WC+FcKRaY8/2mCn+d2kE=;
        b=VrUh4BEvz655OA+Y5P+3MkvokMYtjlvD6/KhuU88LIc14+SD0jjg0XYHfQUe8KBoGy
         IJXMYEx698deGxnLwevf/kqGf0Tb1AGE4kfz1lgzadtFy5osI6WFpcBTds0nTiRZCa0A
         b91vkLGgr2lTKFv96s60G4bybn2bzMuzvWgUoouMiBqlQ+hTuO+LKPhB4TGlGnbVrxzy
         N3Ocn+fYdczMOe472Z7GeImxi1o5CpmlrJCvug8XoksII1VNu2ary7ei3CQEdWr6SxRu
         cqHFWOgkKmttnphJNe1HkVhCG5SejdQKrb9QotjPL4lJVYcId1PQYvs1gwLOQchIBhjZ
         0lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707038526; x=1707643326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7telH8WoMZCFUj2oHNemi9WC+FcKRaY8/2mCn+d2kE=;
        b=SAOhGwWMB1FFRfR2FwBFHsL+17xPgpkTGNAwYGAw/27T1JhebJawkZUV3ZbFbH9O5h
         hl2ox2FjG0D5w5ryUc5vOsBE8c0Hn2mYqReaQvSroWJWLR75l9RiNsukHQ2m/sg1QDaT
         x0qH/U1LtvMDtTB7e16LIjkDlcR/6y7rFyRUDcKAJMrMMnUakRZSno2dbZB/ePd7yz1n
         WJZUf4mDz/mXxLIqg1eCbHHP9tRFETS8VB1IH8KAcpSsR87bjzUmEXVeqCXXMQ6ebZlr
         AlFzlcuSEF7rWG2NM+EzAUX6SJnkYiEkNSYkSKp4OZHy4vvA4vadlzMJnOTwFGWjEei3
         myrA==
X-Gm-Message-State: AOJu0YyNH2B5Z4MEyW9U9GesG4mgcJO8bUAeZ7MOv26WhbEoIBmcMKHO
	jXsl0L3f5FkRYmUxgmW2Lpmb6yMSYhwWGFUjrf5mAjsnqq8xAUSA
X-Google-Smtp-Source: AGHT+IFrPej/95YBCoQ+gPOK4CpRYQApua0TLW5RBQa5YAze3ebUEOBEOmFW4oNmChmukkfudBXaMw==
X-Received: by 2002:a17:906:e0cd:b0:a36:569a:1bd8 with SMTP id gl13-20020a170906e0cd00b00a36569a1bd8mr6390195ejb.28.1707038525879;
        Sun, 04 Feb 2024 01:22:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVYbpVpzbqOYBojLtihXtsa8vNbyNP+KUuY+u+gJbXtKk7moBHtVRkQUoqZzHdvFCSZqXN5B3frFrwsSgSqaHGoZ6jd5rRTyZMzwDJdiAqxknvIJggogyOWIsCAyT0St+NRXnELOvaQdxDm745lPXQj77nlF6gZIiPfh9siuwOhMjef51kPUlWwHMx9MguQuGKOORiji2Et
Received: from loveone ([151.82.12.249])
        by smtp.gmail.com with ESMTPSA id kk28-20020a170907767c00b00a354f8fc19fsm2927120ejc.214.2024.02.04.01.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 01:22:05 -0800 (PST)
From: Ettore Forgiarini <ettorenigma@gmail.com>
To: gregkh@linuxfoundation.org
Cc: richardcochran@gmail.com,
	ozlinux@hotmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ettore Forgiarini <ettorenigma@gmail.com>
Subject: [PATCH 2/2] Staging: octeon: octeon-stubs: remove all typedef
Date: Sun,  4 Feb 2024 10:21:34 +0100
Message-ID: <20240204092134.1265312-1-ettorenigma@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed all typedef so the code conform with code style
---
 drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index de333d6718d2..7c769f2d42fb 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -213,14 +213,14 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode_t {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
-typedef enum {
+enum cvmx_helper_interface_mode_t {
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
+enum cvmx_pow_wait_t {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
-typedef enum {
+enum cvmx_pko_lock_t {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
-typedef enum {
+enum cvmx_pko_status_t {
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
@@ -384,7 +384,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status_t {
 	u32 dropped_octets;
 	u32 dropped_packets;
 	u32 pci_raw_packets;
@@ -407,13 +407,13 @@ typedef struct {
 	u32 inb_packets;
 	u64 inb_octets;
 	u16 inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status_t {
 	u32 packets;
 	u64 octets;
 	u64 doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	u64 u64;
@@ -1258,14 +1258,14 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status_t *status)
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline enum cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
@@ -1342,11 +1342,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait_t wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait_t wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1356,13 +1356,13 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait_t wait)
 {
 	return (void *)(unsigned long)wait;
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
@@ -1381,12 +1381,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock_t use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+static inline enum cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock_t use_locking)
 {
 	return 0;
 }
-- 
2.43.0

