Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68F16D14
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 07:46:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6114F61429;
	Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624607172;
	bh=Ld7DW5jECxC88oMIcoz++1wV6pcftOHGeawgys+m67c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MAPAIWQyLTqItTAQJIz+0Ww27qEPbIw2IRXLEpNZaKacDeMvn3ci0C4ZrPy5W+ocf
	 hX1HRopf6pYjcMvRy9e3vat34ShuXtoTaz4CbA/UbTUXXF0GL9trjYtJw7O/ZokuwO
	 LtXblCQqlLOiRzMA1RGAmgbRVVeE7SW12sNmiJlatPm0tRRK0yHfQpgEcLRFw+UOld
	 ymuuyRbBF5uujMZ3Kq/zR7AmHfuzyjmrDcih948kiiZXdPiz2VyaPNNVfwM+37/hcM
	 G3R5fJFpt8VfSeRJ+/OGW+weVSOmdWNAQIQwGOBesBX6JPs2forPidUoYeV5Om6dvy
	 WZPqBuGOLvPqQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwgXS-004aeI-Dr; Fri, 25 Jun 2021 09:46:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lee Jones" <lee.jones@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v8 04/12] staging: hi6421-spmi-pmic: update copyright's year
Date: Fri, 25 Jun 2021 09:45:56 +0200
Message-Id: <af023af1f7a0371a838cb336a29ef05780e4dff8.1624606660.git.mchehab+huawei@kernel.org>
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

Update the copyright to reflect the current year.

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 626140cb96f2..29ac53684ad2 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -2,8 +2,8 @@
 /*
  * Device driver for regulators in HISI PMIC IC
  *
- * Copyright (c) 2013 Linaro Ltd.
- * Copyright (c) 2011 Hisilicon.
+ * Copyright (c) 2013-2021 Linaro Ltd.
+ * Copyright (c) 2011-2021 HiSilicon Technologies Co., Ltd.
  * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd
  */
 
-- 
2.31.1

