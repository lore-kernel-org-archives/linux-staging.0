Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B87B;
	Mon, 20 Mar 2023 23:04:52 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r11so53045440edd.5;
        Mon, 20 Mar 2023 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEmpGt53dG1aAw90RrCeKMXIYvRU8CrcxjpKorHZWHQ=;
        b=JIxCsluKKeA8eGbygKJZnSHIniF9YGj5R9z0IGKjE8bPbvCnXCvWHo3cPw+vn8quXR
         jGX/JXXa9m1eFNLYPNiq3S8g7yGR8GfdTHMEwOdB5RevVqdeDzKMJv++Yd5wSYP1sWFf
         qppmyjvcX/St6BzgvLg4EI8jJbRDsoLQssKaEF/UNQccmOPd8cgBiRlN8hNQxRaZLmWV
         zPJ3522sHxKIrzDJ+VqSp5k1iidtZPxnHFBjojhrUJKa+14yc1vcOdcCO/evvaID35dY
         qT1gW0HWj2Z6Lf3J4NxATpTMO5QQaA9zHEfb9bEfwPEgWFN4DiSL6beZee/wmQvrqQLV
         4Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEmpGt53dG1aAw90RrCeKMXIYvRU8CrcxjpKorHZWHQ=;
        b=ywcV3x6tsZmy+kgC+wbXpRQayetjuNnm/7Soz9sSDxq91ZxGoYX6HkNpxbEg9pPoZj
         WzzpSgINTLPngqOvHllaRnUfs46wXHkGcu0mm/0f0KBGSA2O+mcUK+TQjGzCokANrqjI
         qkXyIuzOchsKeybj6wm2qBsD/GuDkjV2xz8jzJofh/ol6CQKQ/rQAwq+ikoqCXJALVfP
         D5mOgwonbdtnjDkr4Yy2CupiEkQyRoxIYemI1yrAIrcwfV38qH0wJrFW9GQNhzoyUkBd
         622Hg96NTzKvT8jHO73i4br/cmdCkvvAtREZERAbWFyGPanLcq+kagdGhu9Ws6LZsK22
         /uaA==
X-Gm-Message-State: AO0yUKXAVkxgEVHULm7AtURuzJe9HtnnUfY/1CST7qYvn3GLrE2FzNMa
	+xr9k9kZscWNZcF5pCaBLlc=
X-Google-Smtp-Source: AK7set8bY4tQsS1n+cgIsIxiNbFRE4fOIz/6KbVW+k1ZEK69W9k81Dc5IwLOmPxCmyDgXD8b8PVhaw==
X-Received: by 2002:a17:906:fb0f:b0:8f3:9ee9:f1bc with SMTP id lz15-20020a170906fb0f00b008f39ee9f1bcmr1282495ejb.13.1679353490905;
        Mon, 20 Mar 2023 16:04:50 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:50 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	vireshk@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 0/3] edits in greybus driver
Date: Tue, 21 Mar 2023 01:04:31 +0200
Message-Id: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset includes change happened in greybus driver in three
different files two of them patch one and three related to 
checkpatch issue and in second patch convert two
`container_of` macros into inline functions. 

Menna Mahmoud (3):
  staging: greybus: remove unnecessary blank line
  staging: greybus: use inline function for macros
  staging: greybus: remove unnecessary blank line

 drivers/staging/greybus/gbphy.h                  | 10 ++++++++--
 drivers/staging/greybus/greybus_authentication.h |  1 -
 drivers/staging/greybus/pwm.c                    |  1 -
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1

