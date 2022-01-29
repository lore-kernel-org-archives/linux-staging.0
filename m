Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE82CA2
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:05:42 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d18so8852667plg.2
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PnbU93vWGV651EUjlzxYJgD/J8Jnot+F9jtiMaEhyAI=;
        b=DoCu4VSTL/VXy1qaQWua2z8oAd/y6fgGWU7W5ZR8KskvW8xP480BlgXc3FL7fAoc1A
         LKKK5eZ0XC3o/3q2ykRBc30nfyHVbmLcfT0OwIcjFrQ1FfgK/mLyBwoiwlMJ2O/4WDeY
         cuzIcYgZ++sYothW7hU3FUsb6yehknz49JTflbzwmPoKttL/r67dTwcGmiRP2QhmN3ZB
         DMdhY2v6W4ikEqfYad2LIB+2Fw+9O60CiE+DrLZvtw3tWIX7svbZrj2CYX59AsHRaHdO
         xfTbho91ruL2hPmGNjOdQyjIyLwRluI1ihrde2hTA2lX8S5Yw/7O+lToCwUzQee0tVao
         JQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PnbU93vWGV651EUjlzxYJgD/J8Jnot+F9jtiMaEhyAI=;
        b=IjdfNhBuc9SxeFUBdbW2wmOMXoCJrtAr705bZtko3roLqSaue7zA5f2/bEaXx13ZST
         w783MFgMni+BMi5DxY5YYmNX92m05jtSeW946TiB2HjO1vU46b64I2mbF86nVwyW3nOb
         hlSO444IYMpKhMwux005ZeGzHluPss6X1Ogp5g5i3dh5NZni7jeQS/vjeickZloRqQON
         IEhoQ/Y9FkmOXuY614T7oJ2wEWVtJJrzaVJBU3fNwqewfrjdbEJ2ttVEyBksGNwzf97R
         6IGhPlmdngFuVXnIkUpujmwEri2BJL3acwz0a8kzK6oDfbOac7tysnvvApYgXUFmJ4AW
         8rnQ==
X-Gm-Message-State: AOAM532I10jug0oqL+Wt1p2FFsQ2SDoWAKmox0B4xgvfQ2LTXakgWaI/
	YF+2414NznDJoXaspoCLfmc=
X-Google-Smtp-Source: ABdhPJyUB/YePSOX4rrwQOnm1FOUbvi5tDeD6LRqBCNKxaRa588oXCVIUfazXLkuNrGtoVcuJzywPA==
X-Received: by 2002:a17:90b:17c4:: with SMTP id me4mr15556737pjb.243.1643472342592;
        Sat, 29 Jan 2022 08:05:42 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id t9sm5672868pjg.44.2022.01.29.08.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:05:42 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/23] staging: r8188eu: remove unneeded variable in rtw_wx_get_essid
Date: Sat, 29 Jan 2022 21:34:07 +0530
Message-Id: <d0208689dffce91c52afbd5938b2704a8b1b554e.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index b9f9698d70cf..3a60e1f81592 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1383,7 +1383,7 @@ static int rtw_wx_get_essid(struct net_device *dev,
 			      struct iw_request_info *a,
 			      union iwreq_data *wrqu, char *extra)
 {
-	u32 len, ret = 0;
+	u32 len;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex  *pcur_bss = &pmlmepriv->cur_network.network;
@@ -1399,7 +1399,7 @@ static int rtw_wx_get_essid(struct net_device *dev,
 	wrqu->essid.length = len;
 	wrqu->essid.flags = 1;
 
-	return ret;
+	return 0;
 }
 
 static int rtw_wx_set_rate(struct net_device *dev,
-- 
2.34.1

