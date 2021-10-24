Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA602C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:26:01 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id q13so18278518uaq.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4S8lvEsQXwujwatrBqROuPbSEc2sWN6dV4j7Eupmi7s=;
        b=APlWGDUpN59fZPN1yxcsLEKZedLfhApeDuTLNqqG4jrsMplfUbgs77J+1xRi9BM4rp
         5ZltchltKP1WyIQBmLV7q7fyznzhc6vk2xbZeJ28FrSpXPnsOWn4ESMYZLxy5xgMJIiB
         K/u1lwcdlX7wJWpkwt1v5YhDaGxKtgdeS/Uhp2tf04Ei6APKq+3zFMsX8Qu/gl2jyi7u
         cQsjabY4ArN34DqJo/RpMzSzFdNKKfIk1MTQ577vVnK5zoYluxR9PJZJvyMYMtUcqIzX
         8BWjGTmRv/8YDNVuJeee7c3sC87WNNTMs+qBv1H7XDjT1215rXAqgZHu+5Sq3QT4c/uP
         UAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4S8lvEsQXwujwatrBqROuPbSEc2sWN6dV4j7Eupmi7s=;
        b=z5rvQ2nIR0DlsFevp7ok0raE4JRTjo5yPfsQgPu1zYQt/nCEJ4RcMYZiJ5CktMTfxn
         kZ433d7EYMRRS7LSp0RhgiplIpTrX4wK0eqidGEivxxcvUn9cKthipkB1dS0DOi+5n+n
         HBtXRl8Ybvk4zWMu3iwa0KJvQGouUdIMMydo0cYTG5hp4Kj7LDo9mvFhmyL8bpSyRJBk
         i+PDqDHALBTK6x9vBdQQ9IPRqzWdbK1nw9/+3R3LsyTbjg+DZADsrqoCKJD7c1n4f50h
         rD0bwAFBT41vULoI7yhfgKq0JSJYQfT3Vt8lFPUvW3EypqbULz2AHCqlvweMTFdX5gh2
         FVjA==
X-Gm-Message-State: AOAM532yBy44VoHKbZ+EWpallypDdi4SCjLQ/4gjoj76LOEq5F1087NH
	hmwukYC8lPnHyGR2rjaWD41+RzX1Trw6ng==
X-Google-Smtp-Source: ABdhPJyyaYJDZHmVS1HjJ6xuqswEkGW7P/Gw8WZ9b2YwYh9v4Qgr3gKHkpKcEEJPp94wdL0ZDlx7vw==
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr11829354uam.123.1635110760848;
        Sun, 24 Oct 2021 14:26:00 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 45sm8847869uaq.8.2021.10.24.14.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:26:00 -0700 (PDT)
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
Subject: [PATCH v2 7/8] staging: vchiq_core: cleanup lines that end with '('  or '['
Date: Sun, 24 Oct 2021 18:25:23 -0300
Message-Id: <20211024212524.370078-8-gascoar@gmail.com>
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

Fix lines that end with '(' or '['.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 30 +++++++------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 22d0e706b2dc..3af55e78f356 100644
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
@@ -3089,8 +3080,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle, void *offset, void __
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
2.33.1

