Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DA6FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:08:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso2011985wmc.4
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJOtoqsm0tyufNeV1ShS+S171FTUAh48RMkH3ha17v4=;
        b=SlNm0NOnOU3D9X7z4QlCCYEGLZVjttOaDxsOR0rE9rAuzcuPmGHO1lMw4L1J25ih9r
         1SY/55ujkNf/ZIpReEVsZ+Iegy+BPL0G9YVQbSJEEgHQAH0Zb/c5L9B5z1SjhHSgV+IG
         lyTn9EkKYEL9hVLVw8PCm295Zh826wfd32QhWk1AXh8Laxvw64h+hd576gKGUpiKiDKW
         cvk6iwPp3n6d3FriulPmVeD0a6UbAeiIuV88XhWpvuSv25qHyXBJuAo3hMjnXMM4/YtT
         +JTvWszlvlfA5TV8gpi6MDPRy+HjmUexMmpbW2urkfq81AeHbnvb48GyaUL6AB6Tn89c
         h4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJOtoqsm0tyufNeV1ShS+S171FTUAh48RMkH3ha17v4=;
        b=XnSTWDZuAgcGGLMDqXStUwVqWhTClsORvJpH9PWFKv/euw/AZoNSyaLH3qWc/oLn3S
         QO5yN3OdljAnoZ7rUtF8N8dpfpKoZZPZnsUEs9t0lF3hF1RLnmWcSSuFTnWyCFC9xJ3S
         oDASwtpxfIJ/AJ7mpOYNi0gL2appd40ZAsGP1c0ae28bWgTUL9GWuyOx9U1XDiixpkar
         UGSCJVm/JJOtz2+l2FU5V8Lug/l8rCSRFR/o73kefRf63R9mjiEakCZPqQr7Uy1pAMHu
         J/BvUmYc364ZeOIuF+1n6KIRrnOjQJ7C714fsLpj/NBfe2ja02h/GTMU9MlDG9zKJOqp
         yO6w==
X-Gm-Message-State: AFqh2kpxDWZrE+UM1awEwWxalHufs8xKVKVj/mvLI5abbvoDUM87BEnG
	fh+cXhFto9f1fXmeljRNIec=
X-Google-Smtp-Source: AMrXdXu0zZ33udh4WCWz0/jbl/UuD7jVjv9OZ1MwRXfkslyQvqHZnrnVhbnC0zchxd5xQUc59E2UBQ==
X-Received: by 2002:a05:600c:3b8c:b0:3c6:c5d9:dad3 with SMTP id n12-20020a05600c3b8c00b003c6c5d9dad3mr8933429wms.0.1674677298048;
        Wed, 25 Jan 2023 12:08:18 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id g16-20020adffc90000000b002882600e8a0sm5493698wrr.12.2023.01.25.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:17 -0800 (PST)
Date: Wed, 25 Jan 2023 21:08:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] staging: rtl8192e: Remove unused variables from
 struct rt_stats
Message-ID: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variables from struct rt_stats.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
V1-V2: Removed further unused variable preamble_guardinterval from
       "Remove unused variables numpacket.. and received_pre.."
       Removed further unused variables prxsc and rxsc_sgien_exflg
       from "Remove unused variables num_proc.., recei.. and rxov.."

Philipp Hortmann (11):
  staging: rtl8192e: Remove unused variables rxrdu and rxok
  staging: rtl8192e: Remove unused variables rxdatacrcerr and
    rxmgmtcrcerr
  staging: rtl8192e: Remove unused variables rxcrcerrmin and friends
  staging: rtl8192e: Remove unused variables numpacket.. and
    received_pre..
  staging: rtl8192e: Remove unused variables numqry_..
  staging: rtl8192e: Remove unused variables num_proc.., recei.. and
    rxov..
  staging: rtl8192e: Remove unused variables rxint, ints and shints
  staging: rtl8192e: Remove unused variables txov.., txbeokint and
    txbkokint
  staging: rtl8192e: Remove unused variables txviok.., txvook.. and
    txbea..
  staging: rtl8192e: Remove unused variables txbeac.., txman.. and
    txcmdp..
  staging: rtl8192e: Remove unused variables txbytes.., txbyt.. and
    signa..

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 39 +---------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 44 ++-----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  | 31 -------------
 3 files changed, 5 insertions(+), 109 deletions(-)

-- 
2.39.1

