Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E868
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 18:08:39 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so7016522pji.5
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 10:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tRTkUL4b/IclFaICDSMtWkDgnrkgp3k8b9yxWekP0Y8=;
        b=fDq4DmzKqveY95pRinYiSMpm27KJdKM9s4iv2PCjY3mJA+1A2ZkXSjKXzJbfGfwn6J
         ejm88XAmveBmsfy/lXwdjUOvTbEKZOkm1H2gjYzKDr7SA+zNfVmukO4/3Md/7laK95z2
         JNhHJMhHPT6GtkFKiUCL2oqDVT1iR9TRibcEznkEMZwMLEhcoLCQwQaPJR3+4bKKR5ec
         5qPJHJ3oz2bNMpVA9DZ0hd/eibnZZegXEBhePhC4n5OdsZ51mJ31f58K3B7PA5Zf2s8+
         CrpXrYGhnFGHx25VtRiBgbI5rIGIs+6HYtj9dYY2ioVzcY35UZQGmxp7tNWiTOVQVjT9
         g/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tRTkUL4b/IclFaICDSMtWkDgnrkgp3k8b9yxWekP0Y8=;
        b=CsM1YL/yv1uxc1BsU7zd8VUzsYG/xaHgQ/CTXzicXWlw5hMgOpYImXrafgG2IV+5wB
         UffxajgX7TWgz+luJO1IQon1uHww8pozfbugnyCeJg2yrDGzyNYCVToLBx6f43Px7pyX
         jP4TNRxfSXdvA6Dm+1RHpYo+2HHw2hhcSOpKyMjuCjsBSAszmS+/jtRL/+kMCmMqum/w
         w4kj4tCa9mpzn4C8LcDRs1lfOd452vEeT/Abk/XruwMgcvSHJGlLoNcPnCZ3jTDL+yuT
         298fv8/8R/T9flE/3lcVyHzWztgo8rz+JeD4YW8o45+G1kHvqX53VSf6vC+Q9v7Cba2n
         +bRA==
X-Gm-Message-State: AOAM533K+jA4d4ZY1GKeM2oMRsh6N/KixosLnIDknYGz2oOmDdenrJ9+
	N3mtUgZ43VGxG++LuirikFGmbyMfgAAAig==
X-Google-Smtp-Source: ABdhPJxR+zGhqbQeQM11xV9Or4sbOYBA3ysWv3GKcQtsi25ffpfgvDv83PAlD6TD4v9YckaCVJX61w==
X-Received: by 2002:a17:902:7107:b0:142:7a83:6dfe with SMTP id a7-20020a170902710700b001427a836dfemr2938682pll.0.1636308518407;
        Sun, 07 Nov 2021 10:08:38 -0800 (PST)
Received: from Sauravs-MacBook-Air.local ([59.88.109.27])
        by smtp.gmail.com with ESMTPSA id r1sm8450445pjm.23.2021.11.07.10.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 10:08:37 -0800 (PST)
Date: Sun, 7 Nov 2021 23:38:30 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	kushalkothari285@gmail.com, fmdefrancesco@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com,
	straube.linux@gmail.com, philippesdixon@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: avoid unnecessary if condition
Message-ID: <YYgWHt+PpyqOv40R@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In function rtw_lps_change_dtim_hdl remove the if condition check
to compare the pwrpriv->dtim to dtim . If both are not equal dtim
is getting assign to pwrpriv->dtim. But if both are equal assigning
dtim to pwrpriv->dtim will not make any difference on value. So remove
the unnecessary if condition check.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 639459d52261..bddfc02fb73e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1498,8 +1498,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)

 	mutex_lock(&pwrpriv->lock);

-	if (pwrpriv->dtim != dtim)
-		pwrpriv->dtim = dtim;
+	pwrpriv->dtim = dtim;

 	if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
 		u8 ps_mode = pwrpriv->pwr_mode;
--
2.33.0

