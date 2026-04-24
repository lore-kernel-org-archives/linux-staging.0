Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8736E478
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022999; cv=none; b=R1VNRt7YZWYPHNYnJmfcRggqEcvhWBCF41uOlhBMB1lSMzsgbcUA0/G9XQ8EKnczrQjtgLsy+os6oU4F3GF1nffLe77AvVxL1wqXS/sBVzO0QF2UEU2MDo1fWZiNB7ZIUthYONVFaOb9+pFHGN5vp2Jzz6op8AmUly/iw1NUWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022999; c=relaxed/simple;
	bh=/l2cqmROFQs33BLokVYKJp8GESRrYrFjRXiK33lecRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SZB9g0I57SneDF9i684wd26IlNSIivjpZe97Qe0zKOpJScIT7pRZpPA5BPzwPH1fgD/YToEXW5Dp+RNmSyyya/vgFujUI1Q7I1eRtzExotfu3lRD+bb2lMiCAQHs2zjGzOgssuX6nzUVWQmJWVVv0u59vQprFpn1fIH/bwmlI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPG4Nl8I; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPG4Nl8I"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso75786725e9.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022997; x=1777627797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRmQYDLWnbQPdXE28Inb8Q/Xi2npOv1Gc9ccDpPNZg0=;
        b=UPG4Nl8I/VlY5Iiy6G0zSagxW/M6iJineJNmRPw3n/Vji5HsDCImT9z1JpOToY7cjG
         IH7cQx9F+0vKYYAzyZpM1dgdIqAv4dwhfzFAIcpfh2w1F0gf/xawnIpCpZ/FBvU1MSv7
         WIEa/JtLVLyHx5mbzD/DFl6Qs2otB+Pm3QpCMENe6qalfC64ixW3G8+JNg0NN57ZT7m+
         1v+jKkPymbNY7f9BO3cLE74toW1uyQIA8bA9CEeqh7mm6zulKYuadRuK363wB2I6n5rL
         g4z7TovL6Q7C7xq8PEEL4BNyy/mrGTdFRv6b03RZiZtlV+1hGLvDvFY14ixRHlgJa6dN
         edrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022997; x=1777627797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRmQYDLWnbQPdXE28Inb8Q/Xi2npOv1Gc9ccDpPNZg0=;
        b=W6/+jmfJ/eQF7yAg441/up0xs5jT0jzvq56WmmnHouN9RBqYTlqK+mqAf1hzpC/9Xz
         5y6CAUY09Ne9ngwNUcFmkhlCf9Oq+eed0e4Pnor+WW8B0IpY/jdjQ2rBOqqABV4g0tXZ
         pz98r9HtzhlB8Rc36UJhW/FhfD92YPNaKI1Pf+c2yAVFst7SAn09e3EfFiu1m3luJl+T
         ubLOMqjX8Xa3PyU+zsqRZ4i0MV6bjHsGk+Y319wdT0hlyy2ypAtKCXQZJyyT2DL+R2lr
         ViuT2NIuSV9iDyt3nm1CdLqEorOG0fBDby9u65BckX5mbSfHmSqKDm5CVy5sCbAsI0QG
         d9LA==
X-Forwarded-Encrypted: i=1; AFNElJ/gLCHE+38o5LUzZ78k7LRnp+mvUAGEj+aJRLDevGAWiNny2PKe4Zy7MJf9oxyt7vugloDLwbuddq8ZTvAF@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx2BbsN1ub+87wcqU80PVcayDfg8NmG8Hw+1CjusARCAolbh6M
	QkP1sZdKLP3diLGih5CA97E5troX0ZktCkJ4sCSI1oAhioYNEIfFTSsR
