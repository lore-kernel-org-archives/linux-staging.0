Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D7346E5F
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364519; cv=none; b=S4ujEh5jPXDFU5IrrFw5mtEln1KupE5SzDXqCkXsUcphssBR9uga0YK3YtLJwM7rWr78at2/zchSAqoh0Peqmu2GqyHKlNbff/UbNqvLQpcYHUFPzo9vSO0tgmi/lIqM6vdBukDD8yC3DXc9wut6GlUcAMlqirT6XyxTPYGpQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364519; c=relaxed/simple;
	bh=2hte9lIuoQ4BMUAqgK9M30yeXoTE1ZhLJtl/t/TUiAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/jnVOnVHUqDpjsdlhZl091EmDOifK9v8bS35ZlwI0JOZF20JRXjZ2OgQKVVP7cZC7N/LtrB1iVMvmbgpUUO8rhNc2GyLQKcGbF6GXxDIvbMhPqYfZqG0NG/yfyJ+SDO8pf8gqysNYY6OhsdVhhSAJIOB4ZVebwQHSCMXO7VDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjxNnQ+u; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjxNnQ+u"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4358fb60802so1172301f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364517; x=1770969317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8dqEA/QSCIKURcgQbmWvahtGU7Ye4208ZH3mDr9IXA=;
        b=NjxNnQ+u4t/RDtpRF2J1Bxy44j15biS432bSzFQk54EUBmUaYPJtaxwvZ5hIf3sEMV
         2kExH4iczwCDMPvvnYactrZpW/4kyGbhTuTfm6OCD0FLWDmUCC9sdeiIaDxLDa3Htq2z
         qKinNJBYfnGa/s0HfMDVke526QzmVROeo2jI6wXuVYWhXYMSuub+OeofUKMm7+uyzcz2
         6zW+/9DqQ6mTHUjCpOx808mmiZvz6kqvtcEWIaXRqlurs80Ol/Vhzua5e0BsUDdBAJti
         H/tyxLNWS/OlN3mMj2+v4Ivy9DYMXm8DmDipYeMKEIABtFLzuLQUcpMvU/v9RN81+5nv
         48FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364517; x=1770969317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8dqEA/QSCIKURcgQbmWvahtGU7Ye4208ZH3mDr9IXA=;
        b=fwFe7POita8iHS3KS2EAQG30bYiseTGIRty2RVM06yqKPyDNvmkvtz0BKceDmUgG+I
         o/hM1kEjqKTx/yGgt5zdvISHKZg3SkhrJA5oaE47YYrCzg+FcfHJWwJxlcggdDCLeH+q
         IKTnXQlHwgd1udc97VKoP3g9clDkOTll7MPM4/xDkrrnvAj+4hwgilr8pb4unW8E+18E
         MTgPyd85+KJinaM08RQ/HiwG+zldeYuKqzAZfJjr5Tu+qDNXMUQk2WzkoTSn2xveU75a
         Pos8KSceoTd6WrOnRbj+dnhFuvK+MaCRBr6rKSMj84eBQ3lqvYBkY2e3F76tG3gQ1Top
         s5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUXQWS+dRXEQICfaE962PTptcC9Z6ShjchJDsx52hsele2HEP7/plDTmcksRSj2MxbWOiHrhMpYNO9+4llF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpw7JdxxmyzGdKYviHsQUlBnf2AJpyg18C9aaUogTng2GjH+s/
	bu+d64dGB6rXCh/eic2/2rWoZUrOCujOEaG51+4xUjWxon2yj0XFUGYu+9DMors=
