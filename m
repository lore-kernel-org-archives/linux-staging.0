Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28176D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:24:02 +0000 (UTC)
X-QQ-mid: bizesmtp32t1629105786tgodgymx
Received: from localhost.localdomain (unknown [111.207.172.18])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 16 Aug 2021 17:23:04 +0800 (CST)
X-QQ-SSF: 0140000000200030C000B00D0000000
X-QQ-FEAT: 1USUZei7Xzblra8hebEUe6w3Kn+05DLkcVYHGjy8fK2smcTQ+iiDGMfML4QHI
	EC5x8uDXVrRd0WsVqIujRuPmN49W9QXS211cmnOF4raf94bi5h0wp94IS667J+BfFkFJae7
	8o6A24QKU5xaD5fohtGK2/NjfmdHbqD+rfq+i19zvhb2/OOobkWWsCDXHYrSIZkeWB27W6c
	oXyRtpLVRAnMka/6KD9q9v3UJ/epqeertctTgII8oc7opcnBTX3VMDcryhXz28thBMRrWMM
	D4cjdsMtXyxSXJ1qgCvlJEEeNT/X2fh0VZvbx29RM0A+BdaiPe871v62iB4ilfLewT/fkMn
	zm3CBsaH4MvgwF0kfwNcL89kWjoQg==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: mchehab@kernel.org,
	khilman@baylibre.com
Cc: narmstrong@baylibre.com,
	gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] Media: meson: vdec: Use devm_platform_ioremap_resource_byname()
Date: Mon, 16 Aug 2021 17:23:03 +0800
Message-Id: <20210816092303.10162-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e51d69c4729d..8549d95be0f2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct video_device *vdev;
 	struct amvdec_core *core;
-	struct resource *r;
 	const struct of_device_id *of_id;
 	int irq;
 	int ret;
@@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev = dev;
 	platform_set_drvdata(pdev, core);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
-	core->dos_base = devm_ioremap_resource(dev, r);
+	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
 	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
-	core->esparser_base = devm_ioremap_resource(dev, r);
+	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
 	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
 
-- 
2.20.1



