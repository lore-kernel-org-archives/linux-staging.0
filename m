Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB9303C83;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142005; cv=none; b=VftC6KvJ9tGexsZ2qd32GM4AwZWLIu8PQlQ9YrgeHTpYY+F1bcZYo3dsN3sn9Af7irUBc+f5pI/W1mPh/8k9qKVj9tlpz1Kas4BM8mdfAVc81gpS4ows7ba5XJJivAq1s1VIWLKpQrA4xuFGOwTam+cDPL7n50+RYwxwP7Jpfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142005; c=relaxed/simple;
	bh=zXtoaGB9QB5Fkc+DJoOlTNeBL3v1x6M9tWrSIMdLjx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXdPua00hzJ1C1sxM290dMOr4EFr83F/X7xdBoelaVgkE/FpZGTZLVohb/uZayyqhHVgMeFCD+oNr0eQz1zsXLeSpUx6vTdAsmJP1apaTWgkCIV8p0jYXjucMu1omIG0Ii1iEk3zYgIpGgz2Xjvpa6KFqzit9bgfUegmSbBsO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tc6TXj8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tc6TXj8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C35CC19424;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=zXtoaGB9QB5Fkc+DJoOlTNeBL3v1x6M9tWrSIMdLjx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tc6TXj8KRQu1IINknkJJZUKVZlWusnW26+WVU7yZK39cQuLJoWOQS8stevsbfp3AX
	 xTwrokYwRNUkjlcHs030FAiZY3P3xsmGldv05Av6sWDSVxNeRzT0+ktMdBdXAMkHxL
	 2dVrLIOQRwEhOsOIIF76KWxipWXqOWPinU6I4r/CVnubEXDbCCO20Sm8u7HzeYA1QN
	 qx801Nn3FOvDmOO+zFz+YS2X8SGQHikRbdv9v89ylsuntSMKJozFSqw1XJG7Mqf8Lp
	 I9EqHahSpYTQuyXZAYw2ONjlTAY3JhrSo+JBmZa4xcMR6VC6b6EdA1bGMY1sss7GKs
	 6JGXFwVtRHH8Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065d-0C7a;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH 1/3] staging: greybus: arche-platform: fix coldboot probe error path
Date: Fri, 19 Dec 2025 11:59:26 +0100
Message-ID: <20251219105928.23329-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219105928.23329-1-johan@kernel.org>
References: <20251219105928.23329-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to deregister the PM notifier in case the coldboot sequence
fails during probe.

Fixes: d29b67d44a7c ("greybus: arche-platform: Add support for init-off feature")
Reported-by: Haotian Zhang <vulab@iscas.ac.cn>
Link: https://lore.kernel.org/lkml/20251104090825.224-1-vulab@iscas.ac.cn/
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..bd069d75391b 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -534,8 +534,9 @@ static int arche_platform_probe(struct platform_device *pdev)
 		mutex_lock(&arche_pdata->platform_state_mutex);
 		ret = arche_platform_coldboot_seq(arche_pdata);
 		if (ret) {
+			mutex_unlock(&arche_pdata->platform_state_mutex);
 			dev_err(dev, "Failed to cold boot svc %d\n", ret);
-			goto err_coldboot;
+			goto err_unregister_pm_notifier;
 		}
 		arche_platform_wd_irq_en(arche_pdata);
 		mutex_unlock(&arche_pdata->platform_state_mutex);
@@ -544,8 +545,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 	dev_info(dev, "Device registered successfully\n");
 	return 0;
 
-err_coldboot:
-	mutex_unlock(&arche_pdata->platform_state_mutex);
+err_unregister_pm_notifier:
+	unregister_pm_notifier(&arche_pdata->pm_notifier);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	return ret;
-- 
2.51.2

