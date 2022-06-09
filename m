Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6287C
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 06:41:12 +0000 (UTC)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2595qleU011596;
	Thu, 9 Jun 2022 14:52:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Thu, 09 Jun 2022 14:52:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2595qkUX011587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 9 Jun 2022 14:52:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <faaabb8b-1d69-9ee6-e593-aaa3dc52e05b@I-love.SAKURA.ne.jp>
Date: Thu, 9 Jun 2022 14:52:46 +0900
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jens Frederich <jfrederich@gmail.com>,
        Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] staging: olpc_dcon: Replace flush_scheduled_work() with
 flush_work().
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This driver defines dcon_set_source() and dcon_set_source_sync(), where
the latter calls flush_scheduled_work() which we want to remove.

Since "struct dcon_priv" is per a device struct, I assume that
dcon_set_source_sync() needs to wait for only one work associated with
that device. Therefore, add bool argument to dcon_set_source() and
wait for only one work using flush_work().

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
using a macro") for background.

 drivers/staging/olpc_dcon/olpc_dcon.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index 7284cb4ac395..e0b1c91bb1a7 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -369,21 +369,18 @@ static void dcon_source_switch(struct work_struct *work)
 	dcon->curr_src = source;
 }
 
-static void dcon_set_source(struct dcon_priv *dcon, int arg)
+static void dcon_set_source(struct dcon_priv *dcon, int arg, bool sync)
 {
 	if (dcon->pending_src == arg)
-		return;
+		goto flush;
 
 	dcon->pending_src = arg;
 
 	if (dcon->curr_src != arg)
 		schedule_work(&dcon->switch_source);
-}
-
-static void dcon_set_source_sync(struct dcon_priv *dcon, int arg)
-{
-	dcon_set_source(dcon, arg);
-	flush_scheduled_work();
+flush:
+	if (sync)
+		flush_work(&dcon->switch_source);
 }
 
 static ssize_t dcon_mode_show(struct device *dev,
@@ -459,13 +456,13 @@ static ssize_t dcon_freeze_store(struct device *dev,
 
 	switch (output) {
 	case 0:
-		dcon_set_source(dcon, DCON_SOURCE_CPU);
+		dcon_set_source(dcon, DCON_SOURCE_CPU, false);
 		break;
 	case 1:
-		dcon_set_source_sync(dcon, DCON_SOURCE_DCON);
+		dcon_set_source(dcon, DCON_SOURCE_DCON, true);
 		break;
 	case 2:  /* normally unused */
-		dcon_set_source(dcon, DCON_SOURCE_DCON);
+		dcon_set_source(dcon, DCON_SOURCE_DCON, false);
 		break;
 	default:
 		return -EINVAL;
@@ -699,7 +696,7 @@ static int dcon_suspend(struct device *dev)
 
 	if (!dcon->asleep) {
 		/* Set up the DCON to have the source */
-		dcon_set_source_sync(dcon, DCON_SOURCE_DCON);
+		dcon_set_source(dcon, DCON_SOURCE_DCON, true);
 	}
 
 	return 0;
@@ -712,7 +709,7 @@ static int dcon_resume(struct device *dev)
 
 	if (!dcon->asleep) {
 		dcon_bus_stabilize(dcon, 0);
-		dcon_set_source(dcon, DCON_SOURCE_CPU);
+		dcon_set_source(dcon, DCON_SOURCE_CPU, false);
 	}
 
 	return 0;
-- 
2.18.4

