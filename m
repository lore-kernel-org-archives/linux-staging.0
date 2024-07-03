Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0413DDA6
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012272; cv=none; b=udhcQJ4KjwgeOhYGKt1O8OV54rDSjhI3ZbNz9GLaOq43QoAyA93oQcas++tUChUOOTF98RTrtt9uzbUDZbJVH8XHENVXdNSNrdUYMPOohLqjqs8ZXFgDlDl6k8c6AS625hFQErNjvOEkhBNhkdNyrZyaMT7Ts3QkCt6I3PtBguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012272; c=relaxed/simple;
	bh=xr0+kOJzam5pDcgEH8Zo4mLSBFprduCV3yBG+lGD/kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpNqXbJkYkg8ua25GL/pKcZUbKrKvVkJ8MgbqWQl//OyJSfZAijM1+R0Zv0vsuVi9c+qJZxKX5MLAhg3oLwO6mMHynUe4PK2o7tTdSvKg9HoXktn3/7kBS1qz8WOgXDaJBYT8a7+5zdCWI/b6dEZyGbsr608SQfzH5gLVUp/p18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VtLvtDGS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VtLvtDGS"
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 638A76D6;
	Wed,  3 Jul 2024 15:10:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720012240;
	bh=xr0+kOJzam5pDcgEH8Zo4mLSBFprduCV3yBG+lGD/kU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VtLvtDGSDzol0jDbc6F3NjInhX5GZxddzx+Ie+xSFY7Bp/c5nfDJqmOUeOMZjkbgb
	 iiElGjBoivm3hLu7Kr/DJdInWu03arY6S1DjfAsR9uLyYy345lIuqGC7KmFmzdIRZz
	 U+AFNs/pnkZ0SMmOT+BWQ7UDN5jsmvcRlL+R9tlk=
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
Subject: [PATCH v2 1/2] staging: vchiq_core: Bubble up wait_event_interruptible() return value
Date: Wed,  3 Jul 2024 18:40:51 +0530
Message-ID: <20240703131052.597443-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240703131052.597443-1-umang.jain@ideasonboard.com>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible() returns if the condition evaluates to true
it receives a signal. However, the current code always assume that the
wait_event_interruptible() returns only when the event is fired.
This should not be the case as wait_event_interruptible() can
return on receiving a signal (with -ERESTARTSYS as return value).

We should consider this and bubble up the return value of
wait_event_interruptible() to exactly know if the wait has failed
and error out. This will also help to properly stop kthreads in the
subsequent patch.

Meanwhile at it, remote_wait_event() is modified to return 0 on success,
and an error code (from wait_event_interruptible()) on failure. The
return value is now checked for remote_wait_event() calls.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_core.c          | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 4f65e4021c4d..dd70f2881eca 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -501,16 +501,21 @@ remote_event_create(wait_queue_head_t *wq, struct remote_event *event)
  * routines where switched to the "interruptible" family of functions, as the
  * former was deemed unjustified and the use "killable" set all VCHIQ's
  * threads in D state.
+ *
+ * Returns: 0 on success, a negative error code on failure
  */
 static inline int
 remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
 {
+	int ret = 0;
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
@@ -518,7 +523,7 @@ remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
 	}
 
 	event->fired = 0;
-	return 1;
+	return ret;
 }
 
 /*
@@ -1140,6 +1145,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	struct vchiq_header *header;
 	ssize_t callback_result;
 	int svc_fourcc;
+	int ret;
 
 	local = state->local;
 
@@ -1147,7 +1153,9 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	    mutex_lock_killable(&state->sync_mutex))
 		return -EAGAIN;
 
-	remote_event_wait(&state->sync_release_event, &local->sync_release);
+	ret = remote_event_wait(&state->sync_release_event, &local->sync_release);
+	if (ret)
+		return ret;
 
 	/* Ensure that reads don't overtake the remote_event_wait. */
 	rmb();
@@ -1929,13 +1937,16 @@ slot_handler_func(void *v)
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
+		if (ret)
+			return ret;
 
 		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
@@ -1966,6 +1977,7 @@ recycle_func(void *v)
 	struct vchiq_shared_state *local = state->local;
 	u32 *found;
 	size_t length;
+	int ret;
 
 	length = sizeof(*found) * BITSET_SIZE(VCHIQ_MAX_SERVICES);
 
@@ -1975,7 +1987,9 @@ recycle_func(void *v)
 		return -ENOMEM;
 
 	while (1) {
-		remote_event_wait(&state->recycle_event, &local->recycle);
+		ret = remote_event_wait(&state->recycle_event, &local->recycle);
+		if (ret)
+			return ret;
 
 		process_free_queue(state, found, length);
 	}
@@ -1992,6 +2006,7 @@ sync_func(void *v)
 		(struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
 			state->remote->slot_sync);
 	int svc_fourcc;
+	int ret;
 
 	while (1) {
 		struct vchiq_service *service;
@@ -1999,7 +2014,9 @@ sync_func(void *v)
 		int type;
 		unsigned int localport, remoteport;
 
-		remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
+		ret = remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
+		if (ret)
+			return ret;
 
 		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
-- 
2.43.0

