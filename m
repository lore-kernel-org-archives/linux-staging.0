Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBB70
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 09:42:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B2861106;
	Wed,  5 May 2021 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620207738;
	bh=Ge/Ah7ICxGTEtJ+zpzc3S/dZD8dc9zPvBoOlbXMznLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKdc/dLsQD5sO9k0fCMqOXnJ7qgJpGvzD3Kqmvh7aGjc+vOIc7pwwIUP3UwHCZ3GO
	 nNL/E4OfhDT7M9e/GRXA7RfzmmBq8Amn1JODFN6yHTUIO8Ybviylgr6qLMEYV1DvsO
	 U9Kigw+mIcaBTfuHrNCTPfmiE/R/P1RPhWBCqTNa7CbzP78Lw58K1NP5ulzghcukiN
	 BzOr6k86KO6+W32Wnxg31jRaVclTzaBLR4tJuk5htHWTwaof4PXDRRPd/pVrz+DjiZ
	 y2jjAPEfhLEtVj8Z5tSbwbNdY0VsI9rN3LT6wwxP4ljHZA6sfD42vFsqQH44Skxa0h
	 BmNrU6nJGCccw==
Received: by mail.kernel.org with local (Exim 4.94)
	(envelope-from <mchehab@kernel.org>)
	id 1leE2q-00AHvr-Jj; Wed, 05 May 2021 11:42:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/25] staging: media: rkvdec: fix pm_runtime_get_sync() usage count
Date: Wed,  5 May 2021 11:41:51 +0200
Message-Id: <dd3294f2d2777d41a27b4244f077f440df49a408.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

