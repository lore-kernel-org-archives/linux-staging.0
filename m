Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5F14293
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938606; cv=none; b=Xjtyys1pGl+Q4bO9MAtUvMVTk67dNr69mC9jizzgYTCuLD49JvLTZTQbFPRbaoE47GcGXpri18LIeqWKusZg0RagacMvsEcOLgIbFF4/JUSVWPil4zaF//+v8NkRtPKYXrp7/WkpVb8G+smSsuOs2C02P9q7AqevJWAERy6MvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938606; c=relaxed/simple;
	bh=o3UUPFZuZqM/2OiUnll8VT1D1rChRZtqe6d50PrFAYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIMnFRuWBwZHGGgDb2O2xkb/e6EyuniX0F68m2LoMeDRYLr9SJQFISTzMUYe8MBDy0I644bi8KfM8A99KxsyUhuNJpzi2BH6SmwhAbQh4zAibJR+SOy5p9FlG+s/MSU4dJ8eSuppjo3WnCUP00CZTfZ/+nTt3xTq+JPgjSJfQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r6PkYF2U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r6PkYF2U"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7393DABE;
	Tue,  2 Jul 2024 18:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719938569;
	bh=o3UUPFZuZqM/2OiUnll8VT1D1rChRZtqe6d50PrFAYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6PkYF2UXy3YBBJDU62UPl4zbcg65+28GU5bqjLVLEEHA7PWv6jjVY1T6uY/NqrSR
	 vXdGHMD/qc+u8hi4JmzY8jO4Kaq8WRCagG3/G/H8zeYJpUDmObeH+RwiQwBKHgy2+9
	 VW8D3LeEM5DQbHIh7v0QrWBzyR7Uxq8L6aRC/A5Q=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] staging: vchiq_core: Bubble up wait_event_interruptible() return value
Date: Tue,  2 Jul 2024 22:12:55 +0530
Message-ID: <20240702164256.754391-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702164256.754391-1-umang.jain@ideasonboard.com>
References: <20240702164256.754391-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible() can return if the condition evaluates to
true or it receives a signal. However, the current code always assume
that the wait_event_interruptible() returns only when the event is
fired. This should not be the case as wait_event_interruptible() can
return on receiving a signal (with -ERESTARTSYS as return value).

We should consider this and bubble up the return value of
wait_event_interruptible() to exactly know if the wait has failed
and error out. This will also help to properly stop kthreads in the
subsequent patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 4f65e4021c4d..b5f5853924a8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -505,12 +505,15 @@ remote_event_create(wait_queue_head_t *wq, struct remote_event *event)
 static inline int
 remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
 {
+	int ret;
+
 	if (!event->fired) {
 		event->armed = 1;
 		dsb(sy);
-		if (wait_event_interruptible(*wq, event->fired)) {
+		ret = wait_event_interruptible(*wq, event->fired);
+		if (ret) {
 			event->armed = 0;
-			return 0;
+			return ret;
 		}
 		event->armed = 0;
 		/* Ensure that the peer sees that we are not waiting (armed == 0). */
@@ -1140,6 +1143,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	struct vchiq_header *header;
 	ssize_t callback_result;
 	int svc_fourcc;
+	int ret;
 
 	local = state->local;
 
@@ -1147,7 +1151,9 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	    mutex_lock_killable(&state->sync_mutex))
 		return -EAGAIN;
 
-	remote_event_wait(&state->sync_release_event, &local->sync_release);
+	ret = remote_event_wait(&state->sync_release_event, &local->sync_release);
+	if (ret < 0)
+		return ret;
 
 	/* Ensure that reads don't overtake the remote_event_wait. */
 	rmb();
@@ -1929,13 +1935,16 @@ slot_handler_func(void *v)
 {
 	struct vchiq_state *state = v;
 	struct vchiq_shared_state *local = state->local;
+	int ret;
 
 	DEBUG_INITIALISE(local);
 
 	while (1) {
 		DEBUG_COUNT(SLOT_HANDLER_COUNT);
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
-		remote_event_wait(&state->trigger_event, &local->trigger);
+		ret = remote_event_wait(&state->trigger_event, &local->trigger);
+		if (ret < 0)
+			return ret;
 
 		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
@@ -1966,6 +1975,7 @@ recycle_func(void *v)
 	struct vchiq_shared_state *local = state->local;
 	u32 *found;
 	size_t length;
+	int ret;
 
 	length = sizeof(*found) * BITSET_SIZE(VCHIQ_MAX_SERVICES);
 
@@ -1975,7 +1985,9 @@ recycle_func(void *v)
 		return -ENOMEM;
 
 	while (1) {
-		remote_event_wait(&state->recycle_event, &local->recycle);
+		ret = remote_event_wait(&state->recycle_event, &local->recycle);
+		if (ret < 0)
+			return ret;
 
 		process_free_queue(state, found, length);
 	}
@@ -1992,6 +2004,7 @@ sync_func(void *v)
 		(struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
 			state->remote->slot_sync);
 	int svc_fourcc;
+	int ret;
 
 	while (1) {
 		struct vchiq_service *service;
@@ -1999,7 +2012,9 @@ sync_func(void *v)
 		int type;
 		unsigned int localport, remoteport;
 
-		remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
+		ret = remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
+		if (ret < 0)
+			return ret;
 
 		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
-- 
2.43.0

