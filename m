Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C731433D513
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548069; cv=none; b=WfUbYAvk34yKXBexoYDgz57IIX1uAsTiw7XU8jNI97pUgXkxX+GCLW360Pt9AMG4mvdesgvYoYVyysBW38XZ2dGasJb4oMZCxInPhJqa9EnB5+cBM7M2RR/GBOP8HklMzdWIHuzPY9cY6iL6TTsjpQuplP2Tq/40C5oh707WnfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548069; c=relaxed/simple;
	bh=09EsHM0XWxOtlJPU1WX2qZmGxyI0lzeI24djkkcnGYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EbbkwukgpsTUoZDufpblVNG/yA/9o8QoOn62t7X92SUeJBuXkE1C0wradNXJI50L3Q4bMLCS2sbto7uGhI8/Yqor2mXvsvQOOZF38Nf4EWabrNmsPoiTMBI5hxjjwYbylyNkoLx/snqYsl24VzqCEOSWJGs0LxEpB32w5L/Dl6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ornw6aT/; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ornw6aT/"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so54297955e9.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 02:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770548067; x=1771152867; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gee6j3Nhagod6OKsFyP0vgwT+iZ/TvwykmcXeqLktgQ=;
        b=Ornw6aT/zCdXz51b4cG9g3XD+tOR+WTwR69Pwx5jbe+cfqPpJgoNaDdjZXQ/uELpVv
         UDg7yYw1T+7+LVN5ic79DnuEL6McTW6Ni7zHw7ivDNc6W/4YIvqAN2LVbrW4Ih+la7v0
         sCJarkkMDhBmWQv1MBY1R9AOfg8KgNnqSzig9ONCqn3mJWbeqDgpgiOsqslZLr4No67O
         AzxajX+9DSdqevY8q3xpo3HgGAW7Tm4jqbN8c4CUsp6LXKjWGMuuIq6D8pFdgfVJeG+O
         6YTMvX/VgjewKP2YbuZqJS2+JLhXzq0S2EpRmHfIXg8gRODf668Xvyo/MfKue+qxcsPO
         EsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770548067; x=1771152867;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gee6j3Nhagod6OKsFyP0vgwT+iZ/TvwykmcXeqLktgQ=;
        b=vhScVbHwVz6SwhtTDxngrAxBlczZMtHD5TcpcF1607XQjpdacC2aWKvAxXP3zFyM0u
         nVjjd51hmO0f1YivBL7jICaPLU/5hyckctS+MOCYNnhVMR6j9R+5Yfg3YX7ZaXfEPWAh
         u3Sq3MhUUPfWwj3foeuBE6QN3qfsDs+f++kJyBxyWgq4RxwknrhcppJpn6XN4HH1tJaS
         0wKnU4cA6SsX4uBMQNuhy3kpzcfCTIlmG0vakUtsTkWPCbkEZu2Zu7bWHm1Sn0ZJn/DE
         z8rI6QxZ4lERm+Tf6tD4VoHkQ5lgEzpaEs6BXeN/VY65JVuV4WKeDN1kzD2STGRs58ED
         +pxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU2DWfdBoLiPcpvB2EoDqV62Ci887KiqV/L/KDj4ggKn/b+tUswurwtggJ2MBd0zbpNikh/W35ECtRVRgc@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0rXYw0hG0oMKrh44ZDOdVN0tex98z46FEbWKU2Tjb7TPai4CP
	tww/pEz15vdeKyrpUxWOCWhwhFTFUkJOb0Gjc8z+zfvj0v42yORcDXaW
X-Gm-Gg: AZuq6aLp/zOwm+7s8P+NQtOifHBwo+dBqn595fYrLTBo6UNarQBgQTZTITod905+V/Y
	8YPWFewp1GT7CCTNxrWWoGB5nWWpGNl7OkGxfDhBWCk+jtOjbN/fSYPAv7v49mQtoq5DkPRSXFm
	IdbSksGn9CJP9cRbrgdZLGzuxzn0L9gAjGUt3+yS4hD9bZL1oLAKYJ4Kin4BqetEQ8al3EMUhv5
	gWduo7XnzF2O1idKcqI/HZX8aS037xaPttsi7Hd8fsc0Y0lqZ0DYTw4sJST4NFhQmUAcjzJHLvY
	SkOCZnj6cedCiJI1TJHTlVV3IgkE6MtTRHva027WSVoW8fnwkn4vGF3zn7N+6znPWhvbx1+DI1L
	+dBbHFg7RecQ5XyvLeV0/3xW59LYuDXuKLJJ3fWsJOOwgRs6F8ZKMY9qbUYnM5AnThPgsj83Kyw
	==
