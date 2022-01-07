Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04162CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 23:48:26 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id c36so12959196uae.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 15:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIZk0/qrlbHk+D+cMnIml9bJG7V5kb5RZ/SaCUVYBAY=;
        b=ff2nsmcgN8gRdsIDTf1XYGNtXyP31JzUHAlbJBfa3CiJeUpCJifzJ44U4qPadzdRVM
         AFKkFj3cKVqGePtvbdnKJZkelTgYCq68/g6FyzoGzZifVtFi/PE2gXEz20eNSPR93v0i
         BgQMke5lc884eJszRh16/7YZDPaxZLKMiMrIl8RmDOz0Xx9mlWld4G5NtTPjbE2iztid
         FXImzzzSAmY4YvVWlNwZZqpV4YuYBbnBK73B/wjfLZoSi7r31lTdQa0dPX9Huy5qiwIl
         sAAkcTVV5cQHERv6e906kG75nV45SLjx9OFPXoufwvN+jH/7euFRdnITBD4/YB/B/6i0
         dF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIZk0/qrlbHk+D+cMnIml9bJG7V5kb5RZ/SaCUVYBAY=;
        b=WHHv7I91plIpDA7OXuYU7emGu75R5CDi1QXyrA/wfeVZK7o2lD0a2WXSDN7cq3CnPv
         PvL275duGFZAR/ovkhoS3Mf7uWv49PcigXtqydvbM/cUmgi8A0gyLAcKxKhKDlzTHdxM
         Rd2MyCX/Ml9FFdoLF4wG76+n/xF1y4Jxf3a5LCISWXn6//VF/uGsv37aWq9A84VyD9MA
         wZq2iJGa2qQ3feWGzqJt3GX2cKRGoVSdt1T6rkXAsIpF9JG1SAecAVsHTR2V7AVvQ2wN
         Ux3c+cqY8+u1KTJikrqKSKG/MfLMGUyP3LoG/zPTbgwDvp13l+Gq7yyl5s0QW/mRnUFx
         xy1g==
X-Gm-Message-State: AOAM530T16zUXmnezv+9V0oT/uzRGzDdVdxkS7TtvExl8yfx/ndboYHo
	8GlRb+lcidMvfn0eX1RzXRHTOuaQw4WVww==
X-Google-Smtp-Source: ABdhPJyWNeF7ASXynzT/leso0yUuJElkPHuPa9OSKOGKrxcsz33Uc7mqrtzfaz1NAw+cDg/f0o1Ihg==
X-Received: by 2002:a05:6102:2927:: with SMTP id cz39mr21534038vsb.59.1641599305666;
        Fri, 07 Jan 2022 15:48:25 -0800 (PST)
Received: from localhost.localdomain ([181.23.94.152])
        by smtp.gmail.com with ESMTPSA id az22sm92911vkb.15.2022.01.07.15.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:48:25 -0800 (PST)
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
Subject: [PATCH 2/2] staging: vc04_services: use KBUILD_MODNAME instead of own module name definition
Date: Fri,  7 Jan 2022 20:46:22 -0300
Message-Id: <20220107234620.49900-3-gascoar@gmail.com>
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

Remove own module name definition and use KBUILD_MODNAME instead, which
is the standard way of getting the module name.

While at it, one realignment was made to improve readability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 35ac0fda6e14..88b1878854e0 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -33,7 +33,6 @@
 #include "mmal-parameters.h"
 #include "bcm2835-camera.h"
 
-#define BM2835_MMAL_MODULE_NAME "bcm2835-v4l2"
 #define MIN_WIDTH 32
 #define MIN_HEIGHT 32
 #define MIN_BUFFER_SIZE (80 * 1024)
@@ -1893,8 +1892,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 		dev->capture.fmt = &formats[3]; /* JPEG */
 
 		/* v4l device registration */
-		dev->camera_num = v4l2_device_set_name(&dev->v4l2_dev,
-						       BM2835_MMAL_MODULE_NAME,
+		dev->camera_num = v4l2_device_set_name(&dev->v4l2_dev, KBUILD_MODNAME,
 						       &camera_instance);
 		ret = v4l2_device_register(NULL, &dev->v4l2_dev);
 		if (ret) {
-- 
2.34.1

