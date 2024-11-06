Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551720ADCB
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918045; cv=none; b=X/FYg6J5gbmA1MeSvfLkmktvVYjX0rRS5t80KyJsX5cxH+Hi/na4RgLTteDj7k+92wDlHT+EpL3yZVQ9SS626iLb6OVgy2YDXCKMklBAvxgzRQv26PGTg7iCurDI+biPQ0IwfDogAhW8M2NIj8rZX2r6RFKe4LvsDhppKXUo/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918045; c=relaxed/simple;
	bh=nF94VgLpUJkeXFfnuNcEv8uL/brBOQzMzSl3+POAVoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4GEvBkJuY5QNk2rCv/HsUdodOpF1Wan3m4//5H1k15h4E5v0TgJ1dFPr02Bwgolx7n/QW1shHoIM4YwlZxQTTJsTuOc9rTPk0OsfVLiE/I3it73eF/XNAnjT9Dp1YdxswsePgt6GlEy/FDQMtWB2SRfQgGfL50wJ2tc6rJZQpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmOooyfX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmOooyfX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so5663866b.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918040; x=1731522840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxTMhtxD7KHJNhiedBrkjQNv34RfpyOuX9BscP+yR9I=;
        b=cmOooyfXwPkF4wKNDrlcmuVdHvZs1I08i/Uyk3Xhbjsl2WxvPUW2G4h+rOcypBGs02
         Va0yFVK2Kb6AiHGnR9eq4AWKIuEIUgdyHIjd6AA/ZaqhDXZZ3TGLkX/INiMr9n6P1j4s
         xqznWz7izVMOGhAgAtJJvw6wOdzifNy/jpt5t3p+0S+myi0uIk58xDN+KxUelUp5TjzE
         e42DMUiIGFVtgPn5vT90wXCn50U0VvATH9PnBb/QPMdvlb2b7vpA2sET7m5r0Te7t/ZR
         988OOnJChV4onlF6ylIjT634A5upRJ6zOmRVisCvsdmfoKTRx4/r30o3AGXDK+LZFN7i
         DngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918040; x=1731522840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTMhtxD7KHJNhiedBrkjQNv34RfpyOuX9BscP+yR9I=;
        b=vB2IRdo9zwNqftOdufOwahozsn5Lyze5gs44iOH7gc/ReWnCJfal8a2kG9cqNfJZ83
         xTI9nZQhC1pSV7NI/hZVMg9nGZ3yv4SKsAyeH598/t5akfDIlxQMrF8/aXxofUclWzC1
         6iUhmlKl6ynJrUQML4W2kMcL+7l5eIvU6/yPN/+9swnRnyGF1fS853df4o5P9NuRL4iY
         xBzMgc3/5yfrM2/mNlwBKdOWnr73EZ72wIh3Aan6dGE4XdCCWsktQWjUOF7YaDFEhkRO
         ambb41M3ZxhVow5tOGoNJ6+z4Mrz4jQQXZtTsG2seuqubH5R1GGMUoMt9wPXxOSqk6NA
         cKrw==
X-Forwarded-Encrypted: i=1; AJvYcCWP1lsCVI4RI//FLIijUWnVazRLlmK1FQYyfnH0zlPjyr1vFxrJVytSPRZMALCjgOdCvsrPs/j+QwvQxEZS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyak4xicXQ5Oy+32XZj8qoXfgpNt4jUD/VoXinsj+8dvBILRND8
	0Owax8Qp7mVzRGL6qbqpfzp925WBjv7TB4yfZd6Bwv69/Blunw9x
X-Google-Smtp-Source: AGHT+IG4D3Pg2rvxEKMlZdbcO93uhIf8XDnsy8btxlafqxtMtVdfbKqk/kFGUBXh0eouAf1zjigCug==
X-Received: by 2002:a17:906:bc07:b0:a9e:b287:2808 with SMTP id a640c23a62f3a-a9eb2875ef0mr681262666b.6.1730918040238;
        Wed, 06 Nov 2024 10:34:00 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:59 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 10/16] staging: rtl8723bs: Remove unused function hal_EfusePartialWriteCheck
Date: Wed,  6 Nov 2024 19:33:39 +0100
Message-ID: <12274cb129683493e7406cdc19402d05d5f2ed07.1730916582.git.philipp.g.hortmann@gmail.com>
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

Remove unused function hal_EfusePartialWriteCheck to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 58 -------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 155987c417b4..ceb234cdbd74 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1182,64 +1182,6 @@ static void hal_EfuseConstructPGPkt(
 	pTargetPkt->word_cnts = Efuse_CalculateWordCnts(pTargetPkt->word_en);
 }
 
-static u8 hal_EfusePartialWriteCheck(
-	struct adapter *padapter,
-	u8 efuseType,
-	u16 *pAddr,
-	struct pgpkt_struct *pTargetPkt,
-	u8 bPseudoTest
-)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct efuse_hal *pEfuseHal = &pHalData->EfuseHal;
-	u8 bRet = false;
-	u16 startAddr = 0, efuse_max_available_len = 0, efuse_max = 0;
-	u8 efuse_data = 0;
-
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_max_available_len, bPseudoTest);
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_CONTENT_LEN_BANK, &efuse_max, bPseudoTest);
-
-	if (efuseType == EFUSE_WIFI) {
-		if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-			startAddr = (u16)pEfuseHal->fakeEfuseUsedBytes;
-#else
-			startAddr = (u16)fakeEfuseUsedBytes;
-#endif
-		} else
-			rtw_hal_get_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&startAddr);
-	} else {
-		if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-			startAddr = (u16)pEfuseHal->fakeBTEfuseUsedBytes;
-#else
-			startAddr = (u16)fakeBTEfuseUsedBytes;
-#endif
-		} else
-			rtw_hal_get_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&startAddr);
-	}
-	startAddr %= efuse_max;
-
-	while (1) {
-		if (startAddr >= efuse_max_available_len) {
-			bRet = false;
-			break;
-		}
-
-		if (efuse_OneByteRead(padapter, startAddr, &efuse_data, bPseudoTest) && (efuse_data != 0xFF)) {
-			bRet = false;
-			break;
-		} else {
-			/*  not used header, 0xff */
-			*pAddr = startAddr;
-			bRet = true;
-			break;
-		}
-	}
-
-	return bRet;
-}
-
 static u8 hal_EfusePgPacketWrite1ByteHeader(
 	struct adapter *padapter,
 	u8 efuseType,
-- 
2.43.0

