Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5C2C83
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 05:06:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id cs11-20020a17090af50b00b0019fe3df3dddso8136838pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 22:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RCPTshEDJD1Y+rfEbp8XH1g9vPebJXz3+gWAjl+hT5g=;
        b=EIJ5Mz+icS1YZj8r0R1Nc8L1pvrdj0GhkTBuGyuhtY2XcPQDw48WeA3M2t8AcrjNPO
         7sGDkLLKNqvqXNdUZXW27u44R/xEJS06uTOYFTx5v4PFtcmdm2XmW34rhHpOwfuSYElO
         VgAAH2C8NT0pshjoqZ4wfKGFuoL8m1Wqu9Uyp4r49xQZwKmuq169yLQZqqIyw2VNOKN7
         mxWampOIacsBfGY92ms76f97AZvX4T/chjTi/pov3q07MwUhv+zKAFrv5+0bVntpDvkF
         vfRBabI66ToZ4R2JUABelFWkdin2LB0Y7UBKcomjF/qZjEHJQ76FND/JUFASsYE/KQlw
         HIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RCPTshEDJD1Y+rfEbp8XH1g9vPebJXz3+gWAjl+hT5g=;
        b=6TsmkIw2/7yvuCRU7mb2QBlP071u2FoWo3OWtE0LTOjpUe4QgJTkxXhAgooC0r9ZUS
         5V3Ku8JQOEYd2yU9tq7NCAjYdf6susW1RliVP67PGsvRZIu5QcHJ/cO2TfhpahTZxTk+
         QcPGIjCD7CsIeviBUOePJdCIJYchmw2uVQbDueS4+ObCj4zgxEkeovmVLDeXupVIrPCn
         rswKODYOQ1MUdI/bnxk3465yBK4iIb3bF+tl3WtOBKyx1sEsIVXUShvY+fVLS2kY1Sjj
         84dRtQNP4eo8KSJEqGYRApceF0i6UkJazhzZANUogsjSIIhXJLE4EPa0+lEGlBOvHh3y
         CtyA==
X-Gm-Message-State: AOAM530leHmaM1qxCT0V10X1m0GZAqc4dMuSzLYaPGofn7+38yfePVgF
	ONun8s66+zrLetRrzLHqAqk=
X-Google-Smtp-Source: ABdhPJzgoC5KXNuVzYu5qXB78+uaAonwDHIH4jd5tYu5LZcw6KKPu8qR9I8vCVr3IY3n9CRAWpUSAA==
X-Received: by 2002:a17:902:a40c:b029:12c:17cf:ab6f with SMTP id p12-20020a170902a40cb029012c17cfab6fmr13119033plq.71.1633755978416;
        Fri, 08 Oct 2021 22:06:18 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id w15sm829770pfc.220.2021.10.08.22.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 22:06:17 -0700 (PDT)
Date: Sat, 9 Oct 2021 10:36:12 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, fmdefrancesco@gmail.com,
	zhansayabagdaulet@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: merge the if conditions
Message-ID: <YWEjRHU5FCoVphmu@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merge the two consecutive if conditions in rtw_set_rpwm().
Both are having same condition to check.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index a392d5b4caf2..5292f90251e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -272,11 +272,11 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	pwrpriv->rpwm = pslv;

 	cpwm_orig = 0;
-	if (rpwm & PS_ACK)
+	if (rpwm & PS_ACK) {
 		rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_orig);
-
-	if (rpwm & PS_ACK)
 		_set_timer(&pwrpriv->pwr_rpwm_timer, LPS_RPWM_WAIT_MS);
+	}
+
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_RPWM, (u8 *)(&rpwm));

 	pwrpriv->tog += 0x80;
--
2.32.0

