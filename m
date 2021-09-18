Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6E3FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id v5so42572880edc.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPQxqApznozzGxmIzZvgKnlRlxKs6mC5a3qq+j04H9I=;
        b=PRCekKGHawQ11jBADXVwcKBQ6mMms4qimPl32QMQqoQnEMrUjdkAowqUBA29WrCNZo
         J6OZHavRXU32TQSgpGZz+OrZ/KgggH1IZYB5U5vdc/c3yR7+TzzNTDlByPKBZFF65nbO
         L4HWDiPC0Ds0pCdIX0Z3gMoExrigxQ5nwg0RDBz8ALi3hFXLJ7mXWoKzE+z0FH/bj2Ut
         nXmXeqP20r+8myXv2cfxAceCZoUp8/aCCfIj3w9OZI64suUGDk4CKLgXlnoiTVzw16R1
         tBqGWJ19a9iyY4tbpcAlNYwFDNNLs4oJQFdp/Xw+zPn3daAMQkZ/77DctcuXlENNwNU8
         oHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPQxqApznozzGxmIzZvgKnlRlxKs6mC5a3qq+j04H9I=;
        b=n8r11z8UPis8sMUX37Uwzcr2VAe7e60EDka+ynXzk37G6OGRDqHd+OufVVDu+k9fBu
         0cDp5xymSRaTdVD6N6xxpS5HOSat+gPEelRiFlL8MmEZwPIyCrsED5Hf7Y5lXvZPezEk
         0lQUuEu9owieMBbIiqRflgkhGqaGEueKDjSdggiDLN12/xgc/+3U4tD5cbln6BzNrvvT
         5qeYVcMiAK41VaE9CZCPIuXcoNYsSkeIpyjB8BopiwkRRDx6d3Jp/YfYUM1qSoDBzu7Y
         +0Hjg0x4AA/j5vUPylNWqwtEjEdQ/yFajT8hojcwCEmbMK24ra9frLs5/C5GDnSwZNhO
         2Sqg==
X-Gm-Message-State: AOAM533xhy9hTQF620GqwMtaCvH3NN3uMTa9VViPj5RXpRuRU/j3a2PN
	qvyc5rY/QCXm9iHL/q8Ivu8=
X-Google-Smtp-Source: ABdhPJxzNlRWQV2P1N54o/h3NTWK7I2bE857Jl7NyPlNiaPJ6QRM8yuq1J8zMPVjkzN7z09vkv2Zag==
X-Received: by 2002:a05:6402:1855:: with SMTP id v21mr20407272edy.349.1631989157646;
        Sat, 18 Sep 2021 11:19:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 00/14] staging: r8188eu: remove odm_RegDefine11AC.h
Date: Sat, 18 Sep 2021 20:18:50 +0200
Message-Id: <20210918181904.12000-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 12 patches in this series remove macros and code that
is valid only for 11ac chips and therefore not needed/used in this
driver. Finally we can remove the header odm_RegDefine11AC.h.

The last 2 patches remove unused defines from odm_RegDefine11N.h and
clean up indentation in that file.

Tested on x86_64 with Inter-Tech DMG-02.

v2 -> v3
Added 2 patches that were sent separately but depend on this series.
The first 12 patches are unchanged.

v1 -> v2
Changed subject line of patch 11/12 to fix a typo.
All other patches are unchanged.

Michael Straube (14):
  staging: r8188eu: remove comments from odm_interface.h
  staging: r8188eu: remove unused macros from odm_interface.h
  staging: r8188eu: remove _ic_type from macro _cat in odm_interface.h
  staging: r8188eu: remove dead code from ODM_Write_DIG()
  staging: r8188eu: remove unnecessary if statement
  staging: r8188eu: remove more dead code from ODM_Write_DIG()
  staging: r8188eu: remove macro ODM_REG
  staging: r8188eu: remove macro ODM_BIT
  staging: r8188eu: remove unnecessary if statements
  staging: r8188eu: remove dead code from odm.c
  staging: r8188eu: remove macros ODM_IC_11{N,AC}_SERIES
  staging: r8188eu: remove header file odm_RegDefine11AC.h
  staging: r8188eu: remove unused defines from odm_RegDefine11N.h
  staging: r8188eu: clean up indentation in odm_RegDefine11N.h

 drivers/staging/r8188eu/hal/odm.c             | 224 +++++++-----------
 drivers/staging/r8188eu/include/odm.h         |   5 -
 .../r8188eu/include/odm_RegDefine11AC.h       |  29 ---
 .../r8188eu/include/odm_RegDefine11N.h        | 112 +--------
 .../staging/r8188eu/include/odm_interface.h   |  41 ----
 drivers/staging/r8188eu/include/odm_precomp.h |   1 -
 6 files changed, 90 insertions(+), 322 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/odm_RegDefine11AC.h

-- 
2.33.0

