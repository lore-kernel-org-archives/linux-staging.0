Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB851C3314
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770094066; cv=none; b=DIvy8o5jJqte9IqcTY+Se/PqmsDIt1jhWp+w1LSsx8/loFiwi9jPw2ywjhZtCdfFBNyfPah6h5jKlfLR1e55GoRcN9mfxus9tHGQ9hgQp9AEoILSb3QUTwz1EI25xO4p4Wqv2rRAgr3/eaJi/4ohLhm+iBQcODM1qHS7dA1A5aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770094066; c=relaxed/simple;
	bh=hwNItnnw9ihKndNzU/DeMWvoMF3si335m+ak60VRNN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAujYWqO9cwf7b2nFLaJ5599b2/ijfSPZASP2pC+8kvbji7xbG2q+jYfzFB5z6Vwag2Gcg3gNkfd0ig8LodTMhAlvlowolxDy+mtZ3VeFCWC2MD/cBtL57kyocOSJl8ikw47+vIuVWWPrxQoEgiFo32QC8jRMSmTplALTRI0r3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAZ4b49a; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAZ4b49a"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7bced39cfso54822955ad.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 20:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770094065; x=1770698865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=doaACG/D+VS8vv3mxSVPzZpMTEXTnbMFWjr/fZXYyuQ=;
        b=dAZ4b49akglA4SoI4sYdvfFSrynlfcRDn36q1ha6ottrQN6u2M/4EzCS0kRYnRr3RW
         Y1/KPjx4Hl0F2Y+uFy/PZ4jGca9s3j72xdW8OSSTmpN9R3GN5svmdeHDnApgGGeSqILI
         TsFgq9ZgUx45Yr/S8qy5S7SYJt3WmO0vIOrizZOWKlAslgivDJ6lAH98QZ5AlZcCNed3
         ySr8qKfixOnlAMlWOAjxPoxr4FHx8zWH3xlHYxZ36ylvBTLl5cbHhEWm1EOX/4EMK3v7
         a8lxPaMpSfrTO3g1hRcx2juag4xz0LdGsniJcms/2cLpZ0x9/scCfsRybOPjABv0k41S
         bfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770094065; x=1770698865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doaACG/D+VS8vv3mxSVPzZpMTEXTnbMFWjr/fZXYyuQ=;
        b=Kd7xkuFBHGo94bj1s/U8hrWn7tlManPoREE6guq1+Kg/0jOGfJmqbL86nHM78u9n5S
         qdQG9kwHfSzgnt7Rr24ulwE2WA/aYIKTmIqZcO+vtREL+2FUvXwx4Sep2hDbfFqSLC6E
         Zav8vmyjTNtVvjWzd7zpYTdPQCowxEK+W05/C9DWVP57cr57DM51Dxc4q5PDRFeQpQXN
         ICzdl7MF9u2nn+1QUYCUInOgxXxJ4DOmNnlH/DTVa4wbZNH9MWPcHqPpt+zsMrcr4izJ
         zO7Tork/TjFpuePNAJGua1hnjXdQkdm4YVAoXMkXAjZgSvRH9jXPY+v5P/QBYymUpaZm
         hgsg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMYtAyHMz4Fq6NH8wKQvMNIAkkRZE/odxApzyAAUA8ivQoXArpfUI2Z2wbVSU3vxPmfTLzgB/rjuzzwg/@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Se3YoephnFkknHhu7ct1vgPs2GuEq1AaerVfapNJApYk641M
	mXLr2e9cUgCl56PjVOMxB+qJeQEzYrRHxuwBLWU3JS2YTlHx+bNKl5sh
X-Gm-Gg: AZuq6aL7z/y7IYFnaoimiLSymfv3w52bGeEumto4OJbH70/2i+DFAK/HmetVQuOwnXI
	GbdgtubFcjjCj8LYu2JWgoZIRpMeoiohm3AY7cO+ZhkKN1jO9KkIBVbyptE75W1o14aw7H6F2PT
	F4Nk8auMnI3l18Ti/DHBz9AVuZgeCWcOhSosCAUlHq8G1H8q4JOOZYWkG9zcJLPacTZn27ofHQK
	U+xr3DGNakTwL9IC3EiuQhBOLhlPMNaPFA8buPfBFlOv+8lA5fF2Zf2mWtV5UvpLKtd7hg+sSih
	oC5on+BjACGArRTikxyivfmhl0jQ+EanJx0x0ek4rXR240FBh8tbFyftsh76g5hmZJaX16xbc3+
	/efTY0b457qKGJOpa0GRecVqIEJv0pyaKU6H5GlmU9mhfhMEXxoX05DxOPh570AU+yMeZPVE8UK
	cll5nVEA5YMw2yH+MG1c3CEdbzwUB8wmJBOw==
X-Received: by 2002:a17:903:1984:b0:2a7:3db0:6e1d with SMTP id d9443c01a7336-2a8d96a6af9mr100225895ad.9.1770094065094;
        Mon, 02 Feb 2026 20:47:45 -0800 (PST)
Received: from krishna.. ([103.220.210.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8ec56da60sm85791515ad.38.2026.02.02.20.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 20:47:44 -0800 (PST)
From: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Subject: [PATCH] Revert "staging: fbtft: remove goto from define_fbtft_write_reg macro and clarify empty modifier fbtft-bus.c"
Date: Tue,  3 Feb 2026 10:17:27 +0530
Message-ID: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the goto-based error handling in the define_fbtft_write_reg macro with an
early return while ensuring va_end() is called on all exit paths.

Also add a short comment explaining the empty modifier argument used
for native byte-order writes, instead of introducing an identity macro.

No functional change intended.

This reverts commit 6eec69e273e124dca8549fc52b0958b2953085ee. As per maintainer's feedback.

Signed-off-by: Krishna Agarwal <krishnaworkemail1308@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 41 ++++++++++++++++---------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 0ab4f5c4f886..9b9df0edc158 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -10,7 +10,6 @@
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
  *
  *****************************************************************************/
-#define fbtft_identity(x) (x)
 
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
@@ -43,28 +42,30 @@ void func(struct fbtft_par *par, int len, ...)                                \
 	*buf = modifier((data_type)va_arg(args, unsigned int));               \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
-	if (ret >= 0) {							      \
-		len--;                                                                \
-											\
-		if (par->startbyte)                                                   \
-			*(u8 *)par->buf = par->startbyte | 0x2;                       \
-											\
-		if (len) {                                                            \
-			i = len;                                                      \
-			while (i--)						      \
-				*buf++ = modifier((data_type)va_arg(args,             \
-									unsigned int));   \
-			fbtft_write_buf_dc(par, par->buf,			      \
-					len * (sizeof(data_type) + offset), 1);    \
-		}                                                                     \
-	}											\
-	va_end(args);                                                         \
+	if (ret < 0) {							      \
+		va_end(args);						      \
+		return;							      \
+	}								      \
+	len--;                                                                \
+									      \
+	if (par->startbyte)                                                   \
+		*(u8 *)par->buf = par->startbyte | 0x2;                       \
+									      \
+	if (len) {                                                            \
+		i = len;                                                      \
+		while (i--)						      \
+			*buf++ = modifier((data_type)va_arg(args,             \
+							    unsigned int));   \
+		fbtft_write_buf_dc(par, par->buf,			      \
+				   len * (sizeof(data_type) + offset), 1);    \
+	}                                                                     \
+	va_end(args);							      \
 }                                                                             \
 EXPORT_SYMBOL(func);
-
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_identity)
+/* No modifier --> No byte-conversion is needed, data in native byte order */
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_identity)
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

