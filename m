Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F82DB795
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787387663; cv=none; b=O1oEDDPK7tWpluNa2uo7DOVAlQRT90y141ZftycLyBAy5AG9tyR/Fe2BQ0sZWexVAwKC376ht8Lv6Or5IR5z1CRU/u5d1ggb4n4DJcJj8TJqXklH+OE2hnGFgym7vfTPxH+QngOg46Y+gcYEqzM/j2WoWw24hKc+zxV3DR4sdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787387663; c=relaxed/simple;
	bh=yA3+VoYwcK6KSK/cIn8PJOKv5e27qnifHs5zHsBOJ1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z08ZEADHfqMux14nOfQfOZOi8TpT1/TlA2HjJHrjq1Qy8YaX6vMd2yowDIVh890M+GEJV3uc1/jMffk/Z1M57TMWQeROQuI5JMl+otxRlvrwKp0s1fH+rFwvS9CyVU04mvA17pgtMzclXjCBG/ADq/irgRj9ll3QQ46KdVBWlmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi4lm4of; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi4lm4of"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caea3f742bso29151255ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787387662; x=1787992462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4Ty7m/Oy5sE0aj81AZUZepR8b+A2n+RRtNSKUbvbgk=;
        b=Yi4lm4ofckZVjKYItZ0+RH/ego3K7+ZIa09naW2D0w8PyDqGgZNPcJ2A+pMSK3vaYc
         HFBjm87lYD2+BP19r+i18+3yqdMc4/kJrS+/VcwRfjtlnFuNWW9jGaEpJPqumuu45nWh
         7nwqt5PZ6ZUi/sZhXlOHJeK72BLg8Yhvi2YWpL3agpHBa7Y4/s34vriN0qQp8gZWmJC/
         PsSqlcyQNtqPWV6K5fPFQV823DlGdlrUF94hoC5M51Zo4LK4jBzvHMEHxzIIJPoxG3UJ
         vObCYGNTHKZ8VuW17HwrQ8oR7Divllz3UWPt573iGlI5WTnkSkh/Y1NOMad/1ecpbvkr
         fe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787387662; x=1787992462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4Ty7m/Oy5sE0aj81AZUZepR8b+A2n+RRtNSKUbvbgk=;
        b=YbSpjyGivNRh1PPIONpT94r7hJOBI1+r/qcPs68UmYmraNJyq+POoJDAR1mH+yfwzr
         AWNtU2ce2dG++SGQWpOdd3UEgzqjmwABtsuzENXo5f5wl8TnkQCaczBxvKLrs+ZYuUIn
         p3WKHLMOd9MZaD5vdNGNtnsrltXOOa/gvsMGK8BYeGhgVxLjcXGbDiNr+wqa1y4VnDmU
         U7JQgm3iQHHziyyQWzoDdtHuwMifDfhC8IbUHlh8QlAbd6D6+o1dcrjoBuV2pXsM2Lgi
         M3fK+mHfunyMGOddYRlR73OLcUEXoneu7mtvCN9LcaetzTHgidNN0JNSqcu7hablaFNP
         ozsg==
X-Forwarded-Encrypted: i=1; AHgh+RpBwjU8DImapF0vDDsxSGNOjko/74asAkCi8/Cs9upAP5gDTYl5YN4GYlf8bKXnh/CY7VSEj8nY+YuKcKgT@lists.linux.dev
X-Gm-Message-State: AFuF++ln8xELS1JJog9SseQmljiCz3YvEOUioGXGITbkYb71/dEgD23r
	5M2IJoqYuNlKu8WRO4CKvFswhh/fwT3YtDDVJK15gEdmMXkFdC0hOAk=
X-Gm-Gg: AR+sD120cCz+b64BpjjZ6x5R5SxMps+y47434oqklDBjGtae7oyz1jh/62/yPJjwBgk
	bYDoTPnBlqgdAt/r41VVb4++gKFgaRe9MOdxKCArTOxLHRac+pTr9bHklDYsjqdfnN7bNwCAwF0
	1SE1KpyAaU0PT4TL/RIY/UnfCTsrQ3QVtW/hRUTzuBNgRQEj1T5yExb5T2eAbAPf6dTn8hi1B+x
	Jk7x/1STurTjR/fuU8I9+HGiTO0hhub5PZ9itlMVIY0zkNH/1cT1yT+ELsFT1bYr+TTuKI9Mch6
	85ZBu0emBMswXn/FA6ZrAAKGq38YZtXW+Z2iEhg7kKmnnRV/0rgNcuAqNEhTi84A1SLBHdRDcA5
	q9vZGZm+DU7xIXBqgQXejmmyyNpW+vFnzXr/HaVje7th4SPGWIsBNZN6gkQGsm/9JIi0b91ZQeH
	H1hpffY0O3h2gkhJ9U/cl6tFtgltw74BUP8sSdkD4duAU6bAbIz94oJQA8Gm8gFujeGIcHU4fyd
	qwmRGzToT1jfilI+39XlikPrw1HYsvUFFK2EyNRALEJtRM8aBYoc+O3O2WlQ0rgxBpmCw==
X-Received: by 2002:a17:903:46cc:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d64b162098mr245699135ad.12.1787387661938;
        Sat, 22 Aug 2026 01:34:21 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676788239sm2764105ad.18.2026.08.22.01.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:34:21 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] staging: sm750: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Sat, 22 Aug 2026 08:34:08 +0000
Message-ID: <20260822083408.44764-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend
and resume callbacks, also reduces kernel size in case CONFIG_PM
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..ed6d0a93f0dc 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -394,7 +394,7 @@ static inline unsigned int chan_to_field(unsigned int chan,
 	return chan << bf->offset;
 }
 
-static int __maybe_unused lynxfb_suspend(struct device *dev)
+static int lynxfb_suspend(struct device *dev)
 {
 	struct fb_info *info;
 	struct sm750_dev *sm750_dev;
@@ -415,7 +415,7 @@ static int __maybe_unused lynxfb_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused lynxfb_resume(struct device *dev)
+static int lynxfb_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info;
@@ -1106,14 +1106,14 @@ static const struct pci_device_id smi_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, smi_pci_table);
 
-static SIMPLE_DEV_PM_OPS(lynxfb_pm_ops, lynxfb_suspend, lynxfb_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(lynxfb_pm_ops, lynxfb_suspend, lynxfb_resume);
 
 static struct pci_driver lynxfb_driver = {
 	.name =		"sm750fb",
 	.id_table =	smi_pci_table,
 	.probe =	lynxfb_pci_probe,
 	.remove =	lynxfb_pci_remove,
-	.driver.pm =	&lynxfb_pm_ops,
+	.driver.pm =	pm_sleep_ptr(&lynxfb_pm_ops),
 };
 
 static int __init lynxfb_init(void)
-- 
2.53.0

