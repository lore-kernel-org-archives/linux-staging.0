Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934702FBF
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 00:42:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id k12-20020a05600c1c8cb02901f259f3a250so653143wms.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 17:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VM6rjy1k2Y/qSvUlDobugVK975Hy7Un538yc0+q4TZ8=;
        b=e6Si8DsxxOMG689N1nQV3P6MflMkRiQvOe0CE3DNbha/Y9t0MIRelIjvEu/SnYMhY3
         kOKmbhJfw0EnTzUaDPDMvvkXyVmp+QABu1Z6iEpdgvVqv6soUJgMTSLnWkPVZgd+mutx
         /1QQBgd1AyhbLRCTVruI5cLalJgCZMgabLKzPp2AvFTbMq/8Fu7TbAKyoTtueqy56TXR
         lKaabuAugO+FDuxM0dKJlZn+/m2DM/q7oH0Lp46YyDt1IU7PPkEPpXa14MdMNugQ5H1t
         J0CH5JJoTAB90LOHjzP2Z9xzNcxB9XxYx0dxoUE+2uFbEJ2LyMaaJvEM9sBMWj+ab3NW
         mA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VM6rjy1k2Y/qSvUlDobugVK975Hy7Un538yc0+q4TZ8=;
        b=LZ2cdL9h3Q3rmFHdBKvYeMeZCn6XAdJPPHfMiZGHdTMKZ3brjrLOH2WZifWEryTsvS
         Ptdo7cdt61ouiChUs5QljO1/is1AQtVzAAUpGcU0CNwpl0LSSQ8avqMo2L9zZqdYC77D
         0Rnn9BHcn8CTQiPPzMLMyVSYvsohP8vhLu18tixMV4uosv8WfrAwxdDIRKYSwU4MN537
         O9flP4qEbLGkIBdBPZqTBuc7Hrwt+ZDJGDrViLGVZhBmdROyEeBxcd5w9Xhr2/CGiIxD
         FeJxdt4J8LFlPAqS2qfHrPy40zXZSanv8eQ9Aw16VeqMy/77zcLNLmKVB1sVx4Zje+zf
         JknA==
X-Gm-Message-State: AOAM532INoDH09bhzWnjnWYvEJ3nNrjB2U/+U393i9mnbkaJL75OFdUm
	u93KSFe0snp2aiBAc1KwtKI/1A==
X-Google-Smtp-Source: ABdhPJynJFkLCnmKK5+Bf7i2B1Q5zbVTr41zDw8uLgHlyrybKXQgeTAfj+5kL5vzacoDQSqGSHnx/A==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr11672168wmi.187.1627000959063;
        Thu, 22 Jul 2021 17:42:39 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id m4sm31630498wrs.14.2021.07.22.17.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:42:38 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com
Subject: [PATCH 7/7] staging: rtl8188eu: attach newly imported driver to build system
Date: Fri, 23 Jul 2021 01:42:14 +0100
Message-Id: <20210723004214.912295-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723004214.912295-1-phil@philpotter.co.uk>
References: <20210723004214.912295-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify Kconfig and Makefile to import new rtl8188eu driver into build
system.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/Kconfig  | 2 ++
 drivers/staging/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 7ece46a6423d..5d04f479fe79 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -28,6 +28,8 @@ source "drivers/staging/wlan-ng/Kconfig"
 
 source "drivers/staging/olpc_dcon/Kconfig"
 
+source "drivers/staging/rtl8188eu/Kconfig"
+
 source "drivers/staging/rtl8192u/Kconfig"
 
 source "drivers/staging/rtl8192e/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 581c25c47d1a..065dbd7958ff 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -4,6 +4,7 @@
 obj-y				+= media/
 obj-$(CONFIG_PRISM2_USB)	+= wlan-ng/
 obj-$(CONFIG_FB_OLPC_DCON)	+= olpc_dcon/
+obj-$(CONFIG_R8188EU)		+= rtl8188eu/
 obj-$(CONFIG_RTL8192U)		+= rtl8192u/
 obj-$(CONFIG_RTL8192E)		+= rtl8192e/
 obj-$(CONFIG_RTL8723BS)		+= rtl8723bs/
-- 
2.31.1

