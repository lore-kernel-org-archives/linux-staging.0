Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7B72
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 07:34:25 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 17so19924000pgp.4
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9fj7HOMTAEjrvCtbYb+Vzu40lpj7JG3HNn+Dw24QDhE=;
        b=XiHW8y8HiRKWE4MjzdMcGMKrnLNUm/2DxA23Rwjpv/Y2uyPKsGHVF9SKjyTZVOVt3u
         tgiuas0utFrWqv82kSL92lTElSNbMUhfilYsigMBE4gg4Z+0qqWEcJaE36vLVbqHK8EU
         S1mlWNz3aV+xpcH30RxiKwXEaOaqo3/wPwL3KA/pY83VxwI+4t5uXrCmDwDDf2kue1m9
         S3Bj+0XGOPmuNxVCcr+oCUFw3V+P9n4DG2NPHtEPKcMJuRfjiqK/j+vzSlmyX3xhnvbM
         HCpYgs68zPF3esI/eCuWrEfgdERS/P/6D0XZNFlIzjRMzIHHSTB4MVAM0KLay/cFcNOQ
         RdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9fj7HOMTAEjrvCtbYb+Vzu40lpj7JG3HNn+Dw24QDhE=;
        b=gJH0hBdBYAacw7qadQ/5+9luyhB1UV2+Qi+t5XiX2iUDlF6XYhEVGVo8/SNxjJAfhV
         Dd3AX2OASNhvKsUs0WKKtFtSr/0pfcqvv33uKHFhfWhe4uX3a1BFkX/jXRW1khPjYlx7
         OsgNX1om2Md/6UOqd4BEeqliyEAgeEupgbOCVTL1tcV8zMqNUqFN/tVwrWGDsh1cmeNw
         9aTlvoE+C4DbF308I2fo/DqaeKWO5M1TGll46XGY8ue7Bie+2W9Q+4Z1MxKmoon/B7x0
         DA/Kx+ma/nSZEvUY6TVShQK4++CqvhoAf5peYRBMCtle6XRbLerxEkfgpvGGJDs2WWk4
         UUew==
X-Gm-Message-State: AOAM533R9Wqe/4DO4irT0W1KUoAjxbd9nuOYME/IdasVAeWlpdICRJjc
	TI3GEueS6HKY+L3+uHqJaGA=
X-Google-Smtp-Source: ABdhPJxAImd3GsLSf8jEOhahqfGtQvb40nnbL+RNafys5hkuywableCwRRUk/AB6esCS4cPJbBL2aA==
X-Received: by 2002:aa7:9e0a:0:b0:447:a7f7:40e with SMTP id y10-20020aa79e0a000000b00447a7f7040emr11513094pfq.37.1632209664732;
        Tue, 21 Sep 2021 00:34:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id x8sm16565957pfq.131.2021.09.21.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:34:24 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rts5208: remove unnecessary parentheses in all files
Date: Tue, 21 Sep 2021 13:03:41 +0530
Message-Id: <cover.1632209460.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all unnecessary parentheses in the rts5208 driver.

Benjamin Philip (8):
  staging: rts5208: remove unnecessary parentheses in rtsx_card.c
  staging: rts5208: remove unnecessary parentheses in rtsx.c
  staging: rts5208: remove unnecessary parentheses in rtsx_chip.c
  staging: rts5208: remove unnecessary parentheses in rtsx_transport.c
  staging: rts5208: remove unnecessary parentheses in sd.c
  staging: rts5208: remove unnecessary parentheses in xd.c
  staging: rts5208: remove unnecessary parentheses in rtsx_scsi.c
  staging: rts5208: remove parentheses pair in sd.c

 drivers/staging/rts5208/rtsx.c           |   2 +-
 drivers/staging/rts5208/rtsx_card.c      |   8 +-
 drivers/staging/rts5208/rtsx_chip.c      |  16 ++--
 drivers/staging/rts5208/rtsx_scsi.c      | 106 +++++++++++------------
 drivers/staging/rts5208/rtsx_transport.c |   6 +-
 drivers/staging/rts5208/sd.c             |  68 +++++++--------
 drivers/staging/rts5208/xd.c             |  48 +++++-----
 7 files changed, 127 insertions(+), 127 deletions(-)

-- 
2.31.1

