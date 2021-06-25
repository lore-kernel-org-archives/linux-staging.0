Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA12FB3
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43C896141B;
	Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624607172;
	bh=p+Rom+DO1ZkG3yGuITNLyUYvftbPq8zaTeZ9DWT6/ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHYH+FvNqIgbKTIkru1cLj2fM2IOPEzVblQbpi17mSjVbG6IZWp5oHsgQi7c4rwnS
	 cJR83zdkNb1xuI6tj1q/nRdE0YSTgub5gpMI1aGdq+LlWfosOpZItCIX3wOEV4FX1Q
	 nk69pj6hXKLlzBYXs+QdUxkpLFvnka7nP/8GG6UWjzxAvCk/xNDSSVosPCn7bMzPCU
	 Z7qRiJDG/jjXRyzY3p5F+bVmrmhNjHrczu4wPLGPAgWxyvR8A4gkwD5o24gihyGXoT
	 rLK9GvjHbWutB6AlGJgOGzpZXNyTJ+qwCtto8rlW8FletI67GKyyvwRrj1NgUHAS7a
	 NuUD7anY2YOyw==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwgXS-004aeY-Hj; Fri, 25 Jun 2021 09:46:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lee Jones" <lee.jones@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v8 08/12] staging: hi6421-spmi-pmic: change identation of a table
Date: Fri, 25 Jun 2021 09:46:00 +0200
Message-Id: <a4d718b0479e3867bedc93861e4b2c9c1321aabd.1624606660.git.mchehab+huawei@kernel.org>
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

The struct regmap_config is idented with two tabs.
Just one tab is enough.

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 3f4bfeaaf05e..590c3c0e0b33 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -187,10 +187,10 @@ static void hi6421_spmi_pmic_irq_init(struct hi6421_spmi_pmic *ddata)
 }
 
 static const struct regmap_config regmap_config = {
-	.reg_bits		= 16,
-	.val_bits		= HISI_BITS,
-	.max_register		= 0xffff,
-	.fast_io		= true
+	.reg_bits	= 16,
+	.val_bits	= BITS_PER_BYTE,
+	.max_register	= 0xffff,
+	.fast_io	= true
 };
 
 static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
-- 
2.31.1

