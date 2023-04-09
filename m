Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908F1FB8
	for <linux-staging@lists.linux.dev>; Sun,  9 Apr 2023 13:10:46 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id w11so2357308pjh.5
        for <linux-staging@lists.linux.dev>; Sun, 09 Apr 2023 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681045846; x=1683637846;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fXaACdefbFVmBrFv928AIoW85GWTWRcXqxLif4tfE4=;
        b=kypOjEp3OjhhaD6eQjroTPNErS71sIcg4B7CgLJE4CbJ72YHcRWmQ/YHjx7gWvPypV
         hPAD35ILDpdbLWwJGFQYnCWJbV0ii8O5C0T75WVgRgtJ2Frf9dHM+hdSuRYL0yRSm7tr
         ApW65cEkPLjZ3AmcUe44Z/ofjtp+Gp4Y/1QcWHmIIKDj9ssbA0+LvXu4rXLibf2eW3E6
         RpLQTHuqczhTOznO+iVpRTKJGTgKidKyMD+5RIWVaX8KoEewwf9YaLlG11C6oUA8cqFU
         IT0qhY0o0fAmWmU1Bd1TtQJ17kUu8Y97Z04NPfS8AqzbCXb5PRHS6pH81QpX/3jTsT1W
         0omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045846; x=1683637846;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fXaACdefbFVmBrFv928AIoW85GWTWRcXqxLif4tfE4=;
        b=JWL+ndw5xchHQKzuSo2iHHbZHArMg/Z26env8Wz2jNXayPyC+lXXRGgz9Z2S+OUmOd
         S8U3lN7sktVeywRYPwOsJruQzbqQKIl+iBt2jREtJHBPY1puSWY2w5H5Evr5rTxh0b9O
         3QxxgBTSEraSe0yWX5pdqThdjq0Zv7NbIZXYIDGPMhFVZS0G5B+awRAoWJf/+9n8ivIJ
         daysVZLbJyU4fvWoF/4+CAi6XDXZj1CCil1VOiGjo6BcD2qoilnEsSxhEauPajKMIflg
         sxrxLpJv6Kp+rCAkwrcBHO14lzA8a3Ykw5bV9JthxAKYdP3IcxDgeGVJFCZ9tqSwAXxB
         jlHg==
X-Gm-Message-State: AAQBX9czpiGoNO4IUwq7XkshwGjIjYnMAad442rCI2VJs9klbBCtyBg2
	53AN+/SoHIZEIFDmzfzaCVc=
X-Google-Smtp-Source: AKy350aSyeEYO12iU5WlgKGZxNvq2B9kn59UQss/k/1V6yf1gkplfHevPLEE3Abb/DeJdUu6W+jwig==
X-Received: by 2002:a17:90b:164b:b0:237:f018:6433 with SMTP id il11-20020a17090b164b00b00237f0186433mr9924203pjb.27.1681045846058;
        Sun, 09 Apr 2023 06:10:46 -0700 (PDT)
Received: from Zephyrus-G14 ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id jg14-20020a17090326ce00b001a1fe42a141sm5898218plb.115.2023.04.09.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:10:45 -0700 (PDT)
Date: Sun, 9 Apr 2023 18:40:42 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix comparison to NULL of variable
 rf_set_sens
Message-ID: <ZDK5UvVHa96ejEfU@Zephyrus-G14>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix comparision to NULL of variable rf_set_sens as per Linux kernel
coding-style. These issues were reported by checkpatch.pl.

CHECK: Comparison to NULL could be written "priv->rf_set_sens"
CHECK: Comparison to NULL could be written "!priv->rf_set_sens"

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index cb28288a618b..a67edb81a820 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -311,7 +311,7 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
 	/* ~130 Mb/s real (802.11n) */
 	range->throughput = 130 * 1000 * 1000;
 
-	if (priv->rf_set_sens != NULL)
+	if (priv->rf_set_sens)
 		/* signal level threshold range */
 		range->sensitivity = priv->max_sens;
 
@@ -813,7 +813,7 @@ static int _rtl92e_wx_get_sens(struct net_device *dev,
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->rf_set_sens == NULL)
+	if (!priv->rf_set_sens)
 		return -1; /* we have not this support for this radio */
 	wrqu->sens.value = priv->sens;
 	return 0;
@@ -831,7 +831,7 @@ static int _rtl92e_wx_set_sens(struct net_device *dev,
 		return 0;
 
 	mutex_lock(&priv->wx_mutex);
-	if (priv->rf_set_sens == NULL) {
+	if (!priv->rf_set_sens) {
 		err = -1; /* we have not this support for this radio */
 		goto exit;
 	}
-- 
2.34.1

