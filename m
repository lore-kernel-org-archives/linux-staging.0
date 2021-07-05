Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA929168
	for <linux-staging@lists.linux.dev>; Mon,  5 Jul 2021 09:39:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F608613D1;
	Mon,  5 Jul 2021 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625477942;
	bh=hQQ9uz/b5ur2+Vw9lXTAK8yDrXuki1tHCF2T5xQ+3+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9tT8tyQOYnDcJiE+dbQanV6OvjD2dfOczE1bmWLfEQfPb2Aj3aZlcMeHFkbKn1e+
	 wd+bGtWhedfpuWdRkrGEtvk2bNRBfbpwu8FVmVnRhdA/YeCUExgggWxfChjJRIbs6t
	 4CpDvhkRUZfcUqlFa7mycauRAgNa+YEFDMdHlEHLi899YVEo0m/7FtlWrR2uhICtmS
	 VTPZbTvWl02taz5lJjRutuHfNgZAEUwkYJCmjdFKjWQwn5W0EmAbm7IyWmxPcOw1rw
	 4mj1twjr2+hf6xqQzqFxrwLE2ashk7MGm3BjrEQvJDed7aZd3iJ6yZX/yyMo0ucCBF
	 9YKjLNMMLu1gw==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m0L43-002ton-6i; Mon, 05 Jul 2021 11:38:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v12 2/9] staging: hi6421-spmi-pmic:  add a missing dot at copyright
Date: Mon,  5 Jul 2021 11:38:43 +0200
Message-Id: <243d4bb53ab1d85662ac77a60c12fb8e1be0ce58.1625477735.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625477735.git.mchehab+huawei@kernel.org>
References: <cover.1625477735.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The Huawei's copyright is missing a dot	at the end. Add	it,
in order to make it similar to the other two copyrights.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 9a7e095246f7..08b6f33c505d 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -4,7 +4,7 @@
  *
  * Copyright (c) 2013 Linaro Ltd.
  * Copyright (c) 2011 Hisilicon.
- * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd
+ * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd.
  */
 
 #include <linux/bitops.h>
-- 
2.31.1

