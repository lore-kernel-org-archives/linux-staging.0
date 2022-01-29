Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77D2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:48 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so13877443pjt.5
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Th8PVyYelZWCsFcO3s4hWSpijYoiPjQX9yudaKFZQco=;
        b=UTdYPZZph8EsAJuRqYnss+oruj9Z7o1I+TKpquPsJv5MGwF93vsHmNWTUr/hutsjJg
         Dge+8mILBYWEOKQMnzqXz8x5W3xIRUdZYk6x0YabTfDtCQAt/ddIpaE+op9XV+fk9MMe
         PER/0j6n9askSdZgwS1tPC/MOWkQe94pMafJMb9vpuJ+0CzxnC6dpOYpDc5cxyNDDqQw
         vwRrVaSvgpxK24Vn2orj2sDPZ2WoIwVARu0kBBkIpCHX7t1cn+eqXonzJY06hzV55Ryu
         MjCsP3/B2y8dvNqpgJxr0D0P6fAp8QIk9BQ3QBatZ00HTvcOx0uHKd+uS/REfV4h33++
         14pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Th8PVyYelZWCsFcO3s4hWSpijYoiPjQX9yudaKFZQco=;
        b=1/DSWvnkzViu2Hu+8Jx8xzC52VwhU8/BdfXhQ6Q076vkdzMAh1cDtbArH/T6ngQIDG
         HzNp0O4616A2sy1P0vwZHflcDudbGNSjTtt1ta8Pv6xZlWDFpCIehQLhl9hd7G5nsssv
         Gt/b+T11EJfxF2YlrJhpPwaF2fqJ0lusDy8lU7wPwluz6Bl9wVq1EzE9eliy/ffCvwt/
         3J7rzc8XRCex9SsNIQtQtDAhT2us5kYxjmc3LNOKxaH9icyKeQE4GYfAED6fgHcvsQM5
         iFSBHMW3Ba1hplGLHdBdsFPT5mwB12WckZVhTlFmYV7Xh1W/5m/49f3d6FLyZ951kKo8
         aMhw==
X-Gm-Message-State: AOAM531YFIpzNuysqY5UpRuZdDsgxOj5do5dVPtt1hriwLrvQyMGrYEy
	dD8QNXsFzb342bMy8CgZveg=
X-Google-Smtp-Source: ABdhPJynPVtFor8dKoPc0tEvfK703tA77lIEm8g7DHSvdjqcOn/m9uN8N6N1EB9qisseLzWkLIjj7w==
X-Received: by 2002:a17:902:758c:: with SMTP id j12mr13491819pll.34.1643473908565;
        Sat, 29 Jan 2022 08:31:48 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:48 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/23] staging: r8188eu: convert rtw_p2p_set_go_nego_ssid to return void
Date: Sat, 29 Jan 2022 21:58:02 +0530
Message-Id: <90e2b3e4ff99131423c11b8f9206916791f742d9.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_set_go_nego_ssid always returns 0 and it's return value is not
used. Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 99c7f9369d2a..c761c06cf6e8 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2308,19 +2308,16 @@ static int rtw_wext_p2p_enable(struct net_device *dev,
 	return ret;
 }
 
-static int rtw_p2p_set_go_nego_ssid(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_set_go_nego_ssid(struct net_device *dev,
+				     struct iw_request_info *info,
+				     union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
 	DBG_88E("[%s] ssid = %s, len = %zu\n", __func__, extra, strlen(extra));
 	memcpy(pwdinfo->nego_ssid, extra, strlen(extra));
 	pwdinfo->nego_ssidlen = strlen(extra);
-
-	return ret;
 }
 
 static int rtw_p2p_set_intent(struct net_device *dev,
-- 
2.34.1

