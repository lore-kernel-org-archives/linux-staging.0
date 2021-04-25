Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CC72F83
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:33 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MYvLi-1m5Om83T8a-00UuNM; Sun, 25 Apr 2021 12:51:28 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 03/11] staging: vchiq_core: return early in do_abort_bulks
Date: Sun, 25 Apr 2021 12:50:55 +0200
Message-Id: <1619347863-16080-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:9e43woZZ7z33KyJWlyqn/UT+FJVwtFGzgHEZFjLlA43N8GCBm+R
 Ec3rFztVZOfBIy4CaBU3iYY/lTb98BzISY5AM5xdB8bEa2zInBk6wEWTnJ/fyjyUd3HVPxL
 azS4deH2VcosDrZdoAJr6sUuh43vQiUBwyp2kj27VZ7CdO/TWiOENPDyf+/FBrAjkrLsbcP
 lrNf75thi1DC4BV8zI/gA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7n8HqMtpGg0=:ClZuRAYM+/oR2P8dWRqk5R
 K2htyomVCUyxqX+ZqkjJr1iG2kFxYfVvFP5ospWCAQbDByZi63mQXCIyAYF8qPYV1WUspsqtN
 SNJUNcd+Bh3YwAkyqTo+tKysjbz6lFXOGGrsNKt2JrOd3ggj7GqFetlz31De6n5O1CRT0Ke2U
 q3MwgkgR1eMTWbbzzDRXSl0FYiyBcDHXMGNhDGuMTD2rch7hxLM+yIyYs+dDuM472MoSxQCTx
 H/s2zHjGpzvXmAxTSziepVRsqKUkCtx9DdkwLZnR+ya/+PYBYpyX0FUtMiNF63AGF0IYkrxBW
 8FQHAPPxMY8AYaEWUb4fvPAk2+A3BWIfQjyIGOxkoVynwyia1xst4CeTnOZVIVM1zuP5HihDA
 +vNt7lXD9mgqwLH8VXfyjA0Nj7kJ1hlAaMBp3+lyMvRKOEkqloDqrmxQs/EJpg8q9hNd1Ebpy
 3Ij/mkgew0Y87+B2L498GiiMKNxv1pSotVxH4u9jZ2qOekfAFvn5Q0sqbOnxvc9+Qh3B8NI5X
 xl1GH9BYf9EZBkriQEIyYw=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Avoid the multiline statement for notify_bulks by return early in
error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8a1e6f5..f13d573 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2622,9 +2622,10 @@ do_abort_bulks(struct vchiq_service *service)
 	mutex_unlock(&service->bulk_mutex);
 
 	status = notify_bulks(service, &service->bulk_tx, 0/*!retry_poll*/);
-	if (status == VCHIQ_SUCCESS)
-		status = notify_bulks(service, &service->bulk_rx,
-			0/*!retry_poll*/);
+	if (status != VCHIQ_SUCCESS)
+		return 0;
+
+	status = notify_bulks(service, &service->bulk_rx, 0/*!retry_poll*/);
 	return (status == VCHIQ_SUCCESS);
 }
 
-- 
2.7.4

