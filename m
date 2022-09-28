Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B784A11
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:23:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c30so17017585edn.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=l7u6sxjGd4Up3n2EXEn7w9kG6KJBfmCH4ZVKabih4Ew=;
        b=C89c5692ohREy/7/FUOPApXHUtVSRPnO5sFmt3ft7MSAkvaKl76Vo2bgYkXdYgqtvP
         y2Dr2BSmjjxUCkYD451sEAnK0vxq5ysRpnih3PmadsdFcCTktMRRHwlFdCHraQbY0hWT
         apF12bmB3vS3T+/I9tp0DpjN16gEncbJhwGX/6fFqI4coOuFww24Cay0NyyxICEQZAYw
         sIyJqx0ln5Zr1HPGU4hP1WbtOIUaimLpefxv21zyYxS7vNDRFGvAi7ZsHTbXmEKpM0E3
         SMDfNkrKPqAfKb9ad4u6cGKUoh2CgldA5KSjOFiiuyIkesxOnsYQDY/v5HxlHH4D3sFg
         0vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=l7u6sxjGd4Up3n2EXEn7w9kG6KJBfmCH4ZVKabih4Ew=;
        b=XZc6zXjQ9BCeNAOa9cMNHY4P82vEzKiKf0BkVYCCg9esJ0oqZwD262VDHG/Y0xrvXS
         KZivDticykbwZULI6iuY844Rb/6yc74TCetzAobCKK2oI4KHdCUEsoBsIpK5GygfZfq/
         +UIzyaYuw+jkr2zdtowMwSTL34+nEotoGg3Lkkm2SPs6g8sgIaoOn10KmgMLDMMnzcu7
         MD6zT1Qu6m2Wj6TYTip16MbqW12MLBODbO5qiS9p3jQcLGiLMaW1DeB6OUlNfdsO4Czp
         Cklz5U4Kgw1zDKHDJreSQRQaxt5Ngpl3tCVOLaotLS2LrOJt6ltof7Vl2Mgrp3Dq411G
         1Llw==
X-Gm-Message-State: ACrzQf3j1k7TmwThBpbfU5J7QedGDU9BcU+A90MgU1vdaWWaTEW1whej
	y/U16xBuMwVafgXz88zeljE=
X-Google-Smtp-Source: AMsMyM5d6RiOwXpEaubR6tBVWznwUhpZzM+IErIZv9qy7j+dLzajQ6bYEqyepTS9aWZI5w8RLR+WRg==
X-Received: by 2002:a05:6402:b0f:b0:458:1b:fc9a with SMTP id bm15-20020a0564020b0f00b00458001bfc9amr2183786edb.365.1664385799812;
        Wed, 28 Sep 2022 10:23:19 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b007306a4ecc9dsm2725063ejc.18.2022.09.28.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:23:19 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH v2 0/4] staging: vt6655: Implement allocation failure handling
Date: Wed, 28 Sep 2022 19:21:46 +0200
Message-Id: <cover.1664384503.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver does not handle allocation failure when receiving data very
well. This patchset implements better handling in the case of allocation
failure.

Also do some necessary clean-up to implement this.

v2:
  - squash 3 commits that were doing a single thing
  - add new commit which removes a redundant assignment
  - take device_init_rx_desc() out of unnecessary else condition.
  - remove return statement at the end of void function
  - add a missing rd = rd->next statement in device_rx_srv(): because
    we already drop the current buffer, we should move on to the next
    buffer in the ring where new data will be written to.

Nam Cao (4):
  staging: vt6655: remove redundant if condition
  staging: vt6655: change vnt_receive_frame return type to void
  staging: vt6655: remove redundant assignment
  staging: vt6655: implement allocation failure handling

 drivers/staging/vt6655/device_main.c | 40 +++++++++++++++++-----------
 drivers/staging/vt6655/dpc.c         |  8 +++---
 drivers/staging/vt6655/dpc.h         |  2 +-
 3 files changed, 28 insertions(+), 22 deletions(-)

-- 
2.25.1

