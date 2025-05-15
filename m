Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5ED29B206
	for <linux-staging@lists.linux.dev>; Thu, 15 May 2025 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747338019; cv=none; b=EVv22QMFIPC6nq6/84eo+4F3ZaZU060KsdgwLMnacPRtyNMmE7xgorYf8NfvAPh3OPIb5odVb1L1Wy15YglvvGT3tacgbXc2DZOvBpTVVZ2jsr7K1kIMvoskCXXJeoQXgzgMuwyP4Uvcn28a8uHBE0GcnGywCRq+Udo51gmjciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747338019; c=relaxed/simple;
	bh=q2fii1TNd8FQwF7ZkVGmdhiOTgRMqmaoTUEG7puOjJk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac5sRZ2Zd2s0LU4txn2J0/c7pV+S3uldrEi+QmIhk3Xx5OIIKrKJJ+Jf/+JwxbhYfXJMvw6KObKkPy8i7Bsu8ycE4l9EEqf+HLABkt0vxbtcpQa9IhU6DoMciVOxVRL8bEqjgo+iqhOo0gYAI448DPSjGH7m1396HcYhF8CjZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HubU9UgH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HubU9UgH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1525388e87.1
        for <linux-staging@lists.linux.dev>; Thu, 15 May 2025 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747338016; x=1747942816; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9hf1pY/E40EfpOzBfn/r3vdhfrUtuW8Q8jEK1DP9OY=;
        b=HubU9UgHi4I4hoNq8fBPK/HfbFQVwWiXNJ1KKIqP3Cv34U43svjf+9d1+tubeVZMOT
         TZOLMGuS4vB61WJeuwik2kLrVzTK/zJ0E3dUpMoQP9NKO20HqChp8wznO8Hzxu7d76gW
         yvYOHPRuTkK00zjIDfP7IRzpXA05aEZKdYHb+v4iOIWq+Fr/gHgB6gSyyOxtpmp0NIQf
         HbtrSZ8vpkC4EwhgAPRGOk74MdegwNLv8P/f2O0I3YPDRdYSWH7nu6cRYWLjjon3Qhq2
         mBTDjJ0S6KqXNI79tlGet3/fIlrcUw9ptB0CVgdo0QTXbnCe/VCuR2tXuSKnyYPZ4BZu
         Bf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338016; x=1747942816;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9hf1pY/E40EfpOzBfn/r3vdhfrUtuW8Q8jEK1DP9OY=;
        b=o3W0IC3kDlK2+PUq/oIt+JjSi+Dt1L3cX5qIzlqdufsZtOEQsiXm1S74jfaIH1khhX
         GfUAGIFvHPLwef2IOksz+Qkdq7lO4J1cdwjPcpK/U4Tg+I3JSMpSBAxB49DHQ5PnwRqt
         SVfoTNJIRW1es5yDk/Bv5pJWdmEnVYMnR6mW54KirhbtMtKuZy6DG/TsO3ut/7cicBmD
         Hn3FSPRaQSuTRLYu07pc6K7nfDdFdRYoft/rXMH3YkhtrbKC9O6Uknl+NLbksUdtBg1p
         j5V2Rs4LDq2ajtQIXjm7UzHrmCseurI5Y/tlOWca8ctoNLFGs0C68IHTtz2vb6GlwK6y
         h+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMl82OJI44GoQIIlJsk/iPPBssoGCRzS+TAXtuIiIjxX56JYiCTWqpeN6anskmA5jR9SpbHjuJK9Rb+3LD@lists.linux.dev
X-Gm-Message-State: AOJu0YxaNhk3ec+7LtqmLcIUGGS+AISouoXxATChNVfInECmpaMHztxf
	vpg5nUwwopNhaKsJBA4lg1NVpawABgXIJyqYQZW6guxwIIm0Qit3LTYK
X-Gm-Gg: ASbGncuqeRowi+PCSYW8648OWpA77eOMSFUJ/hmCq6hnFScCtKHv3YeSePDCGjoVmep
	y6NJcF4oHUfoNKI+dPB4c34185Lm1Iof1lrXDU2qkwy6AmdwjJR++HhuAj7Qv1mfoDD2DeQzCsx
	9OiLbR/zWVA8YRS4DsNSwJNUs9NXVR6g7LECIIJaTvvedM+odr2RO6E2BzHLG1TGA6xm7MeL6lZ
	lVpcFU9FuW8T+Dr+BbAw7lxglK2jM+20qr43axtuJHb5mxfhwPOIlBwp2Oozg5CTtK0mN8mRp3E
	/LA0cAFTni0FQM8Dtlo5RL8C6Cu8fPg8eXImypp8mNrogBdtDLYOtODOR25qUXH6DBlqhcQDS+E
	QihsPdodZ2Z25CEfnFx8iH5l0tykNzYe5AEGqjd+OjtFPH/wiR9eoWt7pK3E=
X-Google-Smtp-Source: AGHT+IGeDQ/reVYdGrk3Ixycu5e5TUYCKh6cEoMm/K3M5xzTNaAwDZD90DyJeJrbM6gCLc9SyHeq9Q==
X-Received: by 2002:a05:6512:6505:b0:550:e648:1822 with SMTP id 2adb3069b0e04-550e7232577mr206286e87.43.1747338015527;
        Thu, 15 May 2025 12:40:15 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegddy2ah4yxpld5-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:5c04:23bc:16da:4169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dbc32sm426221fa.50.2025.05.15.12.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:40:15 -0700 (PDT)
Date: Thu, 15 May 2025 22:40:13 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vme_user: add missing includes
Message-ID: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
Add direct includes to make the headers self-contained.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
---
 drivers/staging/vme_user/vme.h      | 5 +++++
 drivers/staging/vme_user/vme_user.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 7753e736f9fd..55499b240dc3 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -3,6 +3,11 @@
 #define _VME_H_
 
 #include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/dma-mapping.h>
 
 /* Resource Type */
 enum vme_resource_type {
diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
index 19ecb05781cc..297b25fab164 100644
--- a/drivers/staging/vme_user/vme_user.h
+++ b/drivers/staging/vme_user/vme_user.h
@@ -2,6 +2,8 @@
 #ifndef _VME_USER_H_
 #define _VME_USER_H_
 
+#include <linux/types.h>
+
 #define VME_USER_BUS_MAX	1
 
 /*
-- 
2.47.2

