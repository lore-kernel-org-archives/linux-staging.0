Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4E385
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 00:30:32 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6490c2c4702so7482966d6.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693009832; x=1693614632;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZyTeNGFnmQqE613GDKmKhvLAFe/AnQBwlsX/erp5GQ=;
        b=lBAbfPJmyYr7D+xhXIJ4YlXKgiw1v/rQRbN7gs6i9aXXb+yHcLxmQO6diIOdHwDr8H
         3JEvbxn/uYkWU88LxZDBF0jDV6Ry3jfFkUSV1i9Z38wNXI0Sr5+bzF0aq2CM0d7qOUy0
         Na/Pcc51GOHtZNfYuhxMdkUR2iI1GHSJPRnhAwcBLzDkuSv5w8yWCiGPhza5v3RRxCei
         xw+sqsZmRAeLqfWQ5jPEyDKTuQRzhmWfzTstc6f70MP/0JCfHfNEr+yvIx2i6y7/InLQ
         TsNObOQVDPmY7eeKrRd4Lk+/zyrwm9ZduKtsBC0tD9SiouW5gdv9niBdgZUEATAaY6tM
         fLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693009832; x=1693614632;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZyTeNGFnmQqE613GDKmKhvLAFe/AnQBwlsX/erp5GQ=;
        b=k4dKAMzvEt26a6KPIRfcvP8g76sdcc994o9kis2R/72/bz2M0EX/ufDD5iztii1Urk
         nfXCwJOgsw/9KA4sTmS6wWcLrbxvbSFGsZK74DgQP6xoF8/1NBFjpq78zQ7kZM4aCz2D
         hqDApc3jxi2yqwfRsIiLrAPgnBvYI7HH2zYo3q/VpYOHctHhNojIerwCJsDVPIjsZi2Z
         avqM9z/iGsTj3pHYFVeYYnEP22kG1cGUcY7NdC2IF8LoIbQC3WFvQby7Hq7M8M/HCxu9
         QtwJNdIck4g/oOpsWoA7m5s5n26Kp1l3//FPhhzGxCVbR98gLYj08f3GH9YkjUJiEcyT
         33Ug==
X-Gm-Message-State: AOJu0YxKAYd/g4wwVA4zzzUGa9t8Tn7tBiflyJi5bLoP0ULFgxjhMe0d
	n/qEeLWIiR3sbSFddzLMTBE=
X-Google-Smtp-Source: AGHT+IHdQMAbKiU8+7Ds3mrCtSx4VtAtS4KB91c27s3l8W/W893AhW7DAtd/kGWb6/gzHLi2XTIGRA==
X-Received: by 2002:a0c:c502:0:b0:64f:69a3:af37 with SMTP id x2-20020a0cc502000000b0064f69a3af37mr7616094qvi.13.1693009831703;
        Fri, 25 Aug 2023 17:30:31 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id x4-20020a0cda04000000b0063d162a8b8bsm903510qvj.19.2023.08.25.17.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 17:30:31 -0700 (PDT)
Date: Fri, 25 Aug 2023 21:30:26 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check unnecessary space after a cast
 in vme_fake.c
Message-ID: <ZOlHos18LFnsKg0i@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: No space is necessary after a cast
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 4258ed6033e7..4ccb16dd0d0b 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -95,7 +95,7 @@ static void fake_VIRQ_tasklet(unsigned long data)
 	struct vme_bridge *fake_bridge;
 	struct fake_driver *bridge;
 
-	fake_bridge = (struct vme_bridge *) data;
+	fake_bridge = (struct vme_bridge *)data;
 	bridge = fake_bridge->driver_priv;
 
 	vme_irq_handler(fake_bridge, bridge->int_level, bridge->int_statid);
@@ -1092,7 +1092,7 @@ static int __init fake_init(void)
 	mutex_init(&fake_device->vme_int);
 	mutex_init(&fake_bridge->irq_mtx);
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
-		     (unsigned long) fake_bridge);
+		     (unsigned long)fake_bridge);
 
 	strcpy(fake_bridge->name, driver_name);
 
-- 
2.41.0

