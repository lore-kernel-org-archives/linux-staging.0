Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B070
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 08:29:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id w3so15221113ejc.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbd5H0UwYLbMR62cEsPc4FBrxl4fQyEDt4D7w7SlNtw=;
        b=Xv+wlrWwbWGUutpihPJnRxfmD1h93HBgETHnKDs03pQmldV52gKO05pW6sz3C7biTv
         K1mTrXxIAkBzz7G9vs1kg9aJm9sCLn+kH76GDBbkLpftIzSV56bNGbUoLZ5NdSoC3fZJ
         UNnaP4ApddRQ4NgTYZR+p30Y5uC9Zi4QqzzmL1SJsvBZc9MnAB+s3bThHq1qIzHODgVf
         7xvlmYG7upHGLnvRilaJDLRNub+8JkZYMLSobfhGwhtvQPEEryxAQ4OHikY30Wmztunw
         TXtXp8yskYxwJQcOgiG+uwvMqdOqmdrIVlug47ZcVg34gUchpxzd2l7of34ao4NC6EwI
         bUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbd5H0UwYLbMR62cEsPc4FBrxl4fQyEDt4D7w7SlNtw=;
        b=S9cOVLUhHjfdx1U7KdwsCY8LQov7E3QbfUcRMGU3YDoE8OMmr7lFrwpgm4Yno/FbIZ
         fWXXtGD/O/41PdfOxIWQ5LCY4Y85B1xN+U/bRWKDuZQFsgWoL+8KoQe3mcxHB0hKPExE
         PcCTPxvArHpQSoFqGtCoKFY+UGjIdSbclHXNfY3KI27JUKvJD2gOmZvzzy5itJZRUeDX
         +Ym3slv1t1LUn7aViRr2XkQwKU8t2bLkoAWpLZUxOD6QegpwsQH+Sv2P9q/6YUamsqOS
         Wb8NdHZDxaNIXe4X5O0oqVmq3FoinXQ0hwLK5l1hteJYrBllwTErWjNAJyMsUSlKvqI/
         mo9w==
X-Gm-Message-State: AOAM530RYl9dxU57rx1hmX1v0jLP/H6tIlrhmnx8x1jDGkyLeB1CIhzl
	oiwtBleMzPCEOmOE0skRPYs=
X-Google-Smtp-Source: ABdhPJyNZirbhS9ukY9aKtE53LirNOwGRzkMtW5FM9oJo2ZMZMXY123Z07csy+YcgkKhcas4pr7UZQ==
X-Received: by 2002:a17:906:9b2:: with SMTP id q18mr22788236eje.147.1618129754397;
        Sun, 11 Apr 2021 01:29:14 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id hp12sm3682541ejc.46.2021.04.11.01.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 01:29:13 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v3 0/4] staging: rtl8723bs: Change several files of the driver
Date: Sun, 11 Apr 2021 10:29:04 +0200
Message-Id: <20210411082908.31876-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove camelcase, correct misspelled words in comments, change 
the type of a variable and its use, change comparisons with 'true'
in controlling expressions.

Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

Fabio M. De Francesco (4):
  staging: rtl8723bs: Remove camelcase in several files
  staging: rtl8723bs: include: Fix misspelled words in comments
  staging: rtl8723bs: Change the type and use of a variable
  staging: rtl8723bs: core: Change a controlling expression

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 18 +++++-----
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 14 ++++----
 .../rtl8723bs/include/Hal8192CPhyReg.h        |  8 ++---
 .../staging/rtl8723bs/include/basic_types.h   |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   | 34 +++++++++----------
 drivers/staging/rtl8723bs/include/hal_data.h  |  2 +-
 .../staging/rtl8723bs/include/hal_pwr_seq.h   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  6 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 18 +++++-----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  2 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  4 +--
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 +--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |  2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  2 +-
 23 files changed, 70 insertions(+), 70 deletions(-)

-- 
2.31.1

