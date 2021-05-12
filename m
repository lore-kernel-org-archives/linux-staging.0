Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC870
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 13:23:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id f1so4824376edt.4
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WDuOE4hxyl+w9T0BI4QiDAhIFt9uxZ9MZCrO+XA/Yd4=;
        b=FpCS/0lXHHZ7RoXBm4tdc3Xol6a6x97nIaoZIjOOI392pAoAAWT9FyYFdPfO0veqr8
         chZxLABHHcr0JSDDyomf8QNsyHBTNoIjyYMs0QIRD/neCeNETKsgUSkju2yQq/yW1lUg
         CrZhkPxTWvz9uc/xkiCesvBUBd771dp9s6MWmrqm449BkyQ2t2sLMY48pspMRcnPf56k
         8FfUtuT8gK2VuN0j978vmuUJbjbfSsW0YpK6gMlrK2JTaP2czwn/JTCfYEJMM87YsUiy
         f0ntpxPYWODv+lHVyf40ejLwSkzjnRRE4h7IK1ESoKLp2gafG9rEX8l4PqjAneVB2TqC
         Qp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WDuOE4hxyl+w9T0BI4QiDAhIFt9uxZ9MZCrO+XA/Yd4=;
        b=kxaTuN7WhZi/VnhRO+AkT0R/M0zO+bQMiBXAjxafhr5iyJtRmMDO+sUsmLNY+XPZ5s
         m+hk5zS4cCbhbd0qzIXDyY1Rf31KQVZ4/B8i9v9SqxerRm0UWDIiakMZr3Wnc7IStwX9
         LHkURngsWcxf3p0+pE06VODNB4u2xqx4nVciOHnqDrwQ9Fd7Mk2/b1GvQkfmKtAYT3Y1
         GS6Ud04yNn6+3W3lsxKJYK7CmdtqNgcj4AiOpyY5Lh8763FLnTBoFDG+HWxs0PHholPV
         6MsBHquLeZBlxEf64NnxSZ8zyP2WECAVzn+efgWLRbNtb1en4vG4QMFyJHst+OL4HolN
         7zOg==
X-Gm-Message-State: AOAM531V7rSrYME1obx9SFEMKxiAUxlAj4l7sD/utMOzB4dXYPmC2yF0
	yO/7OLYNAO8xAM3RGgASk3Q=
X-Google-Smtp-Source: ABdhPJwMeB/7DY1qX1ZEwFh6DzieWTT2XT3NqPkx2Ps8oG9ewPol1cQKIlvKELjbTchJczrjVLcFXw==
X-Received: by 2002:a05:6402:40c:: with SMTP id q12mr10713169edv.0.1620825828531;
        Wed, 12 May 2021 06:23:48 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id yw9sm2881705ejb.91.2021.05.12.06.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 06:23:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] Remove set but unused variables
Date: Wed, 12 May 2021 15:23:42 +0200
Message-Id: <20210512132344.30225-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables from HalPhyRf_8723B.c. Patch 1/2 removes
variables detected by GCC while compiling for x86_64. Patch 2/2 removes
variables detected by the kernel test robot while building for PowerPC.

Fabio M. De Francesco (2):
  staging: rtl8723bs: hal: Remove two set but unused variables
  staging: rtl8723bs: hal: Remove set but unused variables

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

-- 
2.31.1

