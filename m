Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97542C83
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 05:06:11 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 187so11758863pfc.10
        for <linux-staging@lists.linux.dev>; Sat, 09 Oct 2021 22:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=dM074y++lE+8ycfGWmkuR8//9HdPqcSHLfhb3QYeN40=;
        b=nOII8D7OGVKWvJsvhJeHKmcFnb6jyU+FXn9kyzIkfXgeLp7kjzo6Ag+505vaK505FS
         iBngUdAnNHTk/SlHolIV33oxOLbeEyJBcL8crFcpdh+UP8tq9BPAan7srq/hv5XY2ew3
         XKoj2NGX5RfpxXM+9cTo56uSDFmjHPNI2oX5d0kfYfJtbQpebpuWYA299EmSi24rwGYA
         qQdY30tQc+uCp7tZYO9hUbPOIrGzlNxZXdkcByBqvvU7bKkcIysbz2Q3hTkHRL9RdFtW
         bQLSVoSxUxh26pCElvbABa3YH4XMzNoc0KeuNcWTA4icYxHb5hHxNi1nJBo3p6DXYe3/
         x1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=dM074y++lE+8ycfGWmkuR8//9HdPqcSHLfhb3QYeN40=;
        b=q2mVHoP5Edcmlh9IyrH4EHWF2Z+lVlRiMaHn9YuSsFuyaHmbMzMV19j/BBYLSl8rT8
         Yd6rNiekDPOc/YjQ+TVZ3P1AZghKKOCALLPakad7fpWaEzZbzF1tBFRmyCzV0jLN31Wf
         gqhugCu7owhodOkhdhaNiQFriRpo4c2cWpBGe+qahqlKST5mSEPNKp2LP/O+LROGfuSu
         jWJv6TiSC2AFvr8KlldhMARo9cPhZqgIsgHmICVP186J/zmDpv7UQDP3D1g7yvoQLTGb
         JSNQvpBHfvVN/gNcXYbrUjiuK1PhimIfsnk27UtpUAoUmrzVByrSawaJeP2REV3Gn/3p
         uamQ==
X-Gm-Message-State: AOAM533NW8FfO3dsnzY/IUMfjAmajAzJRxqrsqOe86pc/QY6M+dnhKkx
	sppWINhJnjLROYQdhjuYAOg=
X-Google-Smtp-Source: ABdhPJyoXtUr+pUjqFCmRuG4VkqqOnxm94iHyfw2sUdXDaVekhD8AYmCsukNZE8takZb7s9uWK5DwA==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id s5-20020a056a00194500b0044ca95535eamr18709447pfk.85.1633842371256;
        Sat, 09 Oct 2021 22:06:11 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id i2sm3548309pfa.34.2021.10.09.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 22:06:10 -0700 (PDT)
Date: Sun, 10 Oct 2021 10:36:05 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com,
	saurav.girepunje@gmail.com, insafonov@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return statement.
Message-ID: <YWJ0vSrgsiKK7suE@user>
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

ChangeLog V2:
	-Add goto out after the memcpy for no error case return with
	 ret only. Free is not required on no error case.

ChangeLog V1:
	-Remove the unneeded and redundant check of variable on
	 goto out.
	-Simplify the return using multiple goto label to avoid
	 unneeded check.

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 0868f56e2979..ae9579dc0848 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2312,7 +2312,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
 	mon_wdev = rtw_zmalloc(sizeof(struct wireless_dev));
 	if (!mon_wdev) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_zmalloc;
 	}

 	mon_wdev->wiphy = padapter->rtw_wdev->wiphy;
@@ -2322,23 +2322,21 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str

 	ret = cfg80211_register_netdevice(mon_ndev);
 	if (ret) {
-		goto out;
+		goto err_register;
 	}

 	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
 	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ+1);
+	goto out;

-out:
-	if (ret && mon_wdev) {
-		kfree(mon_wdev);
-		mon_wdev = NULL;
-	}
-
-	if (ret && mon_ndev) {
-		free_netdev(mon_ndev);
-		*ndev = mon_ndev = NULL;
-	}
+err_register:
+	kfree(mon_wdev);
+	mon_wdev = NULL;

+err_zmalloc:
+	free_netdev(mon_ndev);
+	*ndev = mon_ndev = NULL;
+out:
 	return ret;
 }

--
2.32.0

