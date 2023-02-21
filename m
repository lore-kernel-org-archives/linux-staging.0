Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530033C4
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:52:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b12so22345659edd.4
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677012766;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME8MmTL9+xojo7h0KQk1KDfx29xTX9q7Bc+zC3HoTX4=;
        b=IAc2VZ7fVro0mazMsBITGoh0A+rYarGL+Mq/INZe/ug+CaZUIkAg1pR58RfjtzLSxb
         v4msx0AzIcb8LG9n1aTEDxzVdzKj4vZYummLfGlFgPA4NLCX70vLeYwb8s7I6jKpQgDN
         c8DlpHtR12o5K9S5sHZZ7wswSmPBP5jzPjveI0TyRnznQg5VIxT5q60PhG3taZuSVKnd
         pMxY6n/FgEnGdFAAhN6IAlorhrLS+6ti4mjZdCT4LOuVWd+r/8zfl/ZuSxbcBH3yoXrf
         Hz59dqjnD5FV8kgsErStepARRrPN09Wp7FoRvGBbnq9NDRVa+VAMDDKwCNX7QBxnlYFw
         vyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677012766;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ME8MmTL9+xojo7h0KQk1KDfx29xTX9q7Bc+zC3HoTX4=;
        b=n/rNQMx/jJ59e5+7/cJalBaYQPLECJoIQDu8RsaGAasv66t0znF1UuAGJ1n5uC/KNv
         yA2i4i4vQU786Uu/xr9ztDvozd7JcgwU8ti6WgLXeDrzGeqAA66mMFnk5/p8zMsy77Gm
         J60DE4aMGtNiyCgxlgcHl4k5ANa98k95r6oRcX5p3H1/ifxHH6BWo3Qfa2H7tHt5Iof+
         kN7uihI6ifFsLtbLmwKJxXwS2YtQVJujeT1/ljsME0VwCCR744i/O024erYzs3eksCuq
         RHsrlK4RQQlQDAG8K0lnoKGSNnf79RYFq2O22A9+iXu1TxuWfK7r2KkZ6W5sEbHKaNuo
         pW/g==
X-Gm-Message-State: AO0yUKWWa3Slc5nyojBIcY5zghyfleVzgktWqLQ7jxwHXiImzsC66+uL
	fpwmucZjtF+2qPnseR8t61Y=
X-Google-Smtp-Source: AK7set8caNMFM8ZxDaaL67ZSIP4ulVMYEfysOtSt/1Lciwb+IbUD5p8JRlUy+A2D96xM9n+K3uqbMQ==
X-Received: by 2002:a05:6402:268e:b0:4ab:178f:e2fe with SMTP id w14-20020a056402268e00b004ab178fe2femr4989935edd.0.1677012766390;
        Tue, 21 Feb 2023 12:52:46 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906738400b008e40853a712sm496113ejl.97.2023.02.21.12.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:52:45 -0800 (PST)
Date: Tue, 21 Feb 2023 21:52:44 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: rtl8192e: Remove entries from struct
 rtl819x_ops start with .tx_enable
Message-ID: <cover.1677010997.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary entries from rtl819x_ops and replace them with
function names when required. This increases readability of the code as
the reader does not always need to look up the corresponding function
name. One patch just removes dead code which increases also readability.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the this patch series:
"[PATCH 00/11] staging: rtl8192e: Remove entries from struct rtl819x_ops
start with .get_eeprom_size"

Philipp Hortmann (7):
  staging: rtl8192e: Remove entry .tx_enable from struct rtl819x_ops
  staging: rtl8192e: Remove entry .interrupt_re.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .tx_check_stuc.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .rx_check_stuc.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove dead code from struct rtl819x_ops
  staging: rtl8192e: Remove entry .link_change from struct rtl819x_ops
  staging: rtl8192e: Remove entry .nic_type from struct rtl819x_ops

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 20 +++++---------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 12 ------------
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c  |  6 +++---
 3 files changed, 8 insertions(+), 30 deletions(-)

-- 
2.39.2

