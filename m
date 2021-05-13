Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6587071
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 08:48:54 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FglGX0m76zlcB5;
	Thu, 13 May 2021 16:30:28 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 16:32:31 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
	<elder@kernel.org>, <gregkh@linuxfoundation.org>
CC: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] staging: greybus: audio: Add missing MODULE_DEVICE_TABLE
Date: Thu, 13 May 2021 16:49:32 +0800
Message-ID: <1620895772-52538-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/staging/greybus/audio_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6..6fa9781 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1086,6 +1086,7 @@ static const struct of_device_id greybus_asoc_machine_of_match[]  = {
 	{ .compatible = "toshiba,apb-dummy-codec", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, greybus_asoc_machine_of_match);
 
 static struct platform_driver gbaudio_codec_driver = {
 	.driver = {
-- 
2.6.2

