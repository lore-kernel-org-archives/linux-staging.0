Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7093D8127
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842803; cv=none; b=JfwYiDOanvckFf/Kn7CSqu/LU+pOTRUYsHBtHSHhpi5R3/pS9otqVwFhnAMzJvE7u/xGVHMe/9ta1ewc76xa+MQ3+hhqs60cnuVZPPs/rG514AnpJbEKOQZAyPJrqcxO0FkL9pO3jreFC+YO4/nKCQ2k71hGNF8NsD434a2m6ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842803; c=relaxed/simple;
	bh=QgeakaD7Ac9VUShZlu872v0LX8c6hJ6rlRXALoBMrHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nE2G+CnA+BV8HkS7Ezi+PqtxAB/kUvyGmzqwjvVAfDXpg9d/wrIkAZ8StfdS0/zSdpKu4CHECDbrFrF8PCQ0Hd3+irp1NBwPxaNoVgpNXSxsTrxJ2oM0M8FoDBoyZo/NcSGDn7rTQ+4AQCcRqboHAWg5BjWghWenIszf+Gf5S4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5kJT1XY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5kJT1XY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8df7620so5101090f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773842800; x=1774447600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOB+sCYamiqirUeOgxCj8EO06rTLVbDoMJcYNCW03kA=;
        b=Y5kJT1XYWH/TKSI2dQIDlrrBLPgK1NYAe2YjGmxUEhbWeMPkdn/h8LozA5pKmRW/fR
         aXGMFU8TRUQj/tEHPr2ELKc73gcjCpl27jnKUIBaLzMXFqQ3B3MOtaAMG73XLmusbgvF
         cBtnmC4VrvX9dhX2otIzQ58ZY4/1j//GeRzEKxcACIAl8Lo9QRSr/8bUf9PP/zNIUxGU
         X8+/AOovTB+Xg+bzMlZjH+w0A0nPBuVEJQ0KFe5RsVYq70ucQSeTCmR/mtJgsFE3Hlhj
         ZZ9A+ZiYFn/qQg9mR1g8A5YR1Q4IuJvIbW3m25T9k+F2UyoR7YbELqirfWMbdVUN8TOC
         bQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842800; x=1774447600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOB+sCYamiqirUeOgxCj8EO06rTLVbDoMJcYNCW03kA=;
        b=CcgdvveMLK/5l31vMAX1j8kshAEp7X8I3t2rA5+9hQalDDPjVGmrCKm+476iH8z0GO
         GDplQUGJW/0QjWhwPDHFV/LaXCPP7yyBgQRELzwsAC0futl1cTB3JFimAuD/NRYik6oq
         +Oe1LRSJLLqdEiXSc0z4uwKqbHV9Nguz8itxXUGXTl6nJq7VY4X1KCRU7mthXK+6l6A+
         c/nvU5yEW8//bXXVl/VQx4w0d48luSm8nydV08AJ1vRsfTIlPxG0+PJFWNDbVqn3VA0Z
         V8hiIc/nzwvojKBnH+1Cu8VpDE7LpCtcautSI9hw7KV9P96pQPqldH3GhNHF44nFw/Cn
         N5mw==
X-Gm-Message-State: AOJu0YwfMLViFL699SheCRzgREdCFy9Hc+fnm3N5f5jZWvoxg3Mgvam3
	zSIi4Wy6LkFfYeml24lJoS8dT2cjv/KfbTq+IZIuEI/p/f6ayCjb5mT6
X-Gm-Gg: ATEYQzyacl4MSpKVugng985B1iHkhpyIoqnhag8BdLrgM9LBRvS7g51/AgYDFwaWrEW
	Naj5pAd4C/5SjtdaHE7TW3xGQYNYgvPzwnWhTiJHl7biIz2OyJB4KmwD7anBowxMNdO+KsBSxda
	OxHxhUdzlSny4F56YZlOjigWbQhXMgr1z4+oJVgyP9mjmghdmEn195H0r03/4Ba6qG2mho3TAWE
	funNxm8cmYfob0DHpE8zbhRvg+Z7xVr2113xpBEX2lE3G70SiQXTJB2w0l73EDTlNA5pCZprDze
	Usch7uxWrTbJUkfcCZKNlPfHEOLzCkAvRgO7h1N5s2IMvjIk3zXt/yBVdLfHs0SgDU4lKYMNvvF
	og2KzZxuVSoKLZwZZNVziwXDSDJ9Kld6f2nwO9vu+XxTka45lEMqFsR7qQAKxtFm6ecPF/rtctn
	k2rMjdqb1xN0sK8arb0ne+GJI1QrGuzol2XvsCV9lS1kvPmz1Pf6e+eg==
X-Received: by 2002:a05:6000:184f:b0:439:b636:1fa4 with SMTP id ffacd0b85a97d-43b527c9ea5mr5860974f8f.48.1773842800028;
        Wed, 18 Mar 2026 07:06:40 -0700 (PDT)
Received: from localhost.localdomain ([46.106.232.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm12950700f8f.16.2026.03.18.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:06:38 -0700 (PDT)
From: huseyinhealth <erdemhuseyincan09@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	huseyinhealth <erdemhuseyincan09@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix code style issues in rtl8723b_hal.h
Date: Wed, 18 Mar 2026 17:05:39 +0300
Message-ID: <20260318140539.4686-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: huseyinhealth <erdemhuseyincan09@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 7ec84304a..cd3b49338 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -28,7 +28,7 @@
 #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
 
 #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
-	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
+	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
 
 struct rt_firmware {
 	u32 fw_length;
@@ -133,7 +133,7 @@ struct rt_firmware_hdr {
 #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
 				* Added by Roger, 2009.09.02.
 				*/
-#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
+#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
 
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
 #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
@@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdID;
 	u8 CmdLen;
 	u8 CmdSeq;
-} __attribute__((__packed__));
+} __packed;
 
 enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
-- 
2.47.3

