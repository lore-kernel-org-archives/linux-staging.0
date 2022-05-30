Received: from mail.meizu.com (edge01.meizu.com [14.29.68.187])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F017E8
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 07:59:23 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 May
 2022 15:58:06 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 May
 2022 15:58:02 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Haowen Bai <baihaowen@meizu.com>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: atomisp-mt9m114: Fix pointer dereferenced before checking
Date: Mon, 30 May 2022 15:58:01 +0800
Message-ID: <1653897481-25681-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

The info->data is dereferencing before null checking, so move
it after checking.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 00d6842c07d6..3c81ab73cdae 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -616,13 +616,15 @@ static int mt9m114_get_intg_factor(struct i2c_client *client,
 				   struct camera_mipi_info *info,
 				   const struct mt9m114_res_struct *res)
 {
-	struct atomisp_sensor_mode_data *buf = &info->data;
+	struct atomisp_sensor_mode_data *buf;
 	u32 reg_val;
 	int ret;
 
 	if (!info)
 		return -EINVAL;
 
+	buf = &info->data;
+
 	ret =  mt9m114_read_reg(client, MISENSOR_32BIT,
 				REG_PIXEL_CLK, &reg_val);
 	if (ret)
-- 
2.7.4

