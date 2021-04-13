Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4F70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b136-20020a1c1b8e0000b029012c69da2040so1530844wmb.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pgwrWrlifftIaaqyW67bp+zxPHy7WgjYbjTjOxGlaD4=;
        b=nRAW0K8gyjq8qELCQBOA1ymAfqbX1KXYxtMFG8pSfiZtINch9BYwnzFe2B46+OZwFR
         ihXVO3j9hBhj4uanuLdbeIK/sHWJkA+k4vFo53wU5dujAlVStGd7our3wygOkQCWC39z
         PGHSv2VAEurpMUzNGWoNdyXcEYfntNSCbtoHR8sUmNKxcD5JzYpR+UfZJq2DYTkfOcA0
         frsY/dHeMhueg7B5U3UtM+WYcGHb2O/3FX6dpfYsRiOQsZRQ5LLFR0PbemcyAYMN2jpU
         8yvb5zItbQajom2EnlK+V80LWyHA3wvdnwptFt0p/W40cHYF8V3YYKzWZChUdEjzggJ+
         mMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pgwrWrlifftIaaqyW67bp+zxPHy7WgjYbjTjOxGlaD4=;
        b=XPs2ctvUe+IaL5mWQRZbGD821fUNWCL1+t8BxwZ3oiJYM6dHdxu1R/Da4fjxsJJFtj
         jXD9m9GNsnpbkkw/m8aXp1v5/uzeescH/sd2wOj6bw4CFH4S9uwQ41lpCyN5eqeWc3BG
         7vc+DjYZ/G+h0Arw/CfwV8V3PgqOa3VOEw8PsijYE4ZbS0Iv4fHHZvdm9FkKPIXNav8K
         mFTsHZ0/Lwoz20HCq5Tf+c9icDczoKHCdVgo0z+Wq1K53xXyloGw6gaL1DVcgrJfLz1w
         GJMV8LuPkx2hI75TGL2yZJ61wgfZ2Vff/wtu1YmacMQBU83hsXQpcGfknU9xr2Kn90+W
         uUxg==
X-Gm-Message-State: AOAM530PRScbYdeLDuDO80XX/GNZ5+jPXhYuSiplP1F529kLM0pfM/+X
	EytbBSiild120Z39LHKYAY8RQeqdSnWxSw==
X-Google-Smtp-Source: ABdhPJw8PM64WQv8w90OKuCda9nWOUq1E+O8yQtQ3A5Q5ieekSubp8cvi8zJTlvcNk761/V6tacKiw==
X-Received: by 2002:a05:600c:4142:: with SMTP id h2mr386404wmm.87.1618325797327;
        Tue, 13 Apr 2021 07:56:37 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id l9sm2470904wmq.2.2021.04.13.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: rtl8723bs: replace DBG_871X_SEL_NL macro with netdev_dbg()
Date: Tue, 13 Apr 2021 16:56:28 +0200
Message-Id: <cover.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces DGB_871X_SEL_NL macro with the driver
recommended log function netdev_dbg().

Macro DBG_871X_SEL_NL indeed executes a raw printk call as
default behaviour. The other behaviour is doing a seq_printf()
call which never occurs.

First patch replace dump_drv_version with a netdev_dbg() call.
Second patch remove an unnecessary dump_drv_version() usage.
Third patch removes dump_drv_version() now unused and
        unused dump_log_level() as well
Fourth patch apply the following coccinelle script for macro
bulk replacement:

@@
expression sel;
expression list args;
identifier padapter;
identifier func;
@@

func(..., struct adapter *padapter, ...) {
	<...
-	DBG_871X_SEL_NL(sel, args);
+	netdev_dbg(padapter->pnetdev, args);
	...>
}

Fifth patch fixes a post commit checkpatch issue left
by coccinelle output.
Sixth patch removes DBG_871X_SEL_NL macro declaration.
Seventh patch removes an unused function argument after
macro replacement.

Fabio Aiuto (7):
  staging: rtl8723bs: replace dump_drv_version() usage with netdev_dbg()
  staging: rtl8723bs: remove unnecessary dump_drv_version() usage
  staging: rtl8723bs: remove two unused functions
  staging: rtl8723bs: replace DBG_871X_SEL_NL with netdev_dbg()
  staging: rtl8723bs: put a new line after ';'
  staging: rtl8723bs: remove DBG_871X_SEL_NL macro declaration
  staging: rtl8723bs: remove unused argument in function

 drivers/staging/rtl8723bs/core/rtw_debug.c    | 26 +++-------
 drivers/staging/rtl8723bs/core/rtw_odm.c      | 52 ++++++++++---------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 31 +++++------
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 -----
 drivers/staging/rtl8723bs/include/rtw_odm.h   |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  4 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  1 -
 7 files changed, 51 insertions(+), 77 deletions(-)

-- 
2.20.1

