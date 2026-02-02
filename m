Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE337475A
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049729; cv=none; b=FIyD3VJt4kXuhLTtSVgVZb1lu4X0rjUpZ/r7uFCGyjRNM2Uw7Nsv+CRPUKdm+piGjG5G1HIytd+Ca+IBnR8hR5eQz14UnU3+oP2r+F7V68Y8w3pTethViJhZRJOYlLGypPUqwsQF5HV9CVOwp9HbIKpstMlA5wE6fXhbEujiXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049729; c=relaxed/simple;
	bh=Ftf6AxmGQtAtNVtlE38F82dj2LDYE/4g8fYPDiaBt6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsUHcrmHzysliTJSSlzNXi4VRfNN45enXre6AIOICaCvBI+XAPMHbQBkXP77f9RaYSTYIKm0pRqQd00QWJw0NvnIoMLjtjBzhzyYtLFwV8Va6d9aCI9yyxYZ3mz3a0RBU1TtwDjlKZba8f5bDf2Z6XtsP0IJQnJjPhnYeQB89XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEY6ltuv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEY6ltuv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07fac8aa1so34723045ad.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770049728; x=1770654528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
        b=lEY6ltuvfL5kjcBnY2Hl/StnyjUf/yTOU7mjeb8aleHCii8eaEt5RDxq4Mk1F9fnf6
         4s1w9c5bnurbluGhRgXon1N2xlTNF5O/+3JqTeGI9uHPlAfPhf/YPaBoEquXyxiGT3Qb
         3F2H0DsNKpnJZ3yZJCTNJnmohKJUAG641/CPvyIQzcHsMDowV/C5GUATzXl9Gao/Ndo4
         FF1UbUcy0I/wgVcwKOGh56iWNDPOjAt9jQoOnl8xa5fvRCcgpLhYNWx1LgaJhWgj00tO
         AQkAMThiZAWhWtqzcg+pnYsATdIW0Nd9UWqw8qk3WhpdCKuAZ1+9aVozyrIvHwLwK6lO
         hf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049728; x=1770654528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sahNc25e8V/0vokuer5AdT6A9YG4/1fX8go429GK/ZE=;
        b=Lh5rlU15yuuhJsYFvQR/4irbZVBkl/4NNL6tgOKxErQ7GHRqq60iCG8hbgDAETklkb
         rsY26tbEgPTPdw6LbmIzAG/MvPWhSAgPJPrzv+neY2Dp75XQJKwMrOLC257ABgbeeHl4
         dOondUc2R4MPd2eOIj34uoLHPn/gJD2FDzGZJ5TOgT/5bNFax/dSrftWknq9C+4w+RQo
         PuPOtcGBSJSXP1xjLF61GsW+S5X2GaxaN8Il4y3EzZDHy4ATVDs/qylunJFmA4hOImIZ
         oB9miUbjWTG9azbsc8T7OktQlbyUVx3MRpVZLdW8g9Bh3Ak13QK5cdlUaLyA6OgEr/hH
         bc4w==
X-Forwarded-Encrypted: i=1; AJvYcCVpyQlAgu+wwvEA+uBKCTHgNNHOxm9Hgo/auDjOk4Zg9/S6QNvSAWoFWduAvy7D/ExBKUkfdozcrXwDn/Cn@lists.linux.dev
X-Gm-Message-State: AOJu0YyVIHfVmrRosLM/FQhLKU2PmKHVmCRJ0MI+xDIbRhqvpJmg1i7w
	MZY/d91y8/gBsrANjZHrXNJQfUifZ9aQT7oWESSiTp66U9F9Tq5oGjrA
X-Gm-Gg: AZuq6aI2BenkrvpxRtv651wyAVwSfy0Ut8IfpUpuf2ts92qKcbWCOvIV6vg9ItURer/
	f4ObRWdIvXM9x6syl2N8NWZJJG61kVgCUzdoDjeRvu4Tha5GBXNIKN1PVhVMSyuUJno7JFwHklR
	pBeZt+pN5r4LdykaRHyZhYQ9pyeo5Pv5JDuNSOWu7BDVKoyn1drWtfcpmnZ6WkD3/CttQ84fc7a
	H5nDYS1V3ia4SRxZXuf2nNXIupvV1tnVO2OwAPvZyP6c0c7CIfKQ1UdR90VJPgYZB2IbMaXQSRW
	Vl0t6OD+FzhGfoWpCQb+J6AyrIOeq6Qppt6uKZiyGN7vlhqpTdVB4a56wh69YhvsDRadRU4UN8z
	sAndSwg8nDMDC0/+M+iodwVmMrKWz1VXkgvJBLBwix7LZAgP0Dh95aM/XN+DHlTqF7h7NCGei0p
	kiTv4V8mvuaxuJAOIugtQGDgw=
X-Received: by 2002:a17:902:db09:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a8d818b2bemr140531225ad.47.1770049727956;
        Mon, 02 Feb 2026 08:28:47 -0800 (PST)
Received: from krishna.. ([103.220.210.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eee8bsm142211405ad.6.2026.02.02.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:28:47 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] staging: fbtft: fix macro flow control warning and empty macro argument in fbtft-bus.c
Date: Mon,  2 Feb 2026 21:58:26 +0530
Message-ID: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning by adding identity modifier for define_fbtft_write_reg().
No functional change.

Signed-off-by: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..0ab4f5c4f886 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,6 +10,7 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
+#define fbtft_identity(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -42,29 +43,28 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	*buf = modifier((data_type)va_arg(args, unsigned int));               \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
-	if (ret < 0)							      \
-		goto out;						      \
-	len--;                                                                \
-									      \
-	if (par->startbyte)                                                   \
-		*(u8 *)par->buf = par->startbyte | 0x2;                       \
-									      \
-	if (len) {                                                            \
-		i = len;                                                      \
-		while (i--)						      \
-			*buf++ = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
-		fbtft_write_buf_dc(par, par->buf,			      \
-				   len * (sizeof(data_type) + offset), 1);    \
-	}                                                                     \
-out:									      \
+	if (ret >= 0) {							      \
+		len--;                                                                \
+											\
+		if (par->startbyte)                                                   \
+			*(u8 *)par->buf = par->startbyte | 0x2;                       \
+											\
+		if (len) {                                                            \
+			i = len;                                                      \
+			while (i--)						      \
+				*buf++ = modifier((data_type)va_arg(args,             \
+									unsigned int));   \
+			fbtft_write_buf_dc(par, par->buf,			      \
+					len * (sizeof(data_type) + offset), 1);    \
+		}                                                                     \
+	}											\
 	va_end(args);                                                         \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

