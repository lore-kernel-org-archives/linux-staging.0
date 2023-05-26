Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566F2156F8
	for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 11:53:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3093a6311dcso601117f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102007; x=1687694007;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JA3Z031EuYV7G9C1xFF3gOewbaEqhRavFGyCZzLQ4k0=;
        b=dp/JrIV318+le9Ak1KhpMRXxRp1rnWIJLBmLEngjbOuEFXT4n/tfxEQlpXoZQf5+Ln
         ztVO6WxXHSCwsa3wV3vCndy2xtRfhS8aeIYZyImCG5ZcKosXsH93mfIktYV+svbe3u9M
         0QOfrno/Z9EUL5/7CcO9cHMVQYr0ZcekO7zQmyinYcBuWGtHdyydXjZANFhnnro2Zdzg
         7a7Ea2B1bglkabSyU7GZTcEGLWGcYhL8bKaApIsakPFLQXmOI41NgyJqCS0lxkmMklbu
         0ji48BfrQiEq/DI7d8dEEJ1er+qpTWUQ0teWQeTJHs41oKkHPh7dsjHA0nE339frw0IF
         1Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102007; x=1687694007;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JA3Z031EuYV7G9C1xFF3gOewbaEqhRavFGyCZzLQ4k0=;
        b=ewifCNwopCTuUDP5HARf+peBcBNG9Xu2ZBM2/bQfodt2IxPX6bbKhrBqxMsA3FSC2z
         336yv6tF1p8v7HBaZKLEk7dYMn8us6ijHeoKgS3xNk235ECIeVrcIWZzwHepF9MtTQYi
         9hRCjVfCiFj9w313bmBr7VZ6mlNItZw0TWpnduinQ2ZyQ7rtb5t9UZ1Fp9lgMnBYi3cO
         fxs750gGyw6ELb5hGWZscPxUnV9xQ5eCEGCOTp/r2RhhB3wjk2CU2oIPzEYr3uHFU5yn
         hA79JjAxa4kOPRgMkWRIy37C55DO8K9ogfAgyF7tCOIUwvwG/jjwNoGCPaYD3VJ0ag+w
         SIEQ==
X-Gm-Message-State: AC+VfDxINx3QHgCiwotM/BqE7ttv68BMFOPIEiVMKSQA1h/RIcHA7/cE
	1ZPciB1HFML4LYbnZlydQRbpxA==
X-Google-Smtp-Source: ACHHUZ5A65Cfn9A34sTFV6Uw0LxcLFBMzuZVTgqdX73nwws6y2XfvNz69/bHKDGYRGRa/4yegmQmpw==
X-Received: by 2002:a5d:6a44:0:b0:2dc:cad4:87b9 with SMTP id t4-20020a5d6a44000000b002dccad487b9mr1237941wrw.68.1685102007583;
        Fri, 26 May 2023 04:53:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm4924229wrm.6.2023.05.26.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:53:26 -0700 (PDT)
Date: Fri, 26 May 2023 14:53:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: gmin_platform: fix out_len in
 gmin_get_config_dsm_var()
Message-ID: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Ideally, strlen(cur->string.pointer) and strlen(out) would be the same.
But this code is using strscpy() to avoid a potential buffer overflow.
So in the same way we should take the strlen() of the smaller string to
avoid a buffer overflow in the caller, gmin_get_var_int().

Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index c718a74ea70a..88d4499233b9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1357,7 +1357,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	dev_info(dev, "found _DSM entry for '%s': %s\n", var,
 		 cur->string.pointer);
 	strscpy(out, cur->string.pointer, *out_len);
-	*out_len = strlen(cur->string.pointer);
+	*out_len = strlen(out);
 
 	ACPI_FREE(obj);
 	return 0;
-- 
2.39.2

