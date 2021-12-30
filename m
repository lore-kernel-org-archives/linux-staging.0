Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EB2C80
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 11:33:12 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id a9so21782021qvd.12
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 03:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0NAb92aP3BvHX/H/r7xcS0pDvxqvrorYUGqTqAdSQus=;
        b=A9gJExEihB/bAGFoBMIBq18odmtsTOCydFD2wgMeuWGTGJ3MFb6CqvVl7rmzJptGby
         45SuFMl4GHtVNDMdIEezv4fpEfhXmJWSJrmsNZXt3EZoL1QFT8BwszUdJU/g1l0d9pHc
         XtSfHGfHRgiJnZUfSf1P8TaYErGPK/0gGC4qCSS4pMTeiZ/qCt9wrah1f3VMqO3ggNkS
         dswRWt+db55IzbzIJv8SjnWR4GmbqGK/FxMNjdrLVWiLweC/IO5OvCL0FxEWkOcRSzbH
         XcGQkyC9oC5gGhYxbOgXfe5uTOTmSpAq2Ugm9FDxN/nDaK6pjirB2SUKVmxPcgzk+MNA
         vIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0NAb92aP3BvHX/H/r7xcS0pDvxqvrorYUGqTqAdSQus=;
        b=PhRHz4JgbjMhTKp5RwlfzjTwc+ErTZ8YTZI/R4ksgVMrBsPmxIhW5HuuYbI2PxaW7Y
         aPrBGvI0mWp58Ww0Lrzd82CS9IM7clbYuLMRrx/tOz1tFQiRzF9gW5J6/kmveGJ5bF/6
         wVmOS16bV1zow15kO7ay6QH7FhspKJaV7OykKgDhCqIffMQrNzoI1vZEv3jR6i5Re1tU
         vZiEcJZBCOiNYKyZfBRNH5NaWt+tvywx/ZhUBWJqOYN7oXr8X9Pa7FAnYd3R9fgN8HjS
         WayAkYciEc5KfXVRqnwAZrfX3ZMPOOYJCRvgogqfK+fj5I0Ml4X/ecCnKijx1lM2fXnT
         FXJQ==
X-Gm-Message-State: AOAM530rvhAQ0Lv1oc0ZjcS5Dppuq1jzQitwtzEV60NpdSAxL7blq6Pe
	70VlTEdor0IaYyKeyGX/olG+i/KI2R2WEQ==
X-Google-Smtp-Source: ABdhPJym1DmSfFDOm0+uJkMnhCuNXQ/vZE1Hb0Km0uMhLyBPVYS1yLSZhyh+rXnBWdszqWcIzY3AJg==
X-Received: by 2002:a05:6214:2344:: with SMTP id hu4mr11691004qvb.55.1640863991767;
        Thu, 30 Dec 2021 03:33:11 -0800 (PST)
Received: from localhost.localdomain ([181.23.70.139])
        by smtp.gmail.com with ESMTPSA id v5sm20348559qkp.126.2021.12.30.03.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 03:33:11 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 3/3] staging: vc04_services: update TODO file
Date: Thu, 30 Dec 2021 08:31:29 -0300
Message-Id: <3f560a75063a0bb744bb34c410e49f792d2c3d21.1640776340.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1640776340.git.gascoar@gmail.com>
References: <cover.1640776340.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no struct typedef remaining inside vc04_services/. Hence, remove the
task from the TODO file.

While at it, fix the items sequential numbering.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/TODO | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 39810ce017cd..241ca004735c 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -80,11 +80,7 @@ vchiq-core.ko and vchiq-dev.ko. This would also ease the upstreaming process.
 
 The code in vchiq_bcm2835_arm.c should fit in the generic platform file.
 
-12) Get rid of all the struct typedefs
-
-Most structs are typedefd, it's not encouraged in the kernel.
-
-13) Get rid of all non essential global structures and create a proper per
+11) Get rid of all non essential global structures and create a proper per
 device structure
 
 The first thing one generally sees in a probe function is a memory allocation
@@ -92,6 +88,6 @@ for all the device specific data. This structure is then passed all over the
 driver. This is good practice since it makes the driver work regardless of the
 number of devices probed.
 
-14) Clean up Sparse warnings from __user annotations. See
+12) Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
-- 
2.34.1

