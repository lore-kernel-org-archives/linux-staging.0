Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EC7C
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 16:39:55 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mdevh-1nVAXk2mJt-00ZdtC; Fri, 24 Jun 2022 18:39:41 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] staging: vchiq_arm: Add missing memory barrier comments
Date: Fri, 24 Jun 2022 18:39:02 +0200
Message-Id: <20220624163902.6913-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6D+6xb9DkEyOjZJDjNMI4PRhQSrvNC/CPkzqV7neEO07RhlSVUE
 /tQBDLZnHOyaQU14YpBxgxEwum/hy+djXvdMofN/KOlgPwhFmR98gOu7vfGLRlpM4g3VlOg
 xTOmCC8JrY5u3v6Aagi9mrhT6FPlGIe3pCVqF74H5rwH8t6FIRzdjycXSrTXs6r6KpY7Gya
 qCpfyXHjAk/gIQbVq7/XQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z+hyA4DojEQ=:hrBOoCm/jfh20e7X+4roJV
 EXO6khWHtPH4/NYFtawUagne99qwQiVih8mO12hq1ou9euX2VhsWFKtFf4Za5W53JIs4EUP4y
 tdTPn4Ghb6oOwXdDFbmDWrR8kIrFciYZ83ijEmZod8/pEK3XWuEDg24G/DyD1nPhzLTLcJMkd
 YCZ44GtFSyE48pkABdPIGtO/oSY5pdbHoRlMXSgG/t6/N8Z9PgGtAs0hBR9i9VHW3VgUbhBsV
 wraGgDHy/W4ZMd6A9b1Rjceb+idKgmhePqlHb40oSEBO/SGFrxU8dxvYteOIb9wKa0lgge2is
 XEmLNJsKfbMtJZLF3ZAMubmB1WJ1oMgsViVdUHHDkbRVneCMIpJgMHl+YJ3wYFVi0NBJtVNvX
 DEzQ/SfGC5NrhgZ2tJ4Ee5U9sv/cJuNdRFQAuwrFLiMWDJNTGMVVG1NJODa9ltlW2Ao+SikCN
 DPsV0w9AWFzJKXcKX2+3Gl5AHwxeAajLDk801469BUr8AUQ1outkSfa8dR6vcWNdpn8tn1IuD
 UNpHsYrFOVeb3z8StnHc68PEfvYXFmipXzWApdZG7lAUv/kcScnHv1ijX0R+qPFt9Ik5xpag9
 /7tXvFJyRc2z1r6P+X/icxTAiZjvvr1+zydQkKzIQBbiEUs9+t2LwR+ILRAm08w2x1R56XC4l
 +5Lv6q5Z1UFh+QOWnkP1g8HNVR6nauvTlIl3tYCE427x7j3L5Q1GoxkGIvVLLci3AW57qCko8
 Nmte26vxSJHyDZn3Y+3TQZ1+1jwDNE+4+w0BRn0UAS/ctTOwl+xQdeq7hk0=

From: Phil Elwell <phil@raspberrypi.com>

One of points on the TODO list was to comment the memory barriers.
This patch addresses the missing ones in order to help reviewers.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Link: https://github.com/raspberrypi/linux/pull/5066
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c        | 4 ++++
 .../vc04_services/interface/vchiq_arm/vchiq_core.c       | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3bcb893d14a1..dc33490ba7fb 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -602,6 +602,10 @@ static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *
 void
 remote_event_signal(struct remote_event *event)
 {
+	/*
+	 * Ensure that all writes to shared data structures have completed
+	 * before signalling the peer.
+	 */
 	wmb();
 
 	event->fired = 1;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 7b9c100eb74d..45ed30bfdbf5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -528,6 +528,7 @@ remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
 			return 0;
 		}
 		event->armed = 0;
+		/* Ensure that the peer sees that we are not waiting (armed == 0). */
 		wmb();
 	}
 
@@ -650,6 +651,7 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 
 skip_service:
 	state->poll_needed = 1;
+	/* Ensure the slot handler thread sees the poll_needed flag. */
 	wmb();
 
 	/* ... and ensure the slot handler runs. */
@@ -1156,6 +1158,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 
 	remote_event_wait(&state->sync_release_event, &local->sync_release);
 
+	/* Ensure that reads don't overtake the remote_event_wait. */
 	rmb();
 
 	header = (struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
@@ -1959,6 +1962,7 @@ slot_handler_func(void *v)
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
 		remote_event_wait(&state->trigger_event, &local->trigger);
 
+		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
 
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
@@ -2021,6 +2025,7 @@ sync_func(void *v)
 
 		remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
 
+		/* Ensure that reads don't overtake the remote_event_wait. */
 		rmb();
 
 		msgid = header->msgid;
@@ -3081,6 +3086,10 @@ enum vchiq_status vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned
 	if (vchiq_prepare_bulk_data(instance, bulk, offset, uoffset, size, dir))
 		goto unlock_error_exit;
 
+	/*
+	 * Ensure that the bulk data record is visible to the peer
+	 * before proceeding.
+	 */
 	wmb();
 
 	vchiq_log_info(vchiq_core_log_level, "%d: bt (%d->%d) %cx %x@%pad %pK",
-- 
2.25.1

