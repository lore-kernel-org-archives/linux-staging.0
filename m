Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE32264CF
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170088; cv=none; b=bDbMe/aSf83efo8FWf8/9gT1X0HKrFxCU2LZHGg37QxcHIzn8iAFzZAreWLS+PDGlclgKDhAEBRiMyn2RNVW9upxSEdCzvNxdeL394ATKbkttSIbyzWF8OfFoTHvqOyaWcam8KzM25E4GqMEDjVKGkxBBUxrpV4XjO2DajkNI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170088; c=relaxed/simple;
	bh=09X1FYDd5bLS3DPuAiSRXnDoFN1mXNFisgGOgUL8+Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLN0Ox97icvSRbOnmMCsJBoWU2IzIJnymKo1xZ+fDjoqcBc0hWu9N7Uuk48pub8b5stMDFDS4CHvN543Sh0tqosUKUY4n0J0Cc8bhRJNQauqlKCp3yEaRtjWRJbheaJ+OBk3jOwhKRjbWvMUK9JWnuRks+O09w2i4GcxO37W2Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVrdWnef; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVrdWnef"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso913143566b.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170085; x=1753774885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W1FPOz9tSHUX2gqoRxUY9TCTbS2xN4Rbh5H0nxiSmc=;
        b=gVrdWnefqPjfiijZ5pJ5KDvwIK4HBK3vK3w9vksA/cGV7JTmjduTqf05/VelskklFU
         oMzFrUq7jpRUE5NIYqa6muPqs3HJv4CdMh6PBGamBbKzQ7TVTsEQVtf9DTnoFSo5lQzl
         OkTgGlwbiEs4aYdZgG2egFdI20nWtvA4+bUKFYW4gQBVnJgwsbcvaHJGbc9hQ93wLTn3
         aMnbduj7aO1rK11myTJ6nCzQQTq/mDhm6GFXzqldpb+ziP2aGwmyFJFsqcyA0ZDwZxfH
         ut2LTBi9Tmwc6cRvPTDPKOJvV8gC6F3ek5cNM6SARs2yVBIAvoasFWvb4nIhCJuu8kpe
         CnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170085; x=1753774885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W1FPOz9tSHUX2gqoRxUY9TCTbS2xN4Rbh5H0nxiSmc=;
        b=gYMSoiDoAUCX+JgVqRRxfgpy9IWmiqfrb/AFZK0uTntYZ42KqYB6i5aqZy3Ibe89/i
         1gv0Q4AGqxRKoVCx+XmAe3kSx2DjKHTlWoaVHJpQ1B5hBPIVepDElfz5J3ESnjq7Hofh
         JmE7nSnjDBY+34mxwtaDzrrn4f38arPGVHWT8WNnZWK+u+3ofSqEwTm82G5wMhHtEviN
         itFK3twWEkYlbDiVv8lG52tKHF7n7C6lONwfBGeJr/yBjVnsMu959FmON2/fbkuTEEpV
         t5PY4AQhnQJvY5kEiD1qc+Xjg24t/RA4Zz52vbYgKBpPBhREprB45lIpbBxqnVKtShSy
         Atdg==
X-Forwarded-Encrypted: i=1; AJvYcCUXW2uyN9xlb44nLH6m+t6cmOEz/n+IaBFp06XwjQ95aJlSJx4IeEreEVTuTfNLvciF72nLnJr8BaWgzadB@lists.linux.dev
X-Gm-Message-State: AOJu0YxszfztBAPEy9kJYid2fsuTGk5w7CVHImt8YdC5yvgaCz+Ixyfr
	e052R55VF8r3gv8nn5+DBL21AYtVE2l5Pti1vSIKWSQlgklG+3WQPRQf
X-Gm-Gg: ASbGnct8ZxhF0zVYAV8WxDpryRCrrNA02YSvFZQHfNfha9MRMbWgrAvWHjscXKjMcop
	y+B1nEQIZXee3ftxyMiEuDT+zszUoS+x/IvYOrhFVes0Kg9Lu3oYmS9sWx5Uq3qGysdELBhXcqc
	82vAtewrJh+VhJgJA97ffMwU4Xz/4W9nyUHqt2MhnpvM1/62GSVcxfErSCR+caFA15DV5S+Zwyw
	S8sT3feaMjPXDa6XdO8atugbtxXJYZTS/fswXDbwIMlomy5arnjM0Ozs0Q7ssDwziuLccYNVteT
	pyc2YzXWREiiRJe/fdRVnUrr1PM2jsaH4YKuRmKR/1Q71PP+fLjYQCtM6uaStpd45z3eoz8RMCo
	ybqGBR06CAxcwl1OAjB7Z4v8=
X-Google-Smtp-Source: AGHT+IGPSGEgzME5Asjigl248gpzG65M9tdsmmmrjez5T1volOyNNvzre0xWUF6TuXh91rCAHDkfAw==
X-Received: by 2002:a17:907:971b:b0:ae7:f389:c751 with SMTP id a640c23a62f3a-af14f24210bmr252751666b.0.1753170084965;
        Tue, 22 Jul 2025 00:41:24 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/7] staging: rtl8723bs: CheckFwRsvdPageContent is empty
Date: Tue, 22 Jul 2025 09:41:09 +0200
Message-ID: <20250722074115.35044-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function CheckFwRsvdPageContent is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 9 ---------
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_cmd.h  | 2 --
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 56526056dd1d..3c5d516cb3af 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -287,15 +287,6 @@ static void ConstructNullFunctionData(
 	*pLength = pktlen;
 }
 
-/*
- * To check if reserved page content is destroyed by beacon because beacon
- * is too large.
- */
-/* 2010.06.23. Added by tynli. */
-void CheckFwRsvdPageContent(struct adapter *Adapter)
-{
-}
-
 static void rtl8723b_set_FwRsvdPage_cmd(struct adapter *padapter, struct rsvdpage_loc *rsvdpageloc)
 {
 	u8 u1H2CRsvdPageParm[H2C_RSVDPAGE_LOC_LEN] = {0};
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a9f33444aec2..1608bc71bd71 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1196,8 +1196,6 @@ static void StopTxBeacon(struct adapter *padapter)
 	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0x64);
 	pHalData->RegReg542 &= ~BIT(0);
 	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
-
-	CheckFwRsvdPageContent(padapter);  /*  2010.06.23. Added by tynli. */
 }
 
 static void _BeaconFunctionEnable(struct adapter *padapter, u8 Enable, u8 Linked)
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index 0665c4955936..6b2d79e19088 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -175,8 +175,6 @@ void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8
 void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus);
 void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter);
 
-void CheckFwRsvdPageContent(struct adapter *padapter);
-
 void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param);
 
 s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
-- 
2.50.1

