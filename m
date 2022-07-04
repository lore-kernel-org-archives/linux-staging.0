Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E015A3
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 02:24:33 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id BBA941E80C90;
	Mon,  4 Jul 2022 10:22:32 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZLW950-QA4D; Mon,  4 Jul 2022 10:22:30 +0800 (CST)
Received: from node1.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 2BAA61E80C96;
	Mon,  4 Jul 2022 10:22:30 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] staging/media/av7110/av7110: Fix typo in string
Date: Mon,  4 Jul 2022 10:24:10 +0800
Message-Id: <20220704022410.3022-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove the repeated ',' from string

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/staging/media/av7110/av7110_av.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index ab7cf496b454..0bf513c26b6b 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -106,7 +106,7 @@ int av7110_av_start_record(struct av7110 *av7110, int av,
 	int ret = 0;
 	struct dvb_demux *dvbdmx = dvbdmxfeed->demux;
 
-	dprintk(2, "av7110:%p, , dvb_demux_feed:%p\n", av7110, dvbdmxfeed);
+	dprintk(2, "av7110:%p, dvb_demux_feed:%p\n", av7110, dvbdmxfeed);
 
 	if (av7110->playing || (av7110->rec_mode & av))
 		return -EBUSY;
-- 
2.18.2

