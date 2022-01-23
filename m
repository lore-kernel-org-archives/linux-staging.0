Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51202CB7
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MplHR-1mUN2A3ePd-00qAw5; Sun, 23 Jan 2022 21:02:55 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 12/18] staging: vchiq_core: fix alignment
Date: Sun, 23 Jan 2022 21:02:17 +0100
Message-Id: <1642968143-19281-13-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:dvHs22P9OF1yM+4JOTHGPfQfNvQ9+v5tQ+CC7g2qsrvq1yuTAWv
 EaPIUp3IjnBwgYDZz5jsn+DXiIHxoyzVcyeY28zwym+m+PZUI4Z2hsX3Pa9IXS+VSTALZTc
 kqX2blf5ZuIDJVeQPRht36GsMwVlEENcu08YTLaw19zz6xE5ZmxiTMLIVprnu1fYSfGsXYh
 K2NlDYN00pUTZBOK5OKPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mxOUJyeiSbM=:mdjRAK5CoR3V7Hx7J73Zku
 ONhh02EfbgpezbpDHf8YQFaTYlGVEObn8kGrri+aIfyHyWEWf4Hl95sYmnaIpejdnPPqd7q9n
 SsT9i1aJPOltCBvWG8aKhsLsVIBUQKQYRg0kj9iGm8prt1E09yoE/JYJ2fqo3+2CxK8VWrfbq
 /izmpsR3ILT9MLjF6S6H/14xrwtYnN0VzmAVd0q6k9FwWiWR3XDzbo1B7Au5e2NmZOB1/V2Fm
 UlwpDreo+rMZB42qsJ9riq8/WjFc27dP/Uga4SYE3o2JbXOY/4sPoNTZ/NU98HGdgV9lwMF0s
 vJ0NdZhoiObSS7jkudp+7kXP+v6uLDVKIk3muyNv/f8TzYQlowZW6esQBtmwCHP3lK/6e7GGX
 yfdW6ivfgV2IL1rScouAYes1IfxbB7apdblke1vnk4O0yUD8eOAr06Gml8M12z/bi1GZWhyMO
 3lJf+vo+No+xh8z6ccDUjGMZzOzEoB+2xf3vY4aK/C1XFmtHjlDEpTDqvhUPIgEStcC1jL9oo
 t2us+nAW/B7/uBYkl1odABPMeFRY43Yxo/nisEolBbCBfoiBNMK5WKhqF9fb8cQU/ygIjQ7dm
 0kYiDaLke06Qs6yw0b9aQx2VwuTJtafGySqPd8jHs9vKGYsJy+weWNVC+S3ung20h//N1lA2u
 DeZMIzUNgRGCtkjrsrZRGEASxPf42ObreiAcv1bQIFmkRRaF6St4nm+zKeVG8QRjl+JFC0hTa
 9kjMdiZFkIwIMiAQ
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fixes some alignment found by checkpatch.pl.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index fbc44e7..7e901be 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2687,8 +2687,7 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 			} else {
 				service->client_id = 0;
 				service->remoteport = VCHIQ_PORT_FREE;
-				if (service->srvstate ==
-					VCHIQ_SRVSTATE_CLOSEWAIT)
+				if (service->srvstate == VCHIQ_SRVSTATE_CLOSEWAIT)
 					set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
 			}
 			complete(&service->remove_event);
@@ -2893,7 +2892,7 @@ vchiq_close_service(unsigned int handle)
 		status = vchiq_close_service_internal(service, NO_CLOSE_RECVD);
 		WARN_ON(status == VCHIQ_RETRY);
 	} else {
-	/* Mark the service for termination by the slot handler */
+		/* Mark the service for termination by the slot handler */
 		request_poll(service->state, service, VCHIQ_POLL_TERMINATE);
 	}
 
-- 
2.7.4

