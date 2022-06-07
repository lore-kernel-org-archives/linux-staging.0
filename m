Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3677F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DA1C34115;
	Tue,  7 Jun 2022 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624959;
	bh=qldU0Sv45lUi0OHgVAjUVTQCnhPsejX2xCEvURu9IC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BYHclgcb43v4GCo9icaWBh6hArFFqbQyG3lVoMFBAacE+5haY1nr33X0HofHSs395
	 4bidvMKGDLOfhNo7XL9TjHjWLuMwMDJxcIwgwnbvx0dkQWf2WVycTXS+Mo6J6fXUoy
	 rGe7LILnIAGQO2FRrRqr2O0YbsjddxV0oGTjRi2LrjBZMsmCcNf9P/PSJGQ0hDfNXy
	 gIuJYufzt3cRr2jMdDTmHufw75sf2wb2hSEuOvpzunxUSo2ZJ7oP2tWTqqu1RxVvoW
	 +UwtkzvDmFmxWbd0/avIlwO6+Jot6RT6myo76lUL6jjytFahhcB+B4D05BA0gwLN36
	 OLGk8voNjDWlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Duoming Zhou <duoming@zju.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	dan.carpenter@oracle.com,
	baihaowen@meizu.com,
	paskripkin@gmail.com,
	davem@davemloft.net,
	dave@stgolabs.net,
	edumazet@google.com,
	yangyingliang@huawei.com,
	wjsota@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 4.14 05/25] drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
Date: Tue,  7 Jun 2022 14:02:06 -0400
Message-Id: <20220607180229.482040-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607180229.482040-1-sashal@kernel.org>
References: <20220607180229.482040-1-sashal@kernel.org>
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
index e4be85af31e7..1edece694fff 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -654,9 +654,9 @@ static void rtllib_beacons_stop(struct rtllib_device *ieee)
 	spin_lock_irqsave(&ieee->beacon_lock, flags);
 
 	ieee->beacon_txing = 0;
-	del_timer_sync(&ieee->beacon_timer);
 
 	spin_unlock_irqrestore(&ieee->beacon_lock, flags);
+	del_timer_sync(&ieee->beacon_timer);
 
 }
 
-- 
2.35.1

