Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DEE5682
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:15 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so12182743wms.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKb3TZUek2HqmZm24nIdjxpAgxRn7zyw1dpq0C4JxaM=;
        b=UADcJhenEukdNJPsH4qL18yi0P8qdk4xW5PT23pPNSbkWqV2fdU+ExgcHN9jLTd5DJ
         5fiolyeCDgJDw+J6dr9i1xrq+dhNYimAEUHjzRQBM+gGSoxqeefSAcFAwLWd+YspprIB
         Jaca/QMdvdf7XUIZ/wRobwyhVYfUtEv1KXSxt1EtduJGnmSpv5j1ccmgrI+18xlZPPgG
         1snABnIaRsElD24rZJ1AaReHKcKj9SzWjg0vTC3ebPt/XDLuo9Wouv0ybOL/J1V1jD5W
         jdQpjSKGZqsGUNIDJpoOEH/zZmMCq8Ycpy8fXyE3Ra0Talslh01bI3KC9OtIB8+qPljh
         Kfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKb3TZUek2HqmZm24nIdjxpAgxRn7zyw1dpq0C4JxaM=;
        b=r1M2OFpMv1K9vak3y+sgdKH5WJf33T0+EKrOhvozRbFw9D4v14wbUIYDDmxiMGKTAy
         fbRZdKDM6sRPItf8X0sfVQrHKMhxl8HsAIn8+nY2pqF+ZScHU/zRywGuPIkucdwRN43D
         I5xzfnchxnDb6Gmr8MA3idnDu6Zf8/CLGlEfoyORtYB8hrMH9PgZH4zYUK22QyBU/Aci
         FcRLvM0s6vConZ0Ygb7EoM7gTpW0fHggn6872lr5/TT6vOHc9Zxoi0DAVArLF/ZAnh/T
         d4jxxeAfAMSeAC2L4zqcCa2pHFOXTNSwVzVc7hL+ixuoj6/L9Gh+97Y/TwC1VEQfOC2D
         NaNg==
X-Gm-Message-State: AO0yUKXY49YKtbwvjcQV3vYUZXAnoe0ulNTEbw9F8rzyyqbZNZ+6cO5W
	Sa5R/9m+O2RGeKKIaxZZKWw=
X-Google-Smtp-Source: AK7set8ATmtKImeOQFkQuVpNj8JmYvU2ELUB1+tOeaIgJOI9rzZF5uMA/mUPeFVIXerXL3FERcortg==
X-Received: by 2002:a05:600c:1c1b:b0:3dc:4234:fe89 with SMTP id j27-20020a05600c1c1b00b003dc4234fe89mr5185724wms.2.1675793773412;
        Tue, 07 Feb 2023 10:16:13 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b003db0ee277b2sm19706599wmb.5.2023.02.07.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:12 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:09 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Rename constants and variables from
 rtl_dm.h
Message-ID: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename constants and variables mainly from rtl_dm.h to fix checkpatch
issues as CamelCase, missing spaces and double line breaks.
Remove dead code in case of double definition.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (10):
  staging: rtl8192e: Rename AcmHw_ViqEn, AcmHw_VoqEn and
    ANAPAR_FOR_8192PciE
  staging: rtl8192e: Calculate definition of MSR_LINK_MASK
  staging: rtl8192e: Remove blank lines in r8192E_hw.h, rtl_core.h and
    ..
  staging: rtl8192e: Rename MacBlkCtrl and remove double definition
  staging: rtl8192e: Rename OFDM_Table.., CCK_Table_.. and
    RxPathSelecti..
  staging: rtl8192e: Rename RxPathSelectio.., RateAdaptive.. and
    RateAdap..
  staging: rtl8192e: Rename RateAdaptiveTH.., VeryLowRSSI and WAIotTHVal
  staging: rtl8192e: Rename Enable, cck_Rx_path and SS_TH_low
  staging: rtl8192e: Rename diff_TH and disabledRF
  staging: rtl8192e: Rename DM_RxPathSelTable

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 22 ++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 15 ++-
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  2 +-
 .../staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  3 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 96 +++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    | 37 +++----
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.c    |  2 +-
 8 files changed, 82 insertions(+), 97 deletions(-)

-- 
2.39.1

