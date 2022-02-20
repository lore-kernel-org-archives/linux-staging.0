Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7605A22
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 10:02:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id s14so6047624edw.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7u3lC5A2Ox2Mr0XkcLY5xCuAMwekJnyBOdtA3+n9Nrs=;
        b=CLcJpQBwvjWPPUvYDqUmCeXK/yN8NCRHwbt4hHPSm2K0LrM9x+Xda8zRnnft5jBZYx
         yLOK2mBBI+UOMc7bYe/S5vtztVS+5JUkJnKMH5uHqXz3z7djcraQJGtfN7C6yAEta7Bg
         8P/M7qLF0/xeeHBYSmMw2G5CwVRw0HLNxILBNrsEs2ZtXuXGyj9Uw19vE9Xtk2xT07pU
         bwjFUovB+0MMqvzVq3POXwEbqi1n0EG0b+BEa3kM4zV2VCSuanBWHEpBraLO0O5F40i3
         HVuaqJtTZZ15RFt2bYG+7KvBROFC5Ay09pwcRVCLM4K2wxleA1mPSrVC1A34BPzmUKwa
         YDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7u3lC5A2Ox2Mr0XkcLY5xCuAMwekJnyBOdtA3+n9Nrs=;
        b=vWyjp5Syf0gYyeJ004zf4lFXj2YqJpLmTTscW6rncQfJXD9udOIMY4GHX2bz6ApuVc
         /+LC1i7cOEYEX7lAlHad8sK585VifZtP+aSpsaoas1Ai1A4NxUxuSysR0HcycCHpnvdI
         pGsefcfRYiUZ7U7jCMkPuu1xm8JWOg2ymKH3hZtF47CSCzouEcx72G0Z5jJCFa3r5URL
         2yJJL+H/6ZyQ0L73l7KNnF2q2lsmjBq9/6RRYv8jtI/ZZoSJLTGzwfjNXjGrkqlXtCiu
         O0VSXq6VK24gmFNbXqPdZR7kHRdqUD5DSrFnwxOQlYLlS3+vXSLYIc3HPjWZp0xOwf9T
         O6PA==
X-Gm-Message-State: AOAM530tJGQmmEzRM6wYYLiWvU3oRmKRygnXpz59dKxZbFGM4fk+k45d
	1y4p9LosLg3LKfXHo3WkRhA=
X-Google-Smtp-Source: ABdhPJzlyMoULzYQRR9uz3KXhH8EN18wzCpoahZ0LuyUKES2HSE5aA6HlpEVMNLye/dJQAp4CTWcgQ==
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id w9-20020a509d89000000b00410ff045a98mr16559884ede.404.1645351338920;
        Sun, 20 Feb 2022 02:02:18 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id dx7sm3265223ejb.23.2022.02.20.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 02:02:18 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: odm cleanups
Date: Sun, 20 Feb 2022 11:02:07 +0100
Message-Id: <20220220100212.7466-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes two more functions from the unwanted hal/odm layer.
Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove ODM_CmnInfoHook()
  staging: r8188eu: convert two u8 variables to bool
  staging: r8188eu: remove enum odm_bw
  staging: r8188eu: convert type of pBandWidth in odm_dm_struct
  staging: r8188eu: remove ODM_CmnInfoUpdate()

 drivers/staging/r8188eu/hal/odm.c             | 56 +------------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 19 ++++---
 drivers/staging/r8188eu/include/odm.h         | 29 +---------
 drivers/staging/r8188eu/include/rtw_mlme.h    |  2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
 5 files changed, 16 insertions(+), 92 deletions(-)

-- 
2.35.1