X-Gm-Gg: AZuq6aLOp5tarEdnN63mXEjxfQGy0oqrjnTr+4JFeB8i2NjLaavAqbcZtBFWy1bzqGy
	61ZfsvzQ+4qKRQ341mR9O2druMuw6X4oTsXS+ftN6ozR+xt0T9SrSFv5t1qzaLSOaEmho1IFPZA
	CPvHJH+UKsNQJxP9eZX5iF0Exr7nKNeDyooJXcexAG1nIt68ITvAgWJuoHfEiR7wxTb9STtTZGa
	EX9shwXh59X8WAcQVuZwNL6DU4g80Oib49O+xYIrf6xv/mWLt8HHeJFCsRaGkWa0tJQnrnIDxBg
	OxXM6OlrMtilt+ptG8s0Zu49Px/sjZWPJHKLxs/gS4mOZzJZ6bo+lMYxs/UQh01RlbBUDDmWJ7X
	IqN7uhshT/xbV9JZ7ZsArCfHTODzfxBPW71AqLcvjr673PpckZ0Y3lUvvSfw1TKPxVgw/aWvX/7
	EYgr01OUwnxJx8nOmMzQBxTRsF6F7TUpKhdA8dPPvWBlcAAHJ1yDgIrqD55zmVcMs=
X-Received: by 2002:a05:6000:24c2:b0:430:fcbc:dc52 with SMTP id ffacd0b85a97d-4362934ab53mr2944538f8f.30.1770364516962;
        Thu, 05 Feb 2026 23:55:16 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:16 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 14/26] staging: rtl8723bs: hal: fix line lengths in HalPhyRf_8723B.c
Date: Fri,  6 Feb 2026 08:54:27 +0100
Message-ID: <20260206075439.103287-15-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 166 ++++++++++++------
 1 file changed, 117 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 34692cca33f5..567a23627db9 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -101,13 +101,15 @@ static void setIqkMatrix_8723B(
 	} else {
 		switch (RFPath) {
 		case RF_PATH_A:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
 			break;
 
 		case RF_PATH_B:
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance,
+				     bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
 			break;
@@ -957,20 +959,25 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		TX0_C = (Y * Oldval_0) >> 8;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, 0xF0000000, ((TX0_C&0x3C0)>>6));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, 0x003F0000, (TX0_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(29), ((Y*Oldval_0>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+				0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							   rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
@@ -984,12 +991,14 @@ static void _PHY_PathAFillIQKMatrix8723B(
 		reg = result[final_candidate][3] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][3] >> 6) & 0xF;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, 0xF0000000, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 
 	}
 }
@@ -1035,22 +1044,27 @@ static void _PHY_PathBFillIQKMatrix8723B(
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
 /* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, 0x003F0000, (TX1_C&0x3F));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY] = rOFDM0_XATxIQImbalance;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord);
 
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(25), ((Y*Oldval_1>>7) & 0x1));
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY] = rOFDM0_ECCAThreshold;
-		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
+		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
 /* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
+			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] =
+				0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter,
+							    rOFDM0_RxIQExtAnta, bMaskDWord);
 			return;
 		}
 
@@ -1060,12 +1074,15 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		reg = result[final_candidate][7] & 0x3F;
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, 0xFC00, reg);
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =
+			PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
-		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
+		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28) |
+			(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord) &
+			 0x0fffffff);
 	}
 }
 
@@ -1086,21 +1103,29 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
 	) {
 		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S0];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S0];
+			struct adapter *a = pDM_Odm->Adapter;
+
 			/* S0 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
 			/* S0 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
 		} else {
+			u32 (*tx)[2] = pRFCalibrateInfo->TxIQC_8723B[PATH_S1];
+			u32 (*rx)[2] = pRFCalibrateInfo->RxIQC_8723B[PATH_S1];
+			struct adapter *a = pDM_Odm->Adapter;
+
 			/* S1 TX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC94][KEY], bMaskDWord, tx[IDX_0xC94][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC80][KEY], bMaskDWord, tx[IDX_0xC80][VAL]);
+			PHY_SetBBReg(a, tx[IDX_0xC4C][KEY], bMaskDWord, tx[IDX_0xC4C][VAL]);
 			/* S1 RX IQC */
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
-			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xC14][KEY], bMaskDWord, rx[IDX_0xC14][VAL]);
+			PHY_SetBBReg(a, rx[IDX_0xCA0][KEY], bMaskDWord, rx[IDX_0xCA0][VAL]);
 		}
 	}
 }
@@ -1360,11 +1385,15 @@ static void phy_IQCalibrate_8723B(
 	/* u32 bbvalue; */
 
 	if (t == 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
 
 		/*  Save ADDA parameters, turn Path A ADDA on */
-		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
-		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
-		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG,
+					    cal->ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG,
+					   cal->IQK_MAC_backup);
+		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					    cal->IQK_BB_backup, IQK_BB_REG_NUM);
 	}
 
 	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
