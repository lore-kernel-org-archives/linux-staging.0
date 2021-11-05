Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9F2C99
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 00:28:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y196so5802402wmc.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Nov 2021 17:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4YUDgdo255VAYFqIsJJWpu2PRm/0Or1BTzsdPRBrWk=;
        b=cHCo4gmABWuKJiSybcT/mk1Y2DZ4oBzkPmeJL3FPTwxhr9SRrlxubLRg/LuBrnlKH1
         vIVEDT0pjtWkI03yyGUc+x0Lj0ZbTx8SAqWrHYm2W3DzvtPjjhu1koNSdbO+c01X07jx
         kyqXT0Pms9lIMaYkU4WR+YGq3Pl0/Ru23wvnWBM5T0H/Ztf10wK2bgj6cG9aWPXHywog
         Pv7JLyKW7n5YjzlFGBfYStcYbCAOVFMC9weiDsQwYoJdcN87sMKPyDKnster9bVKXzaX
         zkgl4+vJaCP+pWWlpecd00tj/s2J6l05HFCSqsFW3eijEYl22ZzOm+C56zQNlep/lFDD
         eZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4YUDgdo255VAYFqIsJJWpu2PRm/0Or1BTzsdPRBrWk=;
        b=k16jSf3PfU4ytWbHxFwh0R+qHBOo3kpF4nuNHEDcESQ+XRBe3Lx5K1srE8c7eMkO1t
         2dFQZgzu0xrPkk4zB3XtLhVvHMJ/3sEJ6OI75aCvlcSIntU/cLREQU7mz7tNMYyaNIsD
         i4Oo1UGz7OLKFg9/TJepbh6uRkVlYygvwwmi0zXgX7jzhWPi2zd7jADUyTL/FSOYCdPV
         FlEjRALtdDvpM5CKHzRvXPTx1JSIGAoxu1BTcfxPQaTs3TaytYncrT+uuiSvQUbGNmVS
         sFjzsTvUJ6QROXYZr1EpoVLNGevvSmrCqizP17f/dFdC2s59aPfSvlP2loOCXd/q/wmi
         IRQg==
X-Gm-Message-State: AOAM5334pOmUgEG+BBTyck8KtLKJYvD4z8LyjOAp3Km/wyVRIvqTXuNC
	6KZ4o9VP4SXvkagpyCt1mdhEow==
X-Google-Smtp-Source: ABdhPJx4p9NftzFucX4ulXLAkGfTpfrMSXcolRKkskOwXdMsmHLlKAcnfTmWTrFXg53nadktouJ/Ew==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr28288141wmc.99.1636072090171;
        Thu, 04 Nov 2021 17:28:10 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g18sm6924566wmq.4.2021.11.04.17.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 17:28:09 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove MSG_88E call from odm_TXPowerTrackingThermalMeterInit
Date: Fri,  5 Nov 2021 00:28:07 +0000
Message-Id: <20211105002807.6628-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary MSG_88E macro call from hal/odm.c, within the
function odm_TXPowerTrackingThermalMeterInit. All it does is print a
struct member, during initialization, that is then immediately set on
the following line. It is therefore surplus to requirements.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/odm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 21f115194df8..bca625a46263 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -891,8 +891,6 @@ void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
 	pDM_Odm->RFCalibrateInfo.bTXPowerTracking = true;
 	pDM_Odm->RFCalibrateInfo.TXPowercount = 0;
 	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = false;
-	MSG_88E("pDM_Odm TxPowerTrackControl = %d\n", pDM_Odm->RFCalibrateInfo.TxPowerTrackControl);
-
 	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
 }
 
-- 
2.31.1

