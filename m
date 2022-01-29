Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D82CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o16-20020a17090aac1000b001b62f629953so6438056pjq.3
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mk12BTSCM2+mq3xJbziWeOLcSVGsDqsbYqmoTpChlQM=;
        b=ae1z82YShCLldmO4lu1B2Nf5vJMnS3IS+SkfIuouT3SGDC0i92Joxo5b9sAR3T4s/u
         xMQnB7RCnrAhj3b3w348Ql6yn3+xLjWBotBRShWZjexpKPhom4EUeL0KzUVgEYDNvEOs
         nB3ZR9IHqdXYBEW1n9kzavhQJ1d5w/swDuzgzEbKXNSAHxpnOgnc39NCuq6MpEzBSsC8
         wogeK7lBFtuV6n+XcsFnuThxAb6IWLH7KNqsi/sQ7g8xYoBQq7M/abJm6srYn9EQTGGm
         K2NE0b96HY6MAN6i6FkP4M3MD+4dtJeikuu0k+8mfscxfj03bmt+rLoBrkX3t7vqprsB
         UEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mk12BTSCM2+mq3xJbziWeOLcSVGsDqsbYqmoTpChlQM=;
        b=WWQGjXny3L0wJGuoYePLcyi9fGjt9zz7kXJcO8D1xqvvyVMQhXfmZpAovKxi9MfCQI
         dYFzqXEYHB6nF/yPv7a2wid9UNHhiZNleIxN3hFBtM3hsmqb2aBDXrMXYeCm0u2oCyDm
         GlIpRMGdtVxVL+TDgcjD387hJLj4xJgQDimFfkxn5bQdyEfmAyrKeFXDLOR2KaU1sbo1
         9Yu2s1V+v31cK9ZqhUUjzD7CqAQ+vqa69q5YeZe7cJ0/DTpzCuKHAvqs5hlAH8Bj6Qoy
         00fVSJ85xUuoAny8MdhJDdylBl6Rf3A+6ODt2y3ONbJ2+8d7+N4HAixCJFtPYeqwTaJn
         mmlQ==
X-Gm-Message-State: AOAM533uFiS++q1S/OMR0fhw4wl9+Y4136dKn6ZFIlM0Ek/pnHOJ+qYv
	6+lYF4tGiiGgwXE5zgCxl3Y=
X-Google-Smtp-Source: ABdhPJzcbwCW28uzSi7lJtVO/GFRCtdb7QsA72O+86uRV+z2LRZ28M2NQj9hsr9czem5ajQi2YT6yA==
X-Received: by 2002:a17:90a:a385:: with SMTP id x5mr17242737pjp.129.1643473935287;
        Sat, 29 Jan 2022 08:32:15 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:14 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/23] staging: r8188eu: convert rtw_p2p_get_peer_devaddr_by_invitation to return void
Date: Sat, 29 Jan 2022 21:58:09 +0530
Message-Id: <06e2dce5de14c1abe457a40ec9ca597a06095437.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_peer_devaddr_by_invitation always returns 0 and it's return
value is not used. Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index dfd19a649803..9ee647de5ba7 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2547,12 +2547,12 @@ static void rtw_p2p_get_peer_devaddr(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_peer_devaddr_by_invitation(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_peer_devaddr_by_invitation(struct net_device *dev,
+						   struct iw_request_info *info,
+						   union iwreq_data *wrqu,
+						   char *extra)
 
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2562,7 +2562,6 @@ static int rtw_p2p_get_peer_devaddr_by_invitation(struct net_device *dev,
 	sprintf(extra, "\nMAC %pM",
 		pwdinfo->p2p_peer_device_addr);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_groupid(struct net_device *dev,
-- 
2.34.1

