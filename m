Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF2C8D9
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 09:22:33 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b47354c658so52499511fa.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687339351; x=1689931351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EDeNQQqyz/nKt5P8lWcisu6DsEDZkm29WDucZUEslLo=;
        b=LvA+yAc7uqyQWWHYSZ/EweD6nBt0ToDoNvUQfmFPftuB3YQaD3wDtfcddxerdjpqLK
         zNURLecHDA0Q6cOBY3eeGf4xX6I9MmmOuJ3gASfKbMSoWsMUsi6UzaomNPo4JNN88KxB
         y3nMyhHHXkjrJ0okRDyTFUog714z1htWRo6ewS0Zm/XhbEi+5kbQVg7YkggJN9ODNKW8
         looCIxDSUKflL9OdA8dMMf3ZwQufzYK0AjgZ47SJeC/bu/mpG4Ov3dQHEsE+VGcWlOPx
         0kihrQ7jlL0p5ijllp28oM66AKUJrmxVHjFbWLmDiID2FFyCr5wG06Pi4u6MY21pLv4q
         9qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687339351; x=1689931351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDeNQQqyz/nKt5P8lWcisu6DsEDZkm29WDucZUEslLo=;
        b=XWhBZ0iQF3IkHdLGzUEv59FjSRZuF0OHOXciA/l+QkTt9VukbL/sisZ/2n0t8Pvnm4
         IMpJSDsUMPV4foxiVaUwEV+QXwAQcZcjQem/HjPVzRmskm1XauDIVgkALwMKsTNphLsT
         8pLxeiKbskFjE57dSRo6HByrWjAlgsh99jMQO017T/8/0Mov00yN8csV1LtRlOfdKm+Y
         xDOuB9gJWxSUD+Ec6oKYKn6/Fgm8yhrzsR+e2vShJ2kltkODlrlEFkESdC+FtCR7124W
         HuC0H/ONQX/iclySgbwCU9vDv0h9tjlGsowLTXzEKrzd9KQAwl5YAL26hDQF4Jmv4t3u
         oiuQ==
X-Gm-Message-State: AC+VfDw5WDjoLVRlMUQBW9lRMzO6vOT8i+a+KXSIEGjCROzqQZPRGymd
	YILEq175rrwu9XaX5qU4htZlKqV2X6M6ag==
X-Google-Smtp-Source: ACHHUZ4b5B0OPx8Ocken2B6jez7ePavuLOeKLr41nwQeM7rYzRLGaa8mAeN0QJbfqgiDZ0QYVm5Ecw==
X-Received: by 2002:a2e:3211:0:b0:2b4:7d83:c80b with SMTP id y17-20020a2e3211000000b002b47d83c80bmr5066194ljy.13.1687339350913;
        Wed, 21 Jun 2023 02:22:30 -0700 (PDT)
Received: from localhost.localdomain (sa-84-52-56-253.saturn.infonet.ee. [84.52.56.253])
        by smtp.googlemail.com with ESMTPSA id w7-20020a05651c102700b002b1b92910c8sm811575ljm.86.2023.06.21.02.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:22:30 -0700 (PDT)
From: emma christy <emma.t.christy@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: emma christy <emma.t.christy@gmail.com>
Subject: [PATCH] Subject: [PATCH] media: rkvdec: removed redundant blank line
Date: Wed, 21 Jun 2023 12:22:23 +0300
Message-Id: <20230621092223.10805-1-emma.t.christy@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style. Removed redundant blank line.
Issue found by checkpatch.

Signed-off-by: emma christy <emma.t.christy@gmail.com>
---
 drivers/staging/media/rkvdec/rkvdec-vp9.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
index cfae99b40ccb..0e7e16f20eeb 100644
--- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
+++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
@@ -227,7 +227,6 @@ static void init_intra_only_probs(struct rkvdec_ctx *ctx,
 				}
 			}
 		}
-
 	}
 
 	for (i = 0; i < sizeof(v4l2_vp9_kf_uv_mode_prob); ++i) {
-- 
2.40.1