@@ -1407,12 +1436,20 @@ static void phy_IQCalibrate_8723B(
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
 /* 		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
+			u32 val;
+
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
-
-				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] =
+				PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8,
+					       bRFRegOffsetMask);
+
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_Before_IQK_A, bMaskDWord);
+			result[t][0] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rTx_Power_After_IQK_A, bMaskDWord);
+			result[t][1] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1421,10 +1458,15 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
+			u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_Before_IQK_A_2, bMaskDWord);
+			result[t][2] = (val & 0x3FF0000) >> 16;
+			val = PHY_QueryBBReg(pDM_Odm->Adapter,
+					     rRx_Power_After_IQK_A_2, bMaskDWord);
+			result[t][3] = (val & 0x3FF0000) >> 16;
 			break;
 		}
 	}
@@ -1439,12 +1481,20 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_IQK_8723B(padapter);
 			if (PathBOK == 0x01) {
+				u32 val;
+
 				/*  Path B Tx IQK Success */
 				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
-				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
-
-				result[t][4] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
-				result[t][5] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
+				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] =
+					PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_B,
+						       0x8, bRFRegOffsetMask);
+
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_Before_IQK_A, bMaskDWord);
+				result[t][4] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rTx_Power_After_IQK_A, bMaskDWord);
+				result[t][5] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1453,10 +1503,15 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
+				u32 val;
 /* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 /* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
-				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_Before_IQK_A_2, bMaskDWord);
+				result[t][6] = (val & 0x3FF0000) >> 16;
+				val = PHY_QueryBBReg(pDM_Odm->Adapter,
+						     rRx_Power_After_IQK_A_2, bMaskDWord);
+				result[t][7] = (val & 0x3FF0000) >> 16;
 				break;
 			}
 		}
@@ -1468,13 +1523,18 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
 
 	if (t != 0) {
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
+
 		/*  Reload ADDA power saving parameters */
-		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateInfo.ADDA_backup, IQK_ADDA_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG,
+					      cal->ADDA_backup, IQK_ADDA_REG_NUM);
 
 		/*  Reload MAC parameters */
-		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
+		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG,
+					     cal->IQK_MAC_backup);
 
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      cal->IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
 /* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
@@ -1613,8 +1673,10 @@ void PHY_IQCalibrate_8723B(
 		u32 offset, data;
 		u8 path, bResult = SUCCESS;
 		struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
+		struct adapter *a = pDM_Odm->Adapter;
 
-		path = (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte0) == 0x00) ? RF_PATH_A : RF_PATH_B;
+		path = (PHY_QueryBBReg(a, rS0S1_PathSwitch, bMaskByte0) == 0x00) ?
+			RF_PATH_A : RF_PATH_B;
 
 		/*  Restore TX IQK */
 		for (i = 0; i < 3; ++i) {
@@ -1624,7 +1686,7 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		/*  Restore RX IQK */
@@ -1635,14 +1697,16 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
+			PHY_SetBBReg(a, offset, bMaskDWord, data);
 		}
 
 		if (pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] == 0) {
 			bResult = FAIL;
 		} else {
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A]);
-			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask, pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B]);
+			PHY_SetRFReg(a, RF_PATH_A, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_A]);
+			PHY_SetRFReg(a, RF_PATH_B, RF_TXM_IDAC, bRFRegOffsetMask,
+				     pRFCalibrateInfo->TxLOK[RF_PATH_B]);
 		}
 
 		if (bResult == SUCCESS)
@@ -1650,7 +1714,9 @@ void PHY_IQCalibrate_8723B(
 	}
 
 	if (bReCovery) {
-		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C,
+					      pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+					      9);
 		return;
 	}
 
@@ -1752,7 +1818,9 @@ void PHY_IQCalibrate_8723B(
 			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] = result[final_candidate][i];
 	}
 
-	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover, 9);
+	_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C,
+				    pDM_Odm->RFCalibrateInfo.IQK_BB_backup_recover,
+				    9);
 
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
-- 
2.52.0

