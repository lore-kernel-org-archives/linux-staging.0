Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A22360
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER0Tw76d"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c4b9e09528so996901a34.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 17:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697156997; x=1697761797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQmNkjrmwzSWWtINLY7udYjqrYfBzZUq+RBDqd2xGCI=;
        b=ER0Tw76d2W+2YKkLzl2pQkN7AokxpYAyD5bPrsKgdW7HAsL99/QGhktgWenX7V9/+L
         9q83ivGqUWApjNpXfLw6Ehxk9wWXVfmG7ao7NImJZ5MvpMIMBugdmq2UCz+K03M/6h8N
         yWqzc3KInil11RzB41KA09NFaLJRy36bwhICg2MEfQDkTFSRLvM+B29mPD5AZm/dEQRG
         4nyM66A3zZflF2TOZFmvpeIZqvLgz8giXh6zEkAtK734TwxbmsFkpnmBBjm8HpaWdAOx
         qBU06X9Gy5C3Zzg2fUCtenpFKeVQiHNH16vuHsDCpzXv63YGxgivh1TctFre8IeP8NHn
         OKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697156997; x=1697761797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQmNkjrmwzSWWtINLY7udYjqrYfBzZUq+RBDqd2xGCI=;
        b=Uo5cyIMlkHqKFXqfGhaMih+7qOgvbfOPzzJTTtWgbKV1DMMX7aIlsqCBz9j0Mx9yTS
         pO2ZCENkMi8lNL5zVdGa2Z6AmKo+6e+5CmNl6MLXlqo1DJqhn3MuPRYIzGYFGHUzHsLg
         XezbAP3kDTXbxzG4KYHSuaBCV6YjqKYhdydl9otxybsVPTvT+meH109ico/Ez54xdqCf
         2Cz9yyz3mlHp7G9AZ7HqipckMpMILYakTNXzdM9lbZXE1CuaN4eBaG/7roun1SXMcRyl
         YuZQXZCsHUpF4TL/ZZhEJERAa3CnmbAkmm4eW+WUBdyt/TmeDIfBaASYFUO3gqNvs4fD
         ZQVA==
X-Gm-Message-State: AOJu0YzhgxV+44BP6eRSri/D7fv8ms2Yhxtdx4UVY9J1Pkknp2sCNGYF
	nws1Ols3xZ9E1veyfqoyIK0=
X-Google-Smtp-Source: AGHT+IHs/6Ft6mMQZfzxCiHDp+QEX5s5zVr189dmmR67U2GauD6CP6SPrr3l2DlwamQXKCb6X8eBAw==
X-Received: by 2002:a05:6830:164a:b0:6bf:12:5189 with SMTP id h10-20020a056830164a00b006bf00125189mr26629234otr.26.1697156997185;
        Thu, 12 Oct 2023 17:29:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b2:f182:ece3:38de:3ac4:3149:fe7b])
        by smtp.gmail.com with ESMTPSA id 4-20020aa79104000000b0069305627491sm12229891pfh.159.2023.10.12.17.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:29:56 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	ruanjinjie@huawei.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] staging: rtl8723bs: Remove unnecessary bracks
Date: Thu, 12 Oct 2023 21:29:44 -0300
Message-Id: <20231013002944.14607-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script.Remove bracks than are not necessary for
a single statement blocks in hal/odm.c

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index ea3b4cd32360..b1397990680f 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -417,13 +417,11 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 	u8 i;
 	struct adapter *padapter =  pDM_Odm->Adapter;
 
-	if (padapter->bDriverStopped) {
+	if (padapter->bDriverStopped)
 		return;
-	}
 
-	if (!pDM_Odm->bUseRAMask) {
+	if (!pDM_Odm->bUseRAMask)
 		return;
-	}
 
 	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
 		PSTA_INFO_T pstat = pDM_Odm->pODM_StaInfo[i];
@@ -461,9 +459,8 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
 {
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK))
 		return;
-	}
 	odm_RefreshRateAdaptiveMaskCE(pDM_Odm);
 }
 
-- 
2.39.2

