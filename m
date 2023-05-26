Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F6156F8
	for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 11:54:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so7020355e9.1
        for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102064; x=1687694064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUt77/SiUosfK0/aaVE2BLo/sR7Y2R27EvH/CSNQIc0=;
        b=N9Jg9r/a4ntsdV7/xjpYg+uCtSB/q9qzw4m+5KksGD56kjWOOmATrc7MxbqvvCrU3R
         Fixqpz8LNfkWPPgQDy5iPITU/pMJCYiVZpdgeyU3Ir2tOpGblYnX5LV5INDPSrKvebAD
         hMY/6gig5Rpjlyx2mhEq0459NAsq59UKyCYN/zcc7YwcAbf/Ss3JDuiGAnTR04xQZIm2
         Gf8ZzDFmSQLXA2OtdZy7WA8LUOzx9hToLEIFO6+yFoDw/L96kG1wLTeagamRRrFHUJwL
         47XgqkVqPSCD34Wo3+Xnp8QnR0fFODIxmhvoXKdc+XQB0DSy7k+fJMcVVfvjBvWhUlRj
         /QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102064; x=1687694064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUt77/SiUosfK0/aaVE2BLo/sR7Y2R27EvH/CSNQIc0=;
        b=CMFbkio5GwB47kaAs7Okvfp8lztj74elsTkNTn5aI6/pJzyJ66sQfThlTeiGHyTvSC
         NCJDcmMD+61pVdmPrsIeM/xDLedjS0uV/BWcUWOaFPoEkQGr0GhEgnlZYoPDAPgab/Jh
         ozpIp8k961K9P5wKF0rEyJJgM5qjZhPga9mT7YmSyyTkqFKNXdqM50n2yAwqFFT5nl8v
         R2b1NHwGa5x/tENMBCAhczAvd/FUxBjsXjMOjFSEMdHXrK56iQP5ZenkuPT6xTtwr32k
         0oDMtgF6H0CJj9I1sJrYqMHKHoDynzxv6lDsGf2IFOBdh2fVWEy6m/pvmJSdjDwz+5tI
         aDcA==
X-Gm-Message-State: AC+VfDzlCwpzaKchkFtKClV2rmYACXpPzyP8qHBL7hCk8LnImecUbwFE
	FBO/1NkHmJ6HC3FXGsfk3grwwDA+/IFxDQwvRMM=
X-Google-Smtp-Source: ACHHUZ4kb1ianWoD3OzIBAumkRHPdUBowfg8mTkdAgEiywYbxBMdk2CzZVbYSvuSI8cMPLz8QYN8Bg==
X-Received: by 2002:a7b:cc93:0:b0:3f6:9634:c8d6 with SMTP id p19-20020a7bcc93000000b003f69634c8d6mr1383382wma.18.1685102064660;
        Fri, 26 May 2023 04:54:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b003f4ecf1fcbcsm8742933wmf.22.2023.05.26.04.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:54:23 -0700 (PDT)
Date: Fri, 26 May 2023 14:54:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [bug report] media: atomisp_gmin_platform: stop abusing efivar API
Message-ID: <26f37e19-c240-4d77-831d-ef3f1a4dd51d@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

The patch 38d4f74bc148: "media: atomisp_gmin_platform: stop abusing
efivar API" from Jun 20, 2022, leads to the following Smatch static
checker warning:

	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1437 gmin_get_var_int()
	error: buffer overflow 'val' 64 <= 64

drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
    1427 
    1428 int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
    1429 {
    1430         char val[CFG_VAR_NAME_MAX];
    1431         size_t len = sizeof(val);
                        ^^^^^^^^^^^^^^^^^
len is set here.

    1432         long result;
    1433         int ret;
    1434 
    1435         ret = gmin_get_config_var(dev, is_gmin, var, val, &len);
    1436         if (!ret) {
--> 1437                 val[len] = 0;
                         ^^^^^^^^
Not all the success paths in gmin_get_config_var() set out_len.  Also
gmin_get_config_dsm_var() was problematic but I've sent a fix for that.

    1438                 ret = kstrtol(val, 0, &result);
    1439         } else {
    1440                 dev_info(dev, "%s: using default (%d)\n", var, def);
    1441         }
    1442 
    1443         return ret ? def : result;
    1444 }

regards,
dan carpenter
