Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA4B1FC4
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 12:48:35 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id fb38so12421021pfb.7
        for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680180515;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldJcxIa6kLbtB5zSDr5wR2rNVF9D0ls2PcDB3uelXJo=;
        b=XUMucqBAvm4duHddaX1DG1eWkBL/xGzu5ISy3hp+p5y6CmK0EbGYZdjxTms40knkqP
         dQeB2j33h4LcFlzph7hzWPPblQc34f/W7O+QxhW/inGPRnLC0/Jf9rdPbpLF6smIKBWY
         SILtac1JZZGZNlE5Vdmwt7K+FT0k9nXJWm2DFdDhxPNKsSO3u4hwhjVzAdqC2LVUpXhq
         UcgMPS0IX9BN0BDk23gRw0PnXjkCVBBJ+8iaftQD7itBJ6REjyVuio9l07NoC7Ujm1tP
         aR5DaWoNDy2ozcVmU2g/kXUl8nR3EPshL0a0FCM04yarYCV+PIYM6YjBHrujPhr1k/+1
         UQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180515;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldJcxIa6kLbtB5zSDr5wR2rNVF9D0ls2PcDB3uelXJo=;
        b=AkmoOwRMPLK+gdjjOHbnSMcsYBl94d66Ng3Y+o+AR2GWiYimx2ybP9C2E0GPXqqXmS
         BxiWBSgYWJfbr7UGuWwZcpzP4pWi9AKNc1jw/u121bvrMix/TGwCzgHTdtV0REHdki4b
         4emw02kvu6vCbefF/CM/fbc5VCI9BXOb6GLk4N4AQematceodBDVAEtWVLuencph43ta
         4uwKTcLCtU1vUJl8N8SIzVZsza/DMJMfT+LURKsks21kc+lBS2nRaIkBLaGE+JSei3GZ
         QX8fz0PjmnkHFGsyvG8GF1JW3uOrgoSvjLKv30rFlvgWhUNE+gok/f/prA+64bhCGJlm
         A+aA==
X-Gm-Message-State: AAQBX9elXLr5k3iCZ7E0nhV88qX21vuii2t1Un0xLhH/PGUWoV8R0xUC
	46o5tyGjf7mQFN3ygTPctc1784t84OOUPE8l
X-Google-Smtp-Source: AKy350bd0dhfR/u5uCTWc4oRWjxej6NtgMvwFw2fjQGTjQwuPuCZrtkNezQ/WWh2WohBmQogowM7tw==
X-Received: by 2002:a62:18d2:0:b0:62a:4267:102d with SMTP id 201-20020a6218d2000000b0062a4267102dmr19941024pfy.27.1680180515246;
        Thu, 30 Mar 2023 05:48:35 -0700 (PDT)
Received: from joel-ubuntu-desktop ([2407:4d00:2c02:823f:14a7:49e0:2d87:e0ad])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0062d19179ec6sm9641449pfn.87.2023.03.30.05.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:48:34 -0700 (PDT)
Received: by joel-ubuntu-desktop (sSMTP sendmail emulation); Thu, 30 Mar 2023 20:48:28 +0800
Date: Thu, 30 Mar 2023 20:48:28 +0800
From: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
To: driverdev-devel@linuxdriverproject.org, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Subject: [PATCH] staging: ks7010: remove unnecessary parentheses
Message-ID: <ZCWFHFogxD+O9N51@joel-ubuntu-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove redundant parentheses

Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
---
 drivers/staging/ks7010/ks_wlan_net.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index e03c87f0bfe7..eef1a1e70088 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -193,14 +193,14 @@ static int ks_wlan_set_freq(struct net_device *dev,
 		fwrq->freq.m = c + 1;
 	}
 	/* Setting by channel number */
-	if ((fwrq->freq.m > 1000) || (fwrq->freq.e > 0))
+	if (fwrq->freq.m > 1000 || fwrq->freq.e > 0)
 		return -EOPNOTSUPP;
 
 	channel = fwrq->freq.m;
 	/* We should do a better check than that,
 	 * based on the card capability !!!
 	 */
-	if ((channel < 1) || (channel > 14)) {
+	if (channel < 1 || channel > 14) {
 		netdev_dbg(dev, "%s: New channel value of %d is invalid!\n",
 			   dev->name, fwrq->freq.m);
 		return -EINVAL;
@@ -663,7 +663,7 @@ static int ks_wlan_set_rts(struct net_device *dev, struct iw_request_info *info,
 	/* for SLEEP MODE */
 	if (vwrq->rts.disabled)
 		rthr = 2347;
-	if ((rthr < 0) || (rthr > 2347))
+	if (rthr < 0 || rthr > 2347)
 		return -EINVAL;
 
 	priv->reg.rts = rthr;
@@ -701,7 +701,7 @@ static int ks_wlan_set_frag(struct net_device *dev,
 	/* for SLEEP MODE */
 	if (vwrq->frag.disabled)
 		fthr = 2346;
-	if ((fthr < 256) || (fthr > 2346))
+	if (fthr < 256 || fthr > 2346)
 		return -EINVAL;
 
 	fthr &= ~0x1;	/* Get an even value - is it really needed ??? */
@@ -780,7 +780,7 @@ static int ks_wlan_set_encode(struct net_device *dev,
 		return -EINVAL;
 
 	/* for SLEEP MODE */
-	if ((index < 0) || (index > 4))
+	if (index < 0 || index > 4)
 		return -EINVAL;
 
 	index = (index == 0) ? priv->reg.wep_index : (index - 1);
@@ -881,7 +881,7 @@ static int ks_wlan_get_encode(struct net_device *dev,
 	}
 
 	/* Which key do we want ? -1 -> tx index */
-	if ((index < 0) || (index >= 4))
+	if (index < 0 || index >= 4)
 		index = priv->reg.wep_index;
 	if (priv->reg.privacy_invoked) {
 		enc->flags &= ~IW_ENCODE_DISABLED;
-- 
2.37.2

