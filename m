Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0A72
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:14:32 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N79Ey-1lPVSS2elA-017Yfg; Sat, 15 May 2021 21:14:28 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 20/20] staging: vchiq_core: introduce defines for retry_poll
Date: Sat, 15 May 2021 21:13:50 +0200
Message-Id: <1621106030-30363-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:T9inPfIak7Yb3Tz0GQ5Csh2OxBK+1Zc4ATSKxqRpLaN1aiExGpR
 UJfJfORAve5oKJdU8MiEBlPD2v6Dv7AV8hFNUXKMeGvA/+PzvhDgMDZIvKWRFc/E28V9/Sj
 bFQo79nFUvMRAzKDBAr8IznZPOvTvvj9v6BE0wv65UyqZxqObAQiaBLyU6Gt/RP+d/zwtQq
 pLYQaQItNlfZ4QnmNFZOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J5+4kNmcvQs=:V+HEIR3bo+nZ3IdohOksDY
 8xLpFREIIEs4713UFhk/hPzpr5qVdiBseaT7FEYZZkM9q6ZufRSspeGVXTVv4s/Hxv2pFw94l
 3JojdwZ1tSFOYm2aYIAJhizvAbKK3o7v+z0HH2IwsZUVJ5WLksjtgPS909xmj5sv/hNMiohvg
 kDOyDXKpdICvx8bkn/6b+Us7ba8oGLyNypjOKumj+9Sb1v4Y0xpnsxp6yukHxwtJrqdtCugRS
 f8xKrh+Jtun16svLJKsNkgiFuFyOGQDYvIL/rMWf7ts21WlSM/GdGAfDfM88V1s6vD/95aTi6
 k5Y64NQV4b74Gu77ia9VHMUOR2/64aGo80o90st+FOW4nsvJu6sa3C5oYQ0n1jh2nXQmu+zJ3
 PwTINgaF0TdtXOwGKnRb9wwJJlMd3tnyjRG5qiUEIhtTKcMDloLpLCAIfkMve/H+EJ/SQsq8b
 rWPykxGRs3uKBcBDzazgBlnv/q/IqNxYT74nQRrZKQpn6goZ5wmcQN7egkm10CB2Qq1bi2F9K
 6YHVuUCpGzfzaba2dny++E=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use descriptive defines instead of a number with a comment.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index c22eefc..47bb0af 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -41,6 +41,9 @@
 #define NO_CLOSE_RECVD	0
 #define CLOSE_RECVD	1
 
+#define NO_RETRY_POLL	0
+#define RETRY_POLL	1
+
 struct vchiq_open_payload {
 	int fourcc;
 	int client_id;
@@ -1366,11 +1369,9 @@ poll_services_of_group(struct vchiq_state *state, int group)
 					     VCHIQ_POLL_TERMINATE);
 		}
 		if (service_flags & BIT(VCHIQ_POLL_TXNOTIFY))
-			notify_bulks(service, &service->bulk_tx,
-				     1/*retry_poll*/);
+			notify_bulks(service, &service->bulk_tx, RETRY_POLL);
 		if (service_flags & BIT(VCHIQ_POLL_RXNOTIFY))
-			notify_bulks(service, &service->bulk_rx,
-				     1/*retry_poll*/);
+			notify_bulks(service, &service->bulk_rx, RETRY_POLL);
 		unlock_service(service);
 	}
 }
@@ -1794,7 +1795,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			queue->process++;
 			mutex_unlock(&service->bulk_mutex);
 			DEBUG_TRACE(PARSE_LINE);
-			notify_bulks(service, queue, 1/*retry_poll*/);
+			notify_bulks(service, queue, RETRY_POLL);
 			DEBUG_TRACE(PARSE_LINE);
 		}
 		break;
@@ -2650,11 +2651,11 @@ do_abort_bulks(struct vchiq_service *service)
 	abort_outstanding_bulks(service, &service->bulk_rx);
 	mutex_unlock(&service->bulk_mutex);
 
-	status = notify_bulks(service, &service->bulk_tx, 0/*!retry_poll*/);
+	status = notify_bulks(service, &service->bulk_tx, NO_RETRY_POLL);
 	if (status != VCHIQ_SUCCESS)
 		return 0;
 
-	status = notify_bulks(service, &service->bulk_rx, 0/*!retry_poll*/);
+	status = notify_bulks(service, &service->bulk_rx, NO_RETRY_POLL);
 	return (status == VCHIQ_SUCCESS);
 }
 
-- 
2.7.4

