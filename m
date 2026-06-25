Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A123DB30E
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387754; cv=none; b=fEmNjn6zLFz2cH3PqseAQwvCWH/mEUXfoKC8Dgi251x4t8WO1kQTbi6UpbXonas5ZfYS7lamwO4fXSbaLL/NK6CqSbQuLLZcVGaVmOqp2EHBW+fYZZpX89reXhZTOr9kHHgOcaKvuucAQZVZbJSXa6DEVKji8kLqcCVXuGc7cH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387754; c=relaxed/simple;
	bh=cq9o5A8vNpt7ZzVGQWLlQl750vKY+6ATDYniEMBZDfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uhug4KcaPu2FuJ0pur24A9HIzrRSjCwmNHUoGBACbu3rLWxcVkKWBFu4I4lbCAPafNv/QoY+b5FMeLfwvAlT7521RnwOv1yQAvDCEwKiNycKrh6+guwnSHUdD3jkTHBaXoveica2Mxtsgcl6JzQCX2A4/WQ+rY0EaLCvEQSo1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNIidApk; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNIidApk"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-139aff562e1so2972798c88.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782387752; x=1782992552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B73dDp79EG28EytJ5lKOIpIzktknebQaTwhx7eBVLTQ=;
        b=QNIidApkN2g5c6MA1aNs7JYeDoZojjgKIeXaOA7vEs5z2I/78Ewrgmdzdh++qSMIKJ
         yqKOf5uJYHoQ153dIp09DafEXyMZZvOtYVk3CoWB/quxK/FDEDQADiy+xBHn3A42b9SZ
         mbkzvkggGZJ7iWkt3KvB1kCT0RuMNPXFL1AvV34iGB+oumTgOY0fCfW+2f8AKWDQlKre
         GQDaMBy+GJTo5MuRFsofWuVipdgIMqXFVrCeoWiIKEqAlQyHLqy3u5hOt7tzqWiD+Wr2
         cbPpqZ07KCMk0igEvG14sIxcpx+5RgJ4WfbaBxEH3w/CNq7NndsIKrq5lDa9njfHuYsU
         /VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387752; x=1782992552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B73dDp79EG28EytJ5lKOIpIzktknebQaTwhx7eBVLTQ=;
        b=ZRVFbz4xLLJkg9ZpVfzEER24owHMrQBRISa1sfynqaeY541PtzmAcqlwglcRMKnUrG
         YC2DSxO6vMVSUso3lllpY9ex2sQWS0lM0j39BZ75+IaHZ5Ee8BC+ei78unMjvwcZw0gs
         zBNYKrX+Waho74q9cfjF5qwFYtD+iKFGlGfhropO1IRNsLBNmSnkH4Fe0kt9o08xbaWX
         fDODdIuI54bVTzCO7RtoSD1UB8VCbj6ChbdON9YKeJQ4fsqYwmre2iT1ee5fMENC5+I2
         338le//Ap4He8TfTjC+/vtJEv7LsB7AGsWFvqoUkCgtV8IXYo+Xe+WDdcIg8HhS8pR+o
         Nbrg==
X-Forwarded-Encrypted: i=1; AFNElJ/XhGCOzd0/ehEXY7ydVmJ1dwDQedUxRMV9+wCoO4CcjFJt7cbCX5OgdnYhlh6DVnI9FjIykGkOuzlrEMKz@lists.linux.dev
X-Gm-Message-State: AOJu0YypD//IeRbzdSXIx9jCI571MmAmKFo0xIgqvLAfHXC/fzjdFMcU
	oeP2rBSWI/YR3MijlBglbW5dSNU454gM3kUHtVTV/TJ+Fhe9PdyTMrh2
X-Gm-Gg: AfdE7cnXi11K7RFVz4b6YxO220hC8WxMz/9ov0I7yFfALebC1bvKqNd4aegNHMF51kt
	8HD3UqAbVxCWqk1Z3K3NKFcPw91JTlJuiQPilbxuXjwEipSSz7uIn1k6d29c5r/zrT2V+Jso84f
	8b0S5ArloJz1TVpot+ZftDULt74GsITPyp0cclkvEgPHhs8/7FmH3rl1nzzRsiHAmQgIYD2op0I
	VjeDkNW4XDMvonqKN5qhVFi0BTFMj/nWWHL9BaX5DOtdDZ5C55Ww8HcXuMhfgCCGBGYHCM6RG8J
	RWUtICEVe8Bqq7Rcl6c9C/i138rnF4tdi8Jwv6rVDyAJMloVSOXwgaXdwBRdNVox1YoCW9l912o
	Z1N8VZfGsbSOVVuRKjvJWOYkgX2U92Ib4UXxzxdWBDEa0kNPgbdiJO1nNlqdbx7CnSZzh6PqPpl
	GdsUHXQStJm++orut2ixKl250GL0tmSU7Gog==
