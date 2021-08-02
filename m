Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7170
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 17:42:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id i10so20510079pla.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i80N/1f6I9wdo5J4KuddrAU0X8MTRP2GIMmztLtoIXU=;
        b=dGRKSl5y/DAV6pEvoYVK6BG58CjupMxOQQIPOWYGfyHlYASZDB/q3o/kekVW2nc9Qs
         9Q1geTJnsUiJcnSpdR6Kh5W4t2ooclWjzzmmJdL+Mlny6kcI/26xxP6ETd/MKXbFCrbz
         kCGIc6azYoMKmlqVPqepJ7LyLwJUMiQ4QdL21YGKs0C+baAdLk9yV6hHisS+UaVBJgTy
         jRhawnWQ4QPQCfr1odXFelfzdMU9r77iYlfE2GhNjPuQuYJPc86XKQG8ycoS/FCFrRcB
         SakrFlaWQvQ2jvwF/zgKQfabUEForM4wxSZZwblfyD6LDmHQLl+062TEDaHelSbO8/WY
         INBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i80N/1f6I9wdo5J4KuddrAU0X8MTRP2GIMmztLtoIXU=;
        b=J5mh8O2egyeDBEnInqtJ0q3kkuGrOfFIGzDHa+xjQmWm/nUoMhFPcOp98MYfkXAmIp
         BvB3bCMZkkS6Szk2Ro1fjruQovyRV1zrKndwGmGLn9rsl2F9pR+VjhFYfgqY2oY/XnEa
         r6qJPGr8gvi5Vl8KQZJuuNaJCgeem/BRi02BK8tBLcZZLAZn9JJylhjRwm1Xd4kDfURw
         ZlhoW4oOZZQGcIpzyax8W1DSTsfNPJNAg75MB/Dm3bu8Z0brEhW5c2+8jh1BAhkbfzjw
         in/VC8YouJcJURTCTpsDu8Q2Ss71REIAvgu7L6fACAGLQFH9ifO9s3+Z40fiLK4yz4Bc
         dIxw==
X-Gm-Message-State: AOAM532hKu0SLIpspUdkpeYb2j9Z0aF0vocoR2QZlBprQu73sMujx5zN
	Osu3Ou1kb3rcYD82hIrNSJI=
X-Google-Smtp-Source: ABdhPJyNmS/nD79RXC2wA494+zIcRoWi3FD/Y1aWTiFT7lJSDXNXoNm96xqRMGkGxWKjxyMTmMwwQQ==
X-Received: by 2002:a65:6a0d:: with SMTP id m13mr1664908pgu.356.1627926146900;
        Mon, 02 Aug 2021 10:42:26 -0700 (PDT)
Received: from localhost.localdomain ([122.161.50.148])
        by smtp.googlemail.com with ESMTPSA id t30sm14449236pgl.47.2021.08.02.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 10:42:26 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com
Cc: dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: vchiq: Set $CONFIG_BCM2835_VCHIQ to imply $CONFIG_VCHIQ_CDEV
Date: Mon,  2 Aug 2021 23:12:10 +0530
Message-Id: <da53207b24bc37f166b05c6835087becdc6b5b4d.1627925241.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627925241.git.ojaswin98@gmail.com>
References: <cover.1627925241.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before $CONFIG_VCHIQ_CDEV was defined, the vchiq cdev used to be created
unconditionally when CONFIG_BCM2835_VCHIQ=y. When an earlier commit
introduced the new config, its default behavior was set to disabled,
which might surprise some unsuspecting users.  Hence, modify
CONFIG_BCM2835_VCHIQ to imply CONFIG_VCHIQ_CDEV

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 drivers/staging/vc04_services/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index 63caa6818d37..ad44b80f13ca 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -13,6 +13,7 @@ if BCM_VIDEOCORE
 
 config BCM2835_VCHIQ
 	tristate "BCM2835 VCHIQ"
+	imply VCHIQ_CDEV
 	help
 		Kernel to VideoCore communication interface for the
 		BCM2835 family of products.
-- 
2.25.1

