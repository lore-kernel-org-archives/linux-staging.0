Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD566D10
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5492061428;
	Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624607172;
	bh=2vhjiYcekYv+JW0f4M/x8jeeqlFPnpMWrhRu0RrwZzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rQ4AoDCHr532Z81eBEUtkZcByWgnaso9uhyiSzFwfnIplnMtBvCaxcIZbXt7KHAG9
	 m5Aym91pe79GnW+LylH7gXrq4Nuz1kQg8X2YSb+UEZ+wq61UlAvC2AXc00medjN9Tg
	 rsc4HZzRPsIdH/FO+n08RppON/P3g1fo2YA3/m4dQ3GBrdDK3nlQrDNLcAwqwpy/89
	 rkDjTPOdzmoCCqUpaIz2nrz9Rc9LdR9e3357BHER/kbi39XpVhKHdcbWU0ZBK9QkJt
	 /nFgqlFcJzO8lkwXaLO1KtVmVHlhNQXv5AlmTFa1HDeqV09LDqS9kF+Cu/WZ5SDHJq
	 /WUYzIqAdA81w==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwgXS-004aeQ-Fj; Fri, 25 Jun 2021 09:46:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lee Jones" <lee.jones@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v8 06/12] staging: hi6421-spmi-pmic: better name IRQs
Date: Fri, 25 Jun 2021 09:45:58 +0200
Message-Id: <327fb075905b889a43a0f9dced29ea9966d611f8.1624606660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624606660.git.mchehab+huawei@kernel.org>
References: <cover.1624606660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of naming them as just "hisi", use hi6421v600 to
make it clearer.

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 2b55acdaad85..be049a5abbcd 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -145,7 +145,7 @@ static void hi6421_spmi_irq_unmask(struct irq_data *d)
 }
 
 static struct irq_chip hi6421_spmi_pmu_irqchip = {
-	.name		= "hisi-irq",
+	.name		= "hi6421v600-irq",
 	.irq_mask	= hi6421_spmi_irq_mask,
 	.irq_unmask	= hi6421_spmi_irq_unmask,
 	.irq_disable	= hi6421_spmi_irq_mask,
@@ -158,7 +158,7 @@ static int hi6421_spmi_irq_map(struct irq_domain *d, unsigned int virq,
 	struct hi6421_spmi_pmic *ddata = d->host_data;
 
 	irq_set_chip_and_handler_name(virq, &hi6421_spmi_pmu_irqchip,
-				      handle_simple_irq, "hisi");
+				      handle_simple_irq, "hi6421v600");
 	irq_set_chip_data(virq, ddata);
 	irq_set_irq_type(virq, IRQ_TYPE_NONE);
 
-- 
2.31.1

