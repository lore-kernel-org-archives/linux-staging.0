Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270219506
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 15:42:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso5167223e87.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687362172; x=1689954172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzxiaQ082ZFew564dfizmutmqfV0MIQOlwM4DhrL6Ig=;
        b=DnH636UX7kGEnRpOVDWD065E2A7A+d66pQf0h3YL7NRfQsbdrdNIvirYGSd73IkXSk
         kcoJ1lnxOlZBW2fKCvEuRhpKtupQbp4IxZMvKcJ4YvvlMg6MlfIForbYnAX+Tt1W8qQy
         5aQQM36JHa5n1+VX8r2GdnmDN+GhkJOcUVltA3OiZygvcFnM4vqgzHjPvVChi2SdNgWa
         YHwUzJ1OdLIXlCrua4LA032FZudH1sIWh/D5nv0fjmg05eOG+BDPpVNHegMTRjMyx0FO
         iLU3RW1XC0I7fdkuta3Abr4kAjZqfqyZKXuey3P4yhUeNbOJ4jHlVXWbyP8QO4ghHQGl
         Dl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687362172; x=1689954172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzxiaQ082ZFew564dfizmutmqfV0MIQOlwM4DhrL6Ig=;
        b=SUiXjliq0PEs4KOqDWxTJmM0XVcTFxH49S2IurKg9VRb2k2ZHExYsGRl0p42Y8vJNc
         vAyPxu4U4C6bahkq90oseW0NWDRT+xvSCg65w4Dp0njmiSLBTpfkmqEBwjVcQ89Z06vY
         zWEHKqG2gqp4e0s5aqVfUhqUei5a7kBkOKSpn24Y3ze/tNdpjSvz6YBx4pQLpvF4wjtf
         uNbhOyv29GyL6Gxt1jAKcYCJyC07ne6/Fq9Qvdjy3CarZixXZPhhdu5HmWaFgnoVLWjS
         nmpXCQcwlLSxhccgim/wPiSXl5k4vglh2r7c6PzabGYd3LCcVSNhZwBu3ttiZjtAMYZv
         zzDA==
X-Gm-Message-State: AC+VfDx7FHiWFdUh7RLe692rP6XkTMHWIwuYM4fy6yYmXGWOGTdNUWia
	KDHLczHlIP3yD65LtwgHZIQ=
X-Google-Smtp-Source: ACHHUZ6Oy/XXvR8t4B7d/NTgPTdlbFRDbN1BltI4AoZQjNz5Dhl5IEq4dU7qm1CazjTVer2vn6hV8g==
X-Received: by 2002:a05:6512:55a:b0:4f7:669f:7da8 with SMTP id h26-20020a056512055a00b004f7669f7da8mr10582510lfl.7.1687362171346;
        Wed, 21 Jun 2023 08:42:51 -0700 (PDT)
Received: from localhost.localdomain (sa-84-52-56-253.saturn.infonet.ee. [84.52.56.253])
        by smtp.googlemail.com with ESMTPSA id j17-20020ac253b1000000b004f76684329esm813156lfh.234.2023.06.21.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:42:50 -0700 (PDT)
From: Emma Christy <emma.t.christy@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emma Christy <emma.t.christy@gmail.com>
Subject: [PATCH v2] media: rkvdec: removed redundant blank line
Date: Wed, 21 Jun 2023 18:42:47 +0300
Message-Id: <20230621154247.43983-1-emma.t.christy@gmail.com>
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

Signed-off-by: Emma Christy <emma.t.christy@gmail.com>
---
Changes in v2:
  - Fixed Singed-off-by.
  - Fixed Subject line.

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

