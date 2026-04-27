Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A01340DB9
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305279; cv=none; b=WvcHHSGSo3YoKlUTX/NIA9V4UlycjAgdy3frZ59YcnUx/RB0gA8jQAWnJpMIDPcBeXgdZ4E+FViWUUgojo8CK3EtE8jBgTqSgA/PV3u0MwPnt4ol5ogz5gI2FcCVCt9qhiEuvzrpyfnnGqObPJwgYtIhqnSxXzh/LM/k2gS6f98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305279; c=relaxed/simple;
	bh=RFwtc+DWnFArVH3yDlpvTx4fUm7z+0DYCBQcxeZkztg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgFQKATolKhPbkILdqni+xvvdE8Ywfb+Ybc/Lb2LVqemfCG9mGDorohJmc+KSipQqQd9UjfLbolltiEGfHA2KsRQvFHymzgDhXmsrFEWx1g4OpoBmJObm52hw5peqK7BPvMBblSsPVf8Wd6Zh5aDU/aKH7TaYtLClqa/JbyytJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3BXe4AV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3BXe4AV"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76b9efc299so4259779a12.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305278; x=1777910078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM2ciHe3IZQx3bTbi2nzxHzfQ0F42LMlFGioqZ6RPhA=;
        b=Z3BXe4AV75mG+7h4GR7pnnDzSHKph6u0LfZCOE3OQaoMSlLBihZC9lYATM9J7/Z5pF
         bDZ1wlXXoi8zOsUxSGpFBpMhmxfyppSXxGKzxW8PWwQNVT2tYaqxw8542IT5uYX9oniL
         B4B1rdRXVVOrpqPxQ+9oR++M0dHvuyOtYv0MC/F36IiYmY8JG5fT/HDClfCQ9TrgBC+b
         zPvnsrdXpYMtVt1YOjaitxDZ2jvEiCH6R2GDm0WlA1/a82AzG3ECELPc1lCl6aiNIY/L
         l/fxhHVsHkvr5z8/5T+NRG5TUmSQLGaBeVkx883U+HXBDpeyodbvrNU8cbm+V2okNrnY
         vBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305278; x=1777910078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AM2ciHe3IZQx3bTbi2nzxHzfQ0F42LMlFGioqZ6RPhA=;
        b=PZv7+P82a30m7B6EykgBBM7kxtV2kefvltr2nyMk50ku5bvV6LIvmExJrrWS+bzzsd
         tNB9A1VY+ZP0SqDJg27q2Cc/Kt/UMoflHRp7J5yFMTEH3kE170AiWR49MIrHUlEsjsTl
         wzAWAF7jgOZjDPRo2XJwJ6EYpQ2vZroxbFU2tNS9/TB9gfJQv4eiEvldPUXKTVXakkeG
         +VXvev5yjgjtyevbyLC/XXouDFrAg5xQVVxw3r80lrNCGimGDENtFe5RhGtHrIrfRIhr
         eECQgrTCabNXEtgif05CmEpkM2fvTFFCOlcapG4atbQ2lIgad6ILXD+Ckjx68nVvqPcp
         RiYw==
X-Forwarded-Encrypted: i=1; AFNElJ+6fGZkAeVCorJkW8Fap0e784NgA6nVckppGMOmPg6dNC+sZuNGbksOTI2EAHkfuuiBnyK16cvHz/zq3zDf@lists.linux.dev
X-Gm-Message-State: AOJu0YxHJiMvSNUA/GYGyGCaVCxRdzPcYyc/bACFQ5pqJWLj5WyQDnRp
	tSjq6BAMR7KpgZPlQjqdRpLKFDK+Re8HSEdfjI/b5CtlCLiTR+acrQYk
X-Gm-Gg: AeBDietMo1vbXx8/pPm1xpnf/GJbEthCzjBYFMFmK/4BbYxw4YTO1kxstN8BzkY7Nee
	UDQin/bUnMSPzvDOFCt5X8/WguB/amscO348/vhRcBByHbmzaD9qai9Js3sVWEQZ+EdtJcM3ozY
	iekXGNLlOHdNYNXm+jnWgLNDCWtovahYE726vnCnTYOJY+T2nKIuqwtmoM3yu9mU87ThIhRk9Oz
	lkbg+ece3dHlEEBof1CT24p9FdeSeIrHuQEGBPhaLH93uNYC5f8NYZ2oaL/HCfuM8Ox3jWMucc2
	gBtisHcf2WNeV2Hlml9VrzySRuf8q4mGLVAaRzeq/CtRj63NIwydUbnYggzSY8mP8GGUNdbLXl1
	I14Er17/ceLxWWNJDChIHS6ly7OZcxoC3FhtIWCsKAo6cEIaeMIqFC0N4lrH12ztBpgU8968jfH
	DlwNhn8644N+pS736AO0oTkiOYrnJXaTn5X0fRsdMz+opiVAaNEfE=
