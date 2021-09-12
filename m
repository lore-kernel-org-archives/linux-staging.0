Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499C3FCF
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 17:16:19 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so4957446pjr.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lGLbYa4J/EZXe/PrXpmfquP6UQajacndX8DduSJkb9I=;
        b=YKgvivWauINumj3NILs+WLOWbIwfwmfzzsGXuXDnJPQqYcnSxtH4EOfNB/Lk2lXbe7
         MfsY+o63JXNAugUbkqfy4CpTFV/TuJz9A59QUfUqJ9MANUKEDj48UIYCUZRIec1sqA0J
         KOYXmeHxJIc/GPa1oW2K/Crsn5yR0N8N9c8GOsAJyWqWGDK0YenCCLSW4j9Tp1QZD1n6
         NWpCr+1z145CftO0/VHxTxJlb6vknLt+gCIjvklTWqhsnBKalWIE15sJaWjgVTbvWRW6
         wBbylM7CEU9azHaU7HVIG3KWwtPVJ/DtLEz/IajS+8IaZp07nKWsraFIeNjxA8Mz0w00
         Xx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=lGLbYa4J/EZXe/PrXpmfquP6UQajacndX8DduSJkb9I=;
        b=dsjlS6Yt5yT6QXukLjoVhNtxetbR3ozCxIxjVI+xKuhXA8QDH2sOKjNvI+BPr1Wm2R
         Om2wdq+eEnrII43/ivVwRMN9hSBO00k5heIRB1xtcuM2yNPrX5IkqYTwih3YkwT8v6y0
         ztbzwkWSFIKAOWmJL3B8wx2ls2tC7l4vo00naf38XqtFi7qjUbRDImpMMBsuEBs/lsPS
         lQ8lxJn0kBELRdCRdMq3SfdTI0yrBxA+UjqCLrfFmtWJcibfGRfdo36H4UigfRJZO9uE
         8Md+m0d8pcDQ8HrpdSsRxRBpqJA5aSg0Q/vjPWZNEWmN2eFWGANUuyHoUykUHgdLoWBa
         ITzQ==
X-Gm-Message-State: AOAM532xjiwkgqyxdjK/OX4zf2Z+gAcF0Tv64T/omq7a/Dgi2oiYXhs5
	UM7a6CZw1jSCF5BotmZJSJw=
X-Google-Smtp-Source: ABdhPJylQoKi0ZxmxC2e0StkTbXR+jRJ+5OR03VmEzNksdJmKqx5Vc7/15HSo7BWhZPgjFpIGkvhHA==
X-Received: by 2002:a17:902:b909:b0:13a:2d8e:12bc with SMTP id bf9-20020a170902b90900b0013a2d8e12bcmr6839890plb.6.1631466979027;
        Sun, 12 Sep 2021 10:16:19 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id d3sm4395494pjc.49.2021.09.12.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 10:16:18 -0700 (PDT)
Date: Sun, 12 Sep 2021 22:46:12 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, martin@kaiser.cx,
	saurav.girepunje@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: remove unused function
 rtw_android_priv_cmd
Message-ID: <YT413EaBXqIqMttS@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused function rtw_android_priv_cmd.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_android.h |   1 -
 drivers/staging/r8188eu/os_dep/rtw_android.c  | 138 ------------------
 2 files changed, 139 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_android.h b/drivers/staging/r8188eu/include/rtw_android.h
index f60cf1c82984..86e3ac5f7955 100644
--- a/drivers/staging/r8188eu/include/rtw_android.h
+++ b/drivers/staging/r8188eu/include/rtw_android.h
@@ -42,6 +42,5 @@ enum ANDROID_WIFI_CMD {
 };

 int rtw_android_cmdstr_to_num(char *cmdstr);
-int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd);

 #endif /* __RTW_ANDROID_H__ */
diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
index 010d529c8982..bd76177d60f9 100644
--- a/drivers/staging/r8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
@@ -133,141 +133,3 @@ static int rtw_android_set_block(struct net_device *net, char *command,
 	return 0;
 }

