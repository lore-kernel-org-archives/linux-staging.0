Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1941D516A
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411223; cv=none; b=X0nfXh6VEgvG6OF3WseXlkHbJxtDwFJfHRleMdO2WQnenxMBdVeiZ/GJj+4czsKO9EQgayTz5XgiYKexPrZy+shOnUYQKVtIjaBZGBqAnTFecL1IISu88MUfJNEx4K41qbhnn7hq/SpexdtKYPGcFCeyKxxvKybvAw912SjSL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411223; c=relaxed/simple;
	bh=5EGtzJ1cMbOymkIecmlDD7A+m6NCguni7LbhMLAGmKM=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=ENzmtpzUggoWcNbgdxrwOorhWk1irhUpIzxl1pDURrmcFBjC+rOlBWNlszg6adEl0AJtA5Wjik0EXFvW0+V6H4jYMkT+n+gwDe6u1p1ho7HGQO7YkGS49cYi0QX/1nCySvZFXvMsgYkx5unsu7lhTLUnO7YkwLErkqZPVlk5LzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm1nqsrr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm1nqsrr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc457bso122168f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743411220; x=1744016020; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtxUbrlQcpIDc0UcOWH0EPLAdbTyQEPVRfkNKbeKs9g=;
        b=dm1nqsrrMtLFhoG8Nuvg7AbtVEGsonS2DBS9WlBHIiT3gTGWNkOtMyjvt3fbBDnoW/
         l688JdK0vEqgpDBLNXOIbaxRKZfzejXcHSJXjyOcj1mYVcwZ2kt304qL8qtSa0DWqhq8
         7fZPWmt1HexORj01tlXvrpOQGKjYPIV8DWIiCUQnIBE6Jh8eLX8M65pXCs7tCpQ26IfS
         q9FxBEVloK0r/2+esbqALPstKxFBcVlGzaevAA46V6tEPkNlczy5RN6nKIOHmf8gNdgW
         2/XaFyyKBUBblI6UG50t4iSs6NtvtajMG/DNg69BytncNpLPQ/LImc2vm5CzqziAfxn/
         F5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411220; x=1744016020;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtxUbrlQcpIDc0UcOWH0EPLAdbTyQEPVRfkNKbeKs9g=;
        b=VYHEo69JzRSHXe11+trLKgyIp5n0gJfcCOFrT+fY8EZsvSXBLoGEb58noWwlrER+fr
         glQVMmYFvd9XnviYTpqNIeBl0EfnxLasIfiT6FjyZICOkmXbWL7fNaJTPBl+5KS3kpZd
         dguUwG4WbiV5jnhe04J9ixbJEnsHEXn3QXCIimhm03xdjFLi23dbHhOfen3VYWyMJG8a
         xb9zvD4UeDI08IEHEfyvQFPO1srUVjNeX1444SokXp+UDaIFvJysfLIyszR38JYKGK9j
         epZ0R1HS4xPl1diN6XEzoFsldo8gqbf8sIiMKl4TFHHB2Jn0xGzSNjuOXHQIQ6Rdc9/k
         mFNg==
X-Forwarded-Encrypted: i=1; AJvYcCXo8ZnkaC0mjGDvrfpEIRuLpZD0mfnX7eHtNt+XRJE84geUKVZnIsLomN9QiBByNS6rs4yDNLMxnAkj5+/M@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+yIPvT1Lw4zeWYOK/ro0KJr72/cAli+nRfgrmEXJLAwvIpiLJ
	pIHD0m1cRxk13CqT2yZ7A8cPtGdwcfdi9Vcb9fq7VbQmNqTnRvCr
X-Gm-Gg: ASbGncspfXTe7WCYymq+BPkqGu4slGC4qSCAglEW2LZh1g4gEe4JzvLNDYx9BKIdGCQ
	jxS3rG04gwxRlZFkIqsZwUe8HGlJuZkiExKNsT/bF/vv4xooUleEohHT9HftulNZCXg1tH4W02E
	qJW06pgLXjEksJMDPpd3XkTS5SwNvgXFyyouOjBerNbse2oB9lL4zYMkIl5Yi292Y3a1SYpq9KN
	vx4Y9zxLqzE1C1kWxmqp0F4FZdvlxVkR5j+mAZrFZAUaNgvsiGXElWLPcllgu05aTgkJsk5zbCd
	9xO6V8iASHfT3RpzneVtH7VKkQ==
X-Google-Smtp-Source: AGHT+IHwvB74wwNeidy3mQa+dv6lV/E0/a4qIZOa2bnY/+0tds3rmfJTIzcrSfjdOjcosUvg4F39WA==
X-Received: by 2002:a05:6000:4282:b0:392:c64:9aef with SMTP id ffacd0b85a97d-39c120de0d9mr6626741f8f.20.1743411219944;
        Mon, 31 Mar 2025 01:53:39 -0700 (PDT)
Received: from parrot ([105.113.58.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4200sm10813538f8f.96.2025.03.31.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:53:39 -0700 (PDT)
Message-ID: <67ea5813.5d0a0220.293276.775e@mx.google.com>
X-Google-Original-Message-ID: <Z-pYEL_knf6sSfZF@princerichard17a@gmail.com>
Date: Mon, 31 Mar 2025 09:53:36 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH] staging: sm750fb: modify function name to kernel code style
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164ResetChip to sii164_reset_chip
as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ResetChip>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..cc8ff3978d42 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164GetDeviceID,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b60245ac..795f8c86e3c0 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -250,10 +250,10 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
 	sii164SetPower(0);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb42c4..a9edc9474f87 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -31,7 +31,7 @@ unsigned short sii164_get_vendor_id(void);
 unsigned short sii164GetDeviceID(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
+void sii164_reset_chip(void);
 char *sii164GetChipString(void);
 void sii164SetPower(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-- 
2.39.5

