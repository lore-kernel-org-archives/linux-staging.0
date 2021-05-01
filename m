Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4032F80
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 13:43:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p17so422186plf.12
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=SKQN4qrkVF+YMQJBQev8dGty0Fkt2Rp9SQ2c3egCWA8=;
        b=uvkYbTzpYuoli3HZ+PZm4ilOAZrRUyvSW/9Ad+MjxojLz4i+Qq7LKOU9hBhAtfJARZ
         m8dlyFiniaUvuSZzIuQ7iyEGORIWZj8kqhhAJJryRB9HOsoM3iHpKfkt2Cv6bbLdvD3Z
         JmLc/MbBXtlYghhFvfQgO9crOITjcT947rEJXA5b7HrQ0PukboR5CXzcfzSWu5c33W2H
         u7BRPEVfsGOd7N9MC94xIQ7qCXaoQjLbQrAqcRrlYjUzeTaRSERzd7i45SkOSUENVA3S
         9mfnbQwRq3kXzVuOC4eSAmuN888RjGlz/NS3uf4g5rQ1IfSugj5NwN3y8cS0rDS6aNX0
         o+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=SKQN4qrkVF+YMQJBQev8dGty0Fkt2Rp9SQ2c3egCWA8=;
        b=sWrZzJljHjwk8xbfuQgIQ4fO7iCRHLcUUBjqOF/E4wedpYYE7Tcm3m0gC05ChyVg3y
         oBlZgsaR7e3TrbcPUH8ZKNjjYWrFszLbwRMGAuLv5wlkk3y/D5LfYR1PCVZkHNjqlr1z
         oj7L9bLXNXq65YPbpMo2AIows6FYwF6NQ6KdGZKGT9uIs7JIKn+aEK6SQcdEMnOAMbQ7
         OxtS8w/xKJ86Lu/GOqCpVAzzLzeQ/aQ3wdTB7eBJdBIPK825sLOX30ERlKy68XhmczUN
         xKqwrLu/wZtYDFEFvclj8pcN5nsjIoSx7U5g4+XVY98Ola5mkVtzjC9VDPngsMeV6Sbc
         Y9JA==
X-Gm-Message-State: AOAM533ZrRutGeT2rQFs1zyaDnmUTjS6OkxHYSMGcN36y9gDnmThYQRr
	Q/QNjbQq0oytlaOeUGHL7RI=
X-Google-Smtp-Source: ABdhPJwI6RG60fqaAajwjGitgkGrtw4farL4wqGiuR7bSp9A8LNWxCY8RCNt1OB5532O75dJbosUug==
X-Received: by 2002:a17:90b:194:: with SMTP id t20mr10876475pjs.83.1619876588248;
        Sat, 01 May 2021 06:43:08 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.225.134])
        by smtp.gmail.com with ESMTPSA id z25sm4609482pfr.120.2021.05.01.06.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 06:43:07 -0700 (PDT)
Date: Sat, 1 May 2021 19:13:00 +0530
From: Ashish Kalra <eashishkalra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ashish Kalra <eashishkalra@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>, Michal Hocko <mhocko@suse.com>,
	David Howells <dhowells@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Allen Pais <apais@linux.microsoft.com>,
	Pritthijit Nath <pritthijit.nath@icloud.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces)
Message-ID: <YI1a5NS+UyTNTwIJ@ashish-NUC8i5BEH>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently p80211knetdev_do_ioctl use type casting to req->data to prevent sparse warning while 
calling memdup_user, instead of type casting it here, its better to change data type for data 
inside p80211ioctl_req to include __user.

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---

Changes from v2:
Corrected line wrap in change log comments

Changes from v1:
removed type casting of (void __user *) for req->data and corrected type for data to include __user.

 drivers/staging/wlan-ng/p80211ioctl.h  | 2 +-
 drivers/staging/wlan-ng/p80211netdev.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211ioctl.h b/drivers/staging/wlan-ng/p80211ioctl.h
index ed65ac57adbe..77e8d2913b76 100644
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
index 70570e8a5ad2..dfb2d2832830 100644
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
2.30.2

