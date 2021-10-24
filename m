Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53582C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:25:44 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id o26so4335048uab.5
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUZrb/8Tu+o0w2Zrk3jfeV2yAEX/FiW+ydM/SILOmDc=;
        b=mNmxG7ptRvHDkHl0zzqXCFzL6bfLkvmlWIcj44A07+YEnbRIvvLldDFyOem6ncngFo
         VlfxdgBK9P7g5R6QLQBMhTQNPC4JMMuHAbt06IMjzl7QK7p/gOxuiCf8TDf4gR8RlBza
         omp1hPLcSnp2nIrcoBowS0hpdvPl0pmEJ0R5bsRknNCrQSS9B2Ysa2deTBp7HhDgqqrc
         v1o/F28cz/D+4rzAoC6uQa0uWSAihg9CYP5rJviR7zF3OlZwKweEdtnR1vFzmGn6zkUx
         DKeSXDvrulPX8ZN4KFydTeLfMKmSs3A2PsxlsaRgpw9aE8XM+lY+EoV+/Y8WgrKGY/Y8
         1m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUZrb/8Tu+o0w2Zrk3jfeV2yAEX/FiW+ydM/SILOmDc=;
        b=GYuEAFnwDu9iNxXQ0Q3aZfmSS5Epn1hj8QGKTuCi2cLM9tYiWJqoYMztKwitSv1V2P
         pdXhBZwubIuTb1tPKLrJUAZHT5Cw8Wne2R87f7iB6eYgSb8lFznAuYyLAxMdQcFujlJa
         vLhU+HvAM4JmkQp1R2o+3tbXr9WTd9JyC/052Lf7LVBbTg92snUVdXd0yw4zaAix1krL
         M40Ohr7T++du8VJPXYVAA2ChN1fuwyMndS7dnXITPVK9v8L37jc7eVbcDCEaVP38ZKdp
         3MSKaRQ3vTP5vzhi3NqOSXitfk2cgVxXYO+/82+8ZRVklvuprc0e9WxJt8xQM6Z3/Z/M
         ltew==
X-Gm-Message-State: AOAM530ZdQDpwXi8jpI+zhmkwQOrHpGzKp50e8nnPdGO0UBBTNTzi0+h
	c3pyt1YS8cPnp+AB8x2+EH5I6654zoYGpQ==
X-Google-Smtp-Source: ABdhPJxk/CNcqk31LoGeoNiFDolG+3j9ZXhJhPee+dhU51Z5ZSzZQwiWi1XR4dHLuCTCO5l7gt0V8g==
X-Received: by 2002:a67:c217:: with SMTP id i23mr12323615vsj.52.1635110743707;
        Sun, 24 Oct 2021 14:25:43 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:25:43 -0700 (PDT)
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
Subject: [PATCH v2 1/8] staging: vchiq_core: cleanup blank lines
Date: Sun, 24 Oct 2021 18:25:17 -0300
Message-Id: <20211024212524.370078-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024212524.370078-1-gascoar@gmail.com>
References: <20211024212524.370078-1-gascoar@gmail.com>
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
index 083abfd8e212..a205f769d5d3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -257,7 +257,6 @@ find_service_by_handle(unsigned int handle)
 struct vchiq_service *
 find_service_by_port(struct vchiq_state *state, int localport)
 {
-
 	if ((unsigned int)localport <= VCHIQ_PORT_MAX) {
 		struct vchiq_service *service;
 
@@ -3338,7 +3337,6 @@ vchiq_queue_message(unsigned int handle,
 	if (!size) {
 		VCHIQ_SERVICE_STATS_INC(service, error_count);
 		goto error_exit;
-
 	}
 
 	if (size > VCHIQ_MAX_MSG_SIZE) {
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
2.33.1

