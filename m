Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C172F80
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 14:46:04 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id s20so15149977plr.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2xFujiKNAg6k8WiwS+GsUKGoyhfviAT6MrFMuV7g0VY=;
        b=W9bX/yQROiVEU3xK/9vtl2mZLT98Kf4hlhcJHT17XauZB0OobUBtWOaqq8wJa1NlXQ
         ib1BezYVzqVtSsChKSGdWHq1fNK9XeMcnvEdY+Ol//OwKa6dqE/gqrJ2O3UkY7ydHHzd
         4rnD+QGh3SAnIj/tzAFpm+hitGY0bug/yVgHKumed7qHGCmP6KOhxV1S1ecFZMNmDvjV
         sIZ5Suh9mvggueaJ8s+V8VVdClx1yiuxnqohMQuqlQRarT9y6RioOa7u7lL0GVK/P9/e
         yrzjO1nMMmMMz/+wH0L1mY7OVQ8k1SEDilBi34w5HTlOtAd5C7CsOvmcRKUbeXZ8+6Xo
         6jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2xFujiKNAg6k8WiwS+GsUKGoyhfviAT6MrFMuV7g0VY=;
        b=Slrv4rU0d1/TKN3TiMahJbhXG9K2QrqHm9QMpbtanPSs4C7aGt/n1xuTgPHBpotng0
         me6b66QneIPCPvaNMZMbixPqtRyTOE5F1el0zY5buXuRfmHaTEP9euXmC2HkaJU0cKBe
         mLbrMFfiK365yOBiz1NLb46ZYIGXwdYxp/uhCxO7i9ydSSKS8Q7wU9FqEKUXldCLdqro
         UDJtEgxWfpmXXotqxCNk5fdc56faQzFUnUXaEqaoFRqkyTBsCgahZFsXB3LdldYy/PSG
         z3rW8lkHMqmkmZPeD8Q/r7o7MSX0gzTTVAKBL9Sj9s0zvF+3gO9ogkW7IMMCczBQGdYy
         7BBQ==
X-Gm-Message-State: AOAM530Z9mXK7/GUCTHoouV63N4TT72ZMyl35nsn0odl/u6bm/X1e1W8
	RHRJHY3iJJfH3Sc/nlGwv8U=
X-Google-Smtp-Source: ABdhPJxtXvWCa9hLb5LLDNJ/OtEomusxQ80BJn1FFpa3wF54twM45iN+8HfzeIfYVJngMdxspzrk0Q==
X-Received: by 2002:a17:90b:3686:: with SMTP id mj6mr5330388pjb.116.1619534763867;
        Tue, 27 Apr 2021 07:46:03 -0700 (PDT)
Received: from ashish ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id o4sm2838199pfk.15.2021.04.27.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 07:46:02 -0700 (PDT)
Date: Tue, 27 Apr 2021 14:45:56 +0000
From: Ashish Kalra <eashishkalra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: eashishkalra@gmail.com
Subject: [PATCH v2] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces) warningJoe Perches <joe@perches.com>,
Message-ID: <20210427144556.GA19024@ashish>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Abheek Dhawan <adawesomeguy222@gmail.com>,
Johannes Weiner <hannes@cmpxchg.org>,
Romain Perier <romain.perier@gmail.com>,
Waiman Long <longman@redhat.com>,
Allen Pais <apais@linux.microsoft.com>,
Ivan Safonov <insafonov@gmail.com>,
linux-staging@lists.linux.dev,
linux-kernel@vger.kernel.org
Upon running sparse, "warning: incorrect type in argument 1 (different
address spaces) is brought to notice for this file.let's correct data type for
variable data adding __user to make it cleaner and silence the Sparse
warning. This is version 2 of the patch, version 1 can be found at
https://lkml.org/lkml/2021/4/20/203

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---
 drivers/staging/wlan-ng/p80211ioctl.h  | 2 +-
 drivers/staging/wlan-ng/p80211netdev.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211ioctl.h b/drivers/staging/wlan-ng/p80211ioctl.h
index ed65ac57a..77e8d2913 100644
--- a/drivers/staging/wlan-ng/p80211ioctl.h
+++ b/drivers/staging/wlan-ng/p80211ioctl.h
@@ -81,7 +81,7 @@
 
 struct p80211ioctl_req {
 	char name[WLAN_DEVNAMELEN_MAX];
-	caddr_t data;
+	char __user *data;
 	u32 magic;
 	u16 len;
 	u32 result;
diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 70570e8a5..dfb2d2832 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -569,7 +569,7 @@ static int p80211knetdev_do_ioctl(struct net_device *dev,
 		goto bail;
 	}
 
-	msgbuf = memdup_user((void __user *)req->data, req->len);
+	msgbuf = memdup_user(req->data, req->len);
 	if (IS_ERR(msgbuf)) {
 		result = PTR_ERR(msgbuf);
 		goto bail;
@@ -579,7 +579,7 @@ static int p80211knetdev_do_ioctl(struct net_device *dev,
 
 	if (result == 0) {
 		if (copy_to_user
-		    ((void __user *)req->data, msgbuf, req->len)) {
+		    (req->data, msgbuf, req->len)) {
 			result = -EFAULT;
 		}
 	}
-- 
2.25.1

