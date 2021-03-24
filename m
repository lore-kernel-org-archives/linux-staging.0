Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5D5F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 15:50:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x7so2487586wrw.10
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izXHtp00Qyo59De+uNdVzosuHl+EhCiFQYmGaB3NbeU=;
        b=fAfNqhO67Tm4SbIzUwIhGYcToWSgXPOwf/Izs0y4rcCh6rSj6UQuKn4M+kpR2B3TMK
         dvM4Ojxd9gpP+Z53Pha5N0vkmDSXdr7YHG1OYTLjHm6zFvc6UjOJ5GMlOrGJSWu3tD5b
         xAsNyxdsRHEjTPOGVUwzF+DOf6YqLvbKaq4lpT4ecY7qtQxreV/dgEzBvRpjCS42JwBP
         Mem8D7diaIJkfx3D8hBC2a7PQbiRfwalwR066axqwyqQ10OQcb2tGXJT577hbP+qFpy0
         wtHy2oj48vubSvAWjeDylGpBs2UoSpXPIWruE6ljyH+B7blOJZjJPOu9gH/GOO1cXH+1
         26SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izXHtp00Qyo59De+uNdVzosuHl+EhCiFQYmGaB3NbeU=;
        b=RAeNLt8l3gyJ8/2qIuQIx8WQny5oo5D/5+AAeWM+E8NL9HhqYtNyfcOt7E4sub+bTe
         538O5rOIa2AcQSz/1mYWLulxqSBGmJb0/dBtp80DkxT+yUENl8am0h/M+yVrbE7aT6S7
         k4V74jzaDeh3NPKsyEnsjTX4yHa8BkY0BAJf+rTzZMWc0BlKc4yAYuFhCb+mPyXnHib5
         rjjxwh2sMneWBfQGWNNqB5Fs05m0etoSFPPSyW/5SNSSixBLJNAraBuy1GlgVy6iYyjW
         sUyIqF33DgJz1nNYaT1WCLBuvNq1Oy0+wTFrMhG+77CR9JncxXtl51x5lfU/CfdESLap
         +3xg==
X-Gm-Message-State: AOAM531Z75kchy9W1ZYOgBsZWnEu99Vezsx6TEG1x8i0ud9iJOxplHEb
	A8Q6g2oKCKBtspp3RymnnRk=
X-Google-Smtp-Source: ABdhPJzNaAZ2WVQLcvj1npiQboGwDS6G+JVmgMPmodEKP/J6VqTCYgNPC2hRrNmfUqBzQhJj4Hyt/A==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr4203339wra.419.1616601049314;
        Wed, 24 Mar 2021 08:50:49 -0700 (PDT)
Received: from agape ([5.171.72.168])
        by smtp.gmail.com with ESMTPSA id u2sm3600578wmm.5.2021.03.24.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:50:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: remove assignment in conditions
Date: Wed, 24 Mar 2021 16:50:33 +0100
Message-Id: <cover.1616600897.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all assignment in conditions in rtl8723bs, 
warned by checkpatch.pl

Fabio Aiuto (3):
  staging: rtl8723bs: remove assignment in condition in
    core/rtw_ieee80211.c
  staging: rtl8723bs: remove assignment in condition in
    os_dep/ioctl_cfg80211.c
  staging: rtl8723bs: remove assignment in condition in
    os_dep/ioctl_linux.c

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    |  5 +++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 13 ++++++++-----
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c    |  9 ++++++---
 3 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.20.1

