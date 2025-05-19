Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3891EF389
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636185; cv=none; b=NsumY2RPvIsQcjhkNDMSqn+kbfApDAp8of0c0t44I9p8SCA/RE/f0vRkfNcME6SUXVLiOObjQx7nrSCzOiAIu9rN8JVCuDlx7AYir4rGfbdPzK/jJE+Iw2u5d2/Y9L9UdVFAe4hLwRzmN28Ucj5z07pLJ72euPSgo/qVP8VQ/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636185; c=relaxed/simple;
	bh=yxZ88PlFUaMu5h3WE1La2O/dnFUz0ysTS6gH8WEt05o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5cWViNIUdACS4L8cHR1rrT1GttCOWUcV01NaiQAyGi9u0aCS3ZAoGDcb4Hrq19PW4Aip9Tt/fw1V/wT0KCePV6PdNlLulN6Nbaj0zWjQP40oAMJy+8yUzI2jx1TniD2GKzbBBnXIf+6Uedx6pH5k+0xr/rV328Y4OK04SqZnFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLI7UBDA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLI7UBDA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3200811b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747636182; x=1748240982; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCTXTihQyq4BkMSwWx91CaD+PF/k+pQgDBveUp2EsO4=;
        b=nLI7UBDAQkk7LcNXpcNQjHYpPNWxtBBGlV457j0cu81teYVfjceKmuy4zdOq6AerRZ
         HSRN25CyhILQ9hGZ/A9WHvg+g8xZ/8WH40ff4kNdbKFdFO42XyLk5gLzk9RveUgI1m0j
         PWbZ5rgz1sIqZ4nmMJLtD5F1RaomuKXKxldms4jP6Gi1n4q+K8AvVPePTwiS48ca8d0p
         aNrZ6HAuFwT8sf7brMP2KNqH0oVGvvqCOrpsM8SqvAvjHhImc2xRGQmrrcbz2i5mG8cO
         +Swvtr2b3UX9KG8okIWMv/Kk2Icycsx+xftMnu2ydLHt+ZlYmsNboJntClRB0dZGjxsC
         8GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636182; x=1748240982;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCTXTihQyq4BkMSwWx91CaD+PF/k+pQgDBveUp2EsO4=;
        b=w9hV5yiyei6uuNgaQWxc4MV0DBn52T5p1AbcwyHyxBb4RVBGeh/VXvhfJq9Dn8Dn6t
         Em0xscCpcwo9I4L8fbwuHevmZ6CasGsYT4vehy8z/EEhKMG0DxRDnC6Zwz8Ni63nLq6N
         1at2vgboqq8mB6t9D/roH8F4EmPjaRrAZLwTdlbCNzFiRdZVF8x/mICi69PCyOc05SJ8
         bIhuRQJGdlf1zzPnvElKcxAdxUj0MCcEgkEdIqL/niWPdrWKVy8mzyyUrVO0bmopgFB2
         bIi+PP6QuzAhRCN3EXk3DqyFwFjeVmqgq7zQJ1SuvxQiCq8/uSsguq9WR17jMZoGJoB7
         nvTg==
X-Forwarded-Encrypted: i=1; AJvYcCVKgz0WaUA/1wHL6Keas9p6Z314+BSPgILCNs+WlpMcV4mwMVznGq6JQvUQp9Vh2yP2BCKrvEdyI025cZAR@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt4+LGnyiEZ3jvd9rEt93BtuE/azqd78n2wQai5pY0c/PWdC8p
	L4sXXMo7wogNDdhY4NWt8aLcXuMIBT7d1wb13KEzH9D+3le4HZ2UO+bX
X-Gm-Gg: ASbGncvhPFx5RcnlBheJIiwNvdr+/X89aEQs8SbRJ8dxUZ98a+3XTnHqmjd+6XXfv4+
	tZN4v3osIN8EfptnL/6ROmV4AGQQGu/QRaeBD68LyDwhN+74I7eag60YFjpBb4lZIyLnVg74fO9
	tkz3Ox1R1td1neWuKK7uh/ahNh+s5oqKI6/3Rraxu6+CyVrLFOYClZjJCWtE0HjM9Q8E4jEW2fm
	GefchIlE4RHI1T5lxf+UAZnHQc41NVAV414pUDeXgLZkCHMGCSiNcL/eYLpLQGmZN2RyTkm9bfW
	uperxHflvmV0KOTj2HH1Ujo8CQp012ZBK3NX38fOMD9B
X-Google-Smtp-Source: AGHT+IGTLBWuPgk8PzYM4BOq5NZjGjQoSW7DZzjjughF4jDj0fSpTahO6VPitIDdQlDm9ier2vX44w==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr15697115637.19.1747636181748;
        Sun, 18 May 2025 23:29:41 -0700 (PDT)
Received: from debian ([1.238.22.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d58eee2sm5835889a91.40.2025.05.18.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:29:41 -0700 (PDT)
Date: Sun, 18 May 2025 23:29:38 -0700
From: Sunghun Son <thswpvm1111@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: remove typedef declaration
Message-ID: <aCrP0mBkFxfZKUZT@debian>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove typedef declaration from several structs.
Also replace related function signatures to reflect these changes.
Issue found by checkpatch.pl

Signed-off-by: Sunghun Son <thswpvm1111@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 49 +++++++++++++--------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 44cced319c11..5de94792ccf2 100644
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
@@ -384,7 +384,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -407,13 +407,13 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status_t {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1258,15 +1258,14 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status_t *status)
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
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode mode, int timeout)
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
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(uint64_t port,
 		uint64_t queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.39.5

