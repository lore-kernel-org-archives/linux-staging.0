Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602034BA57
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305282; cv=none; b=mpcNGdXxosVSwedtrkNVe4fi2BvD+Xfy5FY6k0dtTBvL+FZTj/hWOmVa98FQ2yTreeFuhoirVTaOxc/M7QKXzJEBWLHf1EzvAjVxRuk7+cy4CtYETV2jN7qj2tfaDxwslAC547+RBGDV5b2ywCweHKXZyydUvkUCUWu/XW6Z8ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305282; c=relaxed/simple;
	bh=dPVmA4SAKvP8uttiAwiTIqfYjB1yylln+rbXAL0TOHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtUgRjaOo0zX9Xo54CuSsMsg0wENBL8KtlNhPylCyeG7Oa3rW0yMsgHm3uWDtevPvUVn7ZTciiA435GTSjiavx4uBxMsaKLXCUN0HthOUTl02Edo12dkB5RI1mgSErXl56FhDMapMM9+PT9tVNKOEaZEJu8Tyy//YDKDf6SdEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmkeIaZj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmkeIaZj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-827270d50d4so9322165b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305281; x=1777910081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nEwsx1IE37alek/UbFFJIAS/ZU1TO09DbXxHjDA5/4=;
        b=VmkeIaZjxC9N2cPEGDoqXvKh1MZAZbJV08SRwrHxRrmPRhVpXgLAlNSkcilJQZu5fM
         cXcHZJplOPyXV3O4GbbmWCB1TSWqrl/YtV6cdUpZbxFOMR500AOjUi2VPwZJZFVg5OtB
         GSxmh2CepTBXTlhxoBBN3jgWnOZ+eoS2DI+lOvh5ikPJcrdT8MDxDavlXKdFFii7i7Ds
         X7k8xMG4TBuXAEHf8BXb5AlGxzcgcRUjaz6qcF0+0qINekYTd07xWq55eFA8HZO6xD8r
         IFFVY9xt+Yb3BQ4JojY9wkW6OAIoNGMRgM4FPkY6tIfMEpTkVDDkmG5cIt/NHEJwuXyW
         kD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305281; x=1777910081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/nEwsx1IE37alek/UbFFJIAS/ZU1TO09DbXxHjDA5/4=;
        b=GXtNsu9hGLUZZdJs66WH6uRIgeiPoYCUv4p4uou4kvvv9vyCtmUunble+TSuZa3kr2
         +UADde+sD5Y7ND+PMo8UB8dUALynUW/YKxZrmhLFajreb08BXPqeiAYCtptytPw0lMat
         PJZ2Amfpl/Uo5YtR3kmX1/bwYpd8D9dDb6SFlONNIeCrz7S3TmDKa3abg722rCZyQiRd
         luOCJuvzykGI2rdH2fKMVkLVJY6kOK9RBCVRwTtqFRG3nasRiBXdrNyQlPVx3zQkOOyu
         RW5r1l+wG5G5Wyxph9j4irDPdwXkVTfUFxp5PQJO2GvXVm13AkO/DQ56fxx93bg510G/
         fcrw==
X-Forwarded-Encrypted: i=1; AFNElJ+UU0ttZ1HtM3uNix7LIJTG75cU3iPVPYH/9tvjRKmwo+pdWP213iPCjXgxvXUZJLqD7leRHJaYkBAkbfU5@lists.linux.dev
X-Gm-Message-State: AOJu0YwBzSYJgfS8SB//TlN0D/io9KY+ziHPPiEjbexDJXX5XLIHqhDe
	rbMlckcSGOBS/L27HxFaHA5XXAwCJHtaSieuOD5tBgOgPKkP3iCU5Y+UU5xYMZXXO2P08Q==
X-Gm-Gg: AeBDiesr0kw83yrqX6oa7Gb0NNg6D1x2F0SAmU0YE7J4WZciws1feD5cIHSN9s90s8d
	gJUDCawPfY4hwIfo0NKdcgwHE3DQWGA9FxdDiuM77itKZ07RYP/H0i0AzSCrwdGeehDK4Ge3no9
	2BmcWsaWPvsqeJ4UnLxIX8ismT9HW5YZOISHB/eA6MK+VPVRP2T4vs/Xm+dPu7yaFAqNc+UbU2f
	Bo7w0cg+Wuo50/3qxvsiUD0AxNpd7yrusmZpMS0L8Bbypr5JP2hyOCygZs1rfdZ0sF92PC0eU4c
	CKNxxZ6TsOn87qVHq0/2Fj9jOhqaJUv5beKUd4sK9PDwIdvmtXBti3W9GdeY9FhpzPc65LZgAbV
	xLVfOWMhMJ4jkyWn7ywGGsbsAt/l8q5UegnpKvdhw8HutbDAlcknByvFU9mezU70C1CZf4qydpn
	6V02GD7oaJEipMuOY9p1EFnllMKRhY4MW80SUGvFLU
X-Received: by 2002:a05:6a00:1acc:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f8c8c2f8fmr48204285b3a.28.1777305280668;
        Mon, 27 Apr 2026 08:54:40 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932daa68sm34339028b3a.49.2026.04.27.08.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:40 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 3/7] staging: octeon: convert cvmx_pow_wait_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:23 +0800
Message-ID: <20260427155427.668540-4-kunjinkao.jp@gmail.com>
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
enums. Convert cvmx_pow_wait_t to a plain 'enum cvmx_pow_wait' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pow.h | 12 ++++++------
 drivers/staging/octeon/octeon-stubs.h   | 10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pow.h b/arch/mips/include/asm/octeon/cvmx-pow.h
index 21b4378244fa..409029809639 100644
--- a/arch/mips/include/asm/octeon/cvmx-pow.h
+++ b/arch/mips/include/asm/octeon/cvmx-pow.h
@@ -84,10 +84,10 @@ enum cvmx_pow_tag_type {
 /**
  * Wait flag values for pow functions.
  */
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
 /**
  *  POW tag operations.	 These are used in the data stored to the POW.
@@ -1348,7 +1348,7 @@ static inline void cvmx_pow_tag_sw_wait(void)
  * Returns: the WQE pointer from POW. Returns NULL if no work
  * was available.
  */
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(cvmx_pow_wait_t
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(enum cvmx_pow_wait
 							     wait)
 {
 	cvmx_pow_load_addr_t ptr;
@@ -1382,7 +1382,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync_nocheck(cvmx_pow_wait_
  * Returns: the WQE pointer from POW. Returns NULL if no work
  * was available.
  */
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	if (CVMX_ENABLE_POW_CHECKS)
 		__cvmx_pow_warn_if_pending_switch(__func__);
@@ -1436,7 +1436,7 @@ static inline enum cvmx_pow_tag_type cvmx_pow_work_request_null_rd(void)
  *	  timeout), 0 to cause response to return immediately
  */
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 {
 	cvmx_pow_iobdma_store_t data;
 
@@ -1465,7 +1465,7 @@ static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
  *		    timeout), 0 to cause response to return immediately
  */
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 {
 	if (CVMX_ENABLE_POW_CHECKS)
 		__cvmx_pow_warn_if_pending_switch(__func__);
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 6c0329270464..df0456417f15 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -235,10 +235,10 @@ enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
 };
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
 typedef enum {
 	CVMX_PKO_LOCK_NONE = 0,
@@ -1344,11 +1344,11 @@ static inline unsigned int cvmx_get_core_num(void)
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
@@ -1358,7 +1358,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
-- 
2.43.0

