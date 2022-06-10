Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED277C
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 10:08:58 +0000 (UTC)
Received: from fsav413.sakura.ne.jp (fsav413.sakura.ne.jp [133.242.250.112])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25AA8lfX091580;
	Fri, 10 Jun 2022 19:08:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav413.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp);
 Fri, 10 Jun 2022 19:08:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25AA8kYL091576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jun 2022 19:08:46 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a973969d-cfd0-adc8-2651-d299199dbd7b@I-love.SAKURA.ne.jp>
Date: Fri, 10 Jun 2022 19:08:43 +0900
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2] staging: olpc_dcon: Replace flush_scheduled_work() with
 flush_work().
Content-Language: en-US
To: Jens Frederich <jfrederich@gmail.com>,
        Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
References: <faaabb8b-1d69-9ee6-e593-aaa3dc52e05b@I-love.SAKURA.ne.jp>
 <YqLr2psGA7Fp/oby@kroah.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <YqLr2psGA7Fp/oby@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Since "struct dcon_priv" is per a device struct, I assume that
dcon_set_source_sync() needs to wait for only one work associated with
that device. Therefore, wait for only that work using flush_work().

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
using a macro") for background.

Changes in v2:
  Don't try to save lines by merging dcon_set_source() and dcon_set_source_sync(),
  suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.

 drivers/staging/olpc_dcon/olpc_dcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index 7284cb4ac395..71c8992114b4 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -383,7 +383,7 @@ static void dcon_set_source(struct dcon_priv *dcon, int arg)
 static void dcon_set_source_sync(struct dcon_priv *dcon, int arg)
 {
 	dcon_set_source(dcon, arg);
-	flush_scheduled_work();
+	flush_work(&dcon->switch_source);
 }
 
 static ssize_t dcon_mode_show(struct device *dev,
-- 
2.18.4

