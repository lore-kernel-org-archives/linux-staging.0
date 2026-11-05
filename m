Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841547;
	b=0zBHpcaT9mkTFBruIu70S5hEE4j2TM5RBwQVhnSHT9Zlrw9te8XcuWuvL4/0QGMHUwgT
	 RMRf8KBpoDgyxQzxO/8WWbYpYg6drfFUjWQx6OJfzH1fGeXe90HQWCPIpKeRaOrZXKnJh
	 mOSxvahLuOXgyiPrv+WW/rK2GRY/TSjlmkZHPf6VdAGbFGeHlIzfMQal6dkpZyxA1S/UK
	 hTeVV8yNSRRwjZZ+6P0m0u4JOLjKHPNYNmfja+VNpeOOvP9utxvm8G9lXy0fT26Ubv8ZK
	 8/elhZp1EXmG8sXv9R6wmpw95vB1ZR0R/KJheRpfN+N5cAe01v4ClzCUxwFd6fO0ApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
	b=OHNzWn1/HE+dDfF+sTIGRF202D57GHMeudVX6PQcYiBXyoqHGLmkPEXAEPQtOhwxGp+N
	 LI5TEDVKo+YQwThkWbXosMt5mdzwOzH2UkwMVkHm6eEWQblE2mvmzg2zBLaxD3jr9ESWj
	 YR4Qb80aqf4lUZ8VXe7TLNYGjkBaq/WgSdPcnP9LWkA78csRh05tExCPYSJSgiYx6zzJS
	 uZ1/pKrvo69+lNucyafkmZYLaGDVpe1aFYWZWhKDXhyE7izT0etHFO7mnhxbpyAAJWamC
	 9ic/s/KHzFSxy56Vz8qwYX2BNeTCgVPqnVQ3uG0vvgwunvKgyim+XkhI/IvGguj5ZQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhFILOQ1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C9606A31B
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 01:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhFILOQ1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so10568105e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 17:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841545; x=1794446345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
        b=UhFILOQ1tF8wrac0WtyeLSsmAvCXMdmqba3gumwMZAWyYjhioFarwKQLXZAfOX+pkP
         sdXBWp//3pqsWDOj5bu86527nTRMZWIZGgJzi3Zibbw7/5MlVHHChvOo71J9GwfddUPv
         Vc2c84psyv6+lGutdAjY0f4p8h4h07mdKhwmamZH13t3bPOTna6PenF0rgqNwf+XcWBa
         YGj/BZyTtkg/O04Wp01P0e08/0h+XyufuxOUmvufx+kU7pT+Pky5iFrWW7/n/QJzxqsl
         DKKbUSraDUIlSD2n5oEWWm19LswY+AXpG1vVVKZiAuJa52el+VNKNmEYh/Ovvhw2Ayhl
         cYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841545; x=1794446345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQbGbNxOCWb9ViVgjVKbYzkJ8A0N0L1Js/jwT7TdCjY=;
        b=xCitcy6sT5CqnjEGG/E1PmAPCssAaNPff9fTrGfKCtT3jOChPzWRY0RVzMBOU7RS3A
         nbol/sCiRxBZusV7uPIZq26VPyh6gDwTfPn6WHmI9XM1e7A+TY4JrJP5HdE+uGc47PPW
         YryGtRtpY/P722Z6oVWNIYr9+Ict9wJSMOy4FqzJmeHJzeQ9BzpwkN7IuqOgRVx5JG4l
         T9xz6VSW0wRF8oOyaW6jl/PFvqF+edA9Am0ZxwrT0fNJsJMnczwY3MMMF+QQStFORdhT
         ryBoD3tRnRMnPANHV3/qKDwQD4okwPxbJ6GDwaEWB7iSxrkBd2ppN6tOV72E0xNOukFo
         0E6g==
X-Forwarded-Encrypted: i=1; AKwUvBwEvvjKhLkZbJxN5WpwJTVQ6t2CRYaMh+3tXEh0vUC3HlSJ5Pcldt9/kVSAnRFN2DXXHwDolUYjiwxUn0XZ@lists.linux.dev
X-Gm-Message-State: APuU4Z+kxr3fvK3eyqcZO8WI+J1fgJ7EQofecua//Tj+h0SmqncNpurL
	KWducNUno0Qj4fYgcxJ6NdUHgPed9BykOqDz6rseIQ0kDcMSXrAaaBOt
X-Gm-Gg: AYBFou2KGYYR66PlVpZs4lHHQFRlu1K3Mu2DkN05aFizNwbTLpcZSvi+Y6cHH0CiewI
	Gjbho7CSostVd3Aj9kSb+Rh6/ghvnXuC9rL1CwEJv8A0GrryHzBZNGW637cxDKdFQ08+YXGFCQo
	bO1qoJnxEo/HgIk3gOY53YN+plBos/7E5uVLD1sleOyah2djcTrGoUATmxgFkEd3U+fHEB6FopP
	JI+7pBx+PFyqzId2e/IfXs4Cm+M2zi0UFTVndvzn/ZFkUiaXUCmeFkP4ra6doy8g2JsPuq1sBOQ
	MG216oQHkxlP4557XcLZ+1p6jH7uFwM90MzYIJPPIBBtzloHESgKQHcG1SPwBDsKih0J/wHYAip
	bp/9opmqyiUcNNHKe2iwYBuXflolYu1If2DkrkCOuB4A4Pf5YjkNJg+VXFJmNRhR2gagrFR8E7D
	8PXu+bCpiDCL1WCCcQvE3tSzVTeN5LP2c/QNegtppm4bKJGvo1QUjuHdXuXumxioc2MMZXndhts
	E+AOgXSjCL7aguRhHZuqeewKth0gvPqqmpiW5RGSNGtlrNKCSTuhOkCGOSubs4yNt+kkJDM3EjG
	vorWEy+bOLnvT+q1hEJ6EY69Q6Urp8se5hNJ9NOvZHFsAangTF/YH1M58/BOXn93N2VepmFoNB6
	Z4Er8NLgOBN1PNuwt+nXfphAWHdhw/m1MsFI5ODOSnKsVaDWbBu3FdxSP6iFHpsojcmU=
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr113035475e9.11.1793841545395;
        Wed, 04 Nov 2026 17:19:05 -0800 (PST)
Received: from mint.homenet.telecomitalia.it (host-188-12-85-236.business.telecomitalia.it. [188.12.85.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm122615335e9.3.2026.11.04.17.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:19:05 -0800 (PST)
From: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Thu,  5 Nov 2026 02:18:45 +0100
Message-ID: <20261105011845.130704-1-jacopo.dilauro04@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs attribute show functions.
sysfs_emit() is preferred in sysfs show methods as it is aware of
the PAGE_SIZE buffer limit and prevents potential buffer overflow.

Signed-off-by: Jacopo Di Lauro <jacopo.dilauro04@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

