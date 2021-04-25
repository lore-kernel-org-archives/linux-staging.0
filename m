Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB42FA6
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:40 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvaSG-1lIXmJ0JEM-00sfc6; Sun, 25 Apr 2021 12:51:29 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 04/11] staging: vchiq_core: introduce get_bulk_reason
Date: Sun, 25 Apr 2021 12:50:56 +0200
Message-Id: <1619347863-16080-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:11NuxuH7mFGkK//fKAUurzc80h1s9JEVylP+O4Ws/mvV0ekGUJN
 8sJTIjG+Fxj7w+Vdg7FzP/Z/hDS3zmtXJbP4+j2zQZBs+TlmQ4ydLftYCz5Md6veTPPvXUl
 hq/gdHYzgn8ywskX7oL8LVHMwGYtUpzPEh3kVC6sAEH4vLJoaXJdKpNgSYQITRSFJfOKZDm
 TZ9ZRWY2KfJw1SPMxAkJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EGmY7Qnv3eM=:FQh9T4fYW2Lb2GKtHluWUx
 F7uahNyRVjFpx+ucGEIuqjnYbYif1rA4ExEF/M2u5srvIutbwadAsVsGk94sYfd4V7cy6JN3F
 B+cl/HOkSPXhzm5bw9UrtGGWU2Lqz7du1yxIM6dEWTFQlA9YN4pyA3U7bt40fBrR3vq88G26v
 K653plBp93zopzsRv9I0tDgaDiMQ6HbCqLEt+YAY78bxsf6SWKz3M85+IvvZxDrldtoeBzNby
 GNZAzkRokMCkk81sWNrYppp3NzWPwnzQsLueI/SsVzayrWiaDNrxMcOPB9XixIZHXXQEZvE3F
 reJE+0N1HfDlOBE4uwtmT8gORzn6/lb0Mirjvc938VQL6DExxeCqGP6Eoz2ZZlTmayAxxmI7+
 IerhrJjUP5V8oWqYSIAMwuNr5h2Jip7gcG0kcXv9RmZth2GCN/hu7F0dSZvki0INMZ2pQiJgW
 J+hKO4ZVcsim3NW6H0ULkQ/uWX8vbx3UY35D4qcAVCPbfs2/GxgSjdf0km7ysZhM62sB0mieD
 PEiqeYzBoFEfzHxJKu3K0g=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Nesting multiple ternary operators over multiple lines isn't easy to
read. Move this logic into a separate inline function.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f13d573..3a72c36 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1226,6 +1226,22 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 	mutex_unlock(&state->recycle_mutex);
 }
 
+static inline enum vchiq_reason
+get_bulk_reason(struct vchiq_bulk *bulk)
+{
+	if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
+		if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+			return VCHIQ_BULK_TRANSMIT_ABORTED;
+
+		return VCHIQ_BULK_TRANSMIT_DONE;
+	}
+
+	if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+		return VCHIQ_BULK_RECEIVE_ABORTED;
+
+	return VCHIQ_BULK_RECEIVE_DONE;
+}
+
 /* Called by the slot handler - don't hold the bulk mutex */
 static enum vchiq_status
 notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
@@ -1281,16 +1297,8 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 					spin_unlock(&bulk_waiter_spinlock);
 				} else if (bulk->mode ==
 					VCHIQ_BULK_MODE_CALLBACK) {
-					enum vchiq_reason reason = (bulk->dir ==
-						VCHIQ_BULK_TRANSMIT) ?
-						((bulk->actual ==
-						VCHIQ_BULK_ACTUAL_ABORTED) ?
-						VCHIQ_BULK_TRANSMIT_ABORTED :
-						VCHIQ_BULK_TRANSMIT_DONE) :
-						((bulk->actual ==
-						VCHIQ_BULK_ACTUAL_ABORTED) ?
-						VCHIQ_BULK_RECEIVE_ABORTED :
-						VCHIQ_BULK_RECEIVE_DONE);
+					enum vchiq_reason reason =
+							get_bulk_reason(bulk);
 					status = make_service_callback(service,
 						reason,	NULL, bulk->userdata);
 					if (status == VCHIQ_RETRY)
-- 
2.7.4

