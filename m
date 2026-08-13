Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F944C65B
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623066; cv=none; b=cpjoWPxuZXwuFzqlPnN2q+BL7OWP0CLX/odcZ4F0Ww1kRyyiarQ03cr4ujp/aPuDYGDqCDbRusGEqqHbL76CqLn493DVmBjhjMkUv4JJ00kpYUg4XEr+Y1lreVQJhT+gWVMtkc1BMmUbTI+bUcRezC1Cqeg2lyJFDdRJD2/1IOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623066; c=relaxed/simple;
	bh=DTVdeDwfjKVlxHnEAjqujar4nItKz7mzO01SeOPLFZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eDxnHnyvRwhmpCuBIT+lMoIYnSKnKdlwgZRX1QG0cxE6Rs5Y1wcljUaMhyqL+DrAKKzz/s8LY2gIOSvNkLO9gu/xI8+81KftM1U+gBDDdkguXb4ztt3KNynDU9XhnU6GQ7LyL7SQIK/z54OiSPF7j1prjlu7QgMYjIhZgFfMYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0ILOuqw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0ILOuqw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84864086bfeso600861b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786623064; x=1787227864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwDcLt+ekQ9Y5LBz7FQ+yRAyWssdaJWRHh6HLfRkjh4=;
        b=T0ILOuqwRC+AmQlxyuvVyurlY2p3YdiNGBVTV1sJPUCzQ1Flz+fTE2NoKYMvMl+0dT
         2jhwBpV0GpYUeZh93J49LeYFyIuw+lp5A76IrFYgxZ3H7ldWfmzs+Q0ZQBShZBHmx32C
         BkINLKDjJOccNcGg0U0IaWf0HV+Iwmt9wDgX71M/ab4DnsQnjy9EAAyWUkdzDTOZip5Z
         O46xaWPG7KNpZormnM52VCi1kUmuiSJrzVxp+2X/mFwkxBjqKJLLJS08xTP/um5bgk5m
         N85Ec5A5MQweWG3+5jOTcxpK+djtX1v52MFGKCVuY6uxKCCWHSm0W39FPcPLxdJHuahB
         eS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623064; x=1787227864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwDcLt+ekQ9Y5LBz7FQ+yRAyWssdaJWRHh6HLfRkjh4=;
        b=Y5mkDxFdmkaxlYV0pfdkBmu5YrEkDs69BZurSqiX9j+z5V5/u6P9Xgsdfms9nbP/NQ
         UyPWVl8FgJBDf0tutdu9xtIXnc0/kQJPotdbYsGnPRfJS0SYxl8zcDu+N7dlADGM9Tw5
         6tAtr6swCynF67Vq3dq/3Z4MjOXZuKIeH6obp5FoKUMtCgWO2VVXfXDpr4VqKjSPpvOn
         LEYkSuY9p1pLi2YbFcafSxqrAlToZvAbH8+1lFh7AwhyvHknbqRxYMPhUXCrhRHFmofB
         XYvPM1nQ6eyRYrSE/MlJytV7S9FxrXOYqlcDFK4v2/LTjKFVfDjZWhasXSOslWgxeuE6
         70WQ==
X-Forwarded-Encrypted: i=1; AHgh+RonWnLj5AGrwn9w0jL65NyCm8/I0XA1Ygho1ntBNn2CgvcR7L8P/98RLx1jyB8Dlw80cwBgzTVTOH3PLIy6@lists.linux.dev
X-Gm-Message-State: AOJu0YxqGHiMee0WBDRNwD28XUbXWFvg3q9d0PvK76xVkZkKq3pY4NEL
	SJWsYnY7EHUVYjF3tSzcuG5aAzXu1cebUFG+u15GFyzMZGBvRGROMfDY
X-Gm-Gg: AR+sD12BDoctxgsPj89EPlHUADQVsMN6myqRQ3vnvIJhx+qmEP/bGmUKK1L4NBdhkUy
	/lcAYWFWyN9uMLRUm38SZ2vw6hFhytPY2TYS7j9HyTIVWrmn6xJjtWRtadp0qWm+qodXWsjgByY
	EXbWLkjb9YBZaOOPhy4uuv+Z+wKRzLlhHfgnUDzqCSoCgb/32VNvxIbSaEyoTTTx24FqoVdiAKC
	DdDp2jWR+1g1CU3JsGviHWA6/bI+ezeMvPZ0XIZFmrWKhGEWf5b5wNBz9FkJebMwP5OX7ly/7hs
	+m8o5j4lxblnWgeOkgW9b/CIMaGnBpCXbgG/8CWpWtYJyd07GaeNyG+w8dsZqddicbdgQBJdclW
	IuQOsEfctS2BwkqWV1TtZ9ziCp9SDYDqDTeeaDVvBuu4pMTIw+scWltPDMEXhEvVcWVJeg3mkXr
	iuklkmWm1ePl78ys6Jm6t+mdfmUvgu6Ban5495h3v9tYnmANb9dLXJGCE65746fnSf5P99bwS/Q
	D0FqVlllXYQ8onC
X-Received: by 2002:a05:6a00:bb0f:b0:848:51b3:f3c2 with SMTP id d2e1a72fcca58-84fc7505093mr4328169b3a.33.1786623064044;
        Thu, 13 Aug 2026 05:11:04 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a935cdsm776434b3a.56.2026.08.13.05.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:11:03 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn.welch@gefanuc.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vme_user: fix flush_image leak in tsi148 bridge
Date: Thu, 13 Aug 2026 19:10:57 +0700
Message-Id: <20260813121057.2590433-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When error checking is enabled (err_chk=1), tsi148_probe() allocates an
extra master window resource, tsi148_device->flush_image, which is used
to flush posted writes by reading back over the VME bus. Unlike the
regular master windows, this resource is not linked into
tsi148_bridge->master_resources.

Because it is not on any resource list, it is freed neither by the probe
error path (which only walks the master_resources list) nor by
tsi148_remove(), so it is leaked whenever err_chk is set and either
probe fails after the allocation or the device is unbound / the module
is unloaded.

Free flush_image in both the probe error path and tsi148_remove(). This
is safe when err_chk is disabled: tsi148_device is allocated with
kzalloc() so flush_image is NULL and kfree(NULL) is a no-op.

Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Add Assisted-by: tag (Greg Kroah-Hartman). No code changes.

 drivers/staging/vme_user/vme_tsi148.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index c695ad9b4ca2..8ee1e00cef4f 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2513,6 +2513,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		list_del(pos);
 		kfree(master_image);
 	}
+	kfree(tsi148_device->flush_image);
 
 	tsi148_irq_exit(tsi148_bridge, pdev);
 err_irq:
@@ -2619,6 +2620,8 @@ static void tsi148_remove(struct pci_dev *pdev)
 		kfree(master_image);
 	}
 
+	kfree(bridge->flush_image);
+
 	iounmap(bridge->base);
 
 	pci_release_regions(pdev);
-- 
2.25.1

