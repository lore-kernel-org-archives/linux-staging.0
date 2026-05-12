Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A923905EE
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590725; cv=none; b=PgN1JmfVUOOWpHtwXVJAZ9Je7Y+rrAatlmz+88CfnEH6mkz+9uD7M6EiV1AhJoMk8Jw0cWGyyzfceLb2w1grD4pCCct0QOxVkePYKFLOsBDxwMha3dm8R0VIcuoNklv26y9/RO2sAoQY2fmoIbMGZmcAJceVSGECX2x7fuSIdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590725; c=relaxed/simple;
	bh=7Qcw0DaCmpjzy+DrmznnvT0UQN5+U1K+qUafdfH6my4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5a8eX/QPasxx55cIK6SxNrh+I46hmTpKieDFdJqPX5ELc8t1WR8rQPbU6cax4NRni+F8ZDKYsoCZuKC4jZYAaFlJJzh5eBN1TvOpUWbkRhINLm0AnHyG+QzcjMMm9wqq1k12JjZBkre8oSkd/3aGU54qTftSH+icu/wB6KRV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBenl+wf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBenl+wf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39396f873adso65878591fa.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590722; x=1779195522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xyZglDThcFwMaAw++Qv/VQvWqXL82jKvboQ7mNKpV8=;
        b=CBenl+wf9ZTAI2NOEVMa8axEUYqj4bLryPYnm3FYADz7BvX88b3h8y0UiSIcu6DOv/
         ZVNI06o2C7ouEGkothQEzy7755/oajk4RhwiiG2QeH0MNLwzhpxw/SMfskykCVhipXsp
         7HK9JU7HC+1dzjwTcIOZ7C0zwpFVnWWS+OQsNHFTJyULQF+VnoAscAPQn50QYEWsrFjd
         ZCyHNhhV4CdshxAhk+zTprnexTSnq5kgCTqnTDN6vrc8HdwtEcUybk2ZtzZzykMdd/zv
         to+S9jzRCy1THS/6THQ+MF2oKI8b1bihHrakcoGHj9Cb5jxwI0Pe/1WHfP9+pPujo2sx
         iASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590722; x=1779195522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xyZglDThcFwMaAw++Qv/VQvWqXL82jKvboQ7mNKpV8=;
        b=Ji0SBmTb10RsLsPuAZIcEsraCvjFapSP9uMiJWsFWZcVTiYwqSC6YEMg05FcRjpQ6/
         1Yo/lSsZ375OaK8EQx4KM8CVX1YuFUPqf9gut6JKVH/hA5zbhNhIjMqtxWUMQyzG6V9S
         3lr1N6/gEq4sl+2cJmMTsgbbaKeze8K1z+Vrxk5bguSsaKpQnLPFAZ0mJepfXcldcYid
         cgURv5WZhak1ezCtWJ/GlI58p79CtnA2/+U7KM9LzuVrxRb3a2v40CQrsvex+u9cBsgL
         LogdoFxHYS4t4aopRrZRbB/VFZQ7p6aif8SIZA86nyHxefMvtJYXzwMOpbs45Sxo3izy
         H8qg==
X-Forwarded-Encrypted: i=1; AFNElJ+Z60Kcz2h6p7uCnX/PKUbS8kcJd7obkXGB3xk4hUj9A56GxQD43jYoldmVqTa3Bok3tkfCd0qeXGgAomaF@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9YAEsRfA7YPks+b1DwRZU5MEMdcw//oZ+NjfgQsoIJnqETubk
	xF3cfYAxNNBvu9Ey5baFLGmajm7fByLNm+oBVKKydp3YM49PWIpjHirF1L2z1A==
X-Gm-Gg: Acq92OFcsh5++LviTj7UOFJcwazydmNB1odM5+r4oFElk40k9eoEe8V5++ZzXzbB3dV
	8v76PPZlud3te5P+EeKMb/EI2DUNzkiw5MIKxoKomi14v7AZFwlqkJkr3+1liqP4Bg1nE9ej/2U
	9d+rz6aJyIZS7aXTAeU0SeLaeCv5yHO/fiMXoRrUZrVOtqSy5J9TYdXTSKlUWKaqOD3mAAlMkon
	iuEsnFBkUiKW610F4G7lhFofeQZFgsWDmHvWwjHiCf6tuDEMbLoceb9nWMGSlgs9ucyMS/rgvmP
	qoUQ1b5NY8nbBWNCBChK7sgFWWeREWpcWLVRdPRVhEdD5ewFuGozZMPNxU+2fLeHf2RKX6oK0Vl
	LKBFXfCOxT3x2MjI8GYuTXTBTNyGDKtf7k4kQJpngrENHd4W3hPFRhYjM8+KQzPY5zlbW7WG6V9
	aH5TDndgS4TCPKCWjXQWXHCfru
X-Received: by 2002:a05:651c:154c:b0:393:d776:bc89 with SMTP id 38308e7fff4ca-3943ce57a74mr9464671fa.21.1778590721386;
        Tue, 12 May 2026 05:58:41 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm34949831fa.30.2026.05.12.05.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:58:40 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove empty InitSysInterrupt8723BSdio()
Date: Tue, 12 May 2026 15:55:32 +0300
Message-ID: <20260512125703.6878-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512125703.6878-1-nikolayof23@gmail.com>
References: <20260512125703.6878-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function does not do any useful work to initialize interrupt, so
remove it co clean up dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c |  5 -----
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 13 -------------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 1e0498268aee..eecfc593e2dd 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -532,11 +532,6 @@ static void _InitInterrupt(struct adapter *padapter)
 	/*  Initialize and enable SDIO Host Interrupt. */
 	/*  */
 	InitInterrupt8723BSdio(padapter);
-
-	/*  */
-	/*  Initialize system Host Interrupt. */
-	/*  */
-	InitSysInterrupt8723BSdio(padapter);
 }
 
 static void _InitRFType(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 0c0c243c46eb..f7f6e273c868 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -581,19 +581,6 @@ void InitInterrupt8723BSdio(struct adapter *adapter)
 				   0);
 }
 
-/*  */
-/*	Description: */
-/*		Initialize System Host Interrupt Mask configuration variables for future use. */
-/*  */
-/*	Created by Roger, 2011.08.03. */
-/*  */
-void InitSysInterrupt8723BSdio(struct adapter *adapter)
-{
-	struct hal_com_data *haldata;
-
-	haldata = GET_HAL_DATA(adapter);
-}
-
 /*
  * Enable SDIO Host Interrupt Mask configuration on SDIO local domain.
  *
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 13f13076bc16..252b0e1646e5 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -26,7 +26,6 @@ extern void sd_int_hdl(struct adapter *padapter);
 extern u8 CheckIPSStatus(struct adapter *padapter);
 
 extern void InitInterrupt8723BSdio(struct adapter *padapter);
-extern void InitSysInterrupt8723BSdio(struct adapter *padapter);
 void rtw_sdio_enable_interrupt(struct adapter *padapter);
 void rtw_sdio_disable_interrupt(struct adapter *padapter);
 extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
-- 
2.54.0

