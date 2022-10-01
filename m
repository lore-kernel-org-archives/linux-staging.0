Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA023D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:41:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id sb3so13456455ejb.9
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=tiHEeB6TjFnhc8x7qSHIzbwC1sWIPqTA0JDil3Jab/8=;
        b=PRunBM/zgiMysLtVxGQ/cec3nGW1rX8/tgYvx3oqT8xNd4zXZYXqG2pFXRHnSVHM8q
         NgMXWRtDtH6SDuR10iexHPCZjTwtUh0xOsk4C5ayRhkBMEzPFvVPbvcj1y0Xefrs2VEB
         +7BW+s2kqJbG6VaXKigjrdDOj7sRVUqiOMzOMvj7NF4NkfHZrkDcrKMite5CKXb80E4L
         ZlHieikXlMjwtDVQXOSpme/BdmTUWtYTS/y5SRB31YnNe1gST9PCc3N8xEZJlk5lDPz+
         YIFPAETvdzolgljipkN6kfqvexBkEmaE1WCm48ZCGDs+miitiMYn0WvtXhn+T8mJG2mk
         uTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=tiHEeB6TjFnhc8x7qSHIzbwC1sWIPqTA0JDil3Jab/8=;
        b=oj8LowhC6Lwvlvvi5m01myXUsNInNxtK86DJwmSrpd7h2ZwB24Ta7e8HI3MuRZwpLe
         CcahctyEr09+UmR+oqwc2JXbG0TJfSIl2AfNcuNQK2ElouUQohSXNx0inYhr6BarxgHz
         ETGWMTdrFwrQyLYXEuI+bjRQLMANfotp2MPe7T3o6M7QnXA3jjiGSFfWPSZZVGq30QQf
         FNE7LhyhADxevC8ecLcP+QHOpwHLqEvEXoZZoQb7dkCIzaxmoTK16gDaEPcykPonL7jX
         1ANM/LOEv8P9opjQ2+uWtMWv0GkP68qQKTT4u4lrH0shLfRFyMpGKZRsxRjPc9dtzffF
         g14Q==
X-Gm-Message-State: ACrzQf1OWLektOMyJepXuye7Vpu8Xvn4/Rm5OLh7E0NLH83MXTRw79a5
	RVAB22b1WEC0Wvla6RCG0QeYHUGVZi0=
X-Google-Smtp-Source: AMsMyM68p6g31K1WfupGcvPa5F9voDNuO8IsIu6mvUojneC/8jfGxwPVErFJQ4ohP7YYvIwkngBsZQ==
X-Received: by 2002:a17:907:78b:b0:741:3d29:33d2 with SMTP id xd11-20020a170907078b00b007413d2933d2mr9653610ejb.103.1664617258527;
        Sat, 01 Oct 2022 02:40:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id pk5-20020a170906d7a500b0077016f4c6d4sm2487384ejb.55.2022.10.01.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:40:58 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:40:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove unused variable
 bInPowerSaveMode
Message-ID: <be3ebecd88b85ba1d87b9b3fbe02f2e78e6a669e.1664616227.git.philipp.g.hortmann@gmail.com>
References: <cover.1664616227.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664616227.git.philipp.g.hortmann@gmail.com>

bInPowerSaveMode is just once initialized and changed but never evaluated.
Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   | 2 --
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index cbb65cfea83a..db55b9b65192 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -881,7 +881,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->hw_radio_off = false;
 	priv->RegRfOff = false;
 	priv->isRFOff = false;
-	priv->bInPowerSaveMode = false;
 	priv->rtllib->rf_off_reason = 0;
 	priv->rf_change_in_progress = false;
 	priv->bHwRfOffAction = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 7021f9c435d9..28733dc2038b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -475,7 +475,6 @@ struct r8192_priv {
 
 	bool RegRfOff;
 	bool isRFOff;
-	bool bInPowerSaveMode;
 	u8 bHwRfOffAction;
 
 	bool rf_change_in_progress;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index fba86ef730b5..1ced5bcebdab 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -122,7 +122,6 @@ void rtl92e_ips_enter(struct net_device *dev)
 		(priv->rtllib->iw_mode != IW_MODE_MASTER)) {
 		pPSC->eInactivePowerState = rf_off;
 		priv->isRFOff = true;
-		priv->bInPowerSaveMode = true;
 		_rtl92e_ps_update_rf_state(dev);
 	}
 }
@@ -138,7 +137,6 @@ void rtl92e_ips_leave(struct net_device *dev)
 	if (rt_state != rf_on  && !pPSC->bSwRfProcessing &&
 	    priv->rtllib->rf_off_reason <= RF_CHANGE_BY_IPS) {
 		pPSC->eInactivePowerState = rf_on;
-		priv->bInPowerSaveMode = false;
 		_rtl92e_ps_update_rf_state(dev);
 	}
 }
-- 
2.37.3

