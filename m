Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26820E1
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 14:22:23 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3765260a12.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682259743; x=1684851743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SzOu+Yuals4xOY+oHNYGjX4zD/G3dXcRaRKK7UhEW+4=;
        b=qgToE19+ZDmzMwnxB74VMCCo/QzL9mKrHmvnXsR7h/QctR3dqgRN/94YCa5p177iPw
         p+skWGZiMkHNAwZamvf6i7WCRb8TMMp1Vey92470KVGqrlvi8W44Qh4wCSBqbLbQau0W
         e1sYXFSLjLf/33lAAtXg3PD0QRNDFIPHiPUIEpYGs8iIy1yFI5GN35lvu+qIKTckcru/
         Bm4I75UcIEwLM4fg0KPuC2fWURQITSuE8uKt7xUUu+sPWq8teJ5Wax805emBAQCgZc/8
         xJEsx48r8KEEWCSC2ksZNop17Nv6eTsEfQlo61xhy1AMZoCesCW25Xb4Vr9k8/TmkOnF
         jymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682259743; x=1684851743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzOu+Yuals4xOY+oHNYGjX4zD/G3dXcRaRKK7UhEW+4=;
        b=gmOVQ/rpj/uH5bXb108DhrdDmOpMS7wLA1fyFJWVFbQzekOkhsCMNUqdV2ZOBoGFfZ
         94jPUdlR745mXyL6+MlMwAnb4g67wwU5FvvRxVQ0UZ1T/dzptcT9lv4XtfQZkjmIwstZ
         6LTGCKt+LNI/uyuQ2tgdtMjBxhRBXSFswAnaQyB8EBdTwrJt91vZbXKqQzoKFv+P+uGF
         nTt10LeRtnuBrk7pnm1tcOQxqjBqoAr8geTOpADetTbNpx2DaGjvfFUCBirRpblz4uwg
         DIX4TB0AI9h9EpeKkXY5ic5erKUHBa4QydZLij7SXxMc4XJXZXoIyzNzb1Kzb4cPYjFb
         j0yQ==
X-Gm-Message-State: AAQBX9f45wY2TQ7bEmZjCMZFm0uuTbOwxhFcGDjR0tgSYQVaaR6dbjw3
	0DscWUPZPnU/Yv+U6qNe1gk=
X-Google-Smtp-Source: AKy350bQkd79axEqnU0lZ18XD63JuZer1trKSoQmlwofymsSzcYhhyr/sST+A4QkuPOy3XWhlZr7qA==
X-Received: by 2002:a17:90b:238f:b0:246:c223:14ab with SMTP id mr15-20020a17090b238f00b00246c22314abmr10900361pjb.41.1682259743383;
        Sun, 23 Apr 2023 07:22:23 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id k14-20020a170902760e00b001a972e9d4f4sm667337pll.102.2023.04.23.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:22:23 -0700 (PDT)
Date: Sun, 23 Apr 2023 19:52:18 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] staging: rtl8192e: Remove unused rf_set_sens variable
Message-ID: <ab3604dff9c7defd400e394f8fbf07e5867cffef.1682257566.git.yogi.kernel@gmail.com>
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
index cb28288a618b..06730d3ca6bb 100644
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

