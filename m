Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0171
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:13:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l4so13060141ejc.10
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzckpB2RAMOBd5T4XWzNGlvU9ohIMVxQWJop+FdQAYs=;
        b=qfmDDx80AO89QhPMNuePmFAqmebjkbPHO2EpWFp99nDuilRO6a59EQUVmoLPMyzdaU
         v5G4mquyA++4WMo6CDXfNTraDgbG5rt+utBVzbXr/qixbm5l2HiT4KUouIFPtILb8HeK
         GLciEiIubQIOwHlE+nC08O2nnJypexEm8D8QE/kPcBgmtQEeW13f17uBtvesTz92Z14D
         S9Pe301Z9ffvr5MOidmf9nhopoDzl7/Xq7TcdDoq+nxUU6su1zlUSSKgJmp2gVVkg+gI
         3v0lBi1TkXnaDWyWsEefp8kjIesTyAx3QwOTcpSnJ2HZYqX6AliVAhoOYgM3h8YUHnQf
         KWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzckpB2RAMOBd5T4XWzNGlvU9ohIMVxQWJop+FdQAYs=;
        b=MkG4xDYrwP5Hdsse+kqGLL2cdpR0DmpAN+w/27zuMsDkXmeSlpbIbnNMUOAlZzlXqj
         N1lkmsG0PYfk/4RCJQxL30GTdMYoaXnvbZn50ybZHFnJinv0dZffrAgK9wmMXKHcQeRN
         Kz+IUj6E04eU0KoT2cDixmgQZ0D0qRHn4dQTNZDLpYWn6/6PyElHrXUUPo2HU8Pn6qIG
         u+RkAah88E4kGjg5re6ZP140SoSYqM7G00rfUNDea9dOv0opT2EN4jMMhQ+Tb65E7IvH
         6zpk93fG/044rWDzMaOvPWfRVx/veDTXhWEHSuYmgTrwVXAfR9XwQtLbYIIyUwyuDxpr
         clRw==
X-Gm-Message-State: AOAM531JHduTYaZGl5LEE7Mfi7XFCm2S0gTaf0v2A7qaw6caI1e0LT2Z
	dATdbTFWmR7m2Ct+SwRlecQ=
X-Google-Smtp-Source: ABdhPJyZ0axJrad/YH/LldGphACiWaTCACu6P1qlfjXlOsmgeXWaxGIGwgzX2b5Ew2o+7MzHndymmQ==
X-Received: by 2002:a17:907:2176:: with SMTP id rl22mr17569409ejb.155.1620133979277;
        Tue, 04 May 2021 06:12:59 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id u6sm1404735ejn.14.2021.05.04.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:12:58 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: use in-kernel aes encryption
Date: Tue,  4 May 2021 15:12:54 +0200
Message-Id: <cover.1620133620.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces the private AES routines used to
encrypt data with in-kernel ones.

Fabio Aiuto (3):
  staging: rtl8723bs: align argument position in a new line
  staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines
  staging: rtl8723bs: use in-kernel aes encryption

 drivers/staging/rtl8723bs/core/rtw_security.c | 327 +-----------------
 .../staging/rtl8723bs/include/rtw_security.h  |   1 +
 2 files changed, 15 insertions(+), 313 deletions(-)

-- 
2.20.1

