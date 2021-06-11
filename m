Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBC2FB2
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 00:25:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so7665548wms.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b7LCuD4Mi1ZY73S2sGwIUNflhwnyaOmFWD/95mQTmSQ=;
        b=ZIWfHhWFEmiYxAugmd7t3+L7iRTJd25vGq9YAgbwwwVY2CuYcxH1v2baCvIOTed6WY
         Ea7CiKt4gS2YfzYAb2d7BQozzJhMBISqK4i5rSOjy57kxWYec0Q+RftrSaKbnonptPol
         b/NQoOP1JKgwSUZurP6Pr0e1BMEW09Qx3ZEVcgicrtzWPwsolFiNtLVKG5aAxYRvHifT
         C7LJ0yGZGuEdurwqMGXahjR6wD3pjs3lGadScNshhDgktcCZBG1pSz72Y+OKmt2BwNVM
         wrjREC59ccF3LvBBnBjZGxelkFH4yJKyoEmYl6tt8/eYoCdohuH+f6T4Mmci2Tld67Om
         EtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b7LCuD4Mi1ZY73S2sGwIUNflhwnyaOmFWD/95mQTmSQ=;
        b=mxixV8Yjz79fjLng+b17w0ZV0sfsFdWDptVN/EKorg1aGV7Db62a+uDllBn4oJFcyq
         Aojle8ttoxHb5QJNeHQb/3jiIy9qTftRaRH2BBIASl9NO+HKFzju7WM1moS/oiQd6X5a
         RyWRpW87uZphtzZmtOdHsCgyp22neDdmwmWpYSAVrTb9LPejI8as79ZSC72LDQEWk/QA
         sRu1m4v937/cb5XLk6msXAghphRrrbV3A4oLxvMlV67hrtmN4/5m/xtqZAUC5cp3h+Gh
         Xsny2CpmC02rn/XybYOaJG8ZVmWNRtok7ydtlc+ueeQ3a6gb5EAJaa3bZ6HoDYnFKPS8
         oMUA==
X-Gm-Message-State: AOAM530ZroCWEq+D17ttTTr7Kxv/EyN/O6H9FYcEcvS5gTLjluqLbaOr
	EUBbdJhgg6EDblWDkKaMc9sNQQ==
X-Google-Smtp-Source: ABdhPJwtvOipj9EcO3rpFU2Srz26Lp4+/40l+EDMEfsSOp2KUDT/R1M9IdFVfXFefF/A0pgirqFTTQ==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr1191997wml.161.1623371111222;
        Thu, 10 Jun 2021 17:25:11 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id c2sm11386189wmf.24.2021.06.10.17.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:25:10 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	kaixuxia@tencent.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liushixin2@huawei.com,
	unixbhaskar@gmail.com,
	gustavoars@kernel.org,
	martin@kaiser.cx,
	bkkarthik@pesu.pes.edu,
	dan.carpenter@oracle.com
Subject: [PATCH 3/6] staging: rtl8188eu: remove ODM_RT_TRACE calls from hal/odm_rtl8188e.c
Date: Fri, 11 Jun 2021 01:25:01 +0100
Message-Id: <20210611002504.166405-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611002504.166405-3-phil@philpotter.co.uk>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
 <20210611002504.166405-2-phil@philpotter.co.uk>
 <20210611002504.166405-3-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all ODM_RT_TRACE calls from hal/odm_rtl8188e.c, as this debug code
is not optimal and doesn't follow best practices. This in concert with
other removals allows for the removal of include/odm_debug.h in its
entirety.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/odm_rtl8188e.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm_rtl8188e.c b/drivers/staging/rtl8188eu/hal/odm_rtl8188e.c
index a55a0d8b9fb7..e29cd35a5811 100644
--- a/drivers/staging/rtl8188eu/hal/odm_rtl8188e.c
+++ b/drivers/staging/rtl8188eu/hal/odm_rtl8188e.c
@@ -307,11 +307,7 @@ void rtl88eu_dm_antenna_diversity(struct odm_dm_struct *dm_odm)
 		return;
 
 	if (!dm_odm->bLinked) {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_ANT_DIV, ODM_DBG_LOUD,
-			     ("ODM_AntennaDiversity_88E(): No Link.\n"));
 		if (dm_fat_tbl->bBecomeLinked) {
-			ODM_RT_TRACE(dm_odm, ODM_COMP_ANT_DIV, ODM_DBG_LOUD,
-				     ("Need to Turn off HW AntDiv\n"));
 			phy_set_bb_reg(adapter, ODM_REG_IGI_A_11N, BIT(7), 0);
 			phy_set_bb_reg(adapter, ODM_REG_CCK_ANTDIV_PARA1_11N,
 				       BIT(15), 0);
@@ -324,8 +320,6 @@ void rtl88eu_dm_antenna_diversity(struct odm_dm_struct *dm_odm)
 	}
 
 	if (!dm_fat_tbl->bBecomeLinked) {
-		ODM_RT_TRACE(dm_odm, ODM_COMP_ANT_DIV, ODM_DBG_LOUD,
-			     ("Need to Turn on HW AntDiv\n"));
 		phy_set_bb_reg(adapter, ODM_REG_IGI_A_11N, BIT(7), 1);
 		phy_set_bb_reg(adapter, ODM_REG_CCK_ANTDIV_PARA1_11N,
 			       BIT(15), 1);
-- 
2.30.2