X-Received: by 2002:a05:7022:504:b0:139:dab5:e2bb with SMTP id a92af1059eb24-139dba4ac87mr2092744c88.15.1782387751916;
        Thu, 25 Jun 2026 04:42:31 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm12312296c88.15.2026.06.25.04.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:42:31 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: fbtft: fix unaligned access and txbuf safety issues
Date: Thu, 25 Jun 2026 19:42:15 +0800
Message-ID: <20260625114215.325973-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625111602.438761F000E9@smtp.kernel.org>
References: <20260625111602.438761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses several pre-existing issues in the fbtft driver:

1. define_fbtft_write_reg(): when par->startbyte is set, buf is
   advanced by one byte creating a misaligned pointer for 16-bit types.
   Use put_unaligned() for register writes and fix the SPI transfer
   size from len * (sizeof(data_type) + offset) to
   len * sizeof(data_type) + offset.

2. fbtft_write_vmem16_bus8() and fb_ra8875 write_vmem16_bus8(): same
   unaligned 16-bit stores when txbuf is byte-offset for a start
   prefix. Use put_unaligned() for pixel data copies.

3. tx_array_size underflow: both vmem helpers subtract 2 from
   tx_array_size when a startbyte prefix is used. A small txbuflen
   device property causes unsigned underflow and out-of-bounds heap
   writes. Fall back to the non-buffered write path when the buffer
   is too small.

4. fb_ra8875 write_vmem16_bus8(): missing NULL check for
   par->txbuf.buf, which remains NULL on big-endian when txbuflen is
   0 because the PAGE_SIZE fallback is little-endian only. Fall back
   to direct write when the buffer is missing.

Also replace empty modifier arguments in define_fbtft_write_reg() with
a no-op macro to fix checkpatch warnings.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 10 +++++++++-
 drivers/staging/fbtft/fbtft-bus.c | 25 +++++++++++++++++--------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..06f650aac 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 
 #include <linux/gpio/consumer.h>
+#include <linux/unaligned.h>
 #include "fbtft.h"
 
 #define DRVNAME "fb_ra8875"
@@ -250,7 +251,14 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 
 	remain = len / 2;
 	vmem16 = (u16 *)(par->info->screen_buffer + offset);
+
+	if (!par->txbuf.buf)
+		return par->fbtftops.write(par, vmem16, len);
+
 	tx_array_size = par->txbuf.len / 2;
+	if (tx_array_size <= 2)
+		return par->fbtftops.write(par, vmem16, len);
+
 	txbuf16 = par->txbuf.buf + 1;
 	tx_array_size -= 2;
 	*(u8 *)(par->txbuf.buf) = 0x00;
@@ -262,7 +270,7 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 			to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			put_unaligned(cpu_to_be16(vmem16[i]), &txbuf16[i]);
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..52a0c5c0c 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -4,6 +4,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/spi/spi.h>
 #include "fbtft.h"
+#include <linux/unaligned.h>
 
 /*****************************************************************************
  *
@@ -11,6 +12,7 @@
  *
  *****************************************************************************/
 
+#define fbtft_write_reg_no_modifier(x) (x)
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
@@ -39,7 +41,7 @@ void func(struct fbtft_par *par, int len, ...)                                \
 		offset = 1;                                                   \
 	}                                                                     \
 									      \
-	*buf = modifier((data_type)va_arg(args, unsigned int));               \
+	put_unaligned(modifier((data_type)va_arg(args, unsigned int)), buf);  \
 	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
 				 0);                                          \
 	if (ret < 0)							      \
@@ -51,20 +53,22 @@ void func(struct fbtft_par *par, int len, ...)                                \
 									      \
 	if (len) {                                                            \
 		i = len;                                                      \
-		while (i--)						      \
-			*buf++ = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
+		while (i--) {                                                 \
+			put_unaligned(modifier((data_type)va_arg(args,        \
+					       unsigned int)), buf);          \
+			buf++;                                                \
+		}                                                             \
 		fbtft_write_buf_dc(par, par->buf,			      \
-				   len * (sizeof(data_type) + offset), 1);    \
+				   len * sizeof(data_type) + offset, 1);      \
 	}                                                                     \
 out:									      \
 	va_end(args);                                                         \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_write_reg_no_modifier)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_write_reg_no_modifier)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
@@ -142,19 +146,24 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 	tx_array_size = par->txbuf.len / 2;
 
 	if (par->startbyte) {
+		if (tx_array_size <= 2)
+			return par->fbtftops.write(par, vmem16, len);
 		txbuf16 = par->txbuf.buf + 1;
 		tx_array_size -= 2;
 		*(u8 *)(par->txbuf.buf) = par->startbyte | 0x2;
 		startbyte_size = 1;
 	}
 
+	if (!tx_array_size)
+		return par->fbtftops.write(par, vmem16, len);
+
 	while (remain) {
 		to_copy = min(tx_array_size, remain);
 		dev_dbg(par->info->device, "to_copy=%zu, remain=%zu\n",
 			to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			put_unaligned(cpu_to_be16(vmem16[i]), &txbuf16[i]);
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
-- 
2.47.3

