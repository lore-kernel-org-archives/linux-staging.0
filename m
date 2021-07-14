Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98BC70
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63D8C61396;
	Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626253985;
	bh=hQQ9uz/b5ur2+Vw9lXTAK8yDrXuki1tHCF2T5xQ+3+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKccmc8VN/6cJTy+d2CoGl1idW4SdPyiZGxRW8MQnAONaLCrtP5VJ1jGvHnp1+UnJ
	 s2evlkP9VoeKfKP47R6eKpH49HGpeJPtcN9yHvDpryG+qIBSwLyv6A0QGvHzqXHxZt
	 0nW6jB2NUHrUTu02ryzTK878mZUe0dLugQiWVKBwHZQJrYWoVYJfQr3+9cPUnymxGE
	 M8AEw+7tBCmawK4oIkXX3hmLnFn89WyxlIaCEvx85L0sKEWq1VWPz1onIgicL3IIMY
	 AcNWkJLP2Xe44KscX3lttvnkW8TdgwiXbExmjgveY48u3IciEHKmUE1KoHNBIel1dI
	 yw99xyJv8qY6g==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m3awx-007q2K-3z; Wed, 14 Jul 2021 11:13:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v13 2/9] staging: hi6421-spmi-pmic:  add a missing dot at copyright
Date: Wed, 14 Jul 2021 11:12:54 +0200
Message-Id: <37317d174d792d3f96ffdb96acbb43a83b9f9f7c.1626253775.git.mchehab+huawei@kernel.org>
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

