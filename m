Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E31225AA
	for <linux-staging@lists.linux.dev>; Sun,  4 Feb 2024 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707060999; cv=none; b=oa02g9zWfdrgt+jUJKyzwXcc+88eJ6/XuZUDMC2FndeGRJVV/7K16YAXY32sX8hMcqAJrvVIUiyoSpitizUA5tpj4OSFb5rh8dHl8ByhCJSZJkHloxd6hkPy/dy/EsQ59Z31QPZNSM5uEfyddqcObgRWi95vd4oyHzNjIpTYpwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707060999; c=relaxed/simple;
	bh=jlHr85lx7ijYMM8DzNwyv4cHSz4lBYQQJ33L5PJPNg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWSGhpe9uLhcypA9bXtmX3CgvAJo6YEAouSI/txJ//JGf0UJxD4d16Kj69BHT5/vdez6fpsg04UbpWMEV/6UacrRK2nUbXtsODXeCnVjmFyktmm63CVVOKXBsQrP4+u0e8pcyR9VOPUaH1Z7yUBKFy4FLpt5/hIoRGj/i8bSrlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8EueB/H; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8EueB/H"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so4051574a12.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Feb 2024 07:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707060996; x=1707665796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pC/gomlpxxczil2N1iiBnIyiwHQVcSqITV0Ca4lVoU0=;
        b=N8EueB/Hjp5wJq4EwSmkEGNhbCIStp83H89wq1yx7ALo+GJM4dOVJUX/iBOEQn/wr8
         jzwZPeNUwtcImqckK0iGAtxNbHXB2DddbA07Jj238pn7fmiqJkVDO6DBbeNoR8/ErkVF
         tv+kKrRtE4DMdu8nW8KNFTQ9AAcGfrGjFjxgANpz87j8hKBUYB1QcwwahGp1UE3w8IMe
         hsRIlL0/7wEuBhcCD2H/mb+FEF2as0D2n3LcYPsVnCvrtUka2Rrb/X0K0XBTNAx4riui
         6ymvJfTv5TisJVsKBsswSgPSp4Rk9sbVbL8PBciUPM+oZgwv5YHHHTX5S8V61DVJMsVf
         2G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707060996; x=1707665796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC/gomlpxxczil2N1iiBnIyiwHQVcSqITV0Ca4lVoU0=;
        b=KdNTERQtj8zgktScpu5hCmrbbVwus9RJe5E+l/4lxSfBsW14ojk1vlLvISVW/y4457
         GN4DSYi8E3OSA6YTOFynqdTAbQuHfo1PpjuHmRpCJTPp7rNjpdM6htfgAKs9xNbRKLrE
         RKnX63adK9IuLz/fK19Q1bCoAwMWqO4Dxi0W6KvVsVV7G53qFayVp3MPtgg4CdRmomrh
         QSk6hDBs/vkRnA603+bPOPVz1UlIEoxu2ivD2/jH3u6zZQig3QEf0TKvqmLztagVGWa5
         675P5mUmpIbwpBjWdcyz4QR/ztRuzTzCQwz+auH38IeFikDPdl2+8z2EumgCeICXPy+e
         fWlg==
X-Gm-Message-State: AOJu0YxnQBN2lvwbWoS+OX/EYO4Gt8gT50z9tccl5nkADZQEP17298VL
	FoTcFFGMMKOOWWJxp5NDlt/B+YUCTzVUBP4EadmQwGDLA9ZYmvh3
X-Google-Smtp-Source: AGHT+IFdBuVyXqFvF/TXMXY6Uw4DNtlBY8k0apmNTvQ5iD/YbDjGfBFUuVySCt5h15zhCK8CfoqQDw==
X-Received: by 2002:a17:906:408b:b0:a36:3edb:aeac with SMTP id u11-20020a170906408b00b00a363edbaeacmr7598355ejj.17.1707060996186;
        Sun, 04 Feb 2024 07:36:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWr5SEVMZ24V/xXf0kQ+LPdFpKIqt2nR7Xx5TqExVovQ3mTwa8JyjoF5+I7diHpLb9YYznErXapxXriI/xQUu7RiGQo+kCV2T20efSSSEG+nBW/7fT8hJm7tu5G0+SK9icLbgQh9ZYNi6RSYafVprV8PL7jqWwHZQftOFDZWMd0SSt2StIqFUMP+ikB68aLJUTyTqVaU6v/
Received: from loveone ([151.82.70.227])
        by smtp.gmail.com with ESMTPSA id kq8-20020a170906abc800b00a30cd599285sm3239159ejb.223.2024.02.04.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 07:36:35 -0800 (PST)
From: Ettore Forgiarini <ettorenigma@gmail.com>
To: gregkh@linuxfoundation.org
Cc: richardcochran@gmail.com,
	ozlinux@hotmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ettore Forgiarini <ettorenigma@gmail.com>
Subject: [PATCH 2/2] Staging: octeon: octeon-stubs: remove all typedef
Date: Sun,  4 Feb 2024 16:36:03 +0100
Message-ID: <20240204153603.1373700-1-ettorenigma@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed all typedef so the code conform with code style

Signed-off-by: Ettore Forgiarini <ettorenigma@gmail.com>
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

