Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D200B3AE187
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260132; cv=none; b=QJwx/jPgvlJj7y3zuHKll1rPmHgMh7fIS3Q12nOBs2OYL83JICeudpoNZTbqp8KneGGrZ4Z6ACl/px8q8a48/saelcWu3E/m3+iaw8UTjdh970wGK1zImruO2n3MXxz4LzolvLj2CvDHbkfW1t2b/DpnZFT0kUUqElGCV7F/hxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260132; c=relaxed/simple;
	bh=WmmMfWDDKfBgjDb7jLnzfZ21p1W7XRI6duG2ouKhp34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kyc88qikAoLs0YRjC7HlWXedB1fg5sdCv9s+MmJ8DdKsyS1NN2FJ/P44M0Y4wjImHL1xg1dd6pMtapf1lpJh3EuXmrC+97CWjbBLRgRhmAm/2RfMcSXzQ4/DCQMYUBER+h+niCx/nw59HIGbsvb5CFVMtXIrkGkrNVkxvT8HdDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEFTBvgK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEFTBvgK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so6778865e9.3
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260129; x=1781864929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xIYV+WBBsV+/naaHtunz7i2HPvSQ5d6y+hbX9ETrY8=;
        b=fEFTBvgKfdDDmCxh4Sm9qOxAnKh7ew6Ig2q9cvcgUHLf9gej5j+qDceQ3M2g5ZuZI/
         9ZktKWLnQn/nR0Q9HzdwNpf0WZng7VXYSKKVPbtLdq3hoJYnRPh2ESK0Gzmh6+duaQCV
         LqFA4tM2m649DirJw3VsICWHI9mnNIUSaxVnoa6Z9FhE4yGUxUYV0qklo5EPwhNgmUOz
         v8FYikLg2tOSb5yN/inpGE1hZsD1C9hhE7xD9f68jhsg0jtyGhjBUi80Dai9C6F/sEq3
         RYLN/hsFwLH+R1e+pMsO54uTaW7/do/V9owTIuK3+CfOrZl42X6dmT1ObpDzkjRCddyT
         +4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260129; x=1781864929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xIYV+WBBsV+/naaHtunz7i2HPvSQ5d6y+hbX9ETrY8=;
        b=qW9O/VgteZwxEUmZhm0Wvdk21vPTe9EkLDsXS2R9cNWqxEUyNNl22P9m7fdWLg5rSI
         UnYH8z5WuoeMyfTuCvZ+I0+yAPKQBdYLBguzbKvIpcJBTlm2+519bGdm29/17BmKYF9x
         MpSXcZ12TLMadr9oR6QzKsDBxI0vWF4VoX18RcpKAVVlWQ5geE8io7rM21zsKXBlud5Q
         ZH2gWLRw5PKY4S+QNMNIwU2Hp787Mw80bxkEs8gjJrtYyIrKVjQYMie8VS1SAknF9K/S
         0Z4R0pIjted3owf2Htg1DQe1pZA0ymQrcNVcOYGo6nNQO+os6vRwactTQm65VSHLcRvP
         ymlQ==
X-Gm-Message-State: AOJu0YwlFgOuSXFAR+lXGg10O47HuifQrd2eh3G6E/jJdJ+tnaBoQVF7
	2neJlMJy3dbeWhMbiDEGi9uiz7AT99acwoOE6T3veg+fUe2nv0ppIME5
X-Gm-Gg: Acq92OFrXzJxIsv/s9Q9roV7AGbvQqkI4OF+ib2h10kP7MerxS44l9Ac3I8ewX1S+Oj
	7BUHUnOQEwYB0Oz0DdY9MloovcG7NGo/lXaOSpZfzBOGkPBoRKnx4q9dcBttCTvgz90OxuDvrFK
	NKMY+58lbTXMcq7Mp8LLuMIiwvC2pTwy3nu3cnIbV25QPZnLOcDogBqAT0qca6hk6igt4W99mvL
	HEjx43aKGPo865lcffcf/1XmioOz92Psd3Yw3JekZMKjWvaXowvYU8Ltd4LYIzK+baj+50W+axA
	RMoRLouH6J9VFbfVvHzGnVdN1LHsItmNj/iDt8FrVOjbKrzFcKnsSyctvOeL/IV5E+kWiFpcaSz
	HkyXc5Hat825tnTQl5ZJ+ioEyNliV5Pi+s1t58bXXctqoce+XhoLtnvlKKbWSDq5zZ27ckBCowa
	5LppgY5Pcc5RDuPs5ThR6pdrnSYg==
X-Received: by 2002:a05:600c:15c2:b0:490:bb44:3f8b with SMTP id 5b1f17b1804b1-490ec4fe6cfmr19196565e9.17.1781260129082;
        Fri, 12 Jun 2026 03:28:49 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:48 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 5/7] staging: rtl8723bs: hal: fix space-before-tab warnings in rtl8723b_dm.c
Date: Fri, 12 Jun 2026 11:28:32 +0100
Message-ID: <20260612102834.39935-5-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2276dc1cb44a..9ff8f3eb0169 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/*	ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
-- 
2.43.0

