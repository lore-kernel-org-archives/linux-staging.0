Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CAD290C
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XLgCN8Yh7yxhlMDt3xIIkmr+KqEgc6deFZgdqMU2dck=;
  b=I1/g/SGrOqlYAFWUIoADNfRvCO1Xa8xhnNhL5loAnWHEUyi2buQpkHSe
   UvnMEschS5N06I/cuyzuOu3vr5THR7tgLsLS05JYuJM+3LgbqRd3AFeBh
   TBZI80eprlh9kekDdkz1SQTDOylo8D3o7yHqsaH5ZWU0ZHDFP2a4TIJSN
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; 
   d="scan'208";a="14727958"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:01 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: atomisp: fix typo in comment
Date: Sat, 21 May 2022 13:11:05 +0200
Message-Id: <20220521111145.81697-55-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/staging/media/atomisp/i2c/ov5693/ov5693.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
index 79df07bd69b6..a1366666f49c 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
+++ b/drivers/staging/media/atomisp/i2c/ov5693/ov5693.h
@@ -855,7 +855,7 @@ static struct ov5693_reg const ov5693_1616x1216_30fps[] = {
 	{OV5693_8BIT, 0x3813, 0x06},	/*{3812,3813} windowing Y offset*/
 	{OV5693_8BIT, 0x3814, 0x11},	/*X subsample control*/
 	{OV5693_8BIT, 0x3815, 0x11},	/*Y subsample control*/
-	{OV5693_8BIT, 0x3820, 0x00},	/*FLIP/Binnning control*/
+	{OV5693_8BIT, 0x3820, 0x00},	/*FLIP/Binning control*/
 	{OV5693_8BIT, 0x3821, 0x1e},	/*MIRROR control*/
 	{OV5693_8BIT, 0x5002, 0x00},
 	{OV5693_8BIT, 0x5041, 0x84},

