Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C19168
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 16:08:17 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id dj8so8271132edb.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HXQ80Gs0H0ckHUhiV5CBPamMCfkNtK9JJS8DplDPVh0=;
        b=C+/eBvISmrWAxL30BXiIrSYvtBlT2cP/bl5ecbUJINRUl23pXihPPOZozfj1WW9Cko
         g+peHw+l1sf3X0Jff/1VCsk97fFD/1jMzfyta4RmpPe6CIUBBE1sMJVazzh2aDwRPNyd
         /usQVQWhm3gZnUQemrAAH5ILUdUrgSPMJ5VCvpJDSh1xFT/JYqrnSYYLDB40DtdzfoiM
         AuEPRHq184/MlWmIEIuoLmXKIM6b0Mw1J8qmA1s0hdqhgL+Ir0lsN6hrJQOgBGCsBWHN
         yRfLY1eRYsNig/GuVK6SUxyS0MKYVFxLCDKJcc1lE57wqKCFo3OzcK8aHMxgfEVDiWoR
         0pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HXQ80Gs0H0ckHUhiV5CBPamMCfkNtK9JJS8DplDPVh0=;
        b=WfeKZZdCdJCkbGEdN7HBL9xvsR9xXKkeBXqeuUBD3boBZ21RubtQipc3D2BJpdRI+k
         gQwcDkgVSSH0Y232rV1jykEfHlhVlbBwU8nQuEVAE0zG0sIpX/oMTj4NMuaW3iLClTyj
         9WEvHOmL3tLuGfkpEcfTE2ZGGKXnli8JGtSmOqE4d8oopuhqbiOjxnZx/DAzfgB6wTtd
         VEIv/PmwY/XE3IM3OnDJqDTjPClEHAybmpW/ngrz9upalCwG+TwXeJXLKdYt1yFijd03
         3jvaLMb/NG2Bw/8Z6/VTuiKEOqzv1lZnC725792Fz8q0CQWIycAilJeI4JRErPJlbSdR
         h13Q==
X-Gm-Message-State: AOAM530XVoZY/HWcJNAHytbxZXtCcyQxRX8pXxykMbenvf9eZPyvsTk8
	5Krxjcx6kzowYjn5IksjhkQ=
X-Google-Smtp-Source: ABdhPJzEngTX6vrqGbuHEb2U8rOaX0JKh3br/was1EZUscFkM8GCSzco7Uxk20wuttNU6BUIU85BRg==
X-Received: by 2002:a05:6402:35c7:: with SMTP id z7mr3982152edc.85.1628870895584;
        Fri, 13 Aug 2021 09:08:15 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id a3sm1087817edu.46.2021.08.13.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:08:15 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove variables and simplify PHY_SwChnl8188E()
Date: Fri, 13 Aug 2021 18:08:12 +0200
Message-Id: <20210813160812.17603-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove "bResult" and "tmpchannel" and all tests and assignments that
are related to them in the code of PHY_SwChnl8188E().

"bResult" was always true, therefore its test led to a null statement.
"tmpchannel" was used only to restore "pHalData->CurrentChannel" to its
previous value only if _PHY_SwChnl8192C() was not called; therefore
assign "channel" to "pHalData->CurrentChannel" if and only if
_PHY_SwChnl8192C() is to be executed (and get rid of that temporary
storage).

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 02955b8c4005..9af91ec92d36 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -1091,8 +1091,6 @@ void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
 {
 	/*  Call after initialization */
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(Adapter);
-	u8 tmpchannel = pHalData->CurrentChannel;
-	bool  bResult = true;
 
 	if (pHalData->rf_chip == RF_PSEUDO_11N)
 		return;		/* return immediately if it is peudo-phy */
@@ -1100,17 +1098,8 @@ void PHY_SwChnl8188E(struct adapter *Adapter, u8 channel)
 	if (channel == 0)
 		channel = 1;
 
-	pHalData->CurrentChannel = channel;
-
 	if ((!Adapter->bDriverStopped) && (!Adapter->bSurpriseRemoved)) {
+		pHalData->CurrentChannel = channel;
 		_PHY_SwChnl8192C(Adapter, channel);
-
-		if (bResult)
-			;
-		else
-			pHalData->CurrentChannel = tmpchannel;
-
-	} else {
-		pHalData->CurrentChannel = tmpchannel;
 	}
 }
-- 
2.32.0

