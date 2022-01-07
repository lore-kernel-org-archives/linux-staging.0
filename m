Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65F2CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 23:47:57 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id j4so4625190vkr.12
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 15:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QmPviAS4MELSzWYPYeY4b8c+8wCn1tiv/ZwUCvvrRzU=;
        b=I/agVV8YWArMReVGCdEw86cgqjVxRTF7YfSCfiQRlfhCXxgp15LaAZrV60KjGe6Kcv
         Ux3eBlzvenynvpwGfl9mpA2novk5WDByg2LsaWtWTgFwxVALOPZBuuTCi6IItWHte4Fo
         hld1hWgFL1z2MT4nhN1OstHNgO4bQgLp+15YrPYeghJfMKmsHFUbLrMqH9Qf5vLEKIS7
         3Jw4DV4nP3nK2wACeVhcjMwXi1qvYww9MNBsJrCtxcAUDGrjC6IEF7IydltVhhuM29Wx
         oG6g5FxFVGYsPStHdsIewuqmHwr9o7B2CUa+tp5xvfMoGhfZPJEpZlO/nK91p1yIwIOX
         uQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QmPviAS4MELSzWYPYeY4b8c+8wCn1tiv/ZwUCvvrRzU=;
        b=FmKe6c2DHuMg0jOlmCLS8DOJ1wTlzBiCIvK3dlt/IGPDVVifEyCStnbjbCNWLmThnK
         0EpVVXPgEPv3Q9lFXqZ1h/fFq3xS1DVOtB5XIT3LRYj5dcG7AotKJH+w02PMY5mQZCjr
         V4VuJZ5sJI25HRB+xM262INccSYbwHjT7bOzUrIBVi8FkibuR76NYevmLiU+U5IzCS01
         YaPaAAMPttUVA9u4v6bwtpEHvAl0r920VC825EaQ9Pjb35Xm+0y0nXxCRpdP7u9ZusEr
         Wy1/wZZ3VKrY8nDtbEZnDoVywwJG1Kzec3MuZY63Mq/bESCMkFM6QqIfEqI6UUonPluH
         3Wbg==
X-Gm-Message-State: AOAM532nLQ/s0hpGBuUnPK3RtTssaDvHLw9MQU0lTZCR8Lsr3pg+F3Pf
	heN4qAshUo4PHcxvyuhSsG6FmBFxsTiofA==
X-Google-Smtp-Source: ABdhPJw8ygMqpuKGeVAvH6ofTselM3qHtHu42uVWXxIMgmqFtfJyXEIFp8OusTOet68bna4ZXKudmA==
X-Received: by 2002:a1f:1609:: with SMTP id 9mr23404329vkw.18.1641599276610;
        Fri, 07 Jan 2022 15:47:56 -0800 (PST)
Received: from localhost.localdomain ([181.23.94.152])
        by smtp.gmail.com with ESMTPSA id az22sm92911vkb.15.2022.01.07.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:47:56 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/2] staging: vc04_services: remove unneeded MODULE_VERSION() usage
Date: Fri,  7 Jan 2022 20:46:20 -0300
Message-Id: <20220107234620.49900-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107234620.49900-1-gascoar@gmail.com>
References: <20220107234620.49900-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MODULE_VERSION() is useless for in-tree drivers given that only the kernel
version matters. Hence, remove it.

While at it, one realignment was made to improve readability.

Suggested by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 253d755e547f..35ac0fda6e14 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -33,7 +33,6 @@
 #include "mmal-parameters.h"
 #include "bcm2835-camera.h"
 
-#define BM2835_MMAL_VERSION "0.0.2"
 #define BM2835_MMAL_MODULE_NAME "bcm2835-v4l2"
 #define MIN_WIDTH 32
 #define MIN_HEIGHT 32
@@ -1954,9 +1953,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 			goto unreg_dev;
 		}
 
-		v4l2_info(&dev->v4l2_dev,
-			  "Broadcom 2835 MMAL video capture ver %s loaded.\n",
-			  BM2835_MMAL_VERSION);
+		v4l2_info(&dev->v4l2_dev, "Broadcom 2835 MMAL video capture loaded.\n");
 
 		gdev[camera] = dev;
 	}
@@ -2008,5 +2005,4 @@ module_platform_driver(bcm2835_camera_driver)
 MODULE_DESCRIPTION("Broadcom 2835 MMAL video capture");
 MODULE_AUTHOR("Vincent Sanders");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(BM2835_MMAL_VERSION);
 MODULE_ALIAS("platform:bcm2835-camera");
-- 
2.34.1

