Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D217F1;
	Sat, 25 Mar 2023 08:24:18 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so7184785pjt.2;
        Sat, 25 Mar 2023 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679732658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Da0bkbbQlx1cEs08lUYN3fUFt8qfcR/cqaYyxH0QCRI=;
        b=S8LFugRHYwHLsqlFp4TiYTxTrzlBTJU3W9ZYzdP9TSNebZ3xugCXzOJAuEoceScAfM
         W3afFKTdAfyaaB1/BXWjHmGGPgXR/0rUoquLqS7AijFf6JfkaRz+l5tiKDKIoLH7XOP8
         xVTrwC0oV3wTBzfCU+yJc8ot5T0IkjisKaUcuMl4zw8rZ6KQn02NEt6nJfHkojIZnARb
         VIlINZ2DWrcVGbN23EK/awQb6Wb2rLmQe3xTo8ZpvLh9jhQaeGE6pDcNhqeHXQMiiMqK
         BYmltWHS7uZLZfh3FM2Pce3d84j7R+D+fnz/wMdml4nk9cLl+QqOYuFVqkCfK7BidYhu
         CYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679732658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da0bkbbQlx1cEs08lUYN3fUFt8qfcR/cqaYyxH0QCRI=;
        b=FTpy62AGn78PySnLqG67un5Brid7wig6Af/XBO/yhjP+BMKBAcbUKLl1nc52nThuiM
         CJ2jc6soDVmCgd9FkFlIEV2U6+6btxc6unF9nSCeTN21pgdJceT+LwVOBZ41DOnLDVfq
         uajN9Na8xFWFdBeM/YtsshzuchNqFHldpHzRHaBTT2sK3LaqJtDknQ0jT3NBU9gLE7ZX
         wavLslBsNaIRRR9jBYyzFwbt3PlgrFuMEULPJoICVDXPor6ksQT/aayaDz12cvvNDOQV
         hYxjClf06OLM7xpglGlMDW+Iuy0O5V1nYO1UKbyEcEIvAXOJu4D74CNvdB6wUJHOPJ/9
         lI8Q==
X-Gm-Message-State: AO0yUKW1RNlSv4ahwwOW5RVxWtrzJz4X314SwYEo+LevmuIyGjnGAJ+x
	jTOWUa4A0w1zkVDFAbAzqf8CJ1VAYxM/kZpb
X-Google-Smtp-Source: AK7set+llncqGBAhJvP94FYyzOGTMhdMpyTZWZW6uXjdxRoCGo9tZBxcSO6MBhAfVzbCitYTSnuZNQ==
X-Received: by 2002:a05:6a20:729d:b0:dd:e036:37e4 with SMTP id o29-20020a056a20729d00b000dde03637e4mr7209642pzk.2.1679732658165;
        Sat, 25 Mar 2023 01:24:18 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78105000000b005938f5b7231sm15035875pfi.201.2023.03.25.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:24:17 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v3 0/3] staging: greybus: Use Inline fuctions
Date: Sat, 25 Mar 2023 01:23:30 -0700
Message-Id: <cover.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert macros to a static inline function, to make the relevant
types apparent in the definition and to benefit from the type
checking performed by the compiler at call sites.

Changes in v2: Change patch subjects, noted by Alison Schofield
<alison.schofield@intel.com>

Changes in v3: Change patch subjects to length 80 chars,      
noted by Alison Schofield <alison.schofield@intel.com>

Sumitra Sharma (3):
  staging: greybus: Inline gpio_chip_to_gb_gpio_controller()
  staging: greybus: Inline gb_audio_manager_module()
  staging: greybus: Inline pwm_chip_to_gb_pwm_chip()

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

