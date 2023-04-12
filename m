Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B436FD2
	for <linux-staging@lists.linux.dev>; Wed, 12 Apr 2023 17:51:34 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id nh20-20020a17090b365400b0024496d637e1so17694187pjb.5
        for <linux-staging@lists.linux.dev>; Wed, 12 Apr 2023 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681321894; x=1683913894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMFvx9R05G83emmjiC6gGYYP7XR7L+4xdX75p1GZrA4=;
        b=HldBkYFSTk2eIYOWRcFGEl663iNXGLalkDcFYdEz5SWbBBlKj4aPP4Oluf6I1Cl6nE
         X1+UJm09/5ED+Ki81aiikT/OQHBjouJ608sLyPgAuviTfTcTuspXzL4Xi5dU2DiA61DR
         Zfgpohc99MMg5T3YioxT1M3VaHhNQA8zI1envtnlZlLmi0JzTfBOaBAeKquj65rVNPdI
         nlQbYjc8yN5e0f55gFqYD9OVLPRH8fi91MPql4ZfV+0P+qi9irtNdyZWnL7O1M10O7ma
         aY2sBq/ZmYsbDcWdFRARqARjPtZISbEdn9kjBIxsSiontK2GtunZVfvTKXJJ1vvq1LB/
         qImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681321894; x=1683913894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMFvx9R05G83emmjiC6gGYYP7XR7L+4xdX75p1GZrA4=;
        b=Tt/fwblfisi7Q2JfAxlayKaZceHbYVtL/Mkse6AFvtfGxSoNZtzjPhTK3Q/T3oJoQU
         sOQFxMGfgNiDkVzlI0oo9w2/a3n7cC3tBabxIvMoYbIKqlXroiDZWbjdcNtju8pMg/6Y
         bHIOV3pDgfNWsNMGLH00TSNdeIb7J8oLJ8Kxh3MTf6//nIXH8w4wxb2gZaPi1uOEJ/N5
         4Och+8xvA+m/sUelEpDnsqrK1SaquiZK2s5q+SDXCcP3Nzq+VcXLq/7mdIB+s41HgMX0
         8nt/GT4RWL/vfGoauqQNcUxsZaBOfnWImLitekyCs86ScaN82g8whHSvXxl+1F6Q95gl
         vuTA==
X-Gm-Message-State: AAQBX9cMOQw12ZYdLQUd9ENt9J64hrQwj7aEcYgft74ZIy7XkSutvrYf
	YsTfELLVVGLlDPsHJGCPnvI=
X-Google-Smtp-Source: AKy350bvnCp4sbVZIaf3Tejaf1KAm75vhciwgnputsc6uH0vVYKeFmabQjDWsIYrseDixHYsnuLTxw==
X-Received: by 2002:a17:902:db10:b0:19c:b11b:ffca with SMTP id m16-20020a170902db1000b0019cb11bffcamr28373130plx.23.1681321894400;
        Wed, 12 Apr 2023 10:51:34 -0700 (PDT)
Received: from Zephyrus-G14 ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id c14-20020a655a8e000000b004fb26a80875sm10719885pgt.22.2023.04.12.10.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:51:33 -0700 (PDT)
Date: Wed, 12 Apr 2023 23:21:29 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH v3] staging: rtl8192e: Fix comparison to NULL of variable
 rf_set_sens
Message-ID: <ZDbvoULAO6wdeso1@Zephyrus-G14>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens depend on the
function rf_set_sens, which is declared but never defined.
Hence calling this function will cause an oops.
Because there is no definition of the function priv->rf_set_sens
will always be NULL.

As a result _rtl92e_wx_set_sens and _rtl92e_wx_get_sens will always
return -1.

Hence,
* Removed function definition rf_set_sens
* Removed usage of variable priv->rf_set_sens
* Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
* Cleaned up the variables sens and max_sens used in these functions

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
Changed in v3:
- Fixed description to fit within 75 chars
- Added suggested tags

as Suggested by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Changed in v2:
- Removed function definition rf_set_sens
- Removed usage of variable priv->rf_set_sens
- Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
- Cleaned up the variables sens and max_sens used in these functions
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
 2 files changed, 48 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 2b2d8af4cf6e..a949a3833cca 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -234,7 +234,6 @@ struct r8192_priv {
 	struct rt_stats stats;
 	struct iw_statistics			wstats;
 
-	short (*rf_set_sens)(struct net_device *dev, short sens);
 	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
 
 	struct rx_desc *rx_ring[MAX_RX_QUEUE];
@@ -274,8 +273,6 @@ struct r8192_priv {
 	short	promisc;
 
 	short	chan;
-	short	sens;
-	short	max_sens;
 	bool ps_force;
 
 	u32 irq_mask[2];
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index cb28288a618b..0bb657fda06c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -311,10 +311,6 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
 	/* ~130 Mb/s real (802.11n) */
 	range->throughput = 130 * 1000 * 1000;
 
-	if (priv->rf_set_sens != NULL)
-		/* signal level threshold range */
-		range->sensitivity = priv->max_sens;
-
 	range->max_qual.qual = 100;
 	range->max_qual.level = 0;
 	range->max_qual.noise = 0;
@@ -807,45 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
 	return 0;
 }
 
-static int _rtl92e_wx_get_sens(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	if (priv->rf_set_sens == NULL)
-		return -1; /* we have not this support for this radio */
-	wrqu->sens.value = priv->sens;
-	return 0;
-}
-
-static int _rtl92e_wx_set_sens(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	short err = 0;
-
-	if (priv->hw_radio_off)
-		return 0;
-
-	mutex_lock(&priv->wx_mutex);
-	if (priv->rf_set_sens == NULL) {
-		err = -1; /* we have not this support for this radio */
-		goto exit;
-	}
-	if (priv->rf_set_sens(dev, wrqu->sens.value) == 0)
-		priv->sens = wrqu->sens.value;
-	else
-		err = -EINVAL;
-
-exit:
-	mutex_unlock(&priv->wx_mutex);
-
-	return err;
-}
-
 static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 				     struct iw_request_info *info,
 				     union iwreq_data *wrqu, char *extra)
@@ -1066,8 +1023,6 @@ static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCGIWFREQ)] = _rtl92e_wx_get_freq,
 	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
 	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
-	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
-	[IW_IOCTL(SIOCGIWSENS)] = _rtl92e_wx_get_sens,
 	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
 	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
 	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,
-- 
2.34.1

