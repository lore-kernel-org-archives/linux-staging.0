Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42F1320A;
	Thu, 23 Mar 2023 09:01:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y2so8266483pfw.9;
        Thu, 23 Mar 2023 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RWJzOeM5GIaIf82zupXR/wrUWqvRt22D3jyGfDKRi0=;
        b=GT9VzWPWIi3fRiiTEQRqtMPzOf4UlHEtpXWnaON7ZeEB/MsGe1J2NYF8yO4jWTpa+B
         FDQV3dtv10AicBYCDB/kw4dhLuluZpSeo4pELv0kz4QwZ437E+CFPkbAktP56Z68kafx
         pl9eoxJaIMGEU+MxDRx2AeiYW560rczy2CdmHzR3iR7Udwr6HKFYfK8/2xHYyh4B6rw6
         hnQbxBujs2CSMhjGSR8KDudwUIzlEFct3Frk27NrUzCEGG6WfEI9/Jn0Z6SYnMJT5EC0
         xuUOiTtxrHodzem+fDQjMWr07zfXJvklPIPaKReyyu8FYIdkCtcTIrJm2FBO1YWJ8x/m
         IhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RWJzOeM5GIaIf82zupXR/wrUWqvRt22D3jyGfDKRi0=;
        b=cTng5Ou377pYd7UeZ/FmMq1bgC4GkddwRBJjdPPbPvP5e7G78jCaSP/eYhZHXFAI5j
         tLuQ6Um65ysKJbrWEwJT8IIGIkzfFWv6ppB7WkEthXpyQy8HJeJdIyNshd/aITPT8gwO
         5jjrVPKdOtW6Bcwx2MjuCN8KFnbWsKQEF3cslB8LbDw+1et7Uh4arF76FwuNwLHEntOL
         fyMLLJepyY+HQ7EDfCUm2X/0M0mgyRnNE1YmcVMazJtTNDkEbVmCotZ78WEqR3eWe5CJ
         j3r+wIyypnE1hOIupaVc7eyAMFp/hMJbih8nsA4wAJ/W16uzBbRuQafIoaKr499PZgQV
         TPQg==
X-Gm-Message-State: AO0yUKXvXnDrkmwNnqQtGyvvUsx+PgRTXGNG/vk8TLUa9syTREsoeNwI
	3/Mh8tMo41PZTQ83qslaniUVPP22QjuPXw==
X-Google-Smtp-Source: AK7set9PXu7Uw9YhBNw4+ICSHXADaMDo6mZwCvehYYG3R5Lm9keHwVatsPeUKZXZPuWSWtZHu4/U5w==
X-Received: by 2002:a62:1d8f:0:b0:5dc:6dec:e992 with SMTP id d137-20020a621d8f000000b005dc6dece992mr5088682pfd.1.1679562095852;
        Thu, 23 Mar 2023 02:01:35 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b00625f5aaa1d9sm11346893pfo.83.2023.03.23.02.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:01:35 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH 0/3] Staging: greybus: Convert macro definitions to
Date: Thu, 23 Mar 2023 02:01:04 -0700
Message-Id: <cover.1679558269.git.sumitraartsy@gmail.com>
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

Sumitra Sharma (3):
  Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an
    inline function
  Staging: greybus: Convert macro struct gb_audio_manager_module to an
    inline function
  Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an
    inline function

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

