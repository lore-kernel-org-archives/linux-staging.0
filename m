Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142511;
	b=VJZzcnhQkyMcF7pjGCMKBCINDH4GupQCwTsJnqFCvxphZWxtiBeK69jmP33PaqEtBl4z
	 6vZfq690OK4IYbsSXC9XOE9h/CCGweOhC7CnhOuuKbc5DigpiOdrShpIwWhmHFrrm+87a
	 VUkRlmFqVTBZKjq7j9liiP53Lp5XXuL3hYQ8MJqVxw+aIH9v1zkj52JnQ7a4HiEh2Q4gd
	 kQQqWBNz+Q92K/kDzVt/KJ1HfNzOjW96XlxCvNe4RwsFQaDUx485H4UfoUMkeT6KG8iL8
	 5yLuQxGL3GBiYuqjmrucRaQYKcpZmegBDULzWyKB5d4x0SSC77nMF3QBn68b3dPFBOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=jSQrYStc4jQeNW6pXTM3VY2klAdG7hNRRS7S9gnVRzXa61YWZuPB8KatMcLlbhRaWozz
	 u/iWSEGawNq3ZgXPlwmTzaGmL8T6U4hiLSKtMFNXlR2RQnh8VF3l3GCbMhXDl6hsYqFMU
	 WUT5lD9vyFPJngLeApn0sccnZefckAd67UpAQeBeSmMipvr9kkW7goQ6Es0W8B3yuWGDd
	 qsu8etOSYyQt4MbgkgledraIDVTZXG3jj+RCfZ2ENzang0qCE8nDcpdKEoLq8voL1eNLw
	 C0LOgPGBi3CdmHLKd++jOxQrRAm5f+lw5Jcs5PeHZdKdD8NbQgxZra5+6426DI/lQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBpeXKTk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412B606A326
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 23:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7412B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBpeXKTk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2805885e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142510; x=1793747310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=hBpeXKTk8kgsbGMIjAT3av41mgJkfeCnqBBGm6QKB2pdPlHWE2UrEf25btXdcioaSC
         R1VjQcTReqNO9/UBxINfxZCwsIppJ5aGRfERHXJSZ6yzElB0omD/MOnj4QgKQL/viVJJ
         YtjJ/VqgUZpZS0akjya2btU5/7xLQ699+s/xn+f+neg2fOpZHEpEAdRRVuNhNxRN/t8C
         K81EnRJhigKxR2yDH3A6EJW/vrO6TRs/r2OYt/PmDsEIqnBCHu0ftjXiSuhrV6vt60sE
         74+nGLs2WyKDMYhMOIr82b8Gcbwn6XizrqNY1eo688r3Zsbn73EA1XbHRHVJlve0TlP9
         H9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142510; x=1793747310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=wpbReLUIcbJ0IfYo0XtFAGnwBQL8b8IadGrhOy7N5/bURB1HaJsKM6ufx8RBFlLrz7
         jFvnvihp3fF8+NqwWdix0cbms33Q3yovvahToAV/SZHHkh6yZydSpGa0nncIUvCMygyC
         43vHEmV/lBcWmWvsvGbKWJzEqjrQfY7VNQKKe1mxSc1SRz6B3+YHyb2Waa/sZwgs9mEE
         BLLtFVBiMDWMSKT/ccWZgeLBEROk81pn/hW8twdQy4nInuJl5HFstxSsDLYPApcPrZdM
         l6hkxZER7TjALZxm4EvUbBTB6hu8X+Yc1WoaTMZ9x9olKSR1k7kZXnTyE7940/Sq2/ZX
         sPBw==
X-Forwarded-Encrypted: i=1; AKwUvByOIhXlRknx5o8nldlfPff3AcAHQBEsRaOp4gyUMBePMFnnR7X+soIvVJjNoqq1t3Z/FvcR1XGTuTA/VnUc@lists.linux.dev
X-Gm-Message-State: AFq9FYJXtJIgU3YsI+AunsUSB0IeQCJRSJTM4j/Z+sYJ91hoeGSECu9B
	Z19gA/ntURj8n0WPZBE5aSCfUfUUgSPPaSAqVHyaxF6oWA8tf/pO+y3P
X-Gm-Gg: AYBFou3tQ5oH3oubQOLZaJfi5LE/Z4PYSIrwZy4dIYYMiukqCD4OKnVyNXh/eQZj1m1
	+Ybvw4PNHdZWMfRrUSIPMKMKuaCHi7VDsqgc9qfmKMgh5u2XnYUHwY2BF/Y5kKk3QZvBrK7DAWW
	bNxyY3EQvNiEcESfsGm9qYyqxA5opbbeZRGq67Uj6xpCh0n54iPAKqYNlB46gcyPrWVMMxzFr4M
	HO/mST+tTQjLRT6kwHTukDyQG15GiNpD79TTRwZbgkjk1Zy/U39kvFlpWgmNX/l9jW7xj952BgZ
	31X35o2DtVhm0h+k8JttdAMO9GjNn5DPq+upfdnagop9y9otGii6//OtogfTL7BZCxoMifMGo6C
	1FRvfrgFhyit8AQZYOHn7ekLxW31We91N0Qg1HS1/oFTLiKhIFOSbZqvWUFU2niU97bjOZ+CS3M
	Va/ROuEIqmXFzJ+ZCq1mdxhSfVkioK2BUl00N8Lg0PYSbCgVHzcJ0fzNdbKLmwkPsQgT0ITy7It
	iuwZfUSRqHq4wBptGaZFgvpgx853gpFfFiy2HD68aM29JeR/cyrnm8cX3GaQBV5rITLhAbJWwTn
	bTk=
X-Received: by 2002:a05:600c:348f:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a9678c68c3mr7755225e9.34.1793142509776;
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 23:08:03 +0000
Message-ID: <20261027230807.2407261-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0

