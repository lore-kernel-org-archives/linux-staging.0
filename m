Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF872
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 15:39:18 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id o133so4482179pfg.7
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xn3cZFmsRkEBphig5j0Fjp/Shbu/DV7lATpJ+tppRws=;
        b=I65/gN9VXJyrTgtS9X2dyUj2il1coHyZyab1Wy4IojdCqRUWrytic7fYUURUp2ljaV
         g3DkawOXbe2ClE2ta1jdpPKZX239GAq1dP5OJ9xPumNmP9xcJkkv/oChtWNbUeBb5S3w
         OY86igjXcsIixfzDakmLK/8ShFAyu5zLw4K1rIZs7jvEzVM35fnwtWBY4kLcO/rPEyUc
         HZaTgiPk1m+Mc8SKZO3IX1xA2xM8S0c1Y+1B8uwbdYGkhWZF2FSwac0Rra9ZeusEWcPi
         aADR758y7cT4Mg47QuPR21cNe5oMzl3ud9sCf+jbUIaNqWB8x8vG9JWvK8A97sZxIvYV
         3xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xn3cZFmsRkEBphig5j0Fjp/Shbu/DV7lATpJ+tppRws=;
        b=kMqdxBLxqWxQIU9fg2Eg1hrFLArDVy5Cq8OGc0X2XUc+9sL0yW7jruOsWdIh6+8Ip7
         ZAeERc9WfJU/BS3hj1SQBag4lpeAnF4NwhOChX3p1njn9AA3I8OxMcPXDiBPa6Uhc2SP
         Jf/zN5RicSMip2bejt6skqFSolT5zTO4S3sG/tY8PFHpcnNsfFPV7qT3fKKJS/eHlc5W
         q4RKFbJsYMQ96tA/fgZY8R8zW5h6/OCi1DzhUCc3ndmSTPh+Pm2tgN+bJ2Y+DNHI5f+6
         DmIaYkteBkPXw3F1p+60dzsBRe0a5qex2+kuhk0BTiwx7jokTwWQjvl0D5P9usAgb8Kq
         wh9w==
X-Gm-Message-State: AOAM5309zpvxn1e2Nn++k56QcYgBenhaqcvHcdFi7N1h+YPcrU/OnY8Q
	H8NjicJGB2hsOjwVKzDY/Ms=
X-Google-Smtp-Source: ABdhPJy37wMBE/ZvwJCG4r4p1qVkUAyHu1kF4A5stn8oRkLvqOd3NOPV7yICAlD+ybVTepC9IIdFAw==
X-Received: by 2002:a63:b04c:: with SMTP id z12mr9923338pgo.371.1633793958266;
        Sat, 09 Oct 2021 08:39:18 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id a17sm2730058pfd.54.2021.10.09.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 08:39:17 -0700 (PDT)
Date: Sat, 9 Oct 2021 21:09:12 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: os_dep: simplify the return statement.
Message-ID: <YWG3oIchovDZnPl8@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the unneeded and redundant check of variable on goto out.
Simplify the return using multiple goto label to avoid
unneeded check.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 0868f56e2979..574fdb6adce7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2282,18 +2282,18 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str

 	if (!name) {
 		ret = -EINVAL;
-		goto out;
+		goto err_out;
 	}

 	if (pwdev_priv->pmon_ndev) {
 		ret = -EBUSY;
-		goto out;
+		goto err_out;
 	}

 	mon_ndev = alloc_etherdev(sizeof(struct rtw_netdev_priv_indicator));
 	if (!mon_ndev) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_out;
 	}

 	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
@@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
 	if (!mon_wdev) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_zmalloc;
 	}

 	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
@@ -2322,22 +2322,23 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str

 	ret = cfg80211_register_netdevice(mon_ndev);
 	if (ret) {
-		goto out;
+		goto err_register;
 	}

 	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
 	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);

-out:
-	if (ret && mon_wdev) {
-		kfree(mon_wdev);
-		mon_wdev = NULL;
-	}
+err_register:

-	if (ret && mon_ndev) {
-		free_netdev(mon_ndev);
-		*ndev = mon_ndev = NULL;
-	}
+	kfree(mon_wdev);
+	mon_wdev = NULL;
+
+err_zmalloc:
+
+	free_netdev(mon_ndev);
+	*ndev = mon_ndev = NULL;
+
+err_out:

 	return ret;
 }
--
2.32.0

