Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940513112D0
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160085; cv=none; b=rnZOC/oU/oY6D7KhDBQSUxMQKdHRvb644lNJcTnQBNjjCvnbKyMqrzKY4YRROlyRpdUTDre3svg5K3gT4fKVQmC2afbENAKMBipH4P27FGu/ONqQUcyQcN1hWGfLzozdi+WuV4EYpzKKpPzfVDXLWRiXNQy4KoqUj2tCiNqT/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160085; c=relaxed/simple;
	bh=B7JjV3GFU7Uh5QssvSt50BbkBYppkGhl3wSBvqUdL1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFw57DWbzLpXulLYAoNkzGf62m1m8Q530vdcB+5jETDv2njzxHF2oI+YG69TNp2Q3QGKekcMHIxpI/7KSUlOC4aOgo4gl2r4YVklf/lofAoomkHokOl+p0JNkRDYRbjlD5B/ZI3YKcKQeZxMHwoArkcQVmzR8YEJhBHfgBWYWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjJe6Mgc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjJe6Mgc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b886fc047d5so37143866b.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 15:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160081; x=1770764881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyuu5DQHN0kM/6Ii1doCyC/+2p0/fE93hPD6MhvTzyo=;
        b=WjJe6MgcZSw8+so0MjG1ZO5nr63/Q77YQUs3jaA6tj+T/O0vNYfjNpRYR8SD+bv8Vt
         FoM3CfXlBYAidS8R+ohuIVbWdOnB9msG7uI8M0sRqqTLfPxOTCwNlvUl5v5SENkt9Z7i
         gbK23hZZ2kZ+m3Ryf9NGXQxITbMxHwAUYB3NWwTcVuvyDUq+t5zk8VBKMzg8oCjrKJQR
         2DZHcR2uGEbZfftsPktXihBKFupOwu3mG5wFyxXVl7sDNyyiBfCSpJkogOO3GXufRiar
         YrwBZVUIHbMKw9Gv93F05nxNer5WMk6DrAru7hUmW9DK6bRctJn47KPO1vADmWhLAPpv
         NeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160081; x=1770764881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hyuu5DQHN0kM/6Ii1doCyC/+2p0/fE93hPD6MhvTzyo=;
        b=jATW3YWGiUaItc/HZJm7zcPy1TaaXRXhrUKqCo5j55qWszK2Xuyd/aq3VdEGdpj0vR
         7SavUJNDoWdU7bFZe2vKH/Najw6WNZnKCHVI6xoFBhgpX25dY7fBASpNw3jtT9aJBlFV
         j9l1X76OABgczwZEDOAF3MpTaE5zZ+gCLpDgnkDEb2jrPtjzG/QJQRlw8umehP2FrLbG
         sAFZ5SvfNU1LTU0+jlA/PYkTO2D0rbbYDRtWDY+CsF1rRTyhuioPoxv9c4lV/or0ipVC
         Dm94KHEwNuEEG/rO3moyBpxLzJCWdNRGMQlEHgA37AnX5GK27bQVwlRgNhT/AGpDL7Dn
         CEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjeL0ukGbIMoZUC81j5SahR9MRyMNdlHl2pod7bFQBKUDY9DZiX7ojnGK7QEM75C+/akJRMeBCWjug8orT@lists.linux.dev
X-Gm-Message-State: AOJu0YyNJqjtmfQeXG4pTMai5eSIBYe2dCAUftinEHUO/xzdd6ovnAHC
	CrGRHheWVrkF4lh+LB0Ajpe+tcJm785G/FfQcyl2ShI4AtnOmskEFqAKmKMLDi66vtRUsfFS