-int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
-{
-	int ret = 0;
-	char *command = NULL;
-	int cmd_num;
-	int bytes_written = 0;
-	struct android_wifi_priv_cmd priv_cmd;
-
-	if (!ifr->ifr_data) {
-		ret = -EINVAL;
-		goto exit;
-	}
-	if (copy_from_user(&priv_cmd, ifr->ifr_data,
-			   sizeof(struct android_wifi_priv_cmd))) {
-		ret = -EFAULT;
-		goto exit;
-	}
-	command = kmalloc(priv_cmd.total_len, GFP_KERNEL);
-	if (!command) {
-		DBG_88E("%s: failed to allocate memory\n", __func__);
-		ret = -ENOMEM;
-		goto exit;
-	}
-	if (!access_ok(priv_cmd.buf, priv_cmd.total_len)) {
-		DBG_88E("%s: failed to access memory\n", __func__);
-		ret = -EFAULT;
-		goto exit;
-	}
-	if (copy_from_user(command, (char __user *)priv_cmd.buf,
-			   priv_cmd.total_len)) {
-		ret = -EFAULT;
-		goto exit;
-	}
-	DBG_88E("%s: Android private cmd \"%s\" on %s\n",
-		__func__, command, ifr->ifr_name);
-	cmd_num = rtw_android_cmdstr_to_num(command);
-	switch (cmd_num) {
-	case ANDROID_WIFI_CMD_START:
-		goto response;
-	case ANDROID_WIFI_CMD_SETFWPATH:
-		goto response;
-	}
-	if (!g_wifi_on) {
-		DBG_88E("%s: Ignore private cmd \"%s\" - iface %s is down\n",
-			__func__, command, ifr->ifr_name);
-		ret = 0;
-		goto exit;
-	}
-	switch (cmd_num) {
-	case ANDROID_WIFI_CMD_STOP:
-		break;
-	case ANDROID_WIFI_CMD_SCAN_ACTIVE:
-		break;
-	case ANDROID_WIFI_CMD_SCAN_PASSIVE:
-		break;
-	case ANDROID_WIFI_CMD_RSSI:
-		bytes_written = rtw_android_get_rssi(net, command,
-						     priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_LINKSPEED:
-		bytes_written = rtw_android_get_link_speed(net, command,
-							   priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_MACADDR:
-		bytes_written = rtw_android_get_macaddr(net, command,
-							priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_BLOCK:
-		bytes_written = rtw_android_set_block(net, command,
-						      priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_RXFILTER_START:
-		break;
-	case ANDROID_WIFI_CMD_RXFILTER_STOP:
-		break;
-	case ANDROID_WIFI_CMD_RXFILTER_ADD:
-		break;
-	case ANDROID_WIFI_CMD_RXFILTER_REMOVE:
-		break;
-	case ANDROID_WIFI_CMD_BTCOEXSCAN_START:
-		/* TBD: BTCOEXSCAN-START */
-		break;
-	case ANDROID_WIFI_CMD_BTCOEXSCAN_STOP:
-		/* TBD: BTCOEXSCAN-STOP */
-		break;
-	case ANDROID_WIFI_CMD_BTCOEXMODE:
-		break;
-	case ANDROID_WIFI_CMD_SETSUSPENDOPT:
-		break;
-	case ANDROID_WIFI_CMD_SETBAND:
-		break;
-	case ANDROID_WIFI_CMD_GETBAND:
-		break;
-	case ANDROID_WIFI_CMD_COUNTRY:
-		bytes_written = android_set_cntry(net, command,
-						  priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_P2P_DEV_ADDR:
-		bytes_written = android_get_p2p_addr(net, command,
-						     priv_cmd.total_len);
-		break;
-	case ANDROID_WIFI_CMD_P2P_SET_NOA:
-		break;
-	case ANDROID_WIFI_CMD_P2P_GET_NOA:
-		break;
-	case ANDROID_WIFI_CMD_P2P_SET_PS:
-		break;
-	default:
-		DBG_88E("Unknown PRIVATE command %s - ignored\n", command);
-		snprintf(command, 3, "OK");
-		bytes_written = strlen("OK");
-	}
-
-response:
-	if (bytes_written >= 0) {
-		if ((bytes_written == 0) && (priv_cmd.total_len > 0))
-			command[0] = '\0';
-		if (bytes_written >= priv_cmd.total_len) {
-			DBG_88E("%s: bytes_written = %d\n", __func__,
-				bytes_written);
-			bytes_written = priv_cmd.total_len;
-		} else {
-			bytes_written++;
-		}
-		priv_cmd.used_len = bytes_written;
-		if (copy_to_user((char __user *)priv_cmd.buf, command,
-				 bytes_written)) {
-			DBG_88E("%s: failed to copy data to user buffer\n",
-				__func__);
-			ret = -EFAULT;
-		}
-	} else {
-		ret = bytes_written;
-	}
-exit:
-	kfree(command);
-	return ret;
-}
--
2.32.0

