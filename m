Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9159467
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:56:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-311147ebdb3so353646f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687010198; x=1689602198;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrfA4PjxDsnF9cJAxM87icIyT8p3T29tCTGqeIrXL7Y=;
        b=J5JRW4X56P254eSYv7+tjxeNVUKjpy3Gdg/wIcdfTmCAI7aDGnba2iBCCDj+YQloh5
         6HF/j1+ORAWy0kMjRHGwg+I6X8b3xjlRYIGyKoqOFfFd1hDOgzx+vjFt2gD11QPpZCyI
         5t+4NoFGEdW9jRvgXyhkQjv5RzoPhRtBMY6NZgH4wTxMOCnZb8r5k1Pwm8RdfYUG3xsS
         9c7yS7GzbL//rvGeRaRJeQn+riy8GYVG4AbaZ52ea7zOijFhCbHdJ2yE4S8vxseJlaNG
         ByqcPWihyAxf5cNYoHZSa/L1QbUBdDqOrNvJ/4blR/8QULIGvpLwaCZupgTuXr5JL6/e
         N3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687010198; x=1689602198;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrfA4PjxDsnF9cJAxM87icIyT8p3T29tCTGqeIrXL7Y=;
        b=DM/PauVA0SDtrtecIbD5qLKD8zdckZI5fiUzO0eia7XyR6UllbGh8ncxGDaXZ9rHIw
         WkUzUOoW2sC0wi3Cja1H8qD167l8ZrxF8UOXtAWO9L8G2q3+akcDacvuuevB4WWagG5N
         2x4TcgqYW4TeZqwC4qSK5DB3eSvhX7hmAb9EZ5EnxkZCIOPPf0XcRpme0QgVviO8O4nf
         nmiMxKNCfsf2gBQGy91N7uV4XFSSpauKhIfSjZfmy6UAx0J6op3EA1Hb6cGwQiErjkGM
         xmO4RP7LOLE4jSDL7pGMkC8/fr0RFFnyx2JGFAShTLR6K+Md39NndLDi0PkqlJGA4RxQ
         nyGw==
X-Gm-Message-State: AC+VfDxSpH2UNLoUVhArcU0k0zIJgD/lJcuMJSeqN5xGFVw/bxaZXIE6
	jc7NFX93mkeefCngETaLU8c=
X-Google-Smtp-Source: ACHHUZ62CS8PD+HwPQ1CFJ/aFVv2V3Tndxp45mHcy93B4ZetJAYDpkkGbrpFdhIV9O2cOuVHznTa9A==
X-Received: by 2002:a05:6000:1104:b0:310:b62f:2379 with SMTP id z4-20020a056000110400b00310b62f2379mr3830530wrw.3.1687010197417;
        Sat, 17 Jun 2023 06:56:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906044a00b009845c187bdcsm2437346eja.137.2023.06.17.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 06:56:36 -0700 (PDT)
Date: Sat, 17 Jun 2023 15:56:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: rtl8192e: Remove unsupported modes a and 5G
Message-ID: <cover.1687007788.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unsupported modes a and 5G to shorten code. Change variable names
to align with rtlwifi driver as requested in TODO.

Tested with rtl8192e (WLL6130-D99) in Modes b, g, n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (9):
  staging: rtl8192e: Remove variable stats->freq as it is constant
  staging: rtl8192e: Remove unsupported modes IEEE_N_5G and IEEE_A
  staging: rtl8192e: Rename constant IEEE_x to WIRELESS_MODE_x
  staging: rtl8192e: Remove unused enum led_ctl_mode
  staging: rtl8192e: Rename rtllib_state to rtl_link_state
  staging: rtl8192e: Rename state to link_state
  staging: rtl8192e: Rename RTLLIB_NOLINK to MAC80211_NOLINK
  staging: rtl8192e: Rename RTLLIB_LINKED to MAC80211_LINKED
  staging: rtl8192e: Rename RTLLIB_LINKED_SCANNING

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  24 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  41 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  18 +--
 .../staging/rtl8192e/rtl8192e/rtl_ethtool.c   |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  12 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   8 +-
 drivers/staging/rtl8192e/rtllib.h             |  37 +-----
 drivers/staging/rtl8192e/rtllib_rx.c          |  43 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c     | 122 +++++++++---------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  18 +--
 drivers/staging/rtl8192e/rtllib_tx.c          |   2 +-
 drivers/staging/rtl8192e/rtllib_wx.c          |   4 +-
 13 files changed, 146 insertions(+), 191 deletions(-)

-- 
2.40.1

