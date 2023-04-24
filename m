Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124C3214
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:04:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1a8097c1ccfso52677835ad.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682359483; x=1684951483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9W3bGp63HvrS4+xBjDVhbzlULsCiRVmQgDYYgNevJZE=;
        b=qbnnG0C4A/Rn7+VqEmuzUg9FuGwvyZaKQjdmVVbgXXZ/i2FIp8FyQM9Kxy5jHQYXLI
         47wMuUc6Y27vZE0hm8HGX3xu846ClshPJw1J3XE6qFA0gAv1zvaov8dNo9pYPEaYkt3/
         nQUwHLBb1OCcTvZLNp72G1BEtOB/4ZKHW79isgGYG5768fwgUHMgT3Ute7BTkLifI99U
         Uv4mEgXOEoby2DIrW/D+J1o1UU0S4vnqUZLrP2UZIAngc8mN2iCzrqCLluy6U7uyO+7E
         rgVmI9ODPveMDhXOxWbOFIxWaBEUKuErhWCtOz+wc8lYEWPW3IOSgJf/0Y3VkjJ/UU5m
         5GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682359483; x=1684951483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9W3bGp63HvrS4+xBjDVhbzlULsCiRVmQgDYYgNevJZE=;
        b=OIFr4z9mb+xlrikmBCrqsyFAN0cP+IeonQnvsKwyzMKc4/5m5GvLxJiyn7vq9KHXME
         JI6kYxKBtaLo1Foab/J9/bxsLgIbyTujh7xHTOvG7gcfk37ny4wD1VlaLQGAx3HZI5nc
         20yc/mNXMK3PdmOOZxbyXSsFbycBjOcLqUd3e66UxLpowT+C+Z34UW1x1cHBgul8+OaM
         faIyK4s8X2QzdjMEIgMjt1g4mrUVKNv3kIhUlTS0ozbLlhwW4YnV/banYtcI6c84n5Gw
         xev7J/JFvptod/uzwev4RNCJmcjDqVTpUp5i4ihlarNGIIo1wyrJK/+VPGZCTx0HLfRZ
         0Ypw==
X-Gm-Message-State: AAQBX9eCDXX0WwiTGq4WyowaywLkQGjyu6C+CmnjXZFVL0BNMkj4cnsL
	7mLqC3gohkZ0zoqaBCQ76Qw=
X-Google-Smtp-Source: AKy350a7iXFI5PBeNidJJ7FL3rZ7HajjHptmdyOadJtmHrwquTiXcOZKlWaN3Ub9GZwETgoGususEA==
X-Received: by 2002:a17:902:fa86:b0:1a6:9906:1eb7 with SMTP id lc6-20020a170902fa8600b001a699061eb7mr12726001plb.35.1682359483140;
        Mon, 24 Apr 2023 11:04:43 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902aa8100b001a051eb014bsm6831251plr.219.2023.04.24.11.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:04:42 -0700 (PDT)
Date: Mon, 24 Apr 2023 23:34:38 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] staging: rtl8192e: Remove unused _rtl92e_wx_get_sens
 function
Message-ID: <eae80c4e2ac7f386c853cf824135b988c3666031.1682358035.git.yogi.kernel@gmail.com>
References: <cover.1682358035.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682358035.git.yogi.kernel@gmail.com>

After removal of rf_set_sens variable, the _rtl92e_wx_get_sens function
always returns an error code.
This commit removes the unused function and the respective ioctl.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

Changes in v5:
    1. Rebased onto latest staging-testing branch

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
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index cc1af367f37d..f0c590064def 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -803,15 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
 	return 0;
 }
 
-static int _rtl92e_wx_get_sens(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	return -1;
-}
-
 static int _rtl92e_wx_set_sens(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
@@ -1052,7 +1043,6 @@ static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
 	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
 	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
-	[IW_IOCTL(SIOCGIWSENS)] = _rtl92e_wx_get_sens,
 	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
 	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
 	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,
-- 
2.34.1

