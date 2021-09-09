Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170E3FE3
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:52:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A8161B28;
	Thu,  9 Sep 2021 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188324;
	bh=vJf/hOLRbSjBB5md0JjqiGgNpfTuhUqJ4jPhXj65f/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjDwOQol4jsJrYqQDjQAoGY0ThdvtXv79CfxUNIpTZI9GFcB01sIH5df7iUGhHSPM
	 PRVuv3UeLIKzowIH0h1kb1qf7agVE812sP/59g/WTl7tDv69zAk6iqCF5JaHTF8wN5
	 bbblfM2R5AUcEDMBi4oX7THho1LrCsem4I2LYh4iHTxttGmAs3CaFvo3F1WbiVw7kp
	 jj4sLTtQTyLwWmpd3kgXvT1NS8n8kAma/YT0VgTtzfuGBj/aBVs2AZEpMvc2jomi4x
	 BLcuUFVXKknrSQrTXLaSekf3h78Aa6RvijabuEL1uihfHMS6EN9mmVFH7zLUPdOwX8
	 HsITrDeQnGoMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Hulk Robot <hulkci@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 036/176] media: atomisp: pci: fix error return code in atomisp_pci_probe()
Date: Thu,  9 Sep 2021 07:48:58 -0400
Message-Id: <20210909115118.146181-36-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit d14e272958bdfdc40dcafb827d24ba6fdafa9d52 ]

If init_atomisp_wdts() fails, atomisp_pci_probe() need return
error code.

Link: https://lore.kernel.org/linux-media/20210617072329.1233662-1-yangyingliang@huawei.com
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 02f774ed80c8..fa1bd99cd6f1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1763,7 +1763,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (err < 0)
 		goto register_entities_fail;
 	/* init atomisp wdts */
-	if (init_atomisp_wdts(isp) != 0)
+	err = init_atomisp_wdts(isp);
+	if (err != 0)
 		goto wdt_work_queue_fail;
 
 	/* save the iunit context only once after all the values are init'ed. */
-- 
2.30.2

