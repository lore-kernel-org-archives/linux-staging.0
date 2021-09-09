Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD833FE2
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:47:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C47D261994;
	Thu,  9 Sep 2021 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631188057;
	bh=vJf/hOLRbSjBB5md0JjqiGgNpfTuhUqJ4jPhXj65f/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sj5CLv192c2vSJG3G2pk5+OG2KMjpZvWbpo1S7P+T7w3J+Hyrk6ykuJfuZYRtKPBm
	 1SZXsF3T8EofG7RCGGxLE66VP7Brv/uJO5z+rPc7AWMS0AQdZP8pN5B+UuzaL+xPiq
	 ydX+mWxQjdlh6I7O6J+uSFmja8sV9MSdVhqh5iQbUhFx4cb3yj+ly52spewCrg4bMj
	 LndA8TfL5hC/rB4FUGhkBAD/iyuQtQh4ucEBvYJlRGJU0OpqAYZp0xos8IbdA2JaZZ
	 d5HKkEpDdw9NOL0pqZcapYlm41HnER5ddT5r/YvTV71aPkP8zmCu9p8FWeDRDrFndb
	 YrJcb7QcxzBUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Hulk Robot <hulkci@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.13 048/219] media: atomisp: pci: fix error return code in atomisp_pci_probe()
Date: Thu,  9 Sep 2021 07:43:44 -0400
Message-Id: <20210909114635.143983-48-sashal@kernel.org>
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