X-Gm-Gg: AeBDievcjD6u7Kl/zXCb6kw4+V55CBaIeYA6c9Yw196/MxGTcdoiYbc1IkrrldvWvvC
	i+Ngl95u5X5zU7zz6i1ahX0SRn6+nQVlEIHQqJvk1aB4HEQttyC2Z7FInJCromxiHuPjK8g0/5n
	rKxyN+LeuOYD0WpE61Elrs7+c986nR8f2q3o9z74e2/13h0CKYRLnLFlEdYymvAqEqKicTwNtQr
	AXZ4qgZedzyf7WKV0SpArNW9WaLyRR8DC5pHJ6wNGU3Gx7FGtsMGWed8bpO2qxCnYF32lW+ky6Q
	hfC9ZgTQZrqu7xcqRUqeDXv4aMABxfNNv7xlQhlLGy4SsJ+Xd6TLDi+/9WU79wsa8CexLtDRy1s
	5GeeL///YybQGTINdHzdvLZTlc2TrkJWKGXrTpdappjkGYB1AWbYXtEDel1+Iu2nVMZuSuZyL1r
	SK+fhYi9ltwDR0VXYVFE72Y7r0eHbndt/WSwExoK7OfhpfHUhGmTQy/Kk2mPhgSchm/7kUYCyv6
	agImxGTv8/RgnA4YYRCQnt0Fv2TcEAhieQxZ6xT1R8n6Sym/6tASYzws6eN5bvlhbyR
X-Received: by 2002:a05:600c:4e0c:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-4891d7a463emr288514125e9.3.1777022996567;
        Fri, 24 Apr 2026 02:29:56 -0700 (PDT)
