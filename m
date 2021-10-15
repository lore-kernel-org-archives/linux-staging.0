Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6812C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 16:35:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a140-20020a1c7f92000000b0030d8315b593so3480760wmd.5
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g1PMu4QAwnFdhyl5MyRkydRYCLGimc4yHFMSZWmKWD4=;
        b=YbgH7ZeFLSY+Sr9DQUnX3m0U3snryOHajTm4PeqNFYU82r39vzi42aJfeWcdXy1GFs
         Se/W14SsCvMZ9LIQC6DnOrJhw3hG4e3BuMSzaw8UGI0U9kLrgTNQQ/EuagJnH/8palD3
         X1ju7UtJtFq2mA8aiu0a/WSbDYqUAWN4Zx98F66dR0EMlAu2yMqv8HVSARFfiRBpvFsk
         fUWrNlYrfKscj1TNHRO6ZjJIRgytdzZVfk9C6rHNGjo9Kz/Bob9+d3wvyyaJuSEIJ+MT
         Mk7F5lQol/SIJCkv13ER3Cg1wcx8pUY7j04uPz5/9kEAlRIxHwcx8V9uOn+lFmGcR8I5
         CCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g1PMu4QAwnFdhyl5MyRkydRYCLGimc4yHFMSZWmKWD4=;
        b=5ee8TuAqo1LiY0zBCg0has/3kl2+/dZpS8c+J8zKUzo7caGIzhh2KuD0c82hmJG72B
         hgi26volRPhVLtNOxq0fPUn/ZP+3sfuZIBraDdJlpwkiDaR7e2SxjWPaYWGf73dSjas8
         +fSkbOof88cj41VmdR5s6ivWoXoDGhY3WHKFVBMvGGXrf/zjhT69qovTI+VMHlDFzNGu
         nF7pv/RrPpo5ANtYeKnpzS9BJ70CHG/YjBGrmP9vWKApjrkLkwyzorbDbzUZjVN2bqVn
         IlvbyjZU1+zbYn8c8aBA8V+mpT/NzSWosRCogLNGfuWR084g8WYyBPM/aj1Xny1WwM+4
         9qPQ==
X-Gm-Message-State: AOAM531RsPy9x1y2Bmrm67SDcXX6ITfWmEuJtuXS8pAZtf3Ke43pEeyn
	GN7azx6/qwGQAJCtnMmx1U4=
X-Google-Smtp-Source: ABdhPJzp0aLJi4nzd/LntAwUGY3NXnUXGK84X4wHqwczdgXCgnDyzlLwnF/AD3UnG391LDq360PHAg==
X-Received: by 2002:a05:600c:a43:: with SMTP id c3mr26535192wmq.193.1634315715460;
        Fri, 15 Oct 2021 09:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id c17sm5489593wrq.4.2021.10.15.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:35:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: r8188eu: odm cleanups
Date: Fri, 15 Oct 2021 18:35:00 +0200
Message-Id: <20211015163507.9091-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes:
- empty / unused functions from odm.c
- two never set / unused fields from odm_dm_struct
- the function ODM_CmnInfoPtrArrayHook()

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (7):
  staging: r8188eu: remove empty functions from odm.c
  staging: r8188eu: remove ODM_SingleDualAntennaDefaultSetting()
  staging: r8188eu: remove GetPSDData()
  staging: r8188eu: remove ODM_AntselStatistics_88C()
  staging: r8188eu: pBandType is never set
  staging: r8188eu: pMacPhyMode is not used
  staging: r8188eu: remove ODM_CmnInfoPtrArrayHook()

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |   2 +-
 drivers/staging/r8188eu/hal/odm.c             | 144 ------------------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |   7 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |   5 -
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |   5 +-
 drivers/staging/r8188eu/include/odm.h         |  38 -----
 .../staging/r8188eu/include/odm_interface.h   |   2 -
 drivers/staging/r8188eu/include/odm_precomp.h |   2 -
 9 files changed, 6 insertions(+), 201 deletions(-)

-- 
2.33.0

