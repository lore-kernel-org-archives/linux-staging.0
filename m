Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9D2C87
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 18:58:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id k7so11466984wrd.13
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+AY0+OI2PAH7kEtlWzi6aAmClSw8n2MFbS+iADmhiQ=;
        b=dkJGe2ydPJcbVUbuW4blU66DGMRHsKGBo50bAkQswlBP8z3v8s9Gd2HXyymtKq4row
         yAEsdIDfm4cbDFSVH98s1vJp2/CdjKcvxbJ8jwdJqh4OfgDVwXhOiSOi8UlZuMxWinut
         mNRSk9DvH7rz7ZIMWTc5YG18ls0nAAzdtw0DNwFkHNxbaZ+HTUXmfYXannEPRpO/WuCk
         c+D5EjP2YQwTQok/25md0rSjVU/I+o2eQJeJRncn3KMeYLRDxpZiaWZgg7yIooyG0tln
         XNuEiE9IhgeATuro1USZUGpZl1IuVOoZ5TKbbdRX8NKCu1FMVDolv/Ba4I5hfhrctfmo
         btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+AY0+OI2PAH7kEtlWzi6aAmClSw8n2MFbS+iADmhiQ=;
        b=ojlDxX9aAc22/DvzD5/Uepnd35XDivJfprmHVfmQBuv184d+7kFaUmOuKCFnbO7fxA
         e8eczYeWezuj6Z8kuni7C9DDMhKwaQGP3LRtqJbZSD0zOaEaEcsBqcyvLFARixi9S1LC
         dvOM6mJyaK/DWXe0NMdIXbUiD1Wf/+IKJfBFZfFqkZsVJ+nFn36zeSrXehXO/DxrIP2c
         q4g6/ZC0jkUVTs6thN7HkirsgbAiNMI7R1rfdf1prpIkxb79syhkpE/ZmqqAtT9wTED5
         b4wQbqbnERAe0zjcwjt9t3g2eDYg0T9B/ehxXFz9OYIp4ON5rmLOH8lq9UI5rIuVgXfB
         v/bA==
X-Gm-Message-State: AOAM533wvh8p7V/ABPwhdF0sF4ATanHGGCq4KrA6RbP+rOzF8pb85W4L
	7b7UUWYsZsX/IbDBw/G9myepug==
X-Google-Smtp-Source: ABdhPJyshLTiFB9PpS2SpFkTztGRsVKMP3l3PqG4vPTTmpk0b9T92cdKQBQmD3lyysrTMi5jZLaYnA==
X-Received: by 2002:adf:9784:: with SMTP id s4mr1006923wrb.277.1634151498541;
        Wed, 13 Oct 2021 11:58:18 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:18 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Date: Wed, 13 Oct 2021 18:58:02 +0000
Message-Id: <20211013185812.590931-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

The main change of this serie is to fusion all zoran related modules in
one.
This fixes the load order problem when everything is built-in.

Regards

Changes since v1:
- add missing debugfs cleaning
- clean some remaining module_get/put functions which made impossible to
  remove the zoran module
- added the two latest patchs

Corentin Labbe (10):
  staging: media: zoran: move module parameter checks to zoran_probe
  staging: media: zoran: use module_pci_driver
  staging: media: zoran: rename debug module parameter
  staging: media: zoran: add debugfs
  staging: media: zoran: videocode: remove procfs
  staging: media: zoran: fusion all modules
  staging: media: zoran: remove vidmem
  staging: media: zoran: move videodev alloc
  staging: media: zoran: move config select on primary kconfig
  staging: media: zoran: introduce zoran_i2c_init

 drivers/staging/media/zoran/Kconfig        |  46 +--
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  68 +----
 drivers/staging/media/zoran/videocodec.h   |   6 +-
 drivers/staging/media/zoran/zoran.h        |   6 +-
 drivers/staging/media/zoran/zoran_card.c   | 328 ++++++++++++++-------
 drivers/staging/media/zoran/zoran_driver.c |   5 +-
 drivers/staging/media/zoran/zr36016.c      |  24 +-
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  21 +-
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  21 +-
 drivers/staging/media/zoran/zr36060.h      |   2 +
 13 files changed, 291 insertions(+), 248 deletions(-)

-- 
2.32.0

