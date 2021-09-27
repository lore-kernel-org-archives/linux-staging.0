Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8F3FC8
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 11:37:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C1B560EFD;
	Mon, 27 Sep 2021 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632742626;
	bh=S53mQIgJmKuw8oAdVPMGibdAZq9B1XNWAEqUxJ18+bg=;
	h=From:To:Cc:Subject:Date:From;
	b=Co0Utw3xDXUni3n1X3K6LnsXERWQcHHvduRZWQRoxmHJePzRhYkDzOT6ovApqrmj0
	 xuGJLgPVHkMBtowLerSvwwtD/1Cdm0RmdKmkLuYd16vEv1i0BqM6wPVmZm+uzEGyq/
	 abFf0+tVJPE6qnOBvlGPtJlA3vtg8G8qT7T3blGam/XMwOGjO3fFclqa71ZHkVOqPZ
	 1znJk2//wPEJg3eMoVrGSnQJdmqE2Y0UVTvIpumUitoy5vf79V8tMs4uP3xMQ9nUz2
	 AyZE5EV0c2x4BgJ5NWWNoV0Tjn+jyuH8xb7m1ShoinYSomhTm3hu0fPwQR3mJ4pkDx
	 rcA5yfykA5DLw==
From: Arnd Bergmann <arnd@kernel.org>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Amarjargal Gundjalam <amarjargal16@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vc04_services: shut up out-of-range warning
Date: Mon, 27 Sep 2021 13:36:56 +0200
Message-Id: <20210927113702.3866843-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The comparison against SIZE_MAX produces a harmless warning on 64-bit
architectures:

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:185:16: error: result of comparison of constant 419244183493398898 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (num_pages > (SIZE_MAX - sizeof(struct pagelist) -
            ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Shut up that warning by adding a cast to a longer type.

Fixes: ca641bae6da9 ("staging: vc04_services: prevent integer overflow in create_pagelist()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index b25369a13452..967f10b9582a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -182,7 +182,7 @@ create_pagelist(char *buf, char __user *ubuf,
 		offset = (uintptr_t)ubuf & (PAGE_SIZE - 1);
 	num_pages = DIV_ROUND_UP(count + offset, PAGE_SIZE);
 
-	if (num_pages > (SIZE_MAX - sizeof(struct pagelist) -
+	if ((size_t)num_pages > (SIZE_MAX - sizeof(struct pagelist) -
 			 sizeof(struct vchiq_pagelist_info)) /
 			(sizeof(u32) + sizeof(pages[0]) +
 			 sizeof(struct scatterlist)))
-- 
2.29.2

