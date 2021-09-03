Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1513FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:15:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so197961wme.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCEKx7utYrwkWL98r7FBoPPDURIg0879OiU6M0zgQ8Y=;
        b=VX11jB6gOfOzEMAWcceoSjCouFUaZpGXIPPupzOxCg7uZe9taoXFcI3QO2JUO4ZGci
         M3ThXVVTxMH2xiX3TRkMjlJpz298UVrE4/U0G8/gxuVL3KaZ7P7s1T/805gcveQmSjOA
         2dGBiymZFoCIap7OwP/Eyx5ZuEu+PsV1R2F6454Kf5ppfEvjtd1VeOTus/uHQNO/fLxy
         DhmDvp8wH0pxv++Ib/Nf65U4hjhY4Akkk2LFRVanDuVQatkHuM0fuVId6ohWL5h9adUJ
         Y/YGg9VgJMO4U2uUibUva6A20+W6cwnDix/3077970kAj1l+iJ2SEJsZUtRLuxM/mPn3
         YkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCEKx7utYrwkWL98r7FBoPPDURIg0879OiU6M0zgQ8Y=;
        b=tbXmWuxf3ylTUDqCoK20O5aRPw1kza2rV5wtzVm7tt5y2hACU2cHc6fp5yEIERxDJQ
         2tlzxGIzvSmJ090jVJuB6VBYgpS8otBhPAFTrt+txxE5AdCjoy/i9LPSRFWC8vcYhOkz
         Tl/MM+g34izixL4e/jteU1WBTxLljibdAL3VvST6FQbXybThDikOrXcgDS4QiaypeI2M
         9U6NEg8nkGoOe0158gXIzH2KRTbKQQYIH9bww5Ig48f9W7pjTk7y1wQ9TDx4OGio+KsD
         W+raVgHaOGzT+DVWxLn0iPMWg7LHdfK7+YzneeClLO3E8DfJB0Lkw+nh7NrL4o5i24rF
         bY7w==
X-Gm-Message-State: AOAM531e0eQt71bB99ZLVe5/rp4scl2OMyeIDblCsDvR55uX6YqKxcd/
	skY5bqpOM5u2JKvOfQ53w61AjA==
X-Google-Smtp-Source: ABdhPJztyWjMkam7gbJm517Pa8QO9y5uIwtoPSks8MeGt/ZyN11hmZZ5n1fS8fPujss4uzjqYDqYUA==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id q10mr224171wmf.189.1630696553935;
        Fri, 03 Sep 2021 12:15:53 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:53 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/8] staging: media: zoran: fusion in one module
Date: Fri,  3 Sep 2021 19:15:32 +0000
Message-Id: <20210903191540.3052775-1-clabbe@baylibre.com>
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

Corentin Labbe (8):
  staging: media: zoran: move module parameter checks to zoran_probe
  staging: media: zoran: use module_pci_driver
  staging: media: zoran: rename debug module parameter
  staging: media: zoran: add debugfs
  staging: media: zoran: videocode: remove procfs
  staging: media: zoran: fusion all modules
  staging: media: zoran: remove vidmem
  staging: media: zoran: move videodev alloc

 drivers/staging/media/zoran/Kconfig        |  24 +-
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  60 +----
 drivers/staging/media/zoran/videocodec.h   |   5 +
 drivers/staging/media/zoran/zoran.h        |   7 +-
 drivers/staging/media/zoran/zoran_card.c   | 259 +++++++++++++--------
 drivers/staging/media/zoran/zoran_driver.c |   5 +-
 drivers/staging/media/zoran/zr36016.c      |  23 +-
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  20 +-
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  20 +-
 drivers/staging/media/zoran/zr36060.h      |   2 +
 13 files changed, 229 insertions(+), 208 deletions(-)

-- 
2.32.0

