Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C850C208226
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918039; cv=none; b=RvjnwbJ1fAl9kwytREH7Hylt+lHmDB/CEyB1CzRwte9oy84ZBjMDIckRMTZF2BBY2KEVszepkFiR4X8SrG4Jb5XWmGBsXeCj+SzYprOdE2TINjUbKVKNnxyDkXvlbLOoZFO8Ritc1vc5jM1N0WCjNmRsjEexhLvLlI8TZmbw3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918039; c=relaxed/simple;
	bh=g6sBLUYkzsyXOm9RoSLhLsHpH6Q1sdfSsuPbf0Xpnas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ny8+yKPoOHkQPVGKRYhD3JVdAJ8howyElHiXLOiWzYrNg816TGyB/JcSzlKgNjeheuRF8TN6R62pX6L7mlqYZsLvWhPZmomCpRDqoR4yTun2oJyoMV/H0G8xoJ79YeFqxr4mghUga9gHyvPEfCyoPVNFEM5sRdiv10nHTMPJg9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io7qCWo8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io7qCWo8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so11024566b.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918036; x=1731522836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuJSNI4Y5QqkewpyI3LKafSzihDaZEXh1WGwp+tPk54=;
        b=io7qCWo8UbZ6pzPa0/QNvQjdo6ydfxNqGRvCj54/GcmZq4hsAyyZA+hQdQxMReZYA6
         CUgbRUq8u7QHT1pUjxgJlZRR00EUfOGPczk123RBw+QeEPHbYn9/6bF/Hg3p/TmISIhx
         EWyF5exOKYDu3LmSi2aLbwJv4X9qUkcELK/SLCnfVZ3g+rCy4+0YI7F1TLzE1pwq9aSW
         wDxxls9Tf1gFzRQqnsn0kz6Og3Ei3jYTbZU2NYRv3yhlRsz9NuHDvKPEAii9MN4QFBNE
         nxmalTdZT2Lm/ac7T4ampa5wGWezQF28+NRXuPikTAVxQLbslZCvTE2fIEb9MNE2CK8o
         5hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918036; x=1731522836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuJSNI4Y5QqkewpyI3LKafSzihDaZEXh1WGwp+tPk54=;
        b=rSKp0OdQwsKCfw4/6D/weagogCViEoNZs2C0KhBpa+YvwAdvPwQw9qaVCDuQkkqEKd
         /gr3zlYiBZ7cWTEQ3tZiDp9qFK6Yd/R7z7BtVTK4gLnP/L8Ems9at7pY+4Soi4Nfu4Ng
         12+C6IE9PxOwWqLNGT/5osT5FkIcLLpufiTf5Lgd8/MLc4hVpOJMr/thGTY+ASdocyFm
         IS3NVz6emte+WX+sADFPsF71T3mxVyORVA/DjvJS3O2lWbfFMQploLPF6zf3JNcu7qNr
         +ZwA/uowDPJlQnY6zBLKTkEMhY3PZBiQXCtkJnoAkFYmbqhHdLZb7w0gp7qSLwuKx0BW
         dZgw==
X-Forwarded-Encrypted: i=1; AJvYcCX0klvA6uQS9Qu5N4Otug8AvBJkGIiv9hv+FdJxh9+IyRlh7mfcpjLrgUELcBwrIbRniXl7mwwtKTIBaB0W@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8c0Kz/8f/PlhdTg+/GmbbFQztELaHj3aYnUYYuEjCvsu6pyUQ
	wMXb/UJFZJPaaZWfSSwgjuJgtgqCZ8Ze+BY5wxRG3FvTfxppoGR6
X-Google-Smtp-Source: AGHT+IGl7JHhLJizQ7k5GFivgEP2bu6Q1l8L0CokMFsELwyE66YWlPRM4HHeGC0NIcrCMLgBdxcbhA==
X-Received: by 2002:a17:907:3f29:b0:a9e:c430:7758 with SMTP id a640c23a62f3a-a9ec430787emr416682366b.10.1730918035949;
        Wed, 06 Nov 2024 10:33:55 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:55 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 03/16] staging: rtl8723bs: Remove unused function Efuse_PgPacketRead
Date: Wed,  6 Nov 2024 19:33:32 +0100
Message-ID: <83a819b953cca910c6236c1185d256abd21f2602.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function Efuse_PgPacketRead.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 10 ----------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 8e6c294c168e..e83daeb9303d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -311,16 +311,6 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	return bResult;
 }
 
-int
-Efuse_PgPacketRead(struct adapter *padapter,
-				u8	offset,
-				u8	*data,
-				bool		bPseudoTest)
-{
-	return padapter->HalFunc.Efuse_PgPacketRead(padapter, offset, data,
-						    bPseudoTest);
-}
-
 int
 Efuse_PgPacketWrite(struct adapter *padapter,
 				u8	offset,
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 0cb8c6f6d34d..de4e5906ceb5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -97,7 +97,6 @@ u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudo
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-int	Efuse_PgPacketRead(struct adapter *padapter, u8 offset, u8 *data, bool bPseudoTest);
 int	Efuse_PgPacketWrite(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
 u8 Efuse_WordEnableDataWrite(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
-- 
2.43.0

