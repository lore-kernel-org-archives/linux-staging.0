Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DCF3214
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:04:12 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63d4595d60fso29940832b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682359452; x=1684951452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pz7puxVNtolmzcAAwyFjNawuUpApiD7LRdlC7UvoCIo=;
        b=YjDZliCErZG6eMEe/1BMVzzbVztgISMWDi6eJlA/S29GGNg3j2iwgsvs9h5cFjzBC1
         Z+bRVuCYOtAdWjxET6awwI4G3zCqkV1Bl+AfxuzwUyvlbED+T6VeYNqa3+vFdujhww3o
         Wf0LbZFvZDJ7lPyWZD8CZiSnhBVqeqQjlzEyXiYw1PANXpUiEGMbzSVmVNYZ8ej/OKI+
         p9wBMgYLTfm546yip58JQp1M6Cp2CAE7hkE4W7Di9S+yvYBObwe2jkFbwOYTOevUmfgC
         1y24XyIjW2mDTBmG2Agkb1I3j3qGeDZ4giudu0qKGmSTQKY1hGzaLpKufuboxDeTFP13
         1atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682359452; x=1684951452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pz7puxVNtolmzcAAwyFjNawuUpApiD7LRdlC7UvoCIo=;
        b=Dv2Zbr8yefczEoxvDZbZvng5HOC510VazFT90Yc3fFjifsLObVzaWHQmqTyx3lEUw+
         fjvorW9b2nS05X2CkT+Vch4Isis3aDmeFexGJscbFD+x0DjBmuzHLTydYaLfOSrPX3Xa
         xld380lk1zsiArBmGrwNz4Ve9SNR5Ynb/uDJrSU5VrW9oubHOewSJgzlpENfpsD2Om4q
         q9BV/WL/t5dG9q8b/9fIq8zVO0PoRNwEsCz6NipkUpDQ/6iGxO8oUT07FvW2dVC/aRif
         wAGIrMd//5troYGeQvr1BPE9Qf3epr03/2HC2YLDmTW0z6io76w7goWmyDy1vRkNHXZb
         BKoQ==
X-Gm-Message-State: AAQBX9fzhFZBeTzgRD97MFyoxcpjC+MtI2Q2X3MraOMsLlMx+kq3kN/A
	0IO0aNTMiJ37g//EsdFXlW5d169Y6M0=
X-Google-Smtp-Source: AKy350Y/MzBGCSCbMfswcWt5iik0ZWKHLLQhqJonZltK0oLOutZXWUwqz4UGh7hknJKBt96HOtdIKg==
X-Received: by 2002:a17:90a:6002:b0:246:865d:419a with SMTP id y2-20020a17090a600200b00246865d419amr20810032pji.6.1682359451869;
        Mon, 24 Apr 2023 11:04:11 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id u19-20020a17090abb1300b0024b2fc15befsm5797080pjr.44.2023.04.24.11.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:04:11 -0700 (PDT)
Date: Mon, 24 Apr 2023 23:34:07 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] staging: rtl8192e: Remove unused rf_set_sens variable
Message-ID: <5a9767fab76b1836ea7881994ffb3593c1ab12bf.1682358035.git.yogi.kernel@gmail.com>
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

The rf_set_sens variable is declared but never set, so it is always NULL.
This commit cleans up the unused rf_set_sens variable and removes the
associated code that relied on it.

Specifically, the following changes have been made:
- Removed the `range->sensitivity` assignment, which was never used.
- Removed the sensitivity level get implementation, which always returns
  an error code.
- Removed the sensitivity level set implementation, which always returns
  an error code.
- Removed the `rf_set_sens` variable.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

Changes in v5:
    1. Rebased onto latest staging-testing branch

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    1. Fixed description to fit within 75 chars
    2. Added suggested tags
    per feedback from philipp.g.hortmann@gmail.com

Changes in v2:
    1. Removed function definition rf_set_sens
    2. Removed usage of variable priv->rf_set_sens
    3. Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
    4. Cleaned up the variables sens and max_sens used in these functions

Changes in v1:
    1. Fix comparison to NULL of variable rf_set_sens
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 19 ++-----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 285dac32c074..08145e1f814c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -231,7 +231,6 @@ struct r8192_priv {
 	struct rt_stats stats;
 	struct iw_statistics			wstats;
 
-	short (*rf_set_sens)(struct net_device *dev, short sens);
 	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
 
 	struct rx_desc *rx_ring[MAX_RX_QUEUE];
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index cb28288a618b..cc1af367f37d 100644
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
@@ -813,10 +809,7 @@ static int _rtl92e_wx_get_sens(struct net_device *dev,
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->rf_set_sens == NULL)
-		return -1; /* we have not this support for this radio */
-	wrqu->sens.value = priv->sens;
-	return 0;
+	return -1;
 }
 
 static int _rtl92e_wx_set_sens(struct net_device *dev,
@@ -831,15 +824,7 @@ static int _rtl92e_wx_set_sens(struct net_device *dev,
 		return 0;
 
 	mutex_lock(&priv->wx_mutex);
-	if (priv->rf_set_sens == NULL) {
-		err = -1; /* we have not this support for this radio */
-		goto exit;
-	}
-	if (priv->rf_set_sens(dev, wrqu->sens.value) == 0)
-		priv->sens = wrqu->sens.value;
-	else
-		err = -EINVAL;
-
+	err = -1;
 exit:
 	mutex_unlock(&priv->wx_mutex);
 
-- 
2.34.1

