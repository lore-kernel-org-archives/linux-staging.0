Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084D1118
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z2so1984508edc.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ey0K4wQnhegdgAeyU9dIk00TcYC9S5EHVHT72Ibu5sU=;
        b=oADDvJMm0G3cTIlJG7zJ3VyZ7WisOx61oK8b5QI5OcqUY9fdTFAky58nZ3d4UmX3x+
         42OepF39qhDu6/WTH9IdodwDYDVQvYzybbQjNP+Yyj8EY9FRm920lb7jlJDrpAc2RYiq
         O3zD1OH6ON1sdMnbZdzVIUZrvYjrjRcmlQIV3JqjGDiB055mNJXEZ2xRudpTCstpJfyp
         oHVjERJDdlTN3pdtCXepRsapJKpyC0Zs95jVuDCGJ5EgZAeJB2zaBXTex7m+LQs/CuxM
         OqXvC1OY3/aqNOSG9fiE0hFSZ3ACcxuP+vIasFVcCoPB3zu1UKtgYUnVG11F1GCuaawA
         eh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ey0K4wQnhegdgAeyU9dIk00TcYC9S5EHVHT72Ibu5sU=;
        b=6QgDNmmMx8n8BiyC0h6/jEtLvLPMsmlx3onXMVwDifMJxgkMGE+Yf8GuipFvDqfHH4
         bSRbpL/oulSLGfC5sj5jprAU7hQlY3fsrE/qwxlqfdnXWePF+PxqqJYsaNFmqn7xwNa0
         72J4zGkAbFCNar0LJo/gn/ysHgfuXzronsXXiRA2hKxk73SRvAxJPHew7+cLWsYqXowd
         emAszQQXeGugu9M88DnVo9H0PkzCU4DCfWEajiD3E+tBMCG6Jbch3+KBjRdKWRSqg/Lo
         4vftV/GuzXVytUj0g+GeMe95KK2XhDL0TTXRfa61LHheLzcbGR6Al8OHQ8thZXPK3tmb
         U4mQ==
X-Gm-Message-State: ACgBeo3MSav0Yh7rHpSOoN2L1bvymqXVHOvR0p3JR+jOvjd1C8cq67kS
	OIHX4y9VTUyq2Nh9lS/vdJWJND6EToAVqg==
X-Google-Smtp-Source: AA6agR5R1BncknwGK1xi0WV/APgOv2OQIdbs7lZp4U4k5D5NiNrxABPmB9Vzieel1NVMX8gt4bE47g==
X-Received: by 2002:a05:6402:34c6:b0:43d:8cea:76c0 with SMTP id w6-20020a05640234c600b0043d8cea76c0mr33115562edc.268.1662112356261;
        Fri, 02 Sep 2022 02:52:36 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:35 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/10] staging: rtl8723bs: remove rtw_change_ifname
Date: Fri,  2 Sep 2022 11:51:53 +0200
Message-Id: <975cd771e5b6573b84b31690895d140cbdaeb5e2.1662111798.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete function rtw_change_ifname because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h |  2 -
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 50 -------------------
 2 files changed, 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0bbbdebdf157..bb4650f0b297 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -493,8 +493,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
 
 #include <rtw_btcoex.h>
 
-int rtw_change_ifname(struct adapter *padapter, const char *ifname);
-
 extern char *rtw_initmac;
 extern int rtw_mc2u_disable;
 extern int rtw_ht_enable;
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4fbfa75c05d7..f09c1324c39c 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -108,56 +108,6 @@ void rtw_free_netdev(struct net_device *netdev)
 	return;
 }
 
-int rtw_change_ifname(struct adapter *padapter, const char *ifname)
-{
-	struct net_device *pnetdev;
-	struct net_device *cur_pnetdev;
-	struct rereg_nd_name_data *rereg_priv;
-	int ret;
-
-	if (!padapter)
-		goto error;
-
-	cur_pnetdev = padapter->pnetdev;
-	rereg_priv = &padapter->rereg_nd_name_priv;
-
-	/* free the old_pnetdev */
-	if (rereg_priv->old_pnetdev) {
-		free_netdev(rereg_priv->old_pnetdev);
-		rereg_priv->old_pnetdev = NULL;
-	}
-
-	if (!rtnl_is_locked())
-		unregister_netdev(cur_pnetdev);
-	else
-		unregister_netdevice(cur_pnetdev);
-
-	rereg_priv->old_pnetdev = cur_pnetdev;
-
-	pnetdev = rtw_init_netdev(padapter);
-	if (!pnetdev)
-		goto error;
-
-	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(adapter_to_dvobj(padapter)));
-
-	rtw_init_netdev_name(pnetdev, ifname);
-
-	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
-
-	if (!rtnl_is_locked())
-		ret = register_netdev(pnetdev);
-	else
-		ret = register_netdevice(pnetdev);
-
-	if (ret != 0)
-		goto error;
-
-	return 0;
-
-error:
-	return -1;
-}
-
 void rtw_buf_free(u8 **buf, u32 *buf_len)
 {
 	if (!buf || !buf_len)
-- 
2.25.1

