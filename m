Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F870
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJUy-1l7lds1gvs-00jLjg; Thu, 03 Jun 2021 17:50:48 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 01/16] staging: vchiq_core: fix logic in poll_services_of_group
Date: Thu,  3 Jun 2021 17:49:50 +0200
Message-Id: <1622735405-9980-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:H+AqxlrtCVwCayuWoXw2J+ecfFGI0camiY1sO8cOHKfbv2PTcJ3
 X3Ypf4gaU2MfknylrJeA7HNvODwLxWXjNRLbuVFI0tn19x+VAZyX/xLTQPAcNrtwapPLOgj
 QHr8sRjCAgHCHCamXOj69+nePxZ64wnJ3IJw4UJXieKcnUT2lE92Sa37SpwdyWXRqN7ufUv
 YpYwGTAGIMhkE+OkOUWWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o0X9NjRQpkc=:iaLpBdTqCQuiP3ttvqMHOR
 rC4Ilx44mGPwEBbkwLcaec7TpbwfMlZSTGv2EUeRBKpaoRfg7UKPtOiKCksLOO06oJJxKP2pp
 FFxzxBTKlKCGAgaZ68Z+uanBNlbXgVqzFo3i88NTgqLCKnc2VVl7PhQHYIgqQMkaFG1j9rUJ2
 BGBSxJj4CneD/vxXTjG1pjLBkx6ktCP7IUG1pBI1qoP8hlri9fT3URogD4wSNSwtjTBjLf4kA
 oTXjimlXObPXnEXScnjCRSihOP4ksgTGoEEWdTeqJLgjP2d/R7iM/TD5SWgFFH4KQ7Au4MMgX
 StMOKtKarPta3iSK/DzuOZxc7PIefXe/qYu7PtFQzYyZL/OjLCK133+vZqYOfwCzq6lUUuKqB
 eQCmwTbVRxR84xbwIPOFlmNtqY6bk8HOwSKSqfCpXNfy/hTZDyIOOh+7UoY3aQpVRihqdeU7V
 HCa/+OOt38EIgmSMkb0FFpedRs1ZX2Tyg3KSr3mNwOUBsnccwctx/W+mB1YKzZaP8viVyEh12
 ZsSzGRREkSx69JGTWCj+ZA=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit "staging: vchiq_core: avoid indention in poll_services_of_group"
tries to reduce the indention, but the parts regarding the third if statement
breaks the logic. So restore them and prevent vchiq_test from hanging during
the ping test.

Fixes: 2f440843a7d4 ("staging: vchiq_core: avoid indention in poll_services_of_group")
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 28 ++++++++++------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 47bb0af..bc6e123 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1340,23 +1340,21 @@ poll_services_of_group(struct vchiq_state *state, int group)
 			continue;
 
 		service_flags = atomic_xchg(&service->poll_flags, 0);
-		if ((service_flags & BIT(VCHIQ_POLL_REMOVE)) == 0)
-			continue;
-
-		vchiq_log_info(vchiq_core_log_level, "%d: ps - remove %d<->%d",
-			       state->id, service->localport,
-			       service->remoteport);
+		if (service_flags & BIT(VCHIQ_POLL_REMOVE)) {
+			vchiq_log_info(vchiq_core_log_level, "%d: ps - remove %d<->%d",
+				       state->id, service->localport,
+				       service->remoteport);
 
-		/*
-		 * Make it look like a client, because
-		 * it must be removed and not left in
-		 * the LISTENING state.
-		 */
-		service->public_fourcc = VCHIQ_FOURCC_INVALID;
+			/*
+			 * Make it look like a client, because
+			 * it must be removed and not left in
+			 * the LISTENING state.
+			 */
+			service->public_fourcc = VCHIQ_FOURCC_INVALID;
 
-		if (vchiq_close_service_internal(service, NO_CLOSE_RECVD) !=
-						 VCHIQ_SUCCESS) {
-			request_poll(state, service, VCHIQ_POLL_REMOVE);
+			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD) !=
+							 VCHIQ_SUCCESS)
+				request_poll(state, service, VCHIQ_POLL_REMOVE);
 		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
 			vchiq_log_info(vchiq_core_log_level,
 				"%d: ps - terminate %d<->%d",
-- 
2.7.4

