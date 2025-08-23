Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2163825A351
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953022; cv=none; b=r65wWmTKwv8LyS74IaKZE0McBL1+wFJp98xyWpRevXe4wN8BHFI1Sfh7k3NsX9i6IEJdc+t+TWf7+CEBcXJ2d9qlwH4rNlb3jue6gmKvplv4xRSDwgZjeXEDSiP/R3LxU6eHuWmYCPTKr7JVYXhJygc8fhDPd7t+nQnK1HfSPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953022; c=relaxed/simple;
	bh=K2GtzP1Tp6PLlfmQr1Kp1P75OZIn7IvpZyIysY3IAnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXpaQx6aGOER7oGbXG7ONU0f3HDNKPE3rBWfQKrc8QMLAUgZ6vwhUCfOU9iAT+HyaYwJHYp54OXboVlXo0rhA5BFpLmkpUAhQ3XPkdIa8y4BA13A5wfXkBES+y0BwBNklq9n5KHwEMbOzLyyzko/S9UwI7SPMKG+ThOPJvpIAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8tb1KGe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8tb1KGe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afca3e71009so613173466b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953019; x=1756557819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/T8DTnsDa48J8Nw09VdyHPo/w3+O0UEktrhRhKVLZc=;
        b=c8tb1KGeocdnI+9BqEJ1LeGfDwcfGimzv0Nhh5thp+kzIzg3HPJAJTSKoh7fNI67J6
         jE5BtGEl9t2tpjJs4rhDEsgKkQHIqwCg3rHQFtKlvdcGPbTW/EjZUtica4gvU7K+Lna6
         PdzIGzWc/re47Q7EF1HbiRmopIgbre6/O/wcUDbtPxBECmjjRWDbeyDqRrK8bysbZRd+
         qdEUouP/ySS0ooNKVZNc6tm0D2K0AEf8txNzQF93t2BSgt7UxRvQNbUSD23IxKExjLyg
         3ctyDyF3fLu8DLsBVhKE0s0x6d/GY3GCzQYQBTGV3DnIKgi81C3ESenvXmeMoiFw7v/v
         V17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953019; x=1756557819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/T8DTnsDa48J8Nw09VdyHPo/w3+O0UEktrhRhKVLZc=;
        b=M7FFFa3ofvPPsB+2zQFhGrtr7wK9MU/Fhl5Tn8KnEtPNDKAtKGpUHXYI4sMnP2yAdc
         dhzG4EYmQnPMymRpkspV75e8T7XUY7ePwwR/P0mJVoLXOj0Bj5kS03PQFDGvXvv7lPrB
         OOfQn+eHwxB4ACObZ//zw1OQjGuNixYG3WqiuFlhtJ1IbDLlH7R6iEvoV7BtcIzrsXqz
         NMBJxxxN0UUkj238dLtGJGY4QPj6HCbDcWV7CEyAxPlQOkSAlNDWE/1Vu8wXh1wCep7K
         5VCy9mm+y54OnjgiHjWJGMeEjIZ4LuDxqCjqwlyyg+veKeB3WC2i5fjjdiDu8gptxVfP
         pTfw==
X-Forwarded-Encrypted: i=1; AJvYcCWu9TZ9H+ZryNIBFXd/jy4XZ04DUAs+cWdiT/xkoo6+XHZ74WYj38M4lBPvQANSHgb6/PCLadMyxW+uQ5Kr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+v5H+h+PUYth/VoFPLxlymOfqIdJvtzcdbClpUZGvwEcnyUud
	MgAPXGQA9+R04CsHxbHxDDsXnDbF6aWZf2XljaGaUHlljKspEGBYdNWKlCdpRg==
X-Gm-Gg: ASbGncvDRf5OgEOmUh9tqL97IL1zPXVjpLtXSfVc5iM3SKcv3XA1CZ0TATmijMWnjQE
	G1XCbBvDgTGCPsVf9QxzLYaSGTBPjqScDdmoDprNnXuvGW9C01MymJbUTPjcUTUXzkZEGJ//4HF
	jZDGI0JDN/q9+zdAAHVL+NJPPAMV4UcWAhPFDj9pw/JqjCXDOYZwsHViTPtbeGDTYsVQ18sD6dK
	CDNYwMmiq0Z9f9RxO7A7er+pBtTxMddqO6pntWHA7+Ux5Ttax1SyUfISJAmlPD+BoGb0ZPb7f4Q
	DhhTbie8BNLZ1scCHLrd2AEG1eNclDrYDCsC8VWHOeZZMgtjCk3eWpAoETrMjqlIqUoAm4iB7+E
	AdRdxvGnsHUypFNP84T/ejSHJmw==
X-Google-Smtp-Source: AGHT+IEheKPxRuuoJ+c7oqo62GuSN8YIYg1PG8sW6j7mepnpvA8qCpSnad+S6HjtVsMmkKwECfvCew==
X-Received: by 2002:a17:907:9693:b0:afe:5765:2012 with SMTP id a640c23a62f3a-afe576604e0mr183099966b.15.1755953019144;
        Sat, 23 Aug 2025 05:43:39 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/14] staging: rtl8723bs: remove wrapper efuse_ReadEFuse
Date: Sat, 23 Aug 2025 14:43:11 +0200
Message-ID: <20250823124321.485910-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function efuse_ReadEFuse is just a wrapper around Hal_ReadEFuse.
Remove the wrapper and use Hal_ReadEFuse directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 42 +---------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index e865f83c0967..1079e2bc3287 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -97,46 +97,6 @@ Efuse_CalculateWordCnts(u8 word_en)
 	return word_cnts;
 }
 
-/*  */
-/* Description: */
-/*		1. Execute E-Fuse read byte operation according as map offset and */
-/*			save to E-Fuse table. */
-/*		2. Referred from SD1 Richard. */
-/*  */
-/* Assumption: */
-/*		1. Boot from E-Fuse and successfully auto-load. */
-/*		2. PASSIVE_LEVEL (USB interface) */
-/*  */
-/* Created by Roger, 2008.10.21. */
-/*  */
-/* 2008/12/12 MH	1. Reorganize code flow and reserve bytes. and add description. */
-/*					2. Add efuse utilization collect. */
-/* 2008/12/22 MH	Read Efuse must check if we write section 1 data again!!! Sec1 */
-/*					write addr must be after sec5. */
-/*  */
-
-void
-efuse_ReadEFuse(
-	struct adapter *Adapter,
-	u8 efuseType,
-	u16		_offset,
-	u16		_size_byte,
-	u8 *pbuf,
-bool	bPseudoTest
-	);
-void
-efuse_ReadEFuse(
-	struct adapter *Adapter,
-	u8 efuseType,
-	u16		_offset,
-	u16		_size_byte,
-	u8 *pbuf,
-bool	bPseudoTest
-	)
-{
-	Hal_ReadEFuse(Adapter, efuseType, _offset, _size_byte, pbuf, bPseudoTest);
-}
-
 void
 EFUSE_GetEfuseDefinition(
 	struct adapter *padapter,
@@ -311,7 +271,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
-	efuse_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse, false);
+	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse, false);
 
 	Efuse_PowerSwitch(padapter, false, false);
 }
-- 
2.51.0

