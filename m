Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681D6D13
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:40:12 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 18so6395820edx.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jP3PhGigK/Ueh3VHQJ9puGdUHkKb5RPpqr31LnHq7qA=;
        b=iALCGv7dgZJfAl75kq+j15/GEW609PAV7qIjtsmpitYkjUbDk2Srcv5XeJ9WUay9tI
         OPtn2chLgQntM1yVNqd+A4gBWXL1vBbgpkqcS7pC3d+rlPxlVybKn/1XnrjuxTOqKn8/
         cAI84iEpY/5eEIR/2w9w5jWQ3yFKBEYlkV6ZYmsszFf57mZo4LXRHqerCOGD/NQ+Z4jp
         3NEwcKBPH6Y9ucTzZWlzzbR/J5voOovP1J/5p72FEPF7IYSFOpmrqoMLHeUbipnxkcKm
         ZCPj3/sPK/YaibFxl5UJJphOBn1gebOgJ1khPGWsdy5SEXF5jYf1KkntbfUhNnm1s6k/
         zIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jP3PhGigK/Ueh3VHQJ9puGdUHkKb5RPpqr31LnHq7qA=;
        b=O3SebCpvduMG1Y9iS7Gy9HcCedG47gnxHnnPLA4gllsJgyjHMK+aKEL/kw5MvB4fGI
         sJvjL+qsNHLG/G2kRi8yU14k6HsNvB7MNyrYGNz+HZz4ejATtFi65QLFXaGo7L56Egki
         nP9vIwudu/9Fns5oXKWZUSzk8rXQe3J+mgp+ZT+NgswcDNR5et6MtUYxNzrNZl2mYsvy
         gC63vKtzHsuJ35GDcqOSddwI/eefVIFQPdDtbW9kQ4mqEDkTLTvU5LCdnus1u9pLMxnv
         SBZF9OSgkoh4togPlBrs8EXOMJnD+gw0Y71a1Oi+QOkm9YmH9QY06lvOdyBFbnOqy1Zl
         FQeQ==
X-Gm-Message-State: AOAM531Y7fP02ukZLSLbJAhiodJ+/iA3XJUewbKyBLuPZYtSv/eqmRn/
	4mtZXeadpeGlD+CQioiow1fi2mWas/drtw==
X-Google-Smtp-Source: ABdhPJw2vjjPOvYZVnYSy+uAgediVSvUZ+6nuGvzEe3aEpQZknjVA6iqVETu50DlFxmUbl9jr+YdgQ==
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr17307788edu.164.1617972011158;
        Fri, 09 Apr 2021 05:40:11 -0700 (PDT)
Received: from agape ([151.43.204.41])
        by smtp.gmail.com with ESMTPSA id q19sm1175784ejy.50.2021.04.09.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:40:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove commented out MSG_8192C log
Date: Fri,  9 Apr 2021 14:40:02 +0200
Message-Id: <845969563d7c90d1b7aa3215ae29dd91afc5100c.1617971592.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617971592.git.fabioaiuto83@gmail.com>
References: <cover.1617971592.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out MSG_8192C log.

MSG_8192C is a private trace mechanism macro and is deactivated.
(i.e. the default behaviour is _do nothing_)
The only way to activate it is to manually define a debug
symbol.

So just remove it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 6f8f38a58237..dea4e3679b8e 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -776,9 +776,6 @@ void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm)
 	else
 		pdmpriv->TxPowerTrackControl = false;
 
-
-	/* MSG_8192C("pdmpriv->TxPowerTrackControl = %d\n", pdmpriv->TxPowerTrackControl); */
-
 	/* pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true; */
 	pDM_Odm->RFCalibrateInfo.ThermalValue = pHalData->EEPROMThermalMeter;
 	pDM_Odm->RFCalibrateInfo.ThermalValue_IQK = pHalData->EEPROMThermalMeter;
-- 
2.20.1

