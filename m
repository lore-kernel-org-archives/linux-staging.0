Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EB1D7E5C
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033806; cv=none; b=kYP0ml3uTJicAH3Gpe9gx2VRGeISe7m7emdPJdFG2eXszgaMYPAxGlc6BnUcIPhdyc/uj7vdSacEZuv/zGijYFE5qUg2cmvxFDxowATQ63UubUg8khMhii23RoXXx4cmnfl9iJ7X/zbfnSdB/DCcNFvDzJgXG5RCkWToXHeuLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033806; c=relaxed/simple;
	bh=tHa36Yfnl5UloN6rbk9ub3AEIOz+RJGVbrm6QepGmto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKQ0IuyWtdu4XUQG7EKpFTqAyKrEchPMrKy1fGE7kOLZlOACd+piDYUNk13vRRYXyU9R7Rh7YTdC2bwSnZaX8KstKcFrVfmUfeWmnlYLaJBZ5ALsaeiwtFwpgXOj5ltSjPMnFD/7rUXrXwpm/55cdo2xqwKNZMKmP8L9dp8YBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bgM3TkTE; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bgM3TkTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=v9
	QX9j0TTVmGsZ85673SILcfxQ1otXTH1rmjb7Kp8mg=; b=bgM3TkTE/LKJqKNubl
	bnlx2o2VlgNKCOUm7l35iHRx7kNkvcH/x4xw4KP/+9v6+RTAjOTsCeAOVjLY2A+q
	pD4zDnaG/89E1y3Kpow0TRtnUCF3R/pA0B9gs9mYcAerx4Ao6S3IzK5/cZay/1nG
	EB1h71QMqulAf56srWdKuqjSc=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBXFV6E+INqKVsgOQ--.91S2;
	Tue, 18 Aug 2026 14:15:45 +0800 (CST)
From: huangjia2hi@163.com
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiazhi Huang <huangjia2hi@163.com>
Subject: [PATCH] staging: greybus: audio: use dynamic vendor and product IDs
Date: Tue, 18 Aug 2026 14:15:20 +0800
Message-ID: <20260818061520.67387-1-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXFV6E+INqKVsgOQ--.91S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF43ZFyxAr1UJFyxuFy8Xwb_yoW8JrWfpr
	Z0ka45Cr4DJ3W7Ja1vyw1xXFyFka4kG3yIka98Ww4S9F1FvF1ava18tFyYkwsxKF4rJw4U
	GFZ0gryxZw4qyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pizBT8UUUUU=
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbCxBHdFGqD+JFLogAA31

From: Jiazhi Huang <huangjia2hi@163.com>

Replace hardcoded magic numbers for Vendor ID (vid) and Product ID (pid)
in gb_audio_mgmt_node_desc with dynamic values obtained from the
greybus interface.

This resolves the associated TODO comments by using the actual vendor and
product IDs provided by the interface structure.

Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>
---
 drivers/staging/greybus/audio_module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 4cd1f42c11f0..9eed3ac0c49d 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -358,8 +358,8 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	dev_dbg(dev, "Inform set_event:%d to above layer\n", 1);
 	/* prepare for the audio manager */
 	strscpy(desc.name, gbmodule->name, sizeof(desc.name));
-	desc.vid = 2; /* todo */
-	desc.pid = 3; /* todo */
+	desc.vid = bundle->intf->vendor_id;
+	desc.pid = bundle->intf->product_id;
 	desc.intf_id = gbmodule->dev_id;
 	desc.op_devices = gbmodule->op_devices;
 	desc.ip_devices = gbmodule->ip_devices;
-- 
2.55.0

