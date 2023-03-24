Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C507E;
	Fri, 24 Mar 2023 07:30:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id kc4so1070968plb.10;
        Fri, 24 Mar 2023 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=EABt+4tBOHM6qSQxlsLxqb+XT+Hwp/d72DA0MeJKBv+BeWvSfxLUjroAGm9hNbDTv1
         GxaE0JU5UZSis7KTZO3FdT4DLvkGbHm8fWTCi1JilTAtkHHgDZweG8IoXfGPmQqB88wZ
         JkV2r1uz95QwXrFRwgYs3n3WiuaoycjwqLpCWf0rmLnPk0MgtUR75798Hgy8QBUElqKb
         b89CmAZ1D8tBe+GDOLRXtYrjT6zra/gO6dmo4NYv1N+D6S1CoW8Mx0C8dxE0XpHWN3aR
         NvrgzuRIQOxATxA5Jp+gu/Fd+PhdkTnSmzNQ7kePZqy9u0Vq/cniTqabew25iB+vu/no
         jhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=IlVbhyg0LE44Eg9aTaXuv6sQ36zcGxcaTh8B+U760IWjMp65ssf7yoS7WDxZvSxbjM
         0Q1MhCjH5RRGHr/FgMpViyhItdRTvErgVB6F/QPN3A5lDcLXmYOaV+AloRNmQLrSLyOB
         /VXq89wyu46St8rggZ0LD/KxYirDrr3qUd641RQJrt/stpgtci4ePFsLBIMZExObuN0f
         fnkpb5jKi4bw+JghpKqDg2qjMlWk72SKuZmQ0Su/bfR64sBeeLajE4aTC8FgNaloou0D
         zvDbm16ehUNeQEpBV+Y3FMooZ57TAqL+RpLMNeiUJkFbFHzHGCxjGzbWGz7gFN6j+06s
         Lj9g==
X-Gm-Message-State: AAQBX9era6h6giaXfV+0nMVykmbKODdsheEJsvf5sw4rsGkWSr/Js68f
	BDeXFgEA/TzY6EAkQsb5UiRcvOrj/MSyjg==
X-Google-Smtp-Source: AKy350ZQYyvfIYk6qrcUqaXS46146JyxyToFgIYTy+lVEiCidRMcRlLAA2i6lOgtg9nsUhEs4z1gBw==
X-Received: by 2002:a17:903:2948:b0:19c:f232:21ca with SMTP id li8-20020a170903294800b0019cf23221camr1555972plb.3.1679643025745;
        Fri, 24 Mar 2023 00:30:25 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:30:25 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH v2 0/3] Staging: greybus: Use inline functions
Date: Fri, 24 Mar 2023 00:29:49 -0700
Message-ID: <cover.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20230324072949.Zgy_6F4chAWePn-9cZqhgLyoyQtGtnqRTvInpKh-mAk@z>

Convert macros to a static inline function, to make the relevant 
types apparent in the definition and to benefit from the type 
checking performed by the compiler at call sites.

CHanges in v2: Change patch subjects, noted by Alison Schofield 
<alison.schofield@intel.com>

Sumitra Sharma (3):
  Staging: greybus: Use inline function for macro
    gpio_chip_to_gb_gpio_controller
  Staging: greybus: Use inline function for gb_audio_manager_module
  Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

