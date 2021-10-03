Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3013FDE
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:01:28 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id l19so17220376vst.7
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7bP3U1yAZRt+u68NpbNq0nb+zKNPUwV3lLbZ4sFMYKk=;
        b=VPz19kliN98T8/mxR29yWivNGIFgd3VMZG6pMvmeyA6NkcltfkH5xI0DynISsOPkuC
         vYIkTEfsKpAZ+H6WNpiysN7vHnv3jK6GgRPETyJR4p1jrmQS8hO2KoFoQnllDUUADlLp
         gyS6IOzpLd0ZlipHFUypue4Q+Ucpy+tQuZadFlEDekDjaj9jg8S89mu+z0niMkyhB3SO
         GdwXIH0wW2EaOEjyXT1wK7+09sYe7o0nCYrbHZquLfC4AQsKGJQ1XXHVKAJqmFSfeWj9
         WXupz0ZBxyu7sL68Z81Mlt73c3Hgy6v9QMcv8k7TABDiv8uIgy121zpP4MQ/EZmIQEoQ
         ANCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7bP3U1yAZRt+u68NpbNq0nb+zKNPUwV3lLbZ4sFMYKk=;
        b=JsXYAPWRfWQvCvGK1AJ/oiHOMsq8bcQkHorXHojWC3pM7maHt9/jf9mas+i4T4KLx9
         BhmIXlt9dVd7Bny/OB8RL6ZeyEkSKBvqbtgPQQE9TFmrdG/xRJQPA0n44ckXJ0JTKSQZ
         kOhOeuT1fOXOJykOfK8o1zzERH6L/bo7o/pi49I1AAQsQIo7/79cmTkZo8TQxU8BJo75
         0rjvjKUC6lubZ3SODIkE3sE8nOKf2/5tInYCnCXSHex42feLktDzDA0CnvySZOOwBoCY
         J0SJETHUZryzNAYa3XIjqUm8p3jds78WDFxAGAVZ19g0o0Xd0Cqzf/nkHyNIVAy8xjtU
         bEPQ==
X-Gm-Message-State: AOAM531P1NfSw2gzUHQ8OF0wqEhcLXVErQw6kTVwYprJLtol+HPvL68n
	VfepWgmqS1khR27ZF3TsnxsiN7vLv10rDA==
X-Google-Smtp-Source: ABdhPJzktHhae8DX+eZEXR+RgndZY7/aOkqVP8Bkce0LaukNnLWshpoum9Qyg5P9+1mwKRsATJ1kcg==
X-Received: by 2002:a67:f147:: with SMTP id t7mr10547572vsm.41.1633291287189;
        Sun, 03 Oct 2021 13:01:27 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:01:26 -0700 (PDT)
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
Subject: [PATCH 7/9] staging: vchiq_core: cleanup lines that end with '(' or '['
Date: Sun,  3 Oct 2021 16:58:00 -0300
Message-Id: <20211003195758.36572-8-gascoar@gmail.com>
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

Fix lines that end with '(' or '['.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 30 +++++++------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 026c7c775e40..b4ad68ff42db 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -699,8 +699,7 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
 			return NULL;
 		}
 
-		slot_index = local->slot_queue[
-			SLOT_QUEUE_INDEX_FROM_POS_MASKED(tx_pos)];
+		slot_index = local->slot_queue[SLOT_QUEUE_INDEX_FROM_POS_MASKED(tx_pos)];
 		state->tx_data =
 			(char *)SLOT_DATA_FROM_INDEX(state, slot_index);
 	}
@@ -854,18 +853,15 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 }
 
 static ssize_t
-memcpy_copy_callback(
-	void *context, void *dest,
-	size_t offset, size_t maxsize)
+memcpy_copy_callback(void *context, void *dest, size_t offset, size_t maxsize)
 {
 	memcpy(dest + offset, context + offset, maxsize);
 	return maxsize;
 }
 
 static ssize_t
-copy_message_data(
-	ssize_t (*copy_callback)(void *context, void *dest,
-				 size_t offset, size_t maxsize),
+copy_message_data(ssize_t (*copy_callback)(void *context, void *dest, size_t offset,
+					   size_t maxsize),
 	void *context,
 	void *dest,
 	size_t size)
@@ -946,8 +942,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		 * Ensure this service doesn't use more than its quota of
 		 * messages or slots
 		 */
-		tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(
-			state->local_tx_pos + stride - 1);
+		tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos + stride - 1);
 
 		/*
 		 * Ensure data messages don't use more than their quota of
@@ -959,14 +954,12 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			spin_unlock(&quota_spinlock);
 			mutex_unlock(&state->slot_mutex);
 
-			if (wait_for_completion_interruptible(
-						&state->data_quota_event))
+			if (wait_for_completion_interruptible(&state->data_quota_event))
 				return VCHIQ_RETRY;
 
 			mutex_lock(&state->slot_mutex);
 			spin_lock(&quota_spinlock);
-			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(
-				state->local_tx_pos + stride - 1);
+			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos + stride - 1);
 			if ((tx_end_index == state->previous_data_index) ||
 			    (state->data_use_count < state->data_quota)) {
 				/* Pass the signal on to other waiters */
@@ -985,8 +978,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 					quota->message_use_count, quota->slot_use_count);
 			VCHIQ_SERVICE_STATS_INC(service, quota_stalls);
 			mutex_unlock(&state->slot_mutex);
-			if (wait_for_completion_interruptible(
-						&quota->quota_event))
+			if (wait_for_completion_interruptible(&quota->quota_event))
 				return VCHIQ_RETRY;
 			if (service->closing)
 				return VCHIQ_ERROR;
@@ -998,8 +990,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 				return VCHIQ_ERROR;
 			}
 			spin_lock(&quota_spinlock);
-			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(
-				state->local_tx_pos + stride - 1);
+			tx_end_index = SLOT_QUEUE_INDEX_FROM_POS(state->local_tx_pos + stride - 1);
 		}
 
 		spin_unlock(&quota_spinlock);
@@ -3088,8 +3079,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle, void *offset, void __
 		VCHIQ_SERVICE_STATS_INC(service, bulk_stalls);
 		do {
 			mutex_unlock(&service->bulk_mutex);
-			if (wait_for_completion_interruptible(
-						&service->bulk_remove_event)) {
+			if (wait_for_completion_interruptible(&service->bulk_remove_event)) {
 				status = VCHIQ_RETRY;
 				goto error_exit;
 			}
-- 
2.33.0

