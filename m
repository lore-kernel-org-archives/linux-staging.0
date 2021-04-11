Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F06D14
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:29 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MXXhv-1l3L1j2GUB-00Z1hd; Sun, 11 Apr 2021 20:12:24 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 06/10] staging: vchiq_core: improve readability of request_poll
Date: Sun, 11 Apr 2021 20:11:36 +0200
Message-Id: <1618164700-21150-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:AZXwQSQYzLn52CZBBUQmbU9POJauwWenjCB4QJIE/Xd0znLg888
 EEuKVB9nDjh6g5zaq4D7iZeUGmycpueDzRA8gJMlFb+ludg8lNxpaNhG78lV6m25Dhkb2+f
 AUXbGFDsj3AwGi6uqGB6P50HO9XsoGI9UP6i0Mfk8dA78Pa4+YNhh8buvoYrvNmB9rbWczM
 Gy8sjDtZwFOmKdlrPSZ7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bsKSISHKf2A=:r6ZStugTlYzpUOMxqvPSOT
 pHayZEZpfnpdQIKTmYkEuVCYg9d9FsKJNnkhoTne0FU/CT811i1LW6Zi/nFrsLvWqeDCKadSb
 4Zi6DI0rCCCl2HBKQZr7oBwZMQgLif5yXo9DJmbPnU3dLDQj4lkKHnbv7R8rT6VpxIXfqNRZ2
 fU0T8fmLjFE+tb3+/FtQE4L2UfQhMOrVbk+k4la3Ysnjr5sORpkKJJ/A2ejQzBdjbQh/p/k7k
 qrcbBv3DfQMVBaSOtnfUvBlpOoXTC0fft6b/DFQAmcR2vvc3vTGHONF1g7ov1Kf/h9ys6FRak
 wI3Ak5DIkMOuA6pWfyza5JLnqHg8W1aSgkxj6qwI88QcFBqQk0Uf9z4wmIG+jA4raE1AbYn8g
 3DB7DFp32m8SRqwcjWNPxnI7pf7ky5LMLS7vKHUWuRk5kMo4gUo6vGYH6YTgrR8vnlButUshW
 KJp0WqHxFtnZh524RYyOnBk4jabVU8dsgHWPtyv1jfTAV+pTBi9t
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Storing the index for poll services in a local var will increase the
readability of the second loop. Also we get the rid off the checkpatch
issue about the line ending with a square bracket.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index be0ea1e..22989866 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -537,6 +537,7 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	     int poll_type)
 {
 	u32 value;
+	int index;
 
 	if (!service)
 		goto skip_service;
@@ -546,12 +547,11 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 	} while (atomic_cmpxchg(&service->poll_flags, value,
 		 value | BIT(poll_type)) != value);
 
+	index = service->localport >> 5;
 	do {
-		value = atomic_read(&state->poll_services[
-			service->localport>>5]);
-	} while (atomic_cmpxchg(
-		 &state->poll_services[service->localport>>5], value,
-		 value | BIT(service->localport & 0x1f)) != value);
+		value = atomic_read(&state->poll_services[index]);
+	} while (atomic_cmpxchg(&state->poll_services[index],
+		 value, value | BIT(service->localport & 0x1f)) != value);
 
 skip_service:
 	state->poll_needed = 1;
-- 
2.7.4

