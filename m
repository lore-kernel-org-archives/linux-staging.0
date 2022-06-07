Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77347F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 17:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB70C385A5;
	Tue,  7 Jun 2022 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624747;
	bh=U/JNCbzFYz5H1YnYXfF3XJT4L5e+nT43zDrhKeKSZhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWjp7uvx9bCQw913jhN8mROXcCgH8iYny0hq5kHWzcv87xupf6fTB99sq4fiTf4IC
	 BoiCntGqZkjUlaetydId9VDOzPsY/hyDiClVdlNN0DphsJO9tyPQ6kqtHNzCNn85eB
	 D1lStNiKyCRS8nw7drEOPJps1uofeQuEzJsaHO8XiF7uFBPZUhPa6fcEsH6pLBzL0V
	 HZLBJ+CfwHYeO44spD4DA2PkVn7CGtx3hZatRFVVI7QioQkYpCBYvQxQnOOsSKakq3
	 P8wOzKY0tRA6/6ICHPNzX508sQt2CeOKyittbi3PYh4dTCIqWaPofQz7CARSH5Z5/y
	 kgMCdM+LINEgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Duoming Zhou <duoming@zju.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	dan.carpenter@oracle.com,
	baihaowen@meizu.com,
	len.baker@gmx.com,
	edumazet@google.com,
	dave@stgolabs.net,
	wjsota@gmail.com,
	yangyingliang@huawei.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 08/38] drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
Date: Tue,  7 Jun 2022 13:58:03 -0400
Message-Id: <20220607175835.480735-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175835.480735-1-sashal@kernel.org>
References: <20220607175835.480735-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Duoming Zhou <duoming@zju.edu.cn>

[ Upstream commit 9b6bdbd9337de3917945847bde262a34a87a6303 ]

There is a deadlock in rtllib_beacons_stop(), which is shown
below:

   (Thread 1)              |      (Thread 2)
                           | rtllib_send_beacon()
rtllib_beacons_stop()      |  mod_timer()
 spin_lock_irqsave() //(1) |  (wait a time)
 ...                       | rtllib_send_beacon_cb()
 del_timer_sync()          |  spin_lock_irqsave() //(2)
 (wait timer to stop)      |  ...

We hold ieee->beacon_lock in position (1) of thread 1 and
use del_timer_sync() to wait timer to stop, but timer handler
also need ieee->beacon_lock in position (2) of thread 2.
As a result, rtllib_beacons_stop() will block forever.

This patch extracts del_timer_sync() from the protection of
spin_lock_irqsave(), which could let timer handler to obtain
the needed lock.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
Link: https://lore.kernel.org/r/20220417141641.124388-1-duoming@zju.edu.cn
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e8e72f79ca00..aeb6f015fdda 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -651,9 +651,9 @@ static void rtllib_beacons_stop(struct rtllib_device *ieee)
 	spin_lock_irqsave(&ieee->beacon_lock, flags);
 
 	ieee->beacon_txing = 0;
-	del_timer_sync(&ieee->beacon_timer);
 
 	spin_unlock_irqrestore(&ieee->beacon_lock, flags);
+	del_timer_sync(&ieee->beacon_timer);
 
 }
 
-- 
2.35.1

