Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DE71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 17:22:46 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id s20so15427507plr.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=4aQcJ05qM8Bj1O99QnqWNUcSrtGTjkQQ9E6tg2L5a0M=;
        b=eh487a0QFxf8+o2uBd5ApLOBCOSWbky45t2rhevKHrsCawD4OZ+fQoTAZyRv/e3W4I
         JsFJdtNsorT5QcFZ3rJof+7apwxKjIJlhsJB1RHpkPwCTSGKsjx8OT5DWuRa8JmoGwdl
         rr04iiji3RNYB86ksvG2rvLmd5ZPkvbDxpBESeaLj4zk79oEzBfLe/eXQwHs/ZxMi+Fy
         KB7JXe6zfygiBuCo6ruGDcsmRUJAPrTvvQbkvUgV914FiUzb+IatXmKSSNvGWbrX5HH5
         C+Zuhyy3iVVbrWXZBVrMtZZJMzv0f1bEbz+ypKoxMlRMO8H0sMPUsueYTl/4UgQNBy3A
         Ti0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=4aQcJ05qM8Bj1O99QnqWNUcSrtGTjkQQ9E6tg2L5a0M=;
        b=ioU6Sulif42GklaOfJA/wreAFH1fDkLbkF3DW2NZQHTGuTWjudDFGvecGf5LPaXATm
         kzWiXWh+CgogIYjkM1jcUyZzPZ+Kl53a4kR4cEebD7DD83iJkjClp6zp2yoG0DXBSuZ5
         EiyrGVev9c8I80HlbIcSjSrd4qzU9pZOje2BpW4X2nNi6ReqSwq54PYLh+lCFf1EZq0/
         oQXpNiS7ceW/JmuwE7L9gpNUSrKf52F0ETyzmEtyY36nlnJIEDOLtOKrqfkB1fQ5YO4y
         OGtxoSVJd+pZuVTSSbiKzXVXoew7g4SWs3yptYTJMZuSvPu+KJNyntjOksV+5Pu+RAQn
         o19Q==
X-Gm-Message-State: AOAM530Ub25fAo6wfWFJdhVVqn/KqrB37aK/UYg6IB1lQl8xhu4VqqA1
	EjL8jbWr+L1T4nDef6Vk2G8=
X-Google-Smtp-Source: ABdhPJzmrkvDiStAmtd7+VGvZsI9pYupESy16PFw+F9Kq3HKRKavCuP0bioUmlFpVo2aME8RSxiWhw==
X-Received: by 2002:a17:902:8d84:b029:eb:37bd:a3f7 with SMTP id v4-20020a1709028d84b02900eb37bda3f7mr25339714plo.26.1619544165761;
        Tue, 27 Apr 2021 10:22:45 -0700 (PDT)
Received: from ashish ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id i10sm2746126pjj.16.2021.04.27.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 10:22:45 -0700 (PDT)
Date: Tue, 27 Apr 2021 17:22:40 +0000
From: Ashish Kalra <eashishkalra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces)
Message-ID: <20210427172240.GA36694@ashish>
Reply-To: YIg3UcWgwElAsUnI@kroah.com
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

Changes from v1: removed type casting of (void __user *) for req->data and corrected type for data to include __user.

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

