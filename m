Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92911702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS1/zz5Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b36e721fcso7374665e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221954; x=1702826754; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU3UOTWi/bc8m8mRCi3eOJl1ODr7yK88X76oXpFr/pc=;
        b=fS1/zz5YwJhx+ySggEFTeLnkHhrCbZVMOlPqyyTB5BOJKSf/67GIPgSmgdvh0+dfrq
         9YPyz2O1bz9DxDzMfuYeore3tcWxQll5s/Owu7AmyUHUvRv+a0nQNu+mqzrwIht7GfOH
         jXR/MmUF8SAw5zf9/YEgunBwNSn04PEMCCu59Lpzq2sPWE8G7NtXKeNAfhRQ+Z16Ct2Z
         z+WwW2BHTiQeZmdaXR8vIdzqL0FIDxhzh2N3BzyO3rgE3iXIZklV+x+AeTf/YKdAfZJ1
         5ZWjbPj5eOgfyy+oEOUzxIYwmFxbJi4+GmP+60W9ZnVnwHpO4fk77iDjaayp6KuoTfBj
         QOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221954; x=1702826754;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU3UOTWi/bc8m8mRCi3eOJl1ODr7yK88X76oXpFr/pc=;
        b=MDnXW23Gi+l66dDxf4LJGA2D8fIOPSTuczqWLPal6ogdJsqjuu0dg8L8TqEell3Oqp
         yOSsexd32C+4MtbuzYHyc/LWWhTb/l7/1KRqktNlhjM8YscfFSniQaVhoJ9f5w62XeR9
         bXLBQ4X4GTWx/W0RMHzLFAqg8AQaXu4j6u66GQIWlgAF5oi9yWx4nA0SGbelYhSHkZHz
         8W+S5NhOCC4y/+3wdf6BrbS3KKYThDm+CBdjcRf+baIwOSheAsTqCF/uawWOmv2aa8dh
         6GgZRH+Vi3eonZ2704LbD4UhyMf6+s52I9t+wwbJDLXwisNzbGuuNie0LN1CYYkkSQnu
         2/bQ==
X-Gm-Message-State: AOJu0YzMw2BC8GB5lIf9HOJFmUsb+1JyDWgshSjiozP0KcJyj9Dax5er
	tdM8DjfcTw1lehV2xb/R5MXJ3WvT87k=
X-Google-Smtp-Source: AGHT+IF8xpX7wWYcaDpuGbCoRU2s7+3c6lI7BAfqTZv24zjpHCv4Xktk4Esu7Gz5utBvvqCohlYvfw==
X-Received: by 2002:a05:600c:2eca:b0:40c:3172:acb2 with SMTP id q10-20020a05600c2eca00b0040c3172acb2mr4015413wmn.4.1702221953810;
        Sun, 10 Dec 2023 07:25:53 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b0040c41846919sm3867397wmo.41.2023.12.10.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:25:53 -0800 (PST)
Date: Sun, 10 Dec 2023 16:25:50 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove variable reg_bw_40mhz and
 further
Message-ID: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused or unchanged variables.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.
Tested in b,g,n mode and n mode in channels 2, 9, 10, 13

Philipp Hortmann (10):
  staging: rtl8192e: Remove unused struct iw_range_with_scan_capa
  staging: rtl8192e: Remove variable ht_info->reg_bw_40mhz
  staging: rtl8192e: Remove variable ht_info->reg_supp_cck
  staging: rtl8192e: Remove variable ht_info->reg_short_gi_20mhz
  staging: rtl8192e: Remove variable ht_info->reg_short_gi_40mhz
  staging: rtl8192e: Remove variable ForcedAMPDUMode
  staging: rtl8192e: Remove variable ForcedAMSDUMode
  staging: rtl8192e: Remove equation with pPeerHTCap->DssCCk
  staging: rtl8192e: Remove variable ht_info->bCurSuppCCK
  staging: rtl8192e: Remove struct ht_info_ele SelfHTInfo

 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 22 --------------
 drivers/staging/rtl8192e/rtl819x_HT.h      |  8 -----
 drivers/staging/rtl8192e/rtl819x_HTProc.c  | 34 +++-------------------
 drivers/staging/rtl8192e/rtllib_softmac.c  |  5 +---
 drivers/staging/rtl8192e/rtllib_tx.c       | 21 ++-----------
 5 files changed, 7 insertions(+), 83 deletions(-)

-- 
2.43.0

