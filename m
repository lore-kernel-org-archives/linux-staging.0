Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1C2582
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:50:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-947a47eb908so90102866b.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680904215; x=1683496215;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq8RUQdzJGvVRHtSpwTfubZBnwWXomggCH4yTMLMhUA=;
        b=YZoa6b1LgZLhTRKbgPtIevcXFYpMcLDHzfzwnFNrW73isDDqzdc5rlJPsYyZX/8Cdp
         1v4LjfMk6+ssbGWHTOo0SDXN1N3FOLF9f5rmyHmVDKuO6X27N++FQ7BZzuAOFBn/gj+c
         cuYMaEnjWHWRGBFXWA1NcKPGUdquJA4BCymYefa4NFo6mnDH5JBc0Efi9zziVB3p9npY
         LBCPNqxcXVdtAg9PPEm0KhFKHO1BbT4fdwnevZibhjkVwxyonTWhdpHxgk7QHDZ15Pfz
         beZc1hbz5yfen7oOIeq2RqTLUUq0kPyQFOfJNpFX+6Q7z6jaUxOQhCJIyquFj/on/vUb
         D75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904215; x=1683496215;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq8RUQdzJGvVRHtSpwTfubZBnwWXomggCH4yTMLMhUA=;
        b=KleqhdP9dwlnQaeEAzn2KWlc/gzqR5xhiC4GpfBy1O+2EJFZEftuM0EO5S1JGbwSWj
         HzRoY2BDm8bdBaVyndeYpHeODQhwfdf+TzZcA5gqHtjUz0YrnfqUy5doLzzvt9hbsySB
         4/cF6fAuu4caWUlhGxzaJVSbz8g5CfcR0t8ULlJm30D8cxOni06ZU//NRUVTO+QkxiQv
         j/RuJJT6WN+3x7CL2fyketCsbH96z6NNR85fEf/g4r5rfPLjNzd13nMyjlu1Ko4l6MUg
         vGshg34MbbVe0qzcg5dkrOLT9kcg8oMd2UQ1mAn/98E4JmwryXDKa1KzqsZIYfeXgnqO
         0nOQ==
X-Gm-Message-State: AAQBX9dNB9Ul9o42RlLSTbPNhp+HwftFyKdTsEfGHtShrZU7fLqsHz1R
	25f2drPuXa6Og3GtYepEOsk=
X-Google-Smtp-Source: AKy350aRz71SCGQ3kQveFF5UROzvL+o0nTf8PrYR8yyMN4DiOl6b3SgDcbkFJvpeCSyh1uM9PqTsPQ==
X-Received: by 2002:a17:906:19c:b0:947:bff2:1c2d with SMTP id 28-20020a170906019c00b00947bff21c2dmr720729ejb.3.1680904215069;
        Fri, 07 Apr 2023 14:50:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id k16-20020a17090646d000b0094863433fdcsm2452572ejs.51.2023.04.07.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 14:50:14 -0700 (PDT)
Date: Fri, 7 Apr 2023 23:50:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] staging: rtl8192e: Remove unused code for hardware
 rtl8192se
Message-ID: <cover.1680902603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused macro IS_HARDWARE_TYPE_8192SE and unused function
_rtl92e_dm_init_wa_broadcom_iot. Remove a double check for hardware
rtl8192se. Remove unused variable.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
v1->v2: Removed patch "staging: rtl8192e: Remove unused local
        variable irq_line" as it is unclear if the pci_read is needed
        for a hidden feature.
        Checked in patch "staging: rtl8192e: Remove one of two checks
        for hardware RTL8192SE" that the pci_read does not follow a
        pci_write
        No changes to other patches.

Philipp Hortmann (4):
  staging: rtl8192e: Remove macro IS_HARDWARE_TYPE_8192SE
  staging: rtl8192e: Remove unused function
    _rtl92e_dm_init_wa_broadcom_iot
  staging: rtl8192e: Remove one of two checks for hardware RTL8192SE
  staging: rtl8192e: Remove unused variable RF_Type

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  6 ------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 18 +-----------------
 drivers/staging/rtl8192e/rtl819x_HT.h        |  3 ---
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 5 files changed, 1 insertion(+), 30 deletions(-)

-- 
2.40.0

