Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C485CBB
	for <linux-staging@lists.linux.dev>; Thu, 22 Dec 2022 14:16:38 +0000 (UTC)
Received: from stefanw-SCHENKER ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MFsER-1p5s3E1lAV-00HLB2; Thu, 22 Dec 2022 15:16:23 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-staging@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Umang Jain <umang.jain@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] staging: vchiq_core: Add comments to remote event parts
Date: Thu, 22 Dec 2022 15:15:53 +0100
Message-Id: <20221222141553.138563-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W5Nl+lrIYpBoJ8xhdZ+/1NRR3o2mgPu4MEbmk/LtK/sX0SEhPWV
 l68LEjxWd2UhWWnv3lyN6O0g/jadSaSNEqD1lNCRu+bvTv9QzL8KyHDd7yltPKDZW7WJM3I
 77Dsb6BbzUCDDyf+BYzuAHTPHbrbQcM/yKmtlnEBeu2Rpj1fk6ha06UHv0YioXtBzlROh5N
 svjD3lF50vRNMG7/EEpMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zbymciysjy0=;/q2w0GUPnkREwqyFizDDbzHy9eO
 0BirmsQOya+Gf/MCmqVG3boAx3F5TAH8HGDi0rtLswuFfikrIdG8RLpq1AwdxiEeUAfMfcHvw
 /E80t8XoiwaO1s/3d+Fqq2Wki4nI+IApWhqHyZur2uEr4wEG3gPUn5iwiFTXWPfRuFgyusaag
 eh0E68vl7zchM+GUE5Azrcqn0Zz1jSqfB5RBPLZ0ip9yMmu0C/NbHKTQttvGeAMwb6fquC+Y/
 rkStbUOUQ3P1mgXaGSW62uyh2tgOfAYyUA/kvA7UV0QbxutSg7FfEnGiELUyeuglzf5Lf9Z+d
 pogZ3YLZAzbSVtOA0cpuxKs5xLQ6jQV+Bn7BWTEv8jV5+57RRVyG5js/yAx17vkZhBOfJj8xj
 OalTFr5Phf+R/4We9GnD4FEPCoVJlQWwgo7zvSBSrABjFUhL0Qn7q2q6GhOmHIbaHMAPr0wrM
 TjB87nP3sWPcjarz050dN2rFlcUrsFv7WFB5u2ZPOtOFmFgXK8GQhzC/+PpFnOCShRIt4mytX
 WaWxYfX1K8Diht98/rfCSNenSODKvR0Q5+INGTCNWlPEQzrELwcE80vh6ppv3O+qleU4qC4Vi
 lTlmcxvdHHnawuNasfVqHpnRUwJ4EyyjdqV46SNsdrd0NKZnEK5yuMRCbqW4Z41nIMDoxK32B
 cKofcSBGnZ08Phnp1bZxe3ecfwvPsgS4AeSQt10HVw==

From: Phil Elwell <phil@raspberrypi.com>

struct remote_event and the related functions remote_event_*() provides
a higher function between ARM core and VPU. It's very helpful for a
reviewer to have explaining comments about these parts.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../interface/vchiq_arm/vchiq_core.c           | 10 ++++++++++
 .../interface/vchiq_arm/vchiq_core.h           | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 45ed30bfdbf5..2571a3742745 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -498,6 +498,7 @@ vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate)
 	vchiq_platform_conn_state_changed(state, oldstate, newstate);
 }
 
+/* This initialises a single remote_event, and the associated wait_queue. */
 static inline void
 remote_event_create(wait_queue_head_t *wq, struct remote_event *event)
 {
@@ -536,6 +537,10 @@ remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
 	return 1;
 }
 
+/*
+ * Acknowledge that the event has been signalled, and wake any waiters. Usually
+ * called as a result of the doorbell being rung.
+ */
 static inline void
 remote_event_signal_local(wait_queue_head_t *wq, struct remote_event *event)
 {
@@ -544,6 +549,7 @@ remote_event_signal_local(wait_queue_head_t *wq, struct remote_event *event)
 	wake_up_all(wq);
 }
 
+/* Check if a single event has been signalled, waking the waiters if it has. */
 static inline void
 remote_event_poll(wait_queue_head_t *wq, struct remote_event *event)
 {
@@ -551,6 +557,10 @@ remote_event_poll(wait_queue_head_t *wq, struct remote_event *event)
 		remote_event_signal_local(wq, event);
 }
 
+/*
+ * VCHIQ used a small, fixed number of remote events. It is simplest to
+ * enumerate them here for polling.
+ */
 void
 remote_event_pollall(struct vchiq_state *state)
 {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 8b4a38f5b3f2..fd6c95e91436 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -166,6 +166,24 @@ struct vchiq_bulk_queue {
 	struct vchiq_bulk bulks[VCHIQ_NUM_SERVICE_BULKS];
 };
 
+/*
+ * Remote events provide a way of presenting several virtual doorbells to a
+ * peer (ARM host to VPU) using only one physical doorbell. They can be thought
+ * of as a way for the peer to signal a semaphore, in this case implemented as
+ * a workqueue.
+ *
+ * Remote events remain signalled until acknowledged by the receiver, and they
+ * are non-counting. They are designed in such a way as to minimise the number
+ * of interrupts and avoid unnecessary waiting.
+ *
+ * A remote_event is as small data structures that live in shared memory. It
+ * comprises two booleans - armed and fired:
+ *
+ * The sender sets fired when they signal the receiver.
+ * If fired is set, the receiver has been signalled and need not wait.
+ * The receiver sets the armed field before they begin to wait.
+ * If armed is set, the receiver is waiting and wishes to be woken by interrupt.
+ */
 struct remote_event {
 	int armed;
 	int fired;
-- 
2.34.1

