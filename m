Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB46D0F
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M27Bp-1lXZRZ1O6z-002UyR; Sun, 11 Apr 2021 20:12:24 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 05/10] staging: vchiq_core: introduce service skip
Date: Sun, 11 Apr 2021 20:11:35 +0200
Message-Id: <1618164700-21150-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:caEYFBel8+f31jJXHKFoOBWMc3nh67VVdpCgb/k09lSXrds3DdD
 sRuYc+WwrY3X8Eg0StlV+W1cT/RgsxaqhJOcU+wrau3awAl798MgUgWKU/SIoC0jjy1JAHt
 7aR1qnPh1oILtEBqZZXBIdG2Kq6PLndFSUiBflWv8qXm0vdE/L3pxYk+HsjTue5dRk19ctc
 3mMaDHXVG3PgTzLWnsfGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k6IpcnXy9F8=:iFzyaeb6qYb900uPhhBb4z
 UBTb5MCCWLIiIsHYNQeXme+LfaDaP3Mp/hrv/V+WSqmZWWzsuXPu5Fsx7+3IY3oACiy3+mLrU
 9JaCLY7REQmvmTA2C6SK/W/Nk4fsQEBYCQ6sCQZ/e5+s9v1nbj8dpAUNvRtED2Pb9QO4TF4up
 Pwrly88LP7xJsruabCCT7ovcmsN+0dHh89pjoMb1CTb9PPWbBPuGwP2O3hQ6kdN2+Pie8wYM/
 L7JyV/PTmqXA7Ix6EA/ZsrnaLZ2ggJSa0QyivU2cqp4wHDLCibO2n1hMKCNG+LqxUln1MFZTY
 Yk91JDj0fOPLXv/ru54lXkrQnxcTlukHkJ0RnrwELU6lN6CKiAFVEDKxtNuB5zP60tzf7NtUP
 eZtYziS2iM2Z3SNWs0ENwY46ZZG/q31wNbLKcr1loe0N6sqb//9Rz6qZmJZYSKNvB1yzrhNXU
 GCzFPTa7ZQneHGqA5OtLhQX0Gy3TXozkOyAjRdOYST6qG7jLmr17
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In case there is no service pointer provided, we can skip these polling.
Use a goto to reduce the indentation, which is necessary for the following
patches. Btw fix the brace alignment of the loops.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 27 +++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e67ba54..be0ea1e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -538,21 +538,22 @@ request_poll(struct vchiq_state *state, struct vchiq_service *service,
 {
 	u32 value;
 
-	if (service) {
-		do {
-			value = atomic_read(&service->poll_flags);
-		} while (atomic_cmpxchg(&service->poll_flags, value,
-			value | BIT(poll_type)) != value);
+	if (!service)
+		goto skip_service;
 
-		do {
-			value = atomic_read(&state->poll_services[
-				service->localport>>5]);
-		} while (atomic_cmpxchg(
-			&state->poll_services[service->localport>>5],
-			value, value | BIT(service->localport & 0x1f))
-			!= value);
-	}
+	do {
+		value = atomic_read(&service->poll_flags);
+	} while (atomic_cmpxchg(&service->poll_flags, value,
+		 value | BIT(poll_type)) != value);
+
+	do {
+		value = atomic_read(&state->poll_services[
+			service->localport>>5]);
+	} while (atomic_cmpxchg(
+		 &state->poll_services[service->localport>>5], value,
+		 value | BIT(service->localport & 0x1f)) != value);
 
+skip_service:
 	state->poll_needed = 1;
 	wmb();
 
-- 
2.7.4

