Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116272FB8
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 03:47:04 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h127so20450700pfe.9
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCFKPzrYeuwaqZekX+y/t+Ka+1uMgBTfhabTovYmswE=;
        b=S1VPcIohjHX5sP19NIEdpm56pe9PXvkGl7DaTv6G2T0uAyfAvcQT5SAa9lnNA978jO
         ZTt1yWfo6m3kOYvXP69MZcGR4kAaKxbtzpsWs2ds2wua4NBX2zBrxJEXmhjtDh8A9cpm
         wFalWIggNCl1SonztJEPMp+AXsWI8KEsEUcj+iKPeKVNJ/pd6gxkm9WIyJBCPSuvOKQ7
         dLs8Fxf6vhrqz0pvgjvkMUA1qG89j8YCWtQR0C7Di8b3ZgPztHfxKpTX8Adem0bsK9cq
         u2E9YhfAEIXrSUp4KUI4/XIAcKJLm2mpMq2YXfRu4TfhYtNrUqmKjWi3TMHdVWyb5xhr
         M0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCFKPzrYeuwaqZekX+y/t+Ka+1uMgBTfhabTovYmswE=;
        b=pm5nb0IRYybA4ZGyqI3sjt54+T4YfNlIcFxDXm9hGHtbFyNIUrY4b1s+YKvYN314VB
         NTLJcgC0ETvn4Q4AYobWbrNagtuof8reczIpJ9KpHwtEHNPjexw8oLNMfBxNc8aC6LBv
         wPOPOZCuNe9Ql/HlA7zhZqskf1eSk5AVn8KEHso9FON26tiScusc0jjLwRymvvBqfHDR
         pR06uolZnuY1iAV8JeL1lcamo/uNC4vvGT55A97L5lXnNeSvUxnhXZFLuwNchOCEitL1
         pVADXezozWFkmgwSyDbPeQx8xzS7lrjggadWQiecjc3rdntB5JUmO9CLbYoOxENpAJwd
         9Nrg==
X-Gm-Message-State: AOAM531HlNoC2Z2dXmHTvF7A6zMkksWojHVYXrquWa4liH3vuQih1wM1
	cKXDtSDqzVjAwj4PSyNnNCQ=
X-Google-Smtp-Source: ABdhPJy+EbKIa+BZvLYWEb/qxTIUGLYURVDv4BQlMdlRdnjgQvyyOG8THHzFekc06oruonzKBg/68A==
X-Received: by 2002:a17:90a:a60d:: with SMTP id c13mr2242335pjq.172.1620877624487;
        Wed, 12 May 2021 20:47:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.63.8])
        by smtp.gmail.com with ESMTPSA id t19sm988295pfg.70.2021.05.12.20.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 20:47:04 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: atomisp: Use sysfs_emit() instead of sprintf() where appropriate
Date: Thu, 13 May 2021 11:46:50 +0800
Message-Id: <20210513034650.252993-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_emit() is preferred over raw sprintf() for sysfs attributes since it
knows about the sysfs buffer specifics and has some built-in sanity checks.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index f670faf978e6..dcb571f515a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -96,7 +96,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 static ssize_t iunit_dbglvl_show(struct device_driver *drv, char *buf)
 {
 	iunit_debug.dbglvl = dbg_level;
-	return sprintf(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
+	return sysfs_emit(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
 }
 
 static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
@@ -115,7 +115,7 @@ static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
 static ssize_t iunit_dbgfun_show(struct device_driver *drv, char *buf)
 {
 	iunit_debug.dbgfun = atomisp_get_css_dbgfunc();
-	return sprintf(buf, "dbgfun opt:%u\n", iunit_debug.dbgfun);
+	return sysfs_emit(buf, "dbgfun opt:%u\n", iunit_debug.dbgfun);
 }
 
 static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
@@ -139,7 +139,7 @@ static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
 
 static ssize_t iunit_dbgopt_show(struct device_driver *drv, char *buf)
 {
-	return sprintf(buf, "option:0x%x\n", iunit_debug.dbgopt);
+	return sysfs_emit(buf, "option:0x%x\n", iunit_debug.dbgopt);
 }
 
 static ssize_t iunit_dbgopt_store(struct device_driver *drv, const char *buf,
-- 
2.25.1

