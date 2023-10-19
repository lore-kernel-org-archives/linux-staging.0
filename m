Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1714F6D;
	Thu, 19 Oct 2023 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAooC6i1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4079ed65471so21476215e9.1;
        Thu, 19 Oct 2023 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697708787; x=1698313587; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRx1mkVglneWbuJK9kNyXtkB1fOLyzTlVO5RVNlJSBQ=;
        b=IAooC6i1CYU/MH5m7WHwcwx3F2mKwuWGbPeuTWrrH1OS3k+hzZXgVJHfdNgJ2LH4UT
         wdKphFyIJjZgrmC0xgGeYf50Gibk+XzxB9eqK0imRWFXXNPhqBXoSqzoGWIHNd/LS5CM
         QjsO0bFuKqGEyj8DmPJwo72rWTKmQ66l81xIZj6IAt3dR4GtR9cEBCEX39eqn6PsFOAI
         OmbBcDIjUiPwMfdR71i7TuX2T81+CDS+R+9DbN2r55uTcJjYAAi7yKuB9hpkFW1LrLZt
         5UGZmgumVpVzqAwygErottR4CgAleNlb+IOTBhXr6qrKQ8MBb5yhRRdT84VGGVU5CYRK
         B+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708787; x=1698313587;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRx1mkVglneWbuJK9kNyXtkB1fOLyzTlVO5RVNlJSBQ=;
        b=XJYmB8buCrrD9xX9snJNio48kyBYVn4bTtst+pSuX5LTDxvf0fTZx1zq4394lQsXa7
         HSvPR3NuJl+ENEXBrhjbE4UGGhzlogF94aNfv6lpiEMSfIu+mHkYPtilouOZk3ShULgT
         /DuSGcFfo5E9jBvwS1GQpAmeVl05Gt2xKpTkW/uQGui3YmQnD7Eba/2+aNKo5nBvaxiu
         tcIpXoXtUYcX/TNQvXZxPG+aacBYapqHlz8jVXepblbsybw3YQaS57xvVV5jbmn06xmk
         4SVz9kbUvrv6Nq1gbWjG0btQlJmBdxXmB86Y1FAuQMthwMutKm3E/NlqbDLTQ6XEBszi
         OTdA==
X-Gm-Message-State: AOJu0YwqkWfcArywX+cG8KgT+PM6MWdVl6IB8eqLsei0ehuBDECFJkPp
	NBneZXAXzDjSdp369ADzsy4=
X-Google-Smtp-Source: AGHT+IGxB1FMUpt94hkLPb+IgHxMb75FtIbTeRjZ2Ps6cGpdt9zcWAj00kVdOOdisWuxCLN/pV4J8g==
X-Received: by 2002:a5d:4444:0:b0:32d:857c:d546 with SMTP id x4-20020a5d4444000000b0032d857cd546mr1125114wrr.64.1697708786837;
        Thu, 19 Oct 2023 02:46:26 -0700 (PDT)
Received: from lab-ubuntu ([41.90.66.104])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b0032d9efeccd8sm4064810wrw.51.2023.10.19.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:46:26 -0700 (PDT)
Date: Thu, 19 Oct 2023 12:46:23 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <ZTD677iqMkRPxT27@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The functions vchiq_debugfs_init(), vchiq_debugfs_deinit(),
vchiq_debugfs_add_instance(), and vchiq_debugfs_remove_instance()
are declared and defined but contains no code or statements.
They do nothing.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 .../interface/vchiq_arm/vchiq_arm.c              |  3 ---
 .../interface/vchiq_arm/vchiq_debugfs.c          | 16 ----------------
 .../interface/vchiq_arm/vchiq_debugfs.h          |  8 --------
 .../interface/vchiq_arm/vchiq_dev.c              |  4 ----
 4 files changed, 31 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index eef9c8c06e66..b802d1ecc8f6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1806,8 +1806,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	if (err)
 		goto failed_platform_init;
 
-	vchiq_debugfs_init();
-
 	vchiq_log_info(vchiq_arm_log_level,
 		       "vchiq: platform initialised - version %d (min %d)",
 		       VCHIQ_VERSION, VCHIQ_VERSION_MIN);
@@ -1838,7 +1836,6 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
-	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index dc667afd1f8c..7e45076e5ebd 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -228,20 +228,4 @@ void vchiq_debugfs_deinit(void)
 
 #else /* CONFIG_DEBUG_FS */
 
-void vchiq_debugfs_init(void)
-{
-}
-
-void vchiq_debugfs_deinit(void)
-{
-}
-
-void vchiq_debugfs_add_instance(struct vchiq_instance *instance)
-{
-}
-
-void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
-{
-}
-
 #endif /* CONFIG_DEBUG_FS */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
index e9bf055a4ca9..76424473c32b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.h
@@ -10,12 +10,4 @@ struct vchiq_debugfs_node {
 	struct dentry *dentry;
 };
 
-void vchiq_debugfs_init(void);
-
-void vchiq_debugfs_deinit(void);
-
-void vchiq_debugfs_add_instance(struct vchiq_instance *instance);
-
-void vchiq_debugfs_remove_instance(struct vchiq_instance *instance);
-
 #endif /* VCHIQ_DEBUGFS_H */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 841e1a535642..953f39f537a8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1185,8 +1185,6 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	instance->state = state;
 	instance->pid = current->tgid;
 
-	vchiq_debugfs_add_instance(instance);
-
 	init_completion(&instance->insert_event);
 	init_completion(&instance->remove_event);
 	mutex_init(&instance->completion_mutex);
@@ -1297,8 +1295,6 @@ static int vchiq_release(struct inode *inode, struct file *file)
 
 	free_bulk_waiter(instance);
 
-	vchiq_debugfs_remove_instance(instance);
-
 	kfree(instance);
 	file->private_data = NULL;
 
-- 
2.34.1

