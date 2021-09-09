Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558E3FE1
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:47:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BF93619A6;
	Thu,  9 Sep 2021 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188056;
	bh=r/XfC9YknuEJTwDT2ObfBukG4ljdVEksqJ+CNLioO00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pi1bFiis1JVsGLgsijPsci6x0Ah63uBffdYjnjEOKO7YRxVMKdcwbYMrqYkgiZrAO
	 0oJpvU9c2zZoidK4CzQYerAwcREYIchjYBs1R6rT1/9zhjgZLpuqe5mWMBIG4jSzMg
	 efWfr7T5ls6t5KK82vPUfwZ9N8WNRbIY3RrHSxQeNDHyjS5OBL83deemGv9eeo0DZI
	 +RBo9GIqhVV1jOWmE2c+dft797kxBE5nVoihyH8PPsoGjbODrzlaL62IOAwznEfENJ
	 21Y7UKJI8jodKXN7i40UMRaEGNuo/sI/FX9FlW5ohTPQHO47JMTuUvZ2sDgidMa8x7
	 ah0G4t2qCUnLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 047/219] media: atomisp: Fix runtime PM imbalance in atomisp_pci_probe
Date: Thu,  9 Sep 2021 07:43:43 -0400
Message-Id: <20210909114635.143983-47-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit 672fe1cf145ab9978c62eb827d6a16aa6b63994b ]

When hmm_pool_register() fails, a pairing PM usage counter
increment is needed to keep the counter balanced. It's the
same for the following error paths.

Link: https://lore.kernel.org/linux-media/20210408081850.24278-1-dinghao.liu@zju.edu.cn
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0295e2e32d79..02f774ed80c8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1815,6 +1815,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	hmm_cleanup();
 	hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
 hmm_pool_fail:
+	pm_runtime_get_noresume(&pdev->dev);
 	destroy_workqueue(isp->wdt_work_queue);
 wdt_work_queue_fail:
 	atomisp_acc_cleanup(isp);
-- 
2.30.2

