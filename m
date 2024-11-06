Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68974208229
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918047; cv=none; b=ie9dHX9qa+5jI4ti/MXJLlU/Vp6sah9cIJEuyw3jcrtgYqXSXzG9j6ElLm1sACOGWY0pnHPwce9gTDuPjYKNn8nf/jCIU5rsKq0jmtjH/0XZdhl+EEJX7B3JzlYEY9DfU7j5HocOaICAH6agp0HyzNKDkIUgwqynsEgjeJ4wvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918047; c=relaxed/simple;
	bh=ujon/TnIZaIf3M/ZysmN/DYEURTbS8NW77AlIhTm9r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AA8u3Xa4KYFe0tMxcozpw1ZRBHQb2cP0vsPXRHyIA5PWAy5Phy82lcv77kP5ikBivwEzobRbRhQcB5tq2lTsQJIIbW8+Vt55xh+Dx7b/wekCnR4qb7eZfmKV0CFGjZSnsBXSA6mIwjx/puPsNBy1f6m9r4O+ENzvfWPLYjuIIsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQqNATrM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQqNATrM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a4031f69fso10861566b.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918044; x=1731522844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVry0sRO8ZHXz4GG8DebayIRXDP/gGEhpiGEaTFDJC8=;
        b=QQqNATrMRUXKIFHrsYF0Svq3zg/oB3GxxnisVs3pTv4jVjXlB4/Vqt+ycA+SYK4v2L
         jOHiai1/vQoExDjglzFqANGeLmzdsqlPRfCzNOlPTSeDqC/DLbthkrkZpM0cyh2A2blW
         DhJLT7q9uXebZFVyPPoxwOCuvbk8SfViNIiD1IvTt3EmPg4/cf6rYoo0Uo0Q7/HEeoxR
         GAqbjZnX1iHrJ/EzM8Nh6eLYsFjjx3pNzt/g7R2CLxZ9g1q0pCMOjkXRyQUerWPsqPdX
         481ozOg0a60yq0EH5y4/W32NCTQN1/mT8Q+H2gucvnqjnDEyW74lGzFDF2m8tOD9b5/o
         W9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918044; x=1731522844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVry0sRO8ZHXz4GG8DebayIRXDP/gGEhpiGEaTFDJC8=;
        b=OtqcWmmIioGqyFvcXHLow7y8hDBuUAOnbhmMTOf9Wz2+Iomz3fQ2dXCs9nnc1+kVgH
         Trmzpo1PiffCBNFm5jKAjVeG2sAoLSlp2P8Gw4iWn+Te+8XB3oXzWDC4gwfGUjFNaYrs
         b0X7jJBhSoY936C7I2iFomqlQ+KbJLqLdTbSdUhioA0ltKCfjOEFHr1/bYESBu0FcAKh
         7kauBazISFltaBuZq3r40PRQIrLPusvssVowuOM12t4Xq0e9x7MARmkPSRCMUNc9QmNq
         trMvVGZfrFiekAsc3KKNt+X0UE9nb81CUh/2l4h5hptmIosX5VwDHpdPUM/pD4Lyd+0W
         1ZIA==
X-Forwarded-Encrypted: i=1; AJvYcCV8OohSFPshrARKyDQnvUaLfbVa8Czng2/0rhOupkZsoihTehav6WMr5i3mMNgi6cOBFY5FFJbVH/B6qA1D@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1QuJ7ctraM1Uv67oAxrebMCiOH2qV2S6MIZgNHM5UDcyWxX4U
	lSmBcRmifnaZzZUBqu86OiInWKT8Cl8LUlEYIEc6mtBIiRGt9cZrzJ8KDQ==
X-Google-Smtp-Source: AGHT+IF/t44LVhTPRYiKDhpeI3D/ZhLJn+4riyKlErYne47aNsR6CmzoMCPpHroVqa8wApfjaxsCnA==
X-Received: by 2002:a17:906:f58e:b0:a9a:2afc:e4cc with SMTP id a640c23a62f3a-a9de61a128amr3808363466b.58.1730918043497;
        Wed, 06 Nov 2024 10:34:03 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:03 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 15/16] staging: rtl8723bs: Remove unused function efuse_WordEnableDataRead
Date: Wed,  6 Nov 2024 19:33:44 +0100
Message-ID: <34ae6c921aa8a42407def96360db5b9a7f3dc5b7.1730916582.git.philipp.g.hortmann@gmail.com>
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

Remove unused function efuse_WordEnableDataRead to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 41 -------------------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 2 files changed, 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 557f87306141..fcd9ac58b96f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -311,47 +311,6 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	return bResult;
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	efuse_WordEnableDataRead
- *
- * Overview:	Read allowed word in current efuse section data.
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/16/2008	MHC		Create Version 0.
- * 11/21/2008	MHC		Fix Write bug when we only enable late word.
- *
- *---------------------------------------------------------------------------*/
-void
-efuse_WordEnableDataRead(u8 word_en,
-						u8 *sourdata,
-						u8 *targetdata)
-{
-	if (!(word_en & BIT(0))) {
-		targetdata[0] = sourdata[0];
-		targetdata[1] = sourdata[1];
-	}
-	if (!(word_en & BIT(1))) {
-		targetdata[2] = sourdata[2];
-		targetdata[3] = sourdata[3];
-	}
-	if (!(word_en & BIT(2))) {
-		targetdata[4] = sourdata[4];
-		targetdata[5] = sourdata[5];
-	}
-	if (!(word_en & BIT(3))) {
-		targetdata[6] = sourdata[6];
-		targetdata[7] = sourdata[7];
-	}
-}
-
-
 u8
 Efuse_WordEnableDataWrite(struct adapter *padapter,
 						u16		efuse_addr,
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 546f32dbd33a..5f72be256acf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -97,7 +97,6 @@ u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudo
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
 u8 Efuse_WordEnableDataWrite(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-- 
2.43.0

