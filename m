Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42E168
	for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 14:40:06 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id q2-20020a17090a2e0200b001a0fd4efd49so1133434pjd.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Oct 2021 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fKc/Clzqj7sN35K6qU3YvgRekqlf6MnRSCTbSDpofrw=;
        b=ULCZsjdpfuDtLYUWM6IpmVr38GZz6EQaXWOB677Y6cn8iY2QLmJGKj18essQFIYR+y
         IfjPKxrNed8vV/6olScfYeC2y/kOXWM8hU73fOvinYE4rgjSlFD0XKuJpYykOAgBZGtL
         0Aeqf+0h1AWLVTQREWhBedEovqfRjJmSCzKwfa6s8Sb8XH1lC51af++gsaIB+If2qnHH
         RlgdxN7bZ0n54mcMoY7Tzb0aS3GdVUxcRyNCcgdZAVne8gEfbwh93ruawisUdlTXlbT5
         6eDqS4HV9VNUmBEZbmIKdqphHj9loFNq1qLIGEyWRsdmhFCrzRhXx1NyPImau9g52c0A
         4X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fKc/Clzqj7sN35K6qU3YvgRekqlf6MnRSCTbSDpofrw=;
        b=ZdhnEgnQuhupNq3/oLLNsIZ/cnMv0zdNPJTJJ9ohWQ/IEU/fDrRmNjotGapMOJCkYr
         W1mwnvtQTHMTrcXrUew+vfYYyyUhxhiGTtgQr6cY4L3GV0FfW0hWeW7qufvrHvY1ZLuW
         ivSd4CMVzNXF3ZVAW6S/u2tbfmaiKoGASBIGMhQT5PgEzfXSiFfimUgM37yzSrIEsc9l
         7u1Ionc4BxIsKnEEtsyDa1en48S32Zo4SPe9jfs1m2smWpZCaXIa7zRJuPA+MwR8BlVj
         7k3joNdq9dlVG71KT+LDq38Y+bOqd/LutJMaQC8e9UawZ0fp3S18dd63sDA+b/MRag8j
         8E6A==
X-Gm-Message-State: AOAM533xqz5HwOl1CQ+QBra7WBAA6QIwlt0miRLi1w/txz7SLY9bfNwU
	tV+qVI9LaJc3FrIjKe+QVyA=
X-Google-Smtp-Source: ABdhPJxUHwi6+gcn+Xmnb5ALvr/yD8d8/I5yvbrVpWSwouV3CJfqgcbAPa1UknDNQCfkB9hZXbTLfg==
X-Received: by 2002:a17:90b:1d8e:: with SMTP id pf14mr6579148pjb.125.1634222406217;
        Thu, 14 Oct 2021 07:40:06 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id q8sm9156167pja.52.2021.10.14.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 07:40:05 -0700 (PDT)
Date: Thu, 14 Oct 2021 20:10:00 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com,
	saurav.girepunje@gmail.com, insafonov@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return statement
Message-ID: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove goto statement where function simply return value without doing
any cleanup action.

Simplify the return using goto label to avoid unneeded 'if' condition
check.

Remove the unneeded and redundant check of variable on goto.

Remove the assignment of NULL on local variable.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V3:

	-Remove goto statement where function simply return value
	 without doing any cleanup action.
	-Remove the assignment of NULL on local variable.
	-Replace the goto statement added after the memcpy on V2.
	 with return 0 statement.

ChangeLog V2:

	-Add goto out after the memcpy for no error case return with
	 ret only. On V1 doing free, which was not required for no error
	 case.

ChangeLog V1:

	-Remove the unneeded and redundant check of variable on
	 goto out.
	-Simplify the return using goto label to avoid unneeded if
	 condition check.

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 0868f56e2979..217b86bfb722 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2281,19 +2281,16 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	struct rtw_wdev_priv *pwdev_priv = adapter_wdev_data(padapter);

 	if (!name) {
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}

 	if (pwdev_priv->pmon_ndev) {
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}

 	mon_ndev = alloc_etherdev(sizeof(struct rtw_netdev_priv_indicator));
 	if (!mon_ndev) {
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}

 	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
@@ -2312,7 +2309,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
 	if (!mon_wdev) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_free_mon_ndev;
 	}

 	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
@@ -2322,22 +2319,20 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str

 	ret = cfg80211_register_netdevice(mon_ndev);
 	if (ret) {
-		goto out;
+		goto err_free_mon_wdev;
 	}

 	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
 	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);

-out:
-	if (ret && mon_wdev) {
-		kfree(mon_wdev);
-		mon_wdev = NULL;
-	}
+	return 0;

-	if (ret && mon_ndev) {
-		free_netdev(mon_ndev);
-		*ndev = mon_ndev = NULL;
-	}
+err_free_mon_wdev:
+	kfree(mon_wdev);
+
+err_free_mon_ndev:
+	free_netdev(mon_ndev);
+	*ndev = NULL;

 	return ret;
 }
--
2.33.0

