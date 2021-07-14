Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8E2FAD
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73418613B5;
	Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626253985;
	bh=hj/ipUvkpkeKWt7EJnZrwj31HELGkpjHJJ3w+DNn5xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N05c9EA49loOayM48FOSgyBmKnpTO0cJq4bHkqxqcr5fGor4uor+bAuYrqKZrz9cS
	 tbndrKtMFSH27eswtv2WM/Ty80uTJZTsLFBgnBsMOsESI0/1n979dWfSd2x6EU2LLO
	 V0o0XpSfUKphKaoxC1E0uVBjPAC5GNfVKdFxZdwQfSdbIHKpJvdYgCd2qz4r2SSDYc
	 u9aPK12jTB8f3TryDcNQHebdEQZ3xgfeJoRaqoiiwgfhdDefqAOtGe7jcY8oJ0wXme
	 zAJ7nrNvyvZ3XHx4lTbWBSo1PzZme9fc1OnceL1kUuHu/W964P9J8qTzgXCDK5/Fvt
	 302CUFXBqed+g==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m3awx-007q2H-23; Wed, 14 Jul 2021 11:13:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/9] staging: hi6421-spmi-pmic: rename GPIO IRQ OF node
Date: Wed, 14 Jul 2021 11:12:53 +0200
Message-Id: <1e7ec01a61916a03e7165e684d8d5b7dc58970f0.1626253775.git.mchehab+huawei@kernel.org>
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

Instead of using the standard name ("gpios"), use "interrupts".

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c              | 2 +-
 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 35ef3d4c760b..9a7e095246f7 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -233,7 +233,7 @@ static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
 
 	ddata->dev = dev;
 
-	ddata->gpio = of_get_gpio(np, 0);
+	ddata->gpio = of_get_named_gpio_flags(np, "interrupts", 0, NULL);
 	if (ddata->gpio < 0)
 		return ddata->gpio;
 
diff --git a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
index 8e355cddd437..252b600f02a8 100644
--- a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
+++ b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
@@ -34,7 +34,7 @@ properties:
 
   interrupt-controller: true
 
-  gpios:
+  interrupts:
     maxItems: 1
     description: GPIO used for IRQs
 
@@ -71,7 +71,7 @@ examples:
 
       #interrupt-cells = <2>;
       interrupt-controller;
-      gpios = <&gpio28 0 0>;
+      interrupts = <&gpio28 0 0>;
 
       regulators {
         #address-cells = <1>;
-- 
2.31.1

