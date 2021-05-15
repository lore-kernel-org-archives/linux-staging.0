Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD52FB5
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:36 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N49Ul-1lI6zR0kLJ-0105CZ; Sat, 15 May 2021 21:11:20 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 07/20] staging: vchiq_core: avoid indention in poll_services_of_group
Date: Sat, 15 May 2021 21:10:46 +0200
Message-Id: <1621105859-30215-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:2E9owm3rjOO/a99k7958/A0jOvG532R1btxw3/hDT3FPUYuMfA+
 isNtwA8/Gvql0l95iKUmhzAZ1hpTKS6wmwXtfxqRNMTtLpCSGyOSPmN9zrf7ELr91+3R3ys
 vRixtskDZ4ZQs5iyKQpf5OFOuXxbr8FdKsx9MH8h9o6Abb/2+4CTnPusMwtYgBSJMm2TcGB
 aS0AmBYJ/7hwV31K1NmYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RwKZnrGaM3c=:kYOCmVuyC+2Vb5wnaIpFWE
 UtK+ni4wK3cDKy8CoCsgXjqGsQacp2H+CoZ5kGNeeZBfDEiLOKv4w9t7vFQY0qzKNqoY7p8vB
 uJBopQG/H0InCeFok1LJVYGx+O0a7tSewjmPvJh6jqgQCz+QYipDF73ABUHb0cdOL7R7PPPbp
 80Op4Oq8vpsaqz8gXKQa3B6pJMhL1pWGC+jPoHVFkwr56a2gQaZYPDYUMkU43hi1O0IM/r84B
 X6/jlFVeTeF65kMDjk/L21WcNpaXxSdvbJPoaZupU7GVN5wHTe8B6i5K4lGQ60/TB8RqtGLgs
 oHn2R7BPsX2MwXIELbYgkhnrumDFgKtRB5E5DFSmLvk9UkMZGnk4fVbf93Gg6iHobB1ohehZ6
 6HGanlQ8O1Yb1H+AyvDPjLj8/Z3Tva6yb/3aFWoOyvub2b74WbNUspxUrcoebrEh2hDxg6FJi
 QirCwUiWoVn90vIuOYu9FATDCrGKYc8RzwElNLuAB+vt4JkB+DFHnFraWJI/yH1gu/8ifXEXy
 gnMnpLS20eRKelHSYSs0ro=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

By converting the first and the third if statement into continue early
the function poll_services_of_group() can avoid 2 indention levels.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 97 ++++++++++------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3e847d8..b3e81ac 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1325,59 +1325,54 @@ poll_services_of_group(struct vchiq_state *state, int group)
 	int i;
 
 	for (i = 0; flags; i++) {
-		if (flags & BIT(i)) {
-			struct vchiq_service *service =
-				find_service_by_port(state,
-					(group<<5) + i);
-			u32 service_flags;
-
-			flags &= ~BIT(i);
-			if (!service)
-				continue;
-			service_flags =
-				atomic_xchg(&service->poll_flags, 0);
-			if (service_flags &
-				BIT(VCHIQ_POLL_REMOVE)) {
-				vchiq_log_info(vchiq_core_log_level,
-					"%d: ps - remove %d<->%d",
-					state->id, service->localport,
-					service->remoteport);
+		struct vchiq_service *service;
+		u32 service_flags;
 
-				/*
-				 * Make it look like a client, because
-				 * it must be removed and not left in
-				 * the LISTENING state.
-				 */
-				service->public_fourcc =
-					VCHIQ_FOURCC_INVALID;
-
-				if (vchiq_close_service_internal(
-					service, 0/*!close_recvd*/) !=
-					VCHIQ_SUCCESS)
-					request_poll(state, service,
-						VCHIQ_POLL_REMOVE);
-			} else if (service_flags &
-				BIT(VCHIQ_POLL_TERMINATE)) {
-				vchiq_log_info(vchiq_core_log_level,
-					"%d: ps - terminate %d<->%d",
-					state->id, service->localport,
-					service->remoteport);
-				if (vchiq_close_service_internal(
-					service, 0/*!close_recvd*/) !=
-					VCHIQ_SUCCESS)
-					request_poll(state, service,
-						VCHIQ_POLL_TERMINATE);
-			}
-			if (service_flags & BIT(VCHIQ_POLL_TXNOTIFY))
-				notify_bulks(service,
-					&service->bulk_tx,
-					1/*retry_poll*/);
-			if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
-				notify_bulks(service,
-					&service->bulk_rx,
-					1/*retry_poll*/);
-			unlock_service(service);
+		if ((flags & BIT(i)) == 0)
+			continue;
+
+		service = find_service_by_port(state, (group << 5) + i);
+		flags &= ~BIT(i);
+
+		if (!service)
+			continue;
+
+		service_flags = atomic_xchg(&service->poll_flags, 0);
+		if ((service_flags & BIT(VCHIQ_POLL_REMOVE)) == 0)
+			continue;
+
+		vchiq_log_info(vchiq_core_log_level, "%d: ps - remove %d<->%d",
+			       state->id, service->localport,
+			       service->remoteport);
+
+		/*
+		 * Make it look like a client, because
+		 * it must be removed and not left in
+		 * the LISTENING state.
+		 */
+		service->public_fourcc = VCHIQ_FOURCC_INVALID;
+
+		if (vchiq_close_service_internal(service, 0/*!close_recvd*/) !=
+						 VCHIQ_SUCCESS) {
+			request_poll(state, service, VCHIQ_POLL_REMOVE);
+		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
+			vchiq_log_info(vchiq_core_log_level,
+				"%d: ps - terminate %d<->%d",
+				state->id, service->localport,
+				service->remoteport);
+			if (vchiq_close_service_internal(
+				service, 0/*!close_recvd*/) !=
+				VCHIQ_SUCCESS)
+				request_poll(state, service,
+					     VCHIQ_POLL_TERMINATE);
 		}
+		if (service_flags & BIT(VCHIQ_POLL_TXNOTIFY))
+			notify_bulks(service, &service->bulk_tx,
+				     1/*retry_poll*/);
+		if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
+			notify_bulks(service, &service->bulk_rx,
+				     1/*retry_poll*/);
+		unlock_service(service);
 	}
 }
 
-- 
2.7.4