X-Received: by 2002:a05:600c:3e12:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-48320180a1emr117052625e9.0.1770548067006;
        Sun, 08 Feb 2026 02:54:27 -0800 (PST)
Received: from BERA ([31.223.74.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm235819465e9.2.2026.02.08.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 02:54:26 -0800 (PST)
Date: Sun, 8 Feb 2026 13:54:24 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Refactor setCCKFilterCoefficient to
 remove duplicated rtw_write8() calls
Message-ID: <aYhrYLYDsxAzWfd1@BERA.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Previously, the function used 16 individual and repetitive rtw_write8()
calls (8 for each channel condition) to set the filter coefficients.

The new implementation uses a table pointer to select the appropriate
swingtable and iterates through the 8-byte coefficient array using a
single for loop. This achieves the same result without changing logic.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 28 ++++++-------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..ed447daad3ad 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -121,25 +121,15 @@ static void setIqkMatrix_8723B(
 
 static void setCCKFilterCoefficient(struct dm_odm_t *pDM_Odm, u8 CCKSwingIndex)
 {
-	if (!pDM_Odm->RFCalibrateInfo.bCCKinCH14) {
-		rtw_write8(pDM_Odm->Adapter, 0xa22, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][0]);
-		rtw_write8(pDM_Odm->Adapter, 0xa23, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][1]);
-		rtw_write8(pDM_Odm->Adapter, 0xa24, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][2]);
-		rtw_write8(pDM_Odm->Adapter, 0xa25, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][3]);
-		rtw_write8(pDM_Odm->Adapter, 0xa26, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][4]);
-		rtw_write8(pDM_Odm->Adapter, 0xa27, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][5]);
-		rtw_write8(pDM_Odm->Adapter, 0xa28, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][6]);
-		rtw_write8(pDM_Odm->Adapter, 0xa29, CCKSwingTable_Ch1_Ch13_New[CCKSwingIndex][7]);
-	} else {
-		rtw_write8(pDM_Odm->Adapter, 0xa22, CCKSwingTable_Ch14_New[CCKSwingIndex][0]);
-		rtw_write8(pDM_Odm->Adapter, 0xa23, CCKSwingTable_Ch14_New[CCKSwingIndex][1]);
-		rtw_write8(pDM_Odm->Adapter, 0xa24, CCKSwingTable_Ch14_New[CCKSwingIndex][2]);
-		rtw_write8(pDM_Odm->Adapter, 0xa25, CCKSwingTable_Ch14_New[CCKSwingIndex][3]);
-		rtw_write8(pDM_Odm->Adapter, 0xa26, CCKSwingTable_Ch14_New[CCKSwingIndex][4]);
-		rtw_write8(pDM_Odm->Adapter, 0xa27, CCKSwingTable_Ch14_New[CCKSwingIndex][5]);
-		rtw_write8(pDM_Odm->Adapter, 0xa28, CCKSwingTable_Ch14_New[CCKSwingIndex][6]);
-		rtw_write8(pDM_Odm->Adapter, 0xa29, CCKSwingTable_Ch14_New[CCKSwingIndex][7]);
-	}
+	u8 (*swingtable)[8];
+
+	if (!pDM_Odm->RFCalibrateInfo.bCCKinCH14)
+		swingtable = CCKSwingTable_Ch1_Ch13_New;
+	else
+		swingtable = CCKSwingTable_Ch14_New;
+
+	for (int i = 0; i < 8; i++)
+		rtw_write8(pDM_Odm->Adapter, 0xa22 + i, swingtable[CCKSwingIndex][i]);
 }
 
 /*-----------------------------------------------------------------------------
-- 
2.43.0

