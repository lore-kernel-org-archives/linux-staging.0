Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B32CB6
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MY5s5-1mmAtu2RLB-00YVWj; Sun, 23 Jan 2022 21:02:55 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 11/18] staging: vchiq_core: reduce multi-line statements
Date: Sun, 23 Jan 2022 21:02:16 +0100
Message-Id: <1642968143-19281-12-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:bcybrOAsfprv52F3inb7uXUDZfvWIoXzoa6fmgiNgXIl5KiIXZm
 VTwmQU8nMmFWZdaMPi6t+MVi+jmpcIdY/bXzLdircbeAh+kbk2uSOrsPZlTTeE6lSI4moHC
 YxLw3cVPXlqKFE6qzf+lqmUWE8DrMM6w86s8F93k3gXxIiNcpnu6K6fTieM+Mcej4baNc43
 1vsDlnAIt5opv8QGbJySw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6v7vjsEZ3M=:SVl7ZYvxFy0rCdLbHYBCSQ
 ZAa37dEJn/Qa/8hcy7EPdjoXGezwwJoKggw4D6kT/mjj9A3NgM3MhKwhtoKD0q9h3bLqe+1lY
 rf3QeL84ZhJHzAgnhfH1y5sXT5ps55MopjT6A7jjjNWODPlLYgkq+tWx1jBCwyWbFa6VyTFzF
 n4XahHGUcag3hheHcef8AlKL43iheQQfMdDt/HRsqV6bPbIYAujzf9LRft8qdoliO3BKJj7kw
 s0ImFR0/JwgQSuJ/g07fSRe5K0AZUmW+kincX+1MPVfpzjXVLUKZnAhfr20JweS36lEeMIaOk
 7RIhTr4VLKF3yX6ARICqcl6gfNaZXJQPRb0qvS/WGay7aXWnPhAqKw2sCko7kmJ/VBp5X1SGD
 2wS1t1KtnEVSQ69DlMYyqNGZ5AI5A55YMOjcofJGKcJBxWR2TWagbvf1YUgXPMcpzbCJIqjmT
 cUzOW6QzLdlCcFvYMLdmYrstr9SWdIBTNIlmgzTYqOs9vp1f0P3K/EOe0iUxsDbqq+rXT21Ty
 OTJUOMWQdjF8fCh82agWR7eRTOyQZuVQOgqu3VzOfCnsYYGT4T9njaw+WsYy45EKEBgo5X4bM
 jnzOghcAkCRVr9DG8s2I/MzHDnzzkH3AciQgFMzFWTsscaEfbGc6W50lxxClUk2g1te3ci3tu
 3E0fes5ZwzDS1hPmLeqQeQdvz0st6cW7qvecR3y5PasJ1KGoepjAFUzP2SUgSPZw9L3W5zuLx
 T9GCHLnEbRi7uJAS
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In order to improvement readability try to reduce the multi-line statements.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index d861857..fbc44e7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -872,9 +872,8 @@ copy_message_data(ssize_t (*copy_callback)(void *context, void *dest, size_t off
 		ssize_t callback_result;
 		size_t max_bytes = size - pos;
 
-		callback_result =
-			copy_callback(context, dest + pos,
-				      pos, max_bytes);
+		callback_result = copy_callback(context, dest + pos, pos,
+						max_bytes);
 
 		if (callback_result < 0)
 			return callback_result;
@@ -1028,8 +1027,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 
 		if (callback_result < 0) {
 			mutex_unlock(&state->slot_mutex);
-			VCHIQ_SERVICE_STATS_INC(service,
-						error_count);
+			VCHIQ_SERVICE_STATS_INC(service, error_count);
 			return VCHIQ_ERROR;
 		}
 
@@ -1177,8 +1175,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 
 	if (callback_result < 0) {
 		mutex_unlock(&state->slot_mutex);
-		VCHIQ_SERVICE_STATS_INC(service,
-					error_count);
+		VCHIQ_SERVICE_STATS_INC(service, error_count);
 		return VCHIQ_ERROR;
 	}
 
-- 
2.7.4

