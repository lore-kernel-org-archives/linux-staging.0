Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9814168BD
	for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727492024; cv=none; b=BUbsgeTMLVGbobNfe22XRjqBFzaMp0GE6n26ucUpgHh0d3j5mVS0s7yTOwPCn9RO+u+8qHTsThe5r6SaSo2WdnpLmp6ybC7kX4PMQ84HM3HAoMywcvidRHvFjLLf7Hcc7QZwQGB4COY2vbKuEYk3XX96s1VqFK3rzVf2/Z9MQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727492024; c=relaxed/simple;
	bh=1P5VSdEr6UYzDIu6A2snwQSfVUvFw0ftgr0LKwbktp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ledil/p8tk0XZBU8zKxmj8sVFfRQ+PYY7rQ6rfqhh4Rc2r0sPwY7oKEDJu1K3i8+h93Zf0yqlhbonID7wOZE0IvECCfRx9ysaNJvVvSvISQehXe3HIbdwZVTPG/gyWjD/AFauJWaN26K8hP7flNAyyayHm7nvTPvCJhgiWjDSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8xh84bI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8xh84bI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so2471787b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727492022; x=1728096822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqbEnkFqMvfFF/pkDHaeuRRro8Yo1fTtXIG0am66j4A=;
        b=Y8xh84bIWbyW17QWTo3fIAkGcR+2+ns2iNodBouSVYrBFOXXFQlFLuIGgolByQzit2
         +gH1/xXtpQ0nLm89G+XF7UEl9G6dYaz6AupTjjF736h79Mky2S/WQ/m/5qJGXESiAorr
         +VJEdn0ilYG5bQv8MB/vYFYufdff8oUVPZgmGzP75sPWOBFxeA7YsL9NmSoXm+JiXiip
         FZ7tMvMWXuEAy83QRjWzp7VCdUbtwRPfJYPmGglaE+lIrlkxc/VdxGpkOjwAnMhudCx+
         J2VyM+Xb9RjeBNlqABXE3KFbBXMV9YlsWvKOh3WkB0cZuKg1fZ4cn4A4JodSkexrEJgc
         4ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727492022; x=1728096822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqbEnkFqMvfFF/pkDHaeuRRro8Yo1fTtXIG0am66j4A=;
        b=Fmg1XvrbIs87hjS21EOuQ5D4UWomoc8VSI8TAdJty9Oy0f+IQOEVkveoeMv7RPMRZh
         Td5D3gH1a9pEIZbvX929tuevTGFw1GCZ73paRZ4ra4eIzhtgWdQPGrLfyG3tKZYizitg
         lupKg0psvvu9Oa9mgNt3YPYGNwBlr5i/TaER1QCdjAAxURBWBFZ/eZaoqH+3lMedrhZI
         kb0uZ+6r8WhDnYleLAEbVV5A7P4RCpbWpnwrX8IrqyHBrMffjw2zpB1c5aT5mJ1wUwcA
         SMDNAp9mJkV0mfvSckJWZEDOimgMnqusw1Tyn0AvFMhD/nhG7WKLUPwZmRsTXX//i3Fz
         KxzA==
X-Gm-Message-State: AOJu0Yx1Fe1FZDvVi5EVr/hfRkAddKvchOzb7kKyrlLnGCOd2Vjbgwqz
	ZkBeqPJCvdqOd4h69uSCqMPi/8J6HW0z5CjqYRWNuUx+Ps5o1Jvo
X-Google-Smtp-Source: AGHT+IFDeXgCaD43BECwV8fDnjNu8ghhynmrO7e/H7s02hjuOyPlDmejr9Cx/OCKiMqZDsE4ncd/0w==
X-Received: by 2002:a05:6a00:98c:b0:717:9191:8bfb with SMTP id d2e1a72fcca58-71b2604c2abmr7743159b3a.17.1727492021835;
        Fri, 27 Sep 2024 19:53:41 -0700 (PDT)
Received: from gyrocopter.. ([2603:8001:e00:4cd4:9999:1075:5963:7350])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652589dsm2277388b3a.155.2024.09.27.19.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 19:53:41 -0700 (PDT)
From: Michael Harris <michaelharriscode@gmail.com>
To: gregkh@linuxfoundation.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs: hal: odm: removed unnecessary braces
Date: Fri, 27 Sep 2024 19:53:36 -0700
Message-ID: <20240928025336.55940-1-michaelharriscode@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary braces.

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index ea3b4cd32360..5b5a2efbe5a3 100644
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
@@ -461,9 +459,9 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
 {
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK))
 		return;
-	}
+
 	odm_RefreshRateAdaptiveMaskCE(pDM_Odm);
 }
 
-- 
2.46.1

