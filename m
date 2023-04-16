Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5710FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:19:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f0769b0699so4541745e9.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629571; x=1684221571;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0O0XIvH4c4BlzigY67Qd5l1PmbnHpON5HYPfEl0I6o=;
        b=l96tVkmH6rqdKGLfwHfo4oJWdyRHWk4S2wsULtoPjsL15wlME0iALUOpNyId5USsF7
         4AYrXGAIEGLbAY8hMZco48+Ve5XSxUEmimEhR5nyhjYGgSQVhSeDJ+TUrqP/2HSeV+im
         6BAJSeU1lEq6fpbhas4NFvvQAed+sgH3kl/QJDZ5YXZKg7h9OhrTzhHuEUWSe+RYKp/P
         0+VPPHZ2e469Vyt0wKoQS4C20d2SAxZsogHfvARIHsMBLw2W3J7QpDM/fBrx1ww9tgL5
         wgpBP84pr5R9qLMzaLLkkzjRkk6o92HcjNVDMMssVe8K5zXXP8WZxAhBgVozfOHrRVJp
         VKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629571; x=1684221571;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0O0XIvH4c4BlzigY67Qd5l1PmbnHpON5HYPfEl0I6o=;
        b=kzoYUVUKaHHToO0nHcCQp6ZyqcGUTp/djZpPje5Z+Y5tN3aT9iKQkThOQ1LJP84W8p
         RcjqfUjZepubKEwWuh5C+2KvU1us6j1UQ38WtuKso1XMLcYthnhiQbfQcAVXVAZQtHmB
         9szUWVUSGQ91t5c2+naK9hfH8xU/vay2RoipDg8F1NWwQRThtN+qkReImi318JtoJ08l
         OT51SwonFKJ8EObcvb7psJ9Z1scQ88KuGtgBLNUmRU6wRcmuGjh5wkuy3DZjQ2lv9BKu
         i++Ug9pllo7faWSMD70cgcDTP3uvlxTmUKKICbQYPPfsK6+I4dDlZYluhZSF0BP9fWrs
         rg3w==
X-Gm-Message-State: AAQBX9crYWaTdJU2bhVh/16JvH2lxuPRolSzw3BhXiiMvbPcV/BfvDLL
	YJP9vRcU6iTo9gDIzSnw3tU=
X-Google-Smtp-Source: AKy350bsn31PH4Q/fBL4XCI/dte4Oc0jQMBhU2HtOaiMtVZUQbwrULlIjhx8u/FGKZPeFLYsCjWWKA==
X-Received: by 2002:a05:600c:1c0a:b0:3f0:5a8c:fee4 with SMTP id j10-20020a05600c1c0a00b003f05a8cfee4mr5379324wms.4.1681629571163;
        Sun, 16 Apr 2023 00:19:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c378800b003ed2433aa4asm8461793wmr.41.2023.04.16.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:19:30 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:19:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rtl8192e: Remove unchanged variables around
 rf_power_state
Message-ID: <cover.1681627603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unchanged/unused variables and resulting dead code in conjunction
with the state machine of rf_power_state.

Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (8):
  staging: rtl8192e: Remove unchanged variable RegRfPsLevel
  staging: rtl8192e: Remove unused function rtl92e_disable_nic
  staging: rtl8192e: Remove unused macro RT_SET_PS_LEVEL
  staging: rtl8192e: Remove second initialization of bActuallySet
  staging: rtl8192e: Remove set to true while true of bfirst_after_down
  staging: rtl8192e: Remove unchanged variable chan_forced
  staging: rtl8192e: Remove unchanged variable frame_sync_monitor
  staging: rtl8192e: Remove unchanged variables bfsync_processing and
    more

 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  9 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 20 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  7 --
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 80 +++++++------------
 drivers/staging/rtl8192e/rtllib.h             |  2 -
 5 files changed, 32 insertions(+), 86 deletions(-)

-- 
2.40.0

