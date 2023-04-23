Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D020E1
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 14:23:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so5002725b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682259780; x=1684851780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60VLuunh9jJIqRQxjmwlBPmHJdKwWWEOI7ooFDJYSHQ=;
        b=Lng/wd55ZCIqM3NNkkFneNgE0uJfT0w1M1hyd1qmwFUnpPo2R7UmR4Sh/OkvtG8T9U
         BfEeEOtOnI3Rc1pv1sA9NAzwW8nbDoPn66kJtnPsN/TRku1/UlET36TbP9ti5G9iT2n2
         xCythSSzFgTJHlxbDMb3PuRKwO4RakEXYhSJ6hFUqsiLHX05G7IA97IU/8LMA5OiLbne
         hVLJHfTLeNZcwBV4voQM7Qd5dnKa8sX1Bc8odAc5L3Vd1OugRN7NngMSex8jo+kTr8WQ
         oin+Rj3q55yAeJTgv3z4WeANp7owi1eeqbluQyYGrlk7kLEfIBU1uSLAf/nmJZs9xsu8
         YfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682259780; x=1684851780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60VLuunh9jJIqRQxjmwlBPmHJdKwWWEOI7ooFDJYSHQ=;
        b=LF7tP0lhOxuci8v2ACiKt8siw0b30hq98uhpJfWb/ATfRTNDvT/GE7A9RqJS7ybAUi
         57Ig7Rq57FHVSIaqHZWTXhX29RkAhPo0vy4hdvbY5o1S6MIVJwC8FrQQwl8eZurDiRrn
         CYfZwPw/rgO0u/C2vdZUsHZj9fDoDC9VOSfkGkTZN9fbJqIoN8EdyDDkc4T6HU7zcVJ2
         +WNxx2Lv3dmWOVettek2WI6MmhEddyJmcRThhAaXPr+aijwbxWIpwBQHu8JtmY0uDTXM
         EDUU9yjckjV1WMPN/AcDegj2gMdDRkc6ulbeIpkNsuoWKCE6UUsDuJMSUA/CrvThvAZ4
         e7wg==
X-Gm-Message-State: AAQBX9eWWqGWFMC5paY16o+A9dQRcif0Vo69Dm8xNZES3D1u4FC+KI2E
	asVRQd8tw8aV05sHQ8Jz29w=
X-Google-Smtp-Source: AKy350ZbjbqTODW1PQgjx5o37NcDRsJG37QfOHqM+mC+OHstcfJzxWuL79qWgBNJlwlRB8nSGF7NsA==
X-Received: by 2002:a05:6a20:54a6:b0:f0:ffb:d1e2 with SMTP id i38-20020a056a2054a600b000f00ffbd1e2mr15136204pzk.53.1682259780230;
        Sun, 23 Apr 2023 07:23:00 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id p11-20020a654bcb000000b0050376cedb3asm5076330pgr.24.2023.04.23.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:22:59 -0700 (PDT)
Date: Sun, 23 Apr 2023 19:52:55 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] staging: rtl8192e: Remove unused _rtl92e_wx_set_sens
 function
Message-ID: <5220fec656830820f0dfd116edddbd0941a5cafa.1682257566.git.yogi.kernel@gmail.com>
References: <cover.1682257566.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682257566.git.yogi.kernel@gmail.com>

After removal of rf_set_sens variable, the _rtl92e_wx_set_sens function
always returns an error code.
This commit removes the unused function and the respective ioctl.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    -- None

Changes in v2:
    -- None

Changes in v1:
    -- None
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index e4a726cd0b31..0bb657fda06c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -803,25 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
 	return 0;
 }
 
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
-	err = -1; 
-exit:
-	mutex_unlock(&priv->wx_mutex);
-
-	return err;
-}
-
 static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 				     struct iw_request_info *info,
 				     union iwreq_data *wrqu, char *extra)
@@ -1042,7 +1023,6 @@ static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCGIWFREQ)] = _rtl92e_wx_get_freq,
 	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
 	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
-	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
 	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
 	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
 	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,
-- 
2.34.1

