Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459F71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 16:58:52 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id s14so24418314pjl.5
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=1AGNuGHLiEZNEotvrW58K2H0R4feS2Mkobtfjgal6GU=;
        b=fp3frHUFgW560Gvtc++SA6hXUnivhNELQJwkkzBLrc4kWLEbnNc7rEWa1jhwCb8Qk/
         mTdkMOF4iACKWRVyjtoHayCy0lp/hy/Q/gy10W3kvqRCSdMVYVQxTOFco03UjLDuFhtq
         1FYRsqEGElRiPsZBC2wG1pZ5Fqt5HgHgbCHH41aZyUCBDoI8OWRRKsfWYeyGK/PLdU5j
         uRP0GfNLNpLC7pAmrwN9dR5x2zKwtMs/zT8cnJXt341ReeM078MBOf2U3aMVkr/qu6h3
         Jbokw9Skat/wThbVnw6tTplxs5AKdZONrxvu3WMBlBRqi+z3rU0s4VVx0RM4KDNAHc7M
         gp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=1AGNuGHLiEZNEotvrW58K2H0R4feS2Mkobtfjgal6GU=;
        b=BGBp5ssBK8rh9Bbij01MwxHVXEnZK7+IKmEbQoLr8eJ9Y7T0DD0UXsFo4KBbhxNdv/
         zUy/478avUT1VhaSGNyJ8P1w05j4R+k5W2gtAaaijd2TbEEFXiDm6+B8YmiaIbrw8q7t
         NsKyV54Ao0RGOkTxdS59kbw2GUC5hP5/67htk6H4VxctmO+QTKtwq/aKhv1w1rVQkBc1
         V1Q9hjGZd9S/FdHydcC2auB8OUQR3tgldupIFQ3ZrvcCzu8lM4XiAhQr5X9GVpF1rMY2
         u+uhpqcrNYqraOJXPity8kS/ZKX/OKb4EmwszKW+zqzF9u1xtBCU0dovRipOfcfyxOyM
         NJFA==
X-Gm-Message-State: AOAM530B66W//rMDvH/rwF/iN0kl4jKX/mN2cB/sc/8R0Wo9j6Whv0yb
	QiuDI1mHvhto22UCEMF78aI=
X-Google-Smtp-Source: ABdhPJx2oPd9GXcOgE+fgMaSbmoib0o3LyMBDpfz8ri4R+tmB4CUOlFF7ojgEOx6CGp6REYG0p49ow==
X-Received: by 2002:a17:90a:3f08:: with SMTP id l8mr5898720pjc.136.1619542731876;
        Tue, 27 Apr 2021 09:58:51 -0700 (PDT)
Received: from ashish ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id z17sm2840745pfe.181.2021.04.27.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 09:58:48 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:58:44 +0000
From: Ashish Kalra <eashishkalra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ashish Kalra <eashishkalra@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces)
Message-ID: <20210427165844.GA35857@ashish>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Corrected data type for variable data adding __user to make it cleaner and silence the Sparse warning. This is version 2 of patch, version 1 can be found at https://lore.kernel.org/linux-staging/20210420090142.GA4086@ashish-NUC8i5BEH/

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---

Changes from v1: removed type casting of (void __user *) for req->data and corrected type for data to include __user
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

