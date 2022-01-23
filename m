Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60662CAF
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1My2lr-1mME5J28Nz-00zYcd; Sun, 23 Jan 2022 21:02:54 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 08/18] staging: vchiq_core: simplify vchiq_add_service_internal
Date: Sun, 23 Jan 2022 21:02:13 +0100
Message-Id: <1642968143-19281-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:nfCbNZLHAHd6fnfcgTkgpzBGFLD6uUmXluxr+ZVKYKWhp5IL4e9
 SFkYcOetWDJyxnXXCM6lPkffTCUxy13LZvF+cVjD5Sngviq3Vf8XBD+rH5ObzmQLzKOjJSW
 57GOjbZ3tEYiiTvpsqKr7YiyboVhbY1Yo9TjcdAHp2qV2gkHMXzLeQtqag1ylqc9BkqTs8/
 n4/9Kfu1yWSe6DvAwzu2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bHkiPvmDW7U=:bVeI6UUH6ZXQIsK0dfZkIL
 EDkHB/1+6WhOaGVNaUJNfH5crv2wGVWlTTvX3qfvLd34WpLAOW4thAtwWHIQ5cHCgKBzLSkit
 T1oz/5cE0zPxoIYZTMryar/tXSfL7DHhx0nrFiIhn2Raz6kL738TUpEoKDtIQ/AcNviYuh8mI
 XO8buvkA6moP/0ykVg6U3zTtKZR3nomwOjYAIKXdzO7gEuWdxVv0BqOp2u/r+GI5s96mwLFiM
 oTzL83TNoKX9LMDHRoqE7yYEu6fx01MqC1GVmsSQxfelB2744KJraQANruN/xQfjnITVBRno8
 3qUerXGMUR3nBSW+G13T6T6fK5C8AzatYis4GGnI/eE0ywK8xw9pMlGQJ1OZzzQi+sUupJJgF
 WTIRTBvbe6wR4bchF1DYEfWYpvK0eXxEE9e+5g45Fnr9bdaUr+qPdcwxwlJaQdLoORa8yLdGR
 h/di9PQJVj12NUqaRBLsRLtIiAYkdwPCpgQW/upIOWIvWZiesn9TpfwztMERwa6S2QiNH5m3R
 IdTMRPEh/GYtA7ZcNTNEjynm/lxcQ6SeSIArr6q9rhXpv5xofsyMT3otahNa+UxHDl8x5Ui5U
 f80ABRPAs8upZK6A/YRQYS9Vv9zqoY3bAiJp56X0FU+7giK+8mBZMEcLjNQN2u2fFyKYOT/oU
 1rpi3W7MGji8Vi1aFBq96iAINSukoNZ+z9lrWb6pcg4NCQ2khOFNMbzchVb6FXjbZu1vB21qJ
 hFYV1GMA4Lygs4TB
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Better use kzalloc to properly init vchiq_service with zero. As a result
this saves us all the zero assignments.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 23 +---------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 6fa9fee..a13a076 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2097,16 +2097,6 @@ sync_func(void *v)
 	return 0;
 }
 
-static void
-init_bulk_queue(struct vchiq_bulk_queue *queue)
-{
-	queue->local_insert = 0;
-	queue->remote_insert = 0;
-	queue->process = 0;
-	queue->remote_notify = 0;
-	queue->remove = 0;
-}
-
 inline const char *
 get_conn_state_name(enum vchiq_connstate conn_state)
 {
@@ -2371,7 +2361,7 @@ vchiq_add_service_internal(struct vchiq_state *state,
 	if (ret)
 		return NULL;
 
-	service = kmalloc(sizeof(*service), GFP_KERNEL);
+	service = kzalloc(sizeof(*service), GFP_KERNEL);
 	if (!service)
 		return service;
 
@@ -2387,28 +2377,17 @@ vchiq_add_service_internal(struct vchiq_state *state,
 
 	service->public_fourcc = (srvstate == VCHIQ_SRVSTATE_OPENING) ?
 		VCHIQ_FOURCC_INVALID : params->fourcc;
-	service->client_id     = 0;
 	service->auto_close    = 1;
-	service->sync          = 0;
-	service->closing       = 0;
-	service->trace         = 0;
 	atomic_set(&service->poll_flags, 0);
 	service->version       = params->version;
 	service->version_min   = params->version_min;
 	service->state         = state;
 	service->instance      = instance;
-	service->service_use_count = 0;
-	service->msg_queue_read = 0;
-	service->msg_queue_write = 0;
-	init_bulk_queue(&service->bulk_tx);
-	init_bulk_queue(&service->bulk_rx);
 	init_completion(&service->remove_event);
 	init_completion(&service->bulk_remove_event);
 	init_completion(&service->msg_queue_pop);
 	init_completion(&service->msg_queue_push);
 	mutex_init(&service->bulk_mutex);
-	memset(&service->stats, 0, sizeof(service->stats));
-	memset(&service->msg_queue, 0, sizeof(service->msg_queue));
 
 	/*
 	 * Although it is perfectly possible to use a spinlock
-- 
2.7.4

