Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B8346A08
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305288; cv=none; b=DrulCXrimRZFHx7n0cE0nxKSC0MPAkYJKrj2vqjFO3K/CcJgphIB72f+4fT5nVGApbJ4sbw+rzuvW1VzvOjTqB4bygUFmbFB9ezfse7gs1/zu4rDapKHAlWKVGnrNa+B2EUt5ThV1Alp5uh26MeGTT0Oxw20tGi0ot9n2c4xrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305288; c=relaxed/simple;
	bh=Uw+6McxcbR1X0j5mklzKziZGlm8Wj4N2l8z9PIZdiy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SY6SttV+RXF30VLNr21mW2b29VmIZ2TF9/NjyXJMDGgb/eIjZz1a+aM5QNaFfB/vJ5onMkwvnFdQwqUj4mgLvKJCkZxdfO8E9KriTR4iCclGfNq8IYYCCf3A1NTGdpSYGudqOF3ro/npkBYFNy6KDlgfM3O9sMiPkoJSk2ST278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAdD3Zd0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAdD3Zd0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so8661498a91.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305287; x=1777910087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThV84gm5Y5EtW/yF0FDrADPw1AaaVSJvSYelejtPtaE=;
        b=sAdD3Zd08UGIZg9N9j7MF5zY3gs7krw8Ip52J+X0+r27C6Viqwg7dMxsSLmG5u36tb
         Cr1B1yqJ7fICKlTwypcxreeoJLKpBy5JpuSeZi673ruIxYQdOO7grCumWN/lN0CRYhCI
         LhWs41NE7Pv+5b9yPWJhNmH1KQJV5EtQEGuXwsG9Glzx1QmIkp7Iz5QcLGIDPBRnb8kU
         HwiaVz8jnNv2zT2OzmSdlQWcqE1Glng+mVOudUUa3qAiImKRUzIwMdH3G30FhKUAAqAq
         2bqE2XVPxthLxsEYr3BptiXkXlyR70D95t9Noj/Df3qtfmXv6E022P2fn9tqCKv3tSW0
         35jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305287; x=1777910087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ThV84gm5Y5EtW/yF0FDrADPw1AaaVSJvSYelejtPtaE=;
        b=MyPxFz871LNnKLIg82i96xXjMMxmqV13oa13pr4TkLONMRUcuMGjwHQkbQu2ISsLLC
         WmgAbFqxbCY9AZxQFMZZfz1AHH/eYnvAaCPCI6LzFkA1j3CWErSXLNnvsEwwEJ4uLMUf
         6tMC6UqKZblEtQjbaQPTnDQhxZ0MSfR3Yn2MiK6edbPem87Pt5YSwmqL/5COgBTp2CV5
         MtqRqx1BW6MI1n/rro5AqnrNE9wt9AquIhSY2Z/xOGF5mbUdqzWbWJK06aGXM/E2zA7Z
         43Vbq7AfcafNY8L5/CelqZZhnxQvsEJM/3bJ9rWtKdCuYyN7OO6MqQmT3nwOcQBkQt2W
         CBOA==
X-Forwarded-Encrypted: i=1; AFNElJ8rfanuYWy8N0e23UUvXX33sTq6fT9/y5sSJ+HmtcOHyVn8IIYeVpHZ4hRLuG2Z33cW/9M7d+VzkOop/FMJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5/N0cl9SxPF0iZ8PhWubicV3q6RPKX9zmLSBePo9McVyGgMUV
	58wkJ+vl+mfpIAMqI2x8MF0VMlW5rGKPOuTzbX1TN5zRSga3HULgH4gM
X-Gm-Gg: AeBDieutsAumPURiBz0hHXufcVx4rP0pf5pOj09OlPFfVUBOjf2MQx0iHpEdoUqnG8T
	OZlNvzC+eFz7CScj659G2Rf2LNGdb1U54SNZiAd0VFsi2rkCasNcnPrzf8O2PrYDH0gKBGjAFep
	WlEvLlJIkN0jy5UiMtIoBDfUF+fOf1o3KcQt7PWyDLZOlvMvMuovah9ousr51QgLMZiPCLfxfzf
	w61saIyHQMZthD+USsbtLH+fNuMWtX0cr9hLzqVpoTKOOlOX6wUxmrgVcnrP8FGzyimvwMVTtAB
	Gn8LAkDxTC+OeO3q13QPa2XEywv7R+LfO4JTe2MqfQNSg2pHYCXP1Mw5sqKzFsquRqaPOJkFTcB
	dLHUNXPJQobtAD10/itqwqY3bkryn2ssflGeEaKivDPpuvTRCjO20wT0fhfgLpHOTFexYaDIXMF
	moySYG+/eqC0gsXrouJAUAXEZPJglUVow7VtJIZp8l
X-Received: by 2002:a17:902:7c0f:b0:2b2:b117:1e16 with SMTP id d9443c01a7336-2b5f9f7e95fmr332045605ad.20.1777305286937;
        Mon, 27 Apr 2026 08:54:46 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0caa9sm306493235ad.40.2026.04.27.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:46 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 5/7] staging: octeon: convert cvmx_pko_status_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:25 +0800
Message-ID: <20260427155427.668540-6-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
References: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style discourages the use of typedefs for
enums. Convert cvmx_pko_status_t to a plain 'enum cvmx_pko_status' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-pko.c |  4 ++--
 arch/mips/include/asm/octeon/cvmx-pko.h      | 10 +++++-----
 drivers/staging/octeon/octeon-stubs.h        |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 760abbe12479..b0199d5cb551 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -323,11 +323,11 @@ EXPORT_SYMBOL_GPL(cvmx_pko_shutdown);
  *		     queues have higher priority than higher numbered queues.
  *		     There must be num_queues elements in the array.
  */
-cvmx_pko_status_t cvmx_pko_config_port(uint64_t port, uint64_t base_queue,
+enum cvmx_pko_status cvmx_pko_config_port(uint64_t port, uint64_t base_queue,
 				       uint64_t num_queues,
 				       const uint64_t priority[])
 {
-	cvmx_pko_status_t result_code;
+	enum cvmx_pko_status result_code;
 	uint64_t queue;
 	union cvmx_pko_mem_queue_ptrs config;
 	union cvmx_pko_reg_queue_ptrs1 config1;
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index d8e74a305646..a742c1d61d8f 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -80,7 +80,7 @@
 #define CVMX_PKO_ILLEGAL_QUEUE	0xFFFF
 #define CVMX_PKO_MAX_QUEUE_DEPTH 0
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -88,7 +88,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 /**
  * This enumeration represents the different locking modes supported by PKO.
@@ -306,7 +306,7 @@ extern void cvmx_pko_shutdown(void);
  *		     of a value of 1. There must be num_queues elements in the
  *		     array.
  */
-extern cvmx_pko_status_t cvmx_pko_config_port(uint64_t port,
+extern enum cvmx_pko_status cvmx_pko_config_port(uint64_t port,
 					      uint64_t base_queue,
 					      uint64_t num_queues,
 					      const uint64_t priority[]);
@@ -414,7 +414,7 @@ static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
@@ -457,7 +457,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
  * Returns: CVMX_PKO_SUCCESS on success, or error code on
  * failure of output
  */
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish3(
 	uint64_t port,
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 06cb4f15d9d5..8496c60d647e 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -246,7 +246,7 @@ enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 };
 
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
@@ -1386,7 +1386,7 @@ static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
 		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
-- 
2.43.0

