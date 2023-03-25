Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31F1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:36:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-930bc91df7bso14049266b.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXY6VvxPrL+Ft/OOHN7tVol0Ou3qPIGP5Ichat9gkls=;
        b=nZkUzNJPqrM3dg8D4xEm8V8C0pb+1R4E2r4qfWzkxHrtVfCZGNmLdoh5Om3KkvgJJf
         Ip9sTS8eIjIP0tWwcsGNhqVNtFRgvp7Wq2aEU1CEBWQtC+aPAsoGvaaInsstki7e4bkH
         lOECU1WDjnWbyvpF6r/ZThUcwZVVh0Y0G7BaoAHYaKluRp70yHL9RSicM4ozbx9pAdfs
         CPTw0ugCy3Pg0386U7dbU/Q2jmBSN+aLgT2qH8Av9/SFcj8rqAnUL79fzz5tXguGVdi4
         EbruRtt/WjOnl0tWRqucRQ/2svhPARFz7XHDFwkMHMxmfTfrRXy3ESIF5Qn+bxfLlfKh
         auVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXY6VvxPrL+Ft/OOHN7tVol0Ou3qPIGP5Ichat9gkls=;
        b=inNcGHVxBF/TOo0HvE+e8M+UgS4qedjkFLL5EYdprVm3q3d3h16oRjYaY/ABeLMgHL
         t8SGAIvfHzC9/p9Cb5vYn4v0G+/TkQF3d450t73sU/r5jW+jdBhVUNhS6VzwXdOLJjEq
         k9j4QsnVhCnqkDTRpLPBGdwqo1UK5TA+bupNVSgKjerio7VVbKzhgG5r2MVEdK4CswPP
         PS4PyNKJfz0UGMyaneo9vo+b+wTUfOtcrsFu6Rmg9kYFyP1ZR+sxX+u2/yfYKL/M89Yo
         rY6ncBueueazXefSMqeANmhcH9iF8FyDMlPNk64q0FsnVrx3t25ZUPp5mHCOnk63F62C
         eyPw==
X-Gm-Message-State: AAQBX9figLVnveIsqxSzkZ8n16TNg64NSNPKtFzgxTyFeMjUBa+/XbWb
	0NUOriJzqzAGa+5iDGRF0bK0GrNwauY=
X-Google-Smtp-Source: AKy350ZUHl0k6VkdXzcetSXghQ3i9iL2W6iOcT/US1+29zXFLw9MU4rjNnwHIs1WrSkkOl4zhpozLA==
X-Received: by 2002:a17:906:2083:b0:92c:fc0:b229 with SMTP id 3-20020a170906208300b0092c0fc0b229mr4620756ejq.0.1679733375776;
        Sat, 25 Mar 2023 01:36:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id by22-20020a170906a2d600b008cecb8f374asm11389751ejb.0.2023.03.25.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:36:15 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:36:13 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8192e: Remove priv->rf_chip in
 _rtl92e_set_tx_power_level
Message-ID: <465a789243287c1420fdce68f9a861784a164140.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and never changed. Remove
condition in function _rtl92e_set_tx_power_level as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e35085253e70..b528b8ab4b2b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -542,21 +542,8 @@ static void _rtl92e_set_tx_power_level(struct net_device *dev, u8 channel)
 	u8	powerlevel = priv->tx_pwr_level_cck[channel - 1];
 	u8	powerlevelOFDM24G = priv->tx_pwr_level_ofdm_24g[channel - 1];
 
-	switch (priv->rf_chip) {
-	case RF_8225:
-		break;
-
-	case RF_8256:
-		rtl92e_set_cck_tx_power(dev, powerlevel);
-		rtl92e_set_ofdm_tx_power(dev, powerlevelOFDM24G);
-		break;
-
-	case RF_8258:
-		break;
-	default:
-		netdev_warn(dev, "%s(): Invalid RF Chip ID\n", __func__);
-		break;
-	}
+	rtl92e_set_cck_tx_power(dev, powerlevel);
+	rtl92e_set_ofdm_tx_power(dev, powerlevelOFDM24G);
 }
 
 static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
-- 
2.39.2

