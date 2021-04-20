Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC171
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 09:01:49 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id h20so19331235plr.4
        for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nUTxD83tk99lAvG8V7zJLQuPHa5YvvReXL8ln/DNe9Y=;
        b=UXB94sY2D5CrMsl/iyK72EuZFmC2BeVYULg6Jqcf1+ZBz65O7ld1bEnRlB27uBFlg7
         WrlJCEIHwR6kfZQBU8v42GlPUDNkoxZ4OduJbGFNz1DLGBld7Tg/mAGBKGjaOfv7DsAe
         ZGiIw9KvjY8XTElYID/+3+iYRz4fqLopaveo3Hzshp00TDPjMaV2BuFFypHt6o4aRkz1
         McAGrnGAbP81yu1bxXPDHQNnrKUGwz2NXCk5OXhMr31PALMwZ9z8HLRRPTmWXmxQLHuj
         kDQ4DXfv4ONi06CkLxJND+i5uqln2GJk8tzrfD0E/TAmoohjeKBMvfQJCQfkgLXx8I9I
         qYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nUTxD83tk99lAvG8V7zJLQuPHa5YvvReXL8ln/DNe9Y=;
        b=CEic2Rr67xD1FJeCHPDQFMUUN3ayzTcR5MetodV/J9V72zMNlg1KvcKZ7Mq6FCHOTT
         bnLA3yIOEpj0zxRQZ5bHLM2PPcYX+aQlHUp9oXqbjYJGUrXi6An1EeLYjFZzw9CM9R/s
         3qkax7a/enjS1LOMu3aKFCro2S3/M1OSDGpn5aIqevo5Xs3EVG+U86ecL1yRIlhegMTS
         D7lVgHdtE2Wux9wgVNHrow7pOGw3RqpxmOR/B8KDeTARmYjerbi/95PV4IAluctLFCY5
         M+0D2b9LZjJMFRcOxd9j4QFTFJpnT+5gnkqvCZJMdzYJ7aQQapwoS55eFh9SK8pPqxz4
         RZJg==
X-Gm-Message-State: AOAM532UV1qT+FxWwBkBT45BQ2JzrF4SsDRMKtc3iCcvEZ9pf45KKA2r
	XTrQokAIAjc8tAJPRcPh1W8=
X-Google-Smtp-Source: ABdhPJxF52UkL+Rb6yGN0+lwvAFPPmWOvFjz9PeYVIProM8YegqdIpLfmPnMRbD23utLBh+ZtfEk8g==
X-Received: by 2002:a17:90b:4b86:: with SMTP id lr6mr3872498pjb.77.1618909309084;
        Tue, 20 Apr 2021 02:01:49 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id n20sm14733914pgv.15.2021.04.20.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 02:01:48 -0700 (PDT)
Date: Tue, 20 Apr 2021 14:31:42 +0530
From: Ashish Kalra <eashishkalra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Ashish Kalra <eashishkalra@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: eashishkalra@gmail.com
Subject: [PATCH] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces) warning
Message-ID: <20210420090142.GA4086@ashish-NUC8i5BEH>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Upon running sparse, "warning: incorrect type in argument 1 (different address spaces)
is brought to notice for this file.let's add correct typecast to make it cleaner and
silence the Sparse warning.

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 6f9666dc0277..70570e8a5ad2 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -569,7 +569,7 @@ static int p80211knetdev_do_ioctl(struct net_device *dev,
 		goto bail;
 	}
 
-	msgbuf = memdup_user(req->data, req->len);
+	msgbuf = memdup_user((void __user *)req->data, req->len);
 	if (IS_ERR(msgbuf)) {
 		result = PTR_ERR(msgbuf);
 		goto bail;
-- 
2.25.1

