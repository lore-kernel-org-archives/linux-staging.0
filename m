Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EC63214
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:05:12 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso3929956b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682359512; x=1684951512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiIVNyd08SCa9xZF0j0zmRx0TelGskNY2ufTY9xiK5M=;
        b=FtoVTIjxm1x19Xo2myP/LrNBbREUxIokQhVfkVN/WWcLnQHJbK6LNCobiSBale1+2/
         /e7VGDPbBjkACeVOB5+Pouc4RVXcBbfHE2FDE2QotgTwwE9lxLy7cqBsBdcFrJwdQSE0
         7Wjx4C+xp9cEFBA5Qy5yTnbbBzH4C2MzooslOzgC83BITnm/VVPSSHohEw6CjLXELWmE
         jmLLgN8/8kGcIFyvsP9Kik6B/JJMgePLQ1Vo1SkgfiUisN1wX07NwpOy9LSrIoiqjxov
         5cxCXh+wOEnKcHTcxBxHiPsbxXL8ssBCijXIYYw4yCf0/EHUO9lpibyfyDG7ItnbUS62
         zAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682359512; x=1684951512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiIVNyd08SCa9xZF0j0zmRx0TelGskNY2ufTY9xiK5M=;
        b=XA597qjjDaDUQnpdvE31tf2AKBannPackw2TZQv4w0rU27qSjDJWTemRUZsTQ30XpE
         c/g368qUtbClQgMOa789vPQDWVM5Lk8TrvL+IDxqUHx1buWEgCXNkbA/ykp3s9M4QH3V
         BUKpXd96yeNFCZ8mTMNSkhML/sLyTJds///6yJqvVQw233QxSD+XPFwbx7rB/LGky2q3
         dtSaRc7jGA8F+vxRSPVDYMnEdLFJkPgD8bqMKTfsJq8DLliLkrme3Lc9hjcOkBHpdjvR
         b80TeYURTEQlY7PM0XNbE9uiOrd+7lZ1LsyYt7bxGyAkzFXi2mMgNAGT0UEfDg97gGsN
         frRQ==
X-Gm-Message-State: AAQBX9fbOu5t1JbKOAveWaKILxLsE0+DdWmz/vbYJJ8mAxJVh5g1eXA9
	5qQShRoHPynWIkAijYoXjnU=
X-Google-Smtp-Source: AKy350YVh2dcf+IGeOKoYh4Nxzhww75IUwgD80P3Q2Q423Ejrj/xqUOJPJKAlMGBzuxMn2EgkSMqgA==
X-Received: by 2002:a05:6a21:33a2:b0:f2:9378:814a with SMTP id yy34-20020a056a2133a200b000f29378814amr13326744pzb.49.1682359512298;
        Mon, 24 Apr 2023 11:05:12 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm7794339pfg.107.2023.04.24.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:05:11 -0700 (PDT)
Date: Mon, 24 Apr 2023 23:35:07 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] staging: rtl8192e: Remove unused _rtl92e_wx_set_sens
 function
Message-ID: <439386d2940fe70ec2092e87211df5e7946aab82.1682358035.git.yogi.kernel@gmail.com>
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

After removal of rf_set_sens variable, the _rtl92e_wx_set_sens function
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
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index f0c590064def..0bb657fda06c 100644
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