X-Received: by 2002:a17:903:2acb:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b5f9f08968mr469184115ad.17.1777305277630;
        Mon, 27 Apr 2026 08:54:37 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2df0asm309250075ad.26.2026.04.27.08.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:37 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 2/7] staging: octeon: convert cvmx_helper_interface_mode_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:22 +0800
Message-ID: <20260427155427.668540-3-kunjinkao.jp@gmail.com>
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
enums. Convert cvmx_helper_interface_mode_t to a plain 'enum
cvmx_helper_interface_mode' and update all users across the MIPS
Octeon architecture code and the staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-util.c | 2 +-
 arch/mips/cavium-octeon/executive/cvmx-helper.c      | 8 ++++----
 arch/mips/cavium-octeon/executive/cvmx-pko.c         | 2 +-
 arch/mips/include/asm/octeon/cvmx-helper-util.h      | 2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h           | 6 +++---
 drivers/staging/octeon/ethernet.c                    | 2 +-
 drivers/staging/octeon/octeon-stubs.h                | 6 +++---
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
index 53b912745dbd..abaf91f6ae7c 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-util.c
@@ -52,7 +52,7 @@
  *
  * Returns String
  */
-const char *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t
+const char *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode
 						 mode)
 {
 	switch (mode) {
diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 9abfc4bf9bd8..1985cd66806a 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -95,7 +95,7 @@ EXPORT_SYMBOL_GPL(cvmx_helper_ports_on_interface);
  * @INTERNAL
  * Return interface mode for CN68xx.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_cn68xx(int interface)
 {
 	union cvmx_mio_qlmx_cfg qlm_cfg;
 	switch (interface) {
@@ -147,7 +147,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn68xx(int interface)
  * @INTERNAL
  * Return interface mode for an Octeon II
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_octeon2(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -247,7 +247,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_octeon2(int interface)
  * @INTERNAL
  * Return interface mode for CN7XXX.
  */
-static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
+static enum cvmx_helper_interface_mode __cvmx_get_mode_cn7xxx(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
@@ -289,7 +289,7 @@ static cvmx_helper_interface_mode_t __cvmx_get_mode_cn7xxx(int interface)
  * Returns Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
-cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int interface)
+enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
 {
 	union cvmx_gmxx_inf_mode mode;
 
diff --git a/arch/mips/cavium-octeon/executive/cvmx-pko.c b/arch/mips/cavium-octeon/executive/cvmx-pko.c
index 6e70b859a0ac..760abbe12479 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-pko.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-pko.c
@@ -120,7 +120,7 @@ static void __cvmx_pko_port_map_o68(void)
 {
 	int port;
 	int interface, index;
-	cvmx_helper_interface_mode_t mode;
+	enum cvmx_helper_interface_mode mode;
 	union cvmx_pko_mem_iport_ptrs config;
 
 	/*
diff --git a/arch/mips/include/asm/octeon/cvmx-helper-util.h b/arch/mips/include/asm/octeon/cvmx-helper-util.h
index 97b27a07cfb0..103bb5b3142b 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper-util.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper-util.h
@@ -42,7 +42,7 @@
  * Returns String
  */
 extern const char
-    *cvmx_helper_interface_mode_to_string(cvmx_helper_interface_mode_t mode);
+    *cvmx_helper_interface_mode_to_string(enum cvmx_helper_interface_mode mode);
 
 /**
  * Setup Random Early Drop to automatically begin dropping packets.
diff --git a/arch/mips/include/asm/octeon/cvmx-helper.h b/arch/mips/include/asm/octeon/cvmx-helper.h
index 0cddce35291b..98824ff6314c 100644
--- a/arch/mips/include/asm/octeon/cvmx-helper.h
+++ b/arch/mips/include/asm/octeon/cvmx-helper.h
@@ -38,7 +38,7 @@
 #include <asm/octeon/cvmx-fpa.h>
 #include <asm/octeon/cvmx-wqe.h>
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -49,7 +49,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
 union cvmx_helper_link_info {
 	uint64_t u64;
@@ -125,7 +125,7 @@ extern int cvmx_helper_get_number_of_interfaces(void);
  * Returns Mode of the interface. Unknown or unsupported interfaces return
  *	   DISABLED.
  */
-extern cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+extern enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface);
 
 /**
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..5f9c29071fab 100644
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
index 289a2d41fdc5..6c0329270464 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -222,7 +222,7 @@ enum cvmx_spi_mode {
 	CVMX_SPI_MODE_DUPLEX = 3
 };
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -233,7 +233,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
 typedef enum {
 	CVMX_POW_WAIT = 1,
@@ -1267,7 +1267,7 @@ static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
-- 
2.43.0

