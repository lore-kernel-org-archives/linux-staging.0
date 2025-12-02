Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844230F958
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764669226; cv=none; b=YWfzD6TqRpWDtQXN530iOKxURp3S+gLPldqIriepMXbS7AMT+O5H2O+6cNBF9KcqrVRlRHMdiy3F5ig43q+5ddj7xkH/HjjYjHGYwOGB4weEP+fOCu59lXnn3EKCCQTtEUh8W5RQjKTLlD2cI7DXL8JtkMfUCTc50FBWuQO+38I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764669226; c=relaxed/simple;
	bh=0KeOKsVSJx7LVbouVzJKxUnfef7c+nOYjkKdcPcY0hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxxCnWjkXJa26/BrBa0hhpEdLHYdrDYuq8vAGMlzA/5+aQJq96FqbpsAIhUOBpfOmSpFQ9Q2hUGHTBMW6QvYVrYNEUtr+zbOmFml8YZJgvEIpzOAnrYZaGWc8VJVpObilqikSZftOsy6bfaL51txFxgwiq9s0AtBqc3NCmlUH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABXXW4Yty5pMOv0Ag--.51176S2;
	Tue, 02 Dec 2025 17:53:30 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] staging: vc04_services: vchiq_bus: Check return value of of_dma_configure()
Date: Tue,  2 Dec 2025 17:52:52 +0800
Message-ID: <20251202095253.1640-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXXW4Yty5pMOv0Ag--.51176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1UCFyxGFy3Ar1DAF15twb_yoW8Gw1fpF
	4UWas5G34YgF45uws8XFZxWa4Yga92ka1rur97Gwn5Kr18Zryaqr9rKFy3Wrs5tr48Aay3
	XFWjgw18uw4UGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUejjgDU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkEA2kupaZFZQAAst

vchiq_device_register() ignores the return value of of_dma_configure(),
which may return -EPROBE_DEFER when the IOMMU is not ready or other error
codes. This allows device registration to proceed with incomplete DMA
configuration.

Check of_dma_configure() return value and fail device registration
on error.

Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_bus.c  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 41ece91ab88a..8d920a7a3777 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -80,7 +80,12 @@ vchiq_device_register(struct device *parent, const char *name)
 
 	device->drv_mgmt = dev_get_drvdata(parent);
 
-	of_dma_configure(&device->dev, parent->of_node, true);
+	ret = of_dma_configure(&device->dev, parent->of_node, true);
+	if (ret) {
+		dev_err(parent, "DMA configuration failed for %s: %d\n", name, ret);
+		kfree(device);
+		return NULL;
+	}
 
 	ret = device_register(&device->dev);
 	if (ret) {
-- 
2.50.1.windows.1