Received: from ahossu.localdomain ([5.14.129.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm97787865e9.31.2026.04.24.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:29:55 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: fbtft: fbtft-bus: replace function-defining macro with concrete functions
Date: Fri, 24 Apr 2026 11:28:18 +0200
Message-ID: <20260424092818.3322248-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The define_fbtft_write_reg macro defines full function bodies including
a goto statement and a trailing semicolon on EXPORT_SYMBOL(), which
violates kernel coding style (checkpatch reports 2 ERRORs, 2 WARNINGs,
and 5 CHECKs).

Replace it with three concrete C functions that are semantically
identical to the macro expansions:
  - fbtft_write_reg8_bus8   (u8 buffer, u8 data)
  - fbtft_write_reg16_bus8  (__be16 buffer, u16 data, cpu_to_be16)
  - fbtft_write_reg16_bus16 (u16 buffer, u16 data)

The function declarations in fbtft.h are already present and unchanged.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 191 +++++++++++++++++++++---------
 1 file changed, 137 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..acd035203 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,60 +11,143 @@
  *
  *****************************************************************************/
 
-#define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
-void func(struct fbtft_par *par, int len, ...)                                \
-{                                                                             \
-	va_list args;                                                         \
-	int i, ret;                                                           \
-	int offset = 0;                                                       \
-	buffer_type *buf = (buffer_type *)par->buf;                           \
-									      \
-	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {                    \
-		va_start(args, len);                                          \
-		for (i = 0; i < len; i++) {                                   \
-			buf[i] = modifier((data_type)va_arg(args,             \
-							    unsigned int));   \
-		}                                                             \
-		va_end(args);                                                 \
-		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,                  \
-				  par->info->device, buffer_type, buf, len,   \
-				  "%s: ", __func__);                          \
-	}                                                                     \
-									      \
-	va_start(args, len);                                                  \
-									      \
-	if (par->startbyte) {                                                 \
-		*(u8 *)par->buf = par->startbyte;                             \
-		buf = (buffer_type *)(par->buf + 1);                          \
-		offset = 1;                                                   \
-	}                                                                     \
-									      \
-	*buf = modifier((data_type)va_arg(args, unsigned int));               \
-	ret = fbtft_write_buf_dc(par, par->buf, sizeof(data_type) + offset,   \
-				 0);                                          \
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
-	va_end(args);                                                         \
-}                                                                             \
-EXPORT_SYMBOL(func);
-
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
-define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+void fbtft_write_reg8_bus8(struct fbtft_par *par, int len, ...)
+{
+	va_list args;
+	int i, ret;
+	int offset = 0;
+	u8 *buf = (u8 *)par->buf;
+
+	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {
+		va_start(args, len);
+		for (i = 0; i < len; i++)
+			buf[i] = (u8)va_arg(args, unsigned int);
+		va_end(args);
+		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,
+				  par->info->device, u8, buf, len,
+				  "%s: ", __func__);
+	}
+
+	va_start(args, len);
+
+	if (par->startbyte) {
+		*(u8 *)par->buf = par->startbyte;
+		buf = (u8 *)(par->buf + 1);
+		offset = 1;
+	}
+
+	*buf = (u8)va_arg(args, unsigned int);
+	ret = fbtft_write_buf_dc(par, par->buf, sizeof(u8) + offset, 0);
+	if (ret < 0)
+		goto out;
+	len--;
+
+	if (par->startbyte)
+		*(u8 *)par->buf = par->startbyte | 0x2;
+
+	if (len) {
+		i = len;
+		while (i--)
+			*buf++ = (u8)va_arg(args, unsigned int);
+		fbtft_write_buf_dc(par, par->buf,
+				   len * (sizeof(u8) + offset), 1);
+	}
+out:
+	va_end(args);
+}
+EXPORT_SYMBOL(fbtft_write_reg8_bus8);
+
+void fbtft_write_reg16_bus8(struct fbtft_par *par, int len, ...)
+{
+	va_list args;
+	int i, ret;
+	int offset = 0;
+	__be16 *buf = (__be16 *)par->buf;
+
+	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {
+		va_start(args, len);
+		for (i = 0; i < len; i++)
+			buf[i] = cpu_to_be16((u16)va_arg(args, unsigned int));
+		va_end(args);
+		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,
+				  par->info->device, __be16, buf, len,
+				  "%s: ", __func__);
+	}
+
+	va_start(args, len);
+
+	if (par->startbyte) {
+		*(u8 *)par->buf = par->startbyte;
+		buf = (__be16 *)(par->buf + 1);
+		offset = 1;
+	}
+
+	*buf = cpu_to_be16((u16)va_arg(args, unsigned int));
+	ret = fbtft_write_buf_dc(par, par->buf, sizeof(u16) + offset, 0);
+	if (ret < 0)
+		goto out;
+	len--;
+
+	if (par->startbyte)
+		*(u8 *)par->buf = par->startbyte | 0x2;
+
+	if (len) {
+		i = len;
+		while (i--)
+			*buf++ = cpu_to_be16((u16)va_arg(args, unsigned int));
+		fbtft_write_buf_dc(par, par->buf,
+				   len * (sizeof(u16) + offset), 1);
+	}
+out:
+	va_end(args);
+}
+EXPORT_SYMBOL(fbtft_write_reg16_bus8);
+
+void fbtft_write_reg16_bus16(struct fbtft_par *par, int len, ...)
+{
+	va_list args;
+	int i, ret;
+	int offset = 0;
+	u16 *buf = (u16 *)par->buf;
+
+	if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {
+		va_start(args, len);
+		for (i = 0; i < len; i++)
+			buf[i] = (u16)va_arg(args, unsigned int);
+		va_end(args);
+		fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,
+				  par->info->device, u16, buf, len,
+				  "%s: ", __func__);
+	}
+
+	va_start(args, len);
+
+	if (par->startbyte) {
+		*(u8 *)par->buf = par->startbyte;
+		buf = (u16 *)(par->buf + 1);
+		offset = 1;
+	}
+
+	*buf = (u16)va_arg(args, unsigned int);
+	ret = fbtft_write_buf_dc(par, par->buf, sizeof(u16) + offset, 0);
+	if (ret < 0)
+		goto out;
+	len--;
+
+	if (par->startbyte)
+		*(u8 *)par->buf = par->startbyte | 0x2;
+
+	if (len) {
+		i = len;
+		while (i--)
+			*buf++ = (u16)va_arg(args, unsigned int);
+		fbtft_write_buf_dc(par, par->buf,
+				   len * (sizeof(u16) + offset), 1);
+	}
+out:
+	va_end(args);
+}
+EXPORT_SYMBOL(fbtft_write_reg16_bus16);
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.53.0

