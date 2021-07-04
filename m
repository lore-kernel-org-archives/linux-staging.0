Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7872
	for <linux-staging@lists.linux.dev>; Sun,  4 Jul 2021 23:04:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBC0D611ED;
	Sun,  4 Jul 2021 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625439865;
	bh=HZKz708QQAe/6KtyqJ8F5LJ5x4ZN6OM3xsa305vbhbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGHZa8bPLqZiNLsIxNIXKndxpcwR2kDs+F2W0hvoFnhoXmAYp9IOOVs7/wouRxcze
	 XQX5HntVzAECi0jFkcDATtV+AQNTrWuhhDgKsiJ+RZFhQXIwRoQ8Ktyi45a9ijJa5o
	 H43+j00KUk1gqQcyVc57oLVapzMTx7oEDwAQGk4VTRJMUmTROvkh2Mbi1iIZ222B/I
	 61pEKzkqHfT8HAKpwt95S+ez+sFrvUUl5GDyfQakUbcU6ruLTKQnS4qK6YGWwd9GP5
	 hLb1WMn8fOIniUx5mMlar/UvuQcnkf2LoENgo9j/UGTX855B7gcatsvaDXyrqKLX+G
	 mcrT5S6qCrIMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 03/85] staging: media: rkvdec: fix pm_runtime_get_sync() usage count
Date: Sun,  4 Jul 2021 19:02:58 -0400
Message-Id: <20210704230420.1488358-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230420.1488358-1-sashal@kernel.org>
References: <20210704230420.1488358-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit e90812c47b958407b54d05780dc483fdc1b57a93 ]

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d821661d30f3..8c17615f3a7a 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -658,7 +658,7 @@ static void rkvdec_device_run(void *priv)
 	if (WARN_ON(!desc))
 		return;
 
-	ret = pm_runtime_get_sync(rkvdec->dev);
+	ret = pm_runtime_resume_and_get(rkvdec->dev);
 	if (ret < 0) {
 		rkvdec_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
 		return;
-- 
2.30.2

