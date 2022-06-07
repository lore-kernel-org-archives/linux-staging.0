Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A47F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 18:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D55C385A5;
	Tue,  7 Jun 2022 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624834;
	bh=5bjCs0Jb6YhCJb+AC+LjaNtTWCV4wyc3dEm0P48ZKAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWv8Svhs75Y11i5Bfg7E7f3U/WU2a/b+s2vUqbaSU0kLbs55ioxg70QVudk0Ia0c+
	 A+b/Xyey3kVUMoCD90FtfDxweonn7aiDxujY1Q5N9XBgju9O4pZcS+jDLQMNWRoAkT
	 vAFAezphoCXioGQvOJYi4j7XbCpmgKA2MKjS6ljet9gAiiBTpRWhxbEpUoJXXfHZrZ
	 RDwMY4NxDVHyPGtW9uLFxXUtYrqZaEpHA0+YUxB547+ln4vY0c9H0OLOt3P3X7WBhN
	 Je52rAYOkn3OEATpTYsvyEockGoNEOqZA/hCDXsBpc2V+LVhdyliRYCJX3FSQz2t+7
	 QI4zTuYTSwd9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Duoming Zhou <duoming@zju.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	dan.carpenter@oracle.com,
	baihaowen@meizu.com,
	paskripkin@gmail.com,
	wjsota@gmail.com,
	edumazet@google.com,
	yangyingliang@huawei.com,
	len.baker@gmx.com,
	dave@stgolabs.net,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 07/34] drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
Date: Tue,  7 Jun 2022 13:59:42 -0400
Message-Id: <20220607180011.481266-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607180011.481266-1-sashal@kernel.org>
References: <20220607180011.481266-1-sashal@kernel.org>
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
index 4ff8fd694c60..0154f5791b12 100644
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