X-Gm-Gg: AZuq6aLhm1xuaMy0Xp344FYCyL495zINFufyS+6v4S8s4hNHpqr9DX+N14OEll9d5ci
	yQTysNVZHyzoZtEdeKRxMmqk9OPwcZr+IFXR5I2Am5XflhZJL01n7xckDgIAOziAD3Ga6rntN9c
	J/1e2oeRY4UGMkDBaWJjmpxnOmxd9yT3v+DS6rzer83G91pfFTMcAkU6y45H5KE2388GDdCZLpM
	X2v1OQK3gwweP6VCWMNkjLmTD8wxunwFPFyXoRS1N7NF9CLrWFIvlGf4P+Mo6U48OUKOutNGOR1
	tkFNDIUUTDG5I+hFY4ojARx5KG8LcVw4MV7ajcKNpSXelp7bxY9u1JPmHbr4W674R98+bSSv0pf
	Dw4GdrElQDQ2i6o1AAlP7S7ELeAOG02MMU10fpYY5iStjUGWZUNm3zDnC8FyMsYWm5eIaFc4b2L
	YAq5+3QtxJbmGxfv1rnmhKeie4xCfZllYO1/FItfkKOavwMhBN1dR1PSFACaxV7Irmo1qh4E+08
	mxIihhOasxSTp/7WxZchSbufCm76PFplhv2g+Dtrm17oDafWAsHPOLkrZ0=
X-Received: by 2002:a17:906:9fd1:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b8e9f19471bmr74044066b.36.1770160080597;
        Tue, 03 Feb 2026 15:08:00 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (33.242.13.34.bc.googleusercontent.com. [34.13.242.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0021b3bsm38486566b.49.2026.02.03.15.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:08:00 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 2/4] staging: sm750fb: use strcmp() for exact option matching
Date: Tue,  3 Feb 2026 23:07:56 +0000
Message-ID: <20260203230758.3056-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203230758.3056-1-iprintercanon@gmail.com>
References: <20260203230758.3056-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp(opt, "...", strlen("...")) with strcmp() in option
parsing functions. Options from strsep() are complete null-terminated
tokens, so prefix matching via strncmp() could cause false positives
for options like "noaccelXYZ" matching "noaccel".

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 4c6e84c03..bd2d4a290 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -937,21 +937,21 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
-		if (!strncmp(opt, "swap", strlen("swap"))) {
+		if (!strcmp(opt, "swap")) {
 			swap = 1;
-		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
+		} else if (!strcmp(opt, "nocrt")) {
 			sm750_dev->nocrt = 1;
-		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
+		} else if (!strcmp(opt, "36bit")) {
 			sm750_dev->pnltype = sm750_doubleTFT;
-		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
+		} else if (!strcmp(opt, "18bit")) {
 			sm750_dev->pnltype = sm750_dualTFT;
-		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
+		} else if (!strcmp(opt, "24bit")) {
 			sm750_dev->pnltype = sm750_24TFT;
-		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
+		} else if (!strcmp(opt, "nohwc0")) {
 			g_hwcursor &= ~0x1;
-		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
+		} else if (!strcmp(opt, "nohwc1")) {
 			g_hwcursor &= ~0x2;
-		} else if (!strncmp(opt, "nohwc", strlen("nohwc"))) {
+		} else if (!strcmp(opt, "nohwc")) {
 			g_hwcursor = 0;
 		} else {
 			if (!g_fbmode[0]) {
@@ -1156,11 +1156,11 @@ static int __init lynxfb_setup(char *options)
 	 */
 	while ((opt = strsep(&options, ":")) != NULL) {
 		/* options that mean for any lynx chips are configured here */
-		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
+		if (!strcmp(opt, "noaccel")) {
 			g_noaccel = 1;
-		} else if (!strncmp(opt, "nomtrr", strlen("nomtrr"))) {
+		} else if (!strcmp(opt, "nomtrr")) {
 			g_nomtrr = 1;
-		} else if (!strncmp(opt, "dual", strlen("dual"))) {
+		} else if (!strcmp(opt, "dual")) {
 			g_dualview = 1;
 		} else {
 			memcpy(tmp, opt, strlen(opt));
-- 
2.43.0

