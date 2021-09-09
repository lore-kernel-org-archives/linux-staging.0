Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513113FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 12:00:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FB35615E1;
	Thu,  9 Sep 2021 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188847;
	bh=26cUiET7IwaZ/nPWBAj8dOUe2ufLufxLuyPvQZFnDeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2HJ4epx29wolambnEf2rvmhIB/0JYvVm1aZNxtNYtDzX3b2GW8GoIQZEbpTDvoe/
	 LW9m1LbyYL424WGIGTnkMOh4F2J3GctjVjqulx8uuhcxVA7Q9HDAW9tKIkvOGeI+M2
	 ff9DRirkt3MCFoIJlQ1F+ucgAWda+NEpBPkkFhOE/UWX8wTL4iDfXuuC/udQadIou+
	 6WLl4AAuYmz+zS6Y3C6ZcGpfvNQeuUzAQN+803wx0T4OrTVYchkLEeSwkdvY1I/v+n
	 E2a8HuFFcLr4aTDOksI+RevkXLN0mZPRT+FIEX6r6BWS5tTNPSMQFePhk4KtUngM3G
	 dULfztwIrTJwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 4.9 25/48] staging: ks7010: Fix the initialization of the 'sleep_status' structure
Date: Thu,  9 Sep 2021 07:59:52 -0400
Message-Id: <20210909120015.150411-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909120015.150411-1-sashal@kernel.org>
References: <20210909120015.150411-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 56315e55119c0ea57e142b6efb7c31208628ad86 ]

'sleep_status' has 3 atomic_t members. Initialize the 3 of them instead of
initializing only 2 of them and setting 0 twice to the same variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/d2e52a33a9beab41879551d0ae2fdfc99970adab.1626856991.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/ks7010/ks7010_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 81c46f4d0935..16d2036018e2 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1037,9 +1037,9 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	memset(&priv->wstats, 0, sizeof(priv->wstats));
 
 	/* sleep mode */
+	atomic_set(&priv->sleepstatus.status, 0);
 	atomic_set(&priv->sleepstatus.doze_request, 0);
 	atomic_set(&priv->sleepstatus.wakeup_request, 0);
-	atomic_set(&priv->sleepstatus.wakeup_request, 0);
 
 	trx_device_init(priv);
 	hostif_init(priv);
-- 
2.30.2

