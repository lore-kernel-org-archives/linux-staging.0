Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887C03FE4
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:42:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E65C61211;
	Thu,  9 Sep 2021 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631187738;
	bh=gt5BgoMf7PUKbuUKs8Clt7Gaku57zTSihOUxXKz1r40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dke46iL8mQAobT72XVJCZOt6fGlOGrJ9YlUiE44xoI82wavDJbGcGsWfp+tJ8X28s
	 x8mOLmDgFU822fn4YmGJK+xI7qQkV9aZ+/9YZUko/jS/0aJaWdbECPGOv5sSM/gP3J
	 JGE/FS5m/1vSkduI0YejMWYuL1Kzk3k6lTcQl4JxN3Lpbhw79XtiQZQqoGWYrO4gxx
	 l2t3tS2SeHxj/e6oTir8thv6OQXdlk9RZ/6tjqQLdZBGlIbQvptHwd1PIx/9QtLyJg
	 +Z24rdl3ApAnRifOAm6JoeZiIgmjnCkEEttjyZKE8+KZAxdzc5JgAcND20kKfrI0T7
	 DiBpaEfKsSA6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Hulk Robot <hulkci@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.14 056/252] media: atomisp: pci: fix error return code in atomisp_pci_probe()
Date: Thu,  9 Sep 2021 07:37:50 -0400
Message-Id: <20210909114106.141462-56-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
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
index af0d83eaa68c..1e324f1f656e 100644
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

