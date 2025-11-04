Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C511DC997
	for <linux-staging@lists.linux.dev>; Tue,  4 Nov 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247352; cv=none; b=h6XJj3/CKfTWa8iV7DEplyBvRjtKYpNHICfkQQfgH3PNioUNGamJ5Bh3IcV/R2sUx2BxLhiYZYGpPl2I3VfL1mvZlIROocnklMaYOm49Lt40440AkTTNh251f95YBAcRraGTZKz/E8Yf/mijDIBXfK4ATfbmz7ki07FbRrFlyUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247352; c=relaxed/simple;
	bh=LfFdE3xERed1Q2WUJPtruMHUPZx8gIQUiFgR3Bw0yns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnj7aXZvX6nOrOWOWRwfz6oKxWtfcVhn9sH05DHXGrlZonbIO2y0InS4qZsNQfx+0svRtNzcL+M/NbAK9g1fvJLcie41sf2fIiVjEpoNqjwfom3+/zxGSAHYRrLplQMPOoXf6I/rw0ttXr5W83Es5jRNEUv1EzuGUj4lRIhdHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAA3oWurwglpVfBcAQ--.499S2;
	Tue, 04 Nov 2025 17:09:00 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] staging: greybus: arche-platform: fix pm_notifier leak in probe error path
Date: Tue,  4 Nov 2025 17:08:25 +0800
Message-ID: <20251104090825.224-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3oWurwglpVfBcAQ--.499S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1rAF4xJF1DXry3WFy5twb_yoWkZFcEq3
	92gw4xCr4rAr1vk3WjyF13WryIvFn0vrZYqFWjqrsxt34rJFsxWr47uw15CFy7XrW2kFyv
	ywnrWr1akw13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjJ73PUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsQA2kJiS3hHAAAsm

In arche_platform_probe(), if arche_platform_coldboot_seq() fails after
register_pm_notifier() succeeds, the function returns without unregistering
the pm_notifier, leading to a resource leak.

Add unregister_pm_notifier() call in the err_coldboot error path to
properly clean up the registered notifier on failure.

Fixes: d29b67d44a7c ("greybus: arche-platform: Add support for init-off feature")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/staging/greybus/arche-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..9c5bb5dae187 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -545,6 +545,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	return 0;
 
 err_coldboot:
+	unregister_pm_notifier(&arche_pdata->pm_notifier);
 	mutex_unlock(&arche_pdata->platform_state_mutex);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
-- 
2.50.1.windows.1

