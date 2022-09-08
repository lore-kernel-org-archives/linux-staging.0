Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30ED7C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 13:09:27 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e17so16673778edc.5
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=LnX4aqgVDvv4QK5SQJtid2l8o9K1NG1d+zs6u1fqVxk=;
        b=nOmayWkJYg+/SXPROx6sHpXDPnA04xdnf4PBZNJCFtpz/Qyr13yVz1jxU/Mcw7Ojza
         Q71/HYmNRh7vDKITSMUqTxP8xkq4r1B6JjPsr+JZp5iTwtuGv/GOt/oORIKpH0mGjNCv
         vCm0jVfpBioeVVbPCarghmiA1OdO0K7WESYGloQ/lbIrTR2fSbcqare8Uv8/mIGhREn4
         /fa6T8e3AT7bvKRjj89PizoSxn+vcBE8wb1E5Q8C+wAMYxgKfdZFuHq6EFr+tfzB9XU6
         XpDdlKuIlmmTr+GeXgoLqMR9u34gu0suCw7il7W8oXjF0HvO5IFKcQiu7wFfwHPnk7fC
         Mg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=LnX4aqgVDvv4QK5SQJtid2l8o9K1NG1d+zs6u1fqVxk=;
        b=A7HTsU8J9bi8mle5a7j9shtYnUqDcrwBnxWCjfKgUxVwF0KhJy66doFS4nAU6doOUG
         LY5R+LoDCPjVuncJURIRt16hfob7Q70Zv2nmxS+LIGXi+mhpoaeFf3C5nrIG71P0VZKW
         YEK1TVCnRAXuJPLLAe8O+TjfOy+e1jLfCl8+ut+IANVJR7cjRLyguLNm0UfhoOe3XyRr
         wB4q5VOYgL+lW2FcRJm2u+JsjXGbgN+5bZAAJjXIGGbm/mtrbUnUe2z+B6fFlSFNEX+6
         eFXPIKuBKVSxKuAm1mU4EA0YiFSR0HvDEDKyLWp0xO7c6YDChwDlWHB6xE7Ogaubqxbm
         RfeQ==
X-Gm-Message-State: ACgBeo1Me1VaDTv+Jx+vbInpOwzSq+pFPTVWi2SRW+4Z0tZH4leDr0g7
	BkF8Oo5dJo6mOrWZluR9+ew=
X-Google-Smtp-Source: AA6agR5edPFE9cvoFBzSJriSpzSOOImuyYXCbgd8ATz+8IF1ba1dHAIEI0Pw6xA2hrDAFLqYyancew==
X-Received: by 2002:a05:6402:2a06:b0:447:820a:1afe with SMTP id ey6-20020a0564022a0600b00447820a1afemr7145683edb.291.1662642566076;
        Thu, 08 Sep 2022 06:09:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id cf6-20020a0564020b8600b0044edf0a2deasm4847978edb.69.2022.09.08.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:09:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: some simple cleanups
Date: Thu,  8 Sep 2022 15:09:11 +0200
Message-Id: <20220908130915.8406-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some simple cleanups in different areas of the
driver.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: remove unused parameters from
    _BeaconFunctionEnable()
  staging: r8188eu: remove unused parameter from UpdateBrateTbl()
  staging: r8188eu: make two functions static
  staging: r8188eu: remove unnecessary return labels.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 42 ++++++++++++++++++-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 40 ------------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  5 +--
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 -
 .../staging/r8188eu/os_dep/osdep_service.c    | 10 ++---
 5 files changed, 47 insertions(+), 52 deletions(-)

-- 
2.37.2

