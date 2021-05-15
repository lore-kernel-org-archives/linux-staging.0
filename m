Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC72FB7
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:24 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtOX2-1lURJp4ARy-00utai; Sat, 15 May 2021 21:11:20 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 06/20] staging: vchiq_core: introduce poll_services_of_group
Date: Sat, 15 May 2021 21:10:45 +0200
Message-Id: <1621105859-30215-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:776M6QL/+dA7kEqYRbNaO4OA8ssjCVLQ8d2R5j2SV/c+om+jP5p
 S5EjPnzY5UkXzG9eXgQGNuB19ZakDmyLJB1J2ZsaOXQ8BQbwG8clSFxa72U9g/4RISKyG2o
 1SDCNrlec/lfGx7X7oddA3I5cCJg/J+rw/8YPGVdzko0cZ9rUNROKrBqQp30IxKor7Bu6oc
 QyGWcMoWDdaagbYDW0J4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:maG0GE7s43Q=:N6k7Iuu/eoxnxIqwdHPB1I
 Qsmu2oAltn6rIiI5ICWwwCmCk1svwDZVAme5wAjFeNlnR9a+MQ0LEp8Fn/MupnL64ySTpSsFH
 vRkAE9HqbkV+p/y6jKMekyuOrZJm2F8JNVnslsXlEUVB51+1ws7sC9ABcVmBDk4OQD7j72eeW
 XaPXW+FuL9RRmiIb7NuP05zoblrpJK8llyishRRDFtFV6PqHBXdTGkaFr9IZK24S6k8n2mzE8
 KL+eXc9MAjOeW9pSsM8/R0Gj0GHACLzRSLLmu54XeLkgVCiAMII2Ql/WeXtj1W9SoYFzJmfqH
 VoDBVs1hIgedrRrxW+6W5hwfgK8fFb3GlzIxyaSYAPw8BiWSi2Sh5/Ixs7QKSgnRdctX0iszd
 S6rgRWe0C0tLqLsWwGiRxpJytZxeOSEggGqNkL0oVcCx5jKTgZHciR2IeA1ohFXNZbMHlQq6E
 Xq/Qe/mRI7B38eljAvh03Cfs9FnPec3M66DakKMzzfEEPnB59bHbMcEtOOi1l0yl2dzzpfFzb
 m+uo1Th7u5l6HwMEA6SCPo=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function poll_services() has too many indention levels. So keep only
the group iteration loop and move the rest into a new function
poll_services_of_group().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 125 +++++++++++----------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2a83c2a..3e847d8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1318,74 +1318,79 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 	return status;
 }
 
-/* Called by the slot handler thread */
 static void
-poll_services(struct vchiq_state *state)
+poll_services_of_group(struct vchiq_state *state, int group)
 {
-	int group, i;
-
-	for (group = 0; group < BITSET_SIZE(state->unused_service); group++) {
-		u32 flags;
-
-		flags = atomic_xchg(&state->poll_services[group], 0);
-		for (i = 0; flags; i++) {
-			if (flags & BIT(i)) {
-				struct vchiq_service *service =
-					find_service_by_port(state,
-						(group<<5) + i);
-				u32 service_flags;
-
-				flags &= ~BIT(i);
-				if (!service)
-					continue;
-				service_flags =
-					atomic_xchg(&service->poll_flags, 0);
-				if (service_flags &
-					BIT(VCHIQ_POLL_REMOVE)) {
-					vchiq_log_info(vchiq_core_log_level,
-						"%d: ps - remove %d<->%d",
-						state->id, service->localport,
-						service->remoteport);
+	u32 flags = atomic_xchg(&state->poll_services[group], 0);
+	int i;
 
-					/*
-					 * Make it look like a client, because
-					 * it must be removed and not left in
-					 * the LISTENING state.
-					 */
-					service->public_fourcc =
-						VCHIQ_FOURCC_INVALID;
-
-					if (vchiq_close_service_internal(
-						service, 0/*!close_recvd*/) !=
-						VCHIQ_SUCCESS)
-						request_poll(state, service,
-							VCHIQ_POLL_REMOVE);
-				} else if (service_flags &
-					BIT(VCHIQ_POLL_TERMINATE)) {
-					vchiq_log_info(vchiq_core_log_level,
-						"%d: ps - terminate %d<->%d",
-						state->id, service->localport,
-						service->remoteport);
-					if (vchiq_close_service_internal(
-						service, 0/*!close_recvd*/) !=
-						VCHIQ_SUCCESS)
-						request_poll(state, service,
-							VCHIQ_POLL_TERMINATE);
-				}
-				if (service_flags & BIT(VCHIQ_POLL_TXNOTIFY))
-					notify_bulks(service,
-						&service->bulk_tx,
-						1/*retry_poll*/);
-				if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
-					notify_bulks(service,
-						&service->bulk_rx,
-						1/*retry_poll*/);
-				unlock_service(service);
+	for (i = 0; flags; i++) {
+		if (flags & BIT(i)) {
+			struct vchiq_service *service =
+				find_service_by_port(state,
+					(group<<5) + i);
+			u32 service_flags;
+
+			flags &= ~BIT(i);
+			if (!service)
+				continue;
+			service_flags =
+				atomic_xchg(&service->poll_flags, 0);
+			if (service_flags &
+				BIT(VCHIQ_POLL_REMOVE)) {
+				vchiq_log_info(vchiq_core_log_level,
+					"%d: ps - remove %d<->%d",
+					state->id, service->localport,
+					service->remoteport);
+
+				/*
+				 * Make it look like a client, because
+				 * it must be removed and not left in
+				 * the LISTENING state.
+				 */
+				service->public_fourcc =
+					VCHIQ_FOURCC_INVALID;
+
+				if (vchiq_close_service_internal(
+					service, 0/*!close_recvd*/) !=
+					VCHIQ_SUCCESS)
+					request_poll(state, service,
+						VCHIQ_POLL_REMOVE);
+			} else if (service_flags &
+				BIT(VCHIQ_POLL_TERMINATE)) {
+				vchiq_log_info(vchiq_core_log_level,
+					"%d: ps - terminate %d<->%d",
+					state->id, service->localport,
+					service->remoteport);
+				if (vchiq_close_service_internal(
+					service, 0/*!close_recvd*/) !=
+					VCHIQ_SUCCESS)
+					request_poll(state, service,
+						VCHIQ_POLL_TERMINATE);
 			}
+			if (service_flags & BIT(VCHIQ_POLL_TXNOTIFY))
+				notify_bulks(service,
+					&service->bulk_tx,
+					1/*retry_poll*/);
+			if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
+				notify_bulks(service,
+					&service->bulk_rx,
+					1/*retry_poll*/);
+			unlock_service(service);
 		}
 	}
 }
 
+/* Called by the slot handler thread */
+static void
+poll_services(struct vchiq_state *state)
+{
+	int group;
+
+	for (group = 0; group < BITSET_SIZE(state->unused_service); group++)
+		poll_services_of_group(state, group);
+}
+
 /* Called with the bulk_mutex held */
 static void
 abort_outstanding_bulks(struct vchiq_service *service,
-- 
2.7.4

