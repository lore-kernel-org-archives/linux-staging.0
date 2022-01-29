Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97E2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id z5so8840717plg.8
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hU0AyPSwzXrTCpt2UBSbf+u4PcwXegon4P9WmWniS1g=;
        b=IICEJbqNAWzJcp8cdThF7LoXbzH50La22u0YiOoneBeq2Enxqnv9A7w5vC6xMft6sT
         epjSGYgO5VIHAsFw7ZsX4Qi7teSRkrcCK5UlBeWnFuE528FJLwEBaDmgaLBV2Z49l46F
         RxEH9fNXlEeEDyWBCphfup6jcpxZ1vU0eGZH5i7+cwnGgdFNbKyeN2ZvFPPRt/kk4iK4
         22bYR1hyIopigEelA7qrgOmCoJ4+U4wm436hhHVZfQ+Lv0XuqQkGGYeqQl/0C2fEVmY4
         PQB0aVVtR3f+ZC8huszc32kkrmol2CbLrst3NHaPvmc4aypFCAxFSD1o7ShHlCVSXWIR
         KAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hU0AyPSwzXrTCpt2UBSbf+u4PcwXegon4P9WmWniS1g=;
        b=6o+XCVUyZZ3uatie4hHYkttI8cLC1c7DbthAb99abPo8vLOzWV35wu9TGP6dzSl+t3
         o5QCIWVtYZfowKodLf3KfYsWN84oSZ5+TSly710lbTNXqy7StiVf+fejfYK1fMqxAFtv
         zePnTnlMY8EYusqISczzMV9tm9LDcN/iNgBhBCzyl2GAnW1KsQJ2GALbWGMNfGL/vL6P
         FjEzIXDbUc6rKEHkdGpkNCwRYXehbsNHFRP30CMTRx+56Tsy1HwdswTIyYUi9tuP3uo4
         Va2eW0MWJYh/ZJGi91sI27XqjBoU5J4b9nhDn9CJ2xvJRKCa+Fi8nwu61KEhLaVbbI6w
         ZYyQ==
X-Gm-Message-State: AOAM530G40MXESmuuRasEO+r02+EHO4sPEQrByJsZiezBeIjR7OYpTn2
	I8et7TgCdbz4b0ETJ4RyyhU=
X-Google-Smtp-Source: ABdhPJxwu0xEHWqGbZdvrUpXDJ2Y9bcRKty9vlked20WesWeLW3I0jh3WJseAbC2Rw2R3xTvMFPpxg==
X-Received: by 2002:a17:90b:1e42:: with SMTP id pi2mr15927775pjb.176.1643473923554;
        Sat, 29 Jan 2022 08:32:03 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:03 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/23] staging: r8188eu: convert rtw_p2p_get_role to return void
Date: Sat, 29 Jan 2022 21:58:06 +0530
Message-Id: <dcd4bba9910b172031ccc0f138c78e8471e36d91.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_role always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index ba0f42ca36e3..343b4ad6ce65 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2501,11 +2501,10 @@ static void rtw_p2p_get_req_cm(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_role(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_role(struct net_device *dev,
+			     struct iw_request_info *info,
+			     union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2515,7 +2514,6 @@ static int rtw_p2p_get_role(struct net_device *dev,
 
 	sprintf(extra, "\n\nRole =%.2d\n", rtw_p2p_role(pwdinfo));
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_peer_ifaddr(struct net_device *dev,
-- 
2.34.1

