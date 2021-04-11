Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FDF72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:05:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r12so15542214ejr.5
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=az8q2odqAehv/6ccb9+lYFG/ANi2ZGKRpdq6W0qCMck=;
        b=h157FVAEdsj22vfj8EhBEa/n516NW0gIl7o8+tw8rdFUvDIObwG7ab0F0McIFnlhWU
         HkABfVBoQ6FHOSVgoRTXMgAUJIBJQolYbWyTpdji0iWbYNOE8vXpXSdH+HOaExRsP5Or
         7cxTCcuPfmxB9K6X+FNJ671tqC6PQJqMlrZqnB4rBvcdclTM8ubwSbxrR0hV4nL7swNU
         xo1ATP47vzutATXf6CQJkF/t5lQhjhs4BwZhEkFZfN3SBMMaS5cYOQuJRrhfKoEDf9oQ
         D7+j4LXPTt/0ET4Oo8S+7+y5F5IKafEOIB1yuMr9KD9qdjF2T6I86OQaWL8L0eAW9DrV
         paEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=az8q2odqAehv/6ccb9+lYFG/ANi2ZGKRpdq6W0qCMck=;
        b=PM7ugR9TAPwmlYPjNIcdCiVDbIFmVfZgeQIRQf1mr8rf3aSEY5uKorkmzDfGIfhjhI
         nI/p7xqFaOlbnuuWos/vaKYdbvKRcz2OgPH76MijKVzKm5S162p5B5XLA0E5JbNBg+Dg
         fdrUh3TJjM2UTd8HDrz3WyPJTs45U7x8z4gf978CH8hB/AxUS/5lJNK+cI+gSSek74Wq
         LYjBpj4meIiW90Mkm1bjQC4uwF/g7mp/jfdGK5WfUzqfZ0XNgLD+6+3sPha1r7DmyiEb
         wJsg7Xm/7U33cxftSGheK0MDmuo2SBLDlhJi9mhoXipOFL2naJFNmYKq4DyQICQx0na2
         xmCQ==
X-Gm-Message-State: AOAM530+Zq9zKVk1+rgc1lDWgb7xF6zexH/48Y8BrSX+uq6AuR939uqQ
	n76Is5eP+9I1U+tQtQHmz/A=
X-Google-Smtp-Source: ABdhPJyGmIUcU9hMK8vtxrrVi1WWp4GtlJ7YQ0MLjun1KSanFzDmudqZFAm1ZSsEULXv84IutKFqTw==
X-Received: by 2002:a17:906:b28c:: with SMTP id q12mr8781212ejz.284.1618139102222;
        Sun, 11 Apr 2021 04:05:02 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id i2sm4577202edy.72.2021.04.11.04.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:05:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v5 0/4] staging: rtl8723bs: Change several files of the driver
Date: Sun, 11 Apr 2021 13:04:54 +0200
Message-Id: <20210411110458.15955-1-fmdefrancesco@gmail.com>
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

Changes from v4: Write patch version number in 2/4.
Changes from v3: Move changes of controlling expressions in patch 4/4.
Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

Fabio M. De Francesco (4):
  staging: rtl8723bs: Remove camelcase in several files
  staging: rtl8723bs: include: Fix misspelled words in comments
  staging: rtl8723bs: include: Change the type of a variable
  staging: rtl8723bs: Change controlling expressions

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

