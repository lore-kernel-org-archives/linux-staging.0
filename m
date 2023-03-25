Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BA28EB
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 13:28:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w9so18319708edc.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShMF2P8iaE6k70YQQ7/9mT94Sb/9TGolk0qbMWkXhfQ=;
        b=WonXO4DE67eifx43i6erh/LtEC9O4lRAVF3Xm2UOVFed3hPR4uSGZAKLcZddtxYN2G
         YGlTndk/dAsfAAzfJXH2yS5aG4Iq2CrureG+1FAZNP40R2Q1VzmTbL0HWn6b8QsQr4Bd
         ZXkJMaZHBXjAwlgmTjMhdkzU9b/uodjIH86PhK3OCVqBbVqyWuOqymRsDJUydgavx91t
         mC66/U3zEXzaJut41zW9Oo2vd9CBLBH/gsvSVB00z7pXTM//05kBqVFB8kYCG9OkEPhe
         iNDLnHf1VW+aN0VfNtqUmrdCyOF12usJF1sUySHAe0qrM3XQRSwx171L8c+6XdzJhDzR
         ogEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShMF2P8iaE6k70YQQ7/9mT94Sb/9TGolk0qbMWkXhfQ=;
        b=YDFARM1ktBt0P1liCSNVfErAYzUbFCFdQ/QDk3lCWMdfiRSfPESDJYzkhJS3GII3Ft
         Q57j3JdjbefQRMRysM4npqi0+DL1BvL5/ul0eWA8qcfnMpU5PGJOuL5rJbRl5TelGamY
         bLVKlYwq9aItWPWy/f1O6d2MBvHa03QqkvXs4PuO2QT7AwsJ2WWUW6mkGFKcsaEBPew8
         poU6eQSIO5BDKVYrlgrVIOLEasxBPwdAgikh16F3qdhmsu1Ro/rUfVHNu9u/voAIXVip
         VRHOSwvp88J2Lft7UZi2hRDJtTGujeK+dWVBK52KVrsrcM3Rr1sP21/M/muBjyoYEbiN
         IN0w==
X-Gm-Message-State: AAQBX9coomITWqDvwS9MDkWbwvzDVWJTvV7dnb9xO+RtLyz5tEnVMr9M
	L8t8BqBX7CVTr1XTtI31LKo=
X-Google-Smtp-Source: AKy350YQhHJtLJumsu2kOulRSbPK9C5zaOwUBnVuvUjvV0wghRqcQtCKS6bz1YmzH6uZkPTGPJajWg==
X-Received: by 2002:a17:907:3e1d:b0:931:1567:f84f with SMTP id hp29-20020a1709073e1d00b009311567f84fmr7846000ejc.4.1679750914406;
        Sat, 25 Mar 2023 06:28:34 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbe9.dynamic.kabel-deutschland.de. [95.90.187.233])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm11727610ejb.74.2023.03.25.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:28:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: rtl8192e: remove rf_type from r8192_priv
Date: Sat, 25 Mar 2023 14:28:19 +0100
Message-Id: <20230325132823.22872-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the rf_type field from the r8192_priv structure.
RF type is always RF_1T2R, so we do not need to store it in an extra
variable.

I don't have any hardware to test this, so compile-tested only.

Michael Straube (4):
  staging: rtl8192e: remove RTL819X_DEFAULT_RF_TYPE
  staging: rtl8192e: remove redundant setting of rf_type
  staging: rtl8192e: priv->rf_type is always RF_1T2R
  staging: rtl8192e: remove rf_type from struct r8192_priv

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 19 +++-----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  7 ++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 25 +++++++------------
 4 files changed, 15 insertions(+), 39 deletions(-)

-- 
2.40.0

