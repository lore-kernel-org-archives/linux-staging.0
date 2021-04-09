Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CC6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:02:05 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id e14so7706900ejz.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJ8/v9wK24aS5UXikGd6e9KbYisMB01d5v8N2b/3U7A=;
        b=VAqidPpx2T2vRO2DcUlQUj3c21p45h+CAtoufrQ5nER7ogfjgDWILOUiXDZvOUYen0
         o/Zbl5FYTjeZXiOibRJKxHooKLhMMqWIlgof4nYPfU5nIm4S6o4kte0cDcnFbqTBRMjQ
         eKHlQHQyPo4k1mn65R+kJwDTSuBEJCrie7Psqm13wdLyGe4dahPYr103HN2LQCQrtSu4
         ISQTC1Qf+7jye5uGGhP06pqBKgXAYU+DI2xX6hzhMjkYMc+5C6+RXj1OwyaXvailpkGR
         ymEyz7daFwqLbO+NNivV7WGPVO9pM9x5D5QLNxpCSw88QjzwDKbl2wIK70kk3uls9HPq
         8j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJ8/v9wK24aS5UXikGd6e9KbYisMB01d5v8N2b/3U7A=;
        b=L31AoyjxwQ493PLdd3w0dgrYj/oHI6xfRxdk/ib80GHGZhiUlwgeCcKNUEAMMlw9IK
         5CFnTMFQU7mPV6sCzsE31JjsGxFxiZajThRdQaGj+CAwE29dR1Gw6smZd1MN32lrnVND
         +bhZS16HzjY3bXH3SGwjUQo7hKdZOu57zRZA3M1THbhDb4Lc7JRIbtKNEl7Dzp2iGFYZ
         f0dDLLpXV6uxDQzT9RhOLnuepoIPklGautvlStsxyf/4Rxjnjavyl8sKeHfV4fA6ZcTT
         89E4JWnsOPv06FIJzfMu46iNTqtDwMZ4Lh/BRqJMONgp4ysuJUb4Q3QETZtidFFyhT/B
         Oexw==
X-Gm-Message-State: AOAM532IJJMYlRX9AKMfCxWzJuiyNfvkRzMVbkoU0KvEGkN040Ce+KO5
	6huHLKeseZ8hhacW0vuaZHo=
X-Google-Smtp-Source: ABdhPJw+HXVISIBTqmrtllvm15Bx2krjOzP8ZfiDyNRia6+AfSfgTH9kDkIOXMihRQXgcZONw/Pz1A==
X-Received: by 2002:a17:906:7016:: with SMTP id n22mr6102564ejj.23.1617962524251;
        Fri, 09 Apr 2021 03:02:04 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id g20sm1137983edb.7.2021.04.09.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:02:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 10/11] staging: rtl8723bs: remove unused variable in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:38 +0200
Message-Id: <6211c4177a9ef1e677987c9ebac445df08605f40.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix following kernel test robot warning:

drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:
In function ‘rtw_wx_set_mlme’:
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:1128:6:
warning: variable ‘reason’ set but
	not used [-Wunused-but-set-variable]
  u16 reason;
      ^~~~~~

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 0ff6fbbb4e4f..6f52b8fb0d6e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1125,7 +1125,6 @@ static int rtw_wx_set_mlme(struct net_device *dev,
 			     union iwreq_data *wrqu, char *extra)
 {
 	int ret = 0;
-	u16 reason;
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct iw_mlme *mlme = (struct iw_mlme *)extra;
 
@@ -1133,8 +1132,6 @@ static int rtw_wx_set_mlme(struct net_device *dev,
 	if (mlme == NULL)
 		return -1;
 
-	reason = mlme->reason_code;
-
 	switch (mlme->cmd) {
 	case IW_MLME_DEAUTH:
 		if (!rtw_set_802_11_disassociate(padapter))
-- 
2.20.1

