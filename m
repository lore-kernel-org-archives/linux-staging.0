Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC729D6
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D023613B6;
	Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626253985;
	bh=q+8JoyZy41b0E54mkPzbSx9EwxDzqQzc896e/gOvyK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPz9Q6uSJgfdvbvPTEUDUcH5tzbA6RlIZFWiQerXX4bIATvFulLP2biHGH86e2P1R
	 k3A32sYl9/DUR6pdCFTmarf+2Za4/dD4b+cmgJE8HszpGP6PA4RBE8ox9f/Ru64jop
	 z7sBjh9b2oTEXiB169VfNc0H8yUFnCFCPB86/nwhhQnEp5Xd0b/5B3Ak5NosF1wcdo
	 DTqVh3ZOx4OjfS1EVNYZO8edk0IVm/lyFaiyNbXYqXAo3GNt9zD8Rd/oyS8pTWdda0
	 cqHcSwK2pGWo7KAntIK+OQDIgjVQ2RPytsl6WFAEcZuNeap2ED9QfUn+x4/l8/YiAj
	 QZypzyGDEAhmw==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m3awx-007q2X-9G; Wed, 14 Jul 2021 11:13:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v13 5/9] staging: hi6421-spmi-pmic: rename spmi_device struct
Date: Wed, 14 Jul 2021 11:12:57 +0200
Message-Id: <fd61e6d5b5ae666f0c6daee94be5aabcad9fe528.1626253775.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626253775.git.mchehab+huawei@kernel.org>
References: <cover.1626253775.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Let's not call a pointer to spmi_device as pdev, as it is
something else.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index f63ba73c9e33..c9c0c3d7011f 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -26,19 +26,19 @@ static const struct regmap_config regmap_config = {
 	.fast_io	= true
 };
 
-static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
+static int hi6421_spmi_pmic_probe(struct spmi_device *sdev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &sdev->dev;
 	struct regmap *regmap;
 	int ret;
 
-	regmap = devm_regmap_init_spmi_ext(pdev, &regmap_config);
+	regmap = devm_regmap_init_spmi_ext(sdev, &regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	dev_set_drvdata(&pdev->dev, regmap);
+	dev_set_drvdata(&sdev->dev, regmap);
 
-	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+	ret = devm_mfd_add_devices(&sdev->dev, PLATFORM_DEVID_NONE,
 				   hi6421v600_devs, ARRAY_SIZE(hi6421v600_devs),
 				   NULL, 0, NULL);
 	if (ret < 0)
-- 
2.31.1

