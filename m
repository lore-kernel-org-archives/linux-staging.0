Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76B2C80
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 12:23:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id p8so2085511pgh.11
        for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 04:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICjiJxg8C+g4r7bRxmTWtfH1V205tPAs91OzeGTMB0o=;
        b=oE7e/Ez8PuhpqUOmgY8y8n8H18d/9AOKOUA+lRKb4ECNHZoomxg+DmEt+K/QLYkefW
         oao3FjgPP2+jwvF5AvpgVyckBXTeWPGxEx6YZ/ZOtr1hRQZ9dVM3LK7O1hBTC1D1VZRi
         QCmZHjtU7+MRguqFxG+HPV4UMS3X1OatVS/ZJ571eUVP5TaJlkGWedIsZdJcwFIjwc9I
         JAuatwUpZfEkI5fO0y39i24SJgbS7gqFMKxEb+tN2R+D98ZP+dEU6fHOq4SsI6GcS+ek
         uDBf1+HVK9FW9l8gLzZ4y83rtshx7gE12a/WMcOhNUrKLiA6iYZVzO+Os8HVWWJLVvIk
         ANhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICjiJxg8C+g4r7bRxmTWtfH1V205tPAs91OzeGTMB0o=;
        b=vrBKCj0hslsobIgQthrTWaehoy/ROHdTK2ru+xap5gWq1Zosv0S0PxF02bjBxMqkkf
         OaUod6Md2Sd9rH1Zg6IL/iA06rPGMP2sr6GjNTvZuAGvveK2CIYPbUcIusBaN+W8YK4K
         v9d2dFMK6nTwcM9uZwqYusc4gtn6XF9/3mawJalnHI7oEsE3XRjYq0GMsSIlb4bc/x54
         EGj4BUUaOBs8vbGPVp/1RUjHcBPFRRnfQXXJMmXMKJnsGZHSU+2TUibvhuvOuQwqXXjW
         7e2e/Ld+JzMl2143jvQQBDqK4vCQs1lEnQmM5Pe5PsgtvfJ6zpw4GepViIT1QnlKK8Ug
         CJOg==
X-Gm-Message-State: AOAM533+BYkXPvIIjxsOJgzd5DCewrwEUi/mIQGjDF2nyn/TANkr1Hlj
	wvJX2Nra+nLgRPgokVXS7dU=
X-Google-Smtp-Source: ABdhPJzWt7uGwKtCc3HoW9uZIS0hlPbteC2x/QfLAq4PWkqJYHwyIDi15xscrg/aA5e/2jox/GrRyA==
X-Received: by 2002:a05:6a00:2443:b0:44e:ec:f388 with SMTP id d3-20020a056a00244300b0044e00ecf388mr15870536pfj.7.1636546990802;
        Wed, 10 Nov 2021 04:23:10 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id fw21sm5432821pjb.25.2021.11.10.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 04:23:10 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: r8188eu: remove unneeded variable
Date: Wed, 10 Nov 2021 12:22:57 +0000
Message-Id: <20211110122257.151666-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck review:
./drivers/staging/r8188eu/os_dep/ioctl_linux.c: 1388: 10-13:
Unneeded variable  ret. Return 0

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 51f46696a593..8ee1d37110e1 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1385,7 +1385,7 @@ static int rtw_wx_get_essid(struct net_device *dev,
 			      struct iw_request_info *a,
 			      union iwreq_data *wrqu, char *extra)
 {
-	u32 len, ret = 0;
+	u32 len;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex  *pcur_bss = &pmlmepriv->cur_network.network;
@@ -1401,7 +1401,7 @@ static int rtw_wx_get_essid(struct net_device *dev,
 	wrqu->essid.length = len;
 	wrqu->essid.flags = 1;
 
-	return ret;
+	return 0;
 }
 
 static int rtw_wx_set_rate(struct net_device *dev,
-- 
2.25.1

