Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C042F3C0E
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439770; cv=none; b=UZNr+OPTa4OrBiqRRbheHKzNUVwV2IX3K85cb29ezKVCj1TpvK1kpoKNOTbBsotoeADvzn1Zq6XYtrsrsxpzL0TTncFykglsC2x4VmNbLrDI6OXq7Vobsk/b362vCo7YQ0zxr6gaM4NPpU7Kh6GVc3DKqvEUOP0EgvVMGm5n0d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439770; c=relaxed/simple;
	bh=lb6V4odR9qWpHIABaIhFN+CQh4Osm7IDQhgDvziIa3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=urLlWsuULHB9Z0Y2p1cgdCzNNhK/Ppo5k6qPuW8I6Oh1EOWsn1yYuewD3IYlAT3jN3q/O1jc7+PGILubD3Dpm+Z10qaxaqcfKZDpXbnKQc/UzbH2HI9C0UvTVJnCndXg3IH0jhEmHpiZU+r/Xi0S90LAxhlLyV09ElA3dr7G4Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZLoRNm+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZLoRNm+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf18c30bb2so18307095ad.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781439768; x=1782044568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rov7GArDmOMJFYQCZJLwMN/VGBxKtla0880/pNxVjGo=;
        b=AZLoRNm+cOGL/G6anLs6Yl2bJEJQoMWt/skTpf9ncepU9oTJs+X8qbj5BowkQEwqSe
         fiM5qFEOUQbPZ9ed+MNEr0jalwlvaobLOVoYSZQ1vOXugVKPwqdxA02u5CGljykHpoAM
         8MDjtLxgK4zwmfh97/Ty4fuKyIt3bmgJ3tQ2vRrUL/F2gRTwuhCVgz6cGdPOMkfhAu+I
         ycNmD8IGcScQWiLfL4mlINsbI6m7HaptpSBfzwzly5zHcQNZnsLYIFyhTpnRjo7eBpU4
         u/QxPwrcc8jrqjMsNtM5CX+mnLZCpg/0kxYuC15tUSXMfpF4NRmearNURhMyrjgYt20F
         51sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781439768; x=1782044568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rov7GArDmOMJFYQCZJLwMN/VGBxKtla0880/pNxVjGo=;
        b=Nhv4bwwlztbo+lMF74lfS/S9FvE/dgsiXbHnH7XBrv+FtvY2stBOe8PdoSesNWFYd0
         Kj7Kp78Pd58KUdgnQF8bCpNn64oRAaXefgjRylXubnvxhPINAcDxtCizDMER4rQ93lck
         QfZiLvN37s44ELlMA7+DQGeYs/rDqPeR585wND+MUsX/UbxEVuKqMgtoLTkOBChPMLrG
         IqbkTHkgyZe0C4qdNKXi1shuRlzDXA7ZBAMGIua03WEjgkWt4WHMhMeDaYJAq/ezdbOE
         aIpRlXXpM+iIHwyTbcqldzLJwOsqwoCbcD3rSR31TZ8HUon/vFvk9fc+kvh5PbcyE8ce
         U7WA==
X-Gm-Message-State: AOJu0Yylub/EsEIWvJ4LkQTh6eq+83v4lya7j6bjZ7lzNPWt+jxeGdjv
	IBB20p/p06nip6lbXy4IJEVQtwczUUUFida08033tdcWa5A5KrqxmJaP
X-Gm-Gg: Acq92OFFfo6Pm/d1N2HNVNrEmmMYUvu3fn/dDdURApY9cB4X7RBW+jp1RSbcuDpvhSY
	0mAWwYjp7IYgl0vCBapWuIBC4ZYX3L8p2djf4nsnIZNmAe4ohxBtTzd9MAUkSxNiXlv3QMIu2gz
	4Sbpb7kYupRdPA3hy/QgaDdA6gF5AjTDYpW6uk/xfTQk+KKeNbljHEmCKRXeBPXndXnssVRPCB/
	fKY0+ZZUEtMc/IDS/O7qPaKCPpsTd+r02uXkm0Xv2tRYTUKW4I8uwktMij2eP/x2pkpgExVZGRW
	KdlBMrvBf75XHGMtEv9zY8kNLfCZzcioC3riCx/M6+Vvnaiclu/kPVbAtoKodw8/EaCyDrp7e+R
	ORsG5ejYaAuzUTPRM8TGdi0DvPLpnuAxq6aKmZ5ddTC+0Qp93ng+ojNk27caIWcfAKJKjnd3v5F
	pU/LszgVfjWIE1VtoMBfTk+5PoVTfG29WbIoDK51XmuPdIirTNF74bpXmx1RN0UYS2WMz8N5gSr
	GSE
X-Received: by 2002:a17:903:3b8e:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c6642a8d8bmr74788535ad.29.1781439768512;
        Sun, 14 Jun 2026 05:22:48 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm69157995ad.70.2026.06.14.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:22:48 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 4/4] staging: rtl8723bs: Fix missing spaces around '-' operator in HalPhyRf.c
Date: Sun, 14 Jun 2026 12:21:55 +0000
Message-Id: <20260614122155.20034-5-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around the '-' operator in swing table index
boundary checks. This fixes the following checkpatch.pl warnings:

CHECK: spaces preferred around that '-' (ctx:VxV)
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a..254bfef54 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -220,13 +220,13 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p];
 
 			/* 4 7.1 Handle boundary conditions of index. */
-			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM-1)
-				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM-1;
+			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM - 1)
+				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM - 1;
 			else if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] < OFDM_min_index)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = OFDM_min_index;
 		}
-		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK-1)
-			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK-1;
+		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK - 1)
+			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK - 1;
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
-- 
2.34.1

