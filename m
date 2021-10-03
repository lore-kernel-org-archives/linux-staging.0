Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634E3FDE
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:00:27 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id l19so17218841vst.7
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7TZJXDTQsGNUDbvRjCz8RKRMYb6ELQrEA+DO5zTgBNA=;
        b=Xem6Lg1b0/aTrHz0hbJGM3loVtZcnOUMJXf/3g28tS48IffCaxi1MVyB09csLYYRD/
         9bOV2VOpccaAhtykLsqneDU8ofwdA1EKWzBNln5c5C1aRMD8Is49jz7kfxiITMugaRQ9
         +CLIkYFkG8bjHYEjOC59Y2OP1Txpi06KAkDq2c8pDrxEEuLNGGRu4NCJoeOVM6dz54hE
         RCaCyaf4X/0KEWofME/Xf84+xe2w8vVNqtDjBykDp81wTtr9QbzdOlxnTYjviOu5tDJM
         j95l0/CEm8gMEmED5zqTSBp1xGMqykG6SUswRhf5qCVz236YfJqRQZFf5zdDnICc/Czq
         puJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7TZJXDTQsGNUDbvRjCz8RKRMYb6ELQrEA+DO5zTgBNA=;
        b=thiztR/WYozIgEcQ7f3+yG82LbFZ+PSxb5q+qB0bQ18jhw+09DY8CfCzxd70dLj1Sa
         zrkBFxkihXeDjOFW16KPFYjrrDWFxR9zVCJeGO2tnkq9gkVb+Scr9vu2+b6sIL9dXoD/
         3RGOIwd6J6DxdFVKbyN3zd/hOT/oe3fkVboqA701O09Mh76YBh9G7+/MMI5jO6DoEkCl
         qyzorA32eHKRBFb/lDQGj57RAzdmpJSGDPHmhOJeH9Fa/s455obzgQ9N/QS9jpnlDyxH
         9VqVXBuzVXUd5SgXkeWthJUT8Sx4ZbQwu2EHo1c8L/GfE+LWKrF44Fhr1BGKVKO+NA49
         +6MA==
X-Gm-Message-State: AOAM531QiGJc/SD6V4IxRJLSIBNvsiqRQGQADVzJYC3Gx6fUHPFTQtVS
	/7xLKJ/gKSeDUfu67wNyBkwJQn+fGe5Elg==
X-Google-Smtp-Source: ABdhPJw1JjvUugGtOTVTqq7ofJV35mRcutZofY6BZ1Lz2nA6gqxT3W3b1s8PAzGPV0klg+cqGQLjyQ==
X-Received: by 2002:a67:c187:: with SMTP id h7mr1634122vsj.29.1633291226351;
        Sun, 03 Oct 2021 13:00:26 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:00:26 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/9] staging: vchiq_core: cleanup blank lines
Date: Sun,  3 Oct 2021 16:57:51 -0300
Message-Id: <20211003195758.36572-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003195758.36572-1-gascoar@gmail.com>
References: <20211003195758.36572-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 083abfd8e212..45858607282c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -257,7 +257,6 @@ find_service_by_handle(unsigned int handle)
 struct vchiq_service *
 find_service_by_port(struct vchiq_state *state, int localport)
 {
-
 	if ((unsigned int)localport <= VCHIQ_PORT_MAX) {
 		struct vchiq_service *service;
 
@@ -3207,7 +3206,6 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle,
 	}
 
 	state = service->state;
-
 	queue = (dir == VCHIQ_BULK_TRANSMIT) ?
 		&service->bulk_tx : &service->bulk_rx;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 3ef4cbe1053c..de1e861c4ed3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -14,7 +14,6 @@
 
 #include "vchiq_cfg.h"
 
-
 /* Do this so that we can test-build the code on non-rpi systems */
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 
@@ -260,7 +259,6 @@ struct vchiq_service_quota {
 };
 
 struct vchiq_shared_state {
-
 	/* A non-zero value here indicates that the content is valid. */
 	int initialised;
 
@@ -449,7 +447,6 @@ struct vchiq_config {
 	short version_min;  /* The minimum compatible version of VCHIQ */
 };
 
-
 extern spinlock_t bulk_waiter_spinlock;
 
 extern int vchiq_core_log_level;
-- 
2.33.0

