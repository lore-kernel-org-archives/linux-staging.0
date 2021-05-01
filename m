Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129E42F80
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 13:52:49 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 10so1056741pfl.1
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=1OO8KJegNvuVXl/QR8Ti4ghr+nskjCRbiCGn/om46yw=;
        b=fVcpvgQtOl+z28kPWiCL4UzHRkr7ViZCZuoL7ZEZa8BC4sqYg8RXre03pcFFvyOc1A
         753nGNy2j+nPXpdhI08z6KCNnTBpdtJdP7XJ0GOXD/EprPfx4HkcxLCZwpJoEFzFStrX
         ui8JVxHPb7rL6nnLGFTQ7wcf3Evjgq9IBzx7gysVU+Iow/4nweTsn+4bJjcvYX9uGeuH
         m+ZoMdpcJZE4CdwgpmLhHPSXXg/qB+rxdlabCBIMJ6GWJm3ldeOCROsL7WFs9rpWz9n9
         IriqHHmdy+xA58YBo1MyyfoZwaZPgBHC2mf1vYG+s1p3VhpYTZvG2TtK3nb4oXdldUKq
         goew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=1OO8KJegNvuVXl/QR8Ti4ghr+nskjCRbiCGn/om46yw=;
        b=ss2tYXQMwk1xaWt4AHE63o9SR5e7n2hBvYszdUGcXzb5vOrgSukMLN6o4RH1YDH1/r
         oq5IalzxKuDBMSHGxNpFndd1LFTiTG/nr5io9LxatfwJrQGa1JN+s1g+1kE6AAsHYnQ+
         4EmVtFQgCvWAG0aAinl9WO6QXGpjAxr6m+RZZ3FF0mTSecq+M9B/+6tIZlyS2Kx9y322
         3VsuSNuxN2muDK5/9+WlynHw3m4nhV6I8tycfOyUpk22qVCyRGVrRz6f7N1c7bAfwsS7
         oJxHkuiMGlk2LhgfsyGs65/hRQGcBkJXW+kDmVejbga9Pgv/AfYXEYaNf9vaItGoS30M
         YoGQ==
X-Gm-Message-State: AOAM533K4DKganWYNXNzKXzLQew0Fku5pj5cy/xyT7K/VQ7BQoptMSoC
	90VHUir7hOEgaBy/XqStROg=
X-Google-Smtp-Source: ABdhPJyH7HmM+q1tOPfcMOAJwckq4RxpFuptV/qT+SG5H2MfG3N0fyaWGqY+I8nYXQOvgL+nLOE6gQ==
X-Received: by 2002:a63:f311:: with SMTP id l17mr9215804pgh.405.1619877168329;
        Sat, 01 May 2021 06:52:48 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.225.134])
        by smtp.gmail.com with ESMTPSA id b21sm4762687pji.39.2021.05.01.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 06:52:47 -0700 (PDT)
Date: Sat, 1 May 2021 19:22:41 +0530
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
Subject: [PATCH v4] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces)
Message-ID: <YI1dKdfBKaSh3J8v@ashish-NUC8i5BEH>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently p80211knetdev_do_ioctl use type casting to req->data to prevent
sparse warning while calling memdup_user, instead of type casting it here,
its better to change data type for data inside p80211ioctl_req to include
__user.

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---

Changes from v3:
Corrected line wrap in change log comments and checkpatch warnings

Changes from v2:
Corrected line wrap in change log comments

Changes from v1:
removed type casting of (void __user *) for req->data and corrected type
for data to include __user.

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

