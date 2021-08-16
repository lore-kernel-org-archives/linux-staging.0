Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C30173
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f12-20020a05600c4e8c00b002e6bdd6ffe2so9622035wmq.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FE51E+z6rwW3vCT+HddSaJ7256vyRjZvLJv2NiM2qi0=;
        b=Nk48hOOqlshjZSpO4U9E02aYdwG/pWMJ7nKwY7hf34vPX/s78Ok026mSndiSmx+iaW
         01yp+itaciLVgIJODcmJ775k0JIcX+BjQXricCu1DPCHI8De0B4boZGrMquKFqueveYy
         e3w6lc+wtEdPX7ePp/hPqpQ1PtcOHIiXnXb18W1CCIHZMKojfwP+sINGB6MCJlUQPk0t
         lcnM8tl17E/B5h45LeKG+gN/6NE8MaZ5CbTi6Q3gYkqTw8aWtLTD2557H7mGq93ACt0b
         h5ulTaFknQbUYQw+GGyvsXoMnWBgZhXxUKYdB9EBbwmZ9iav1TOKhIcs/YyDoK96G/1R
         G0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FE51E+z6rwW3vCT+HddSaJ7256vyRjZvLJv2NiM2qi0=;
        b=lZBzkk233Gf56dmOAHMLEYN0kivUZ9LWecrhDah0dRZQ4rSAxD0Zz80sHkDovn8KOg
         k9VuFhf4x4QAPSFGXpPrCbeV/lKdFdXyhyw7c+ynxjNCx1+KcsfelUP6j9GdHjP293Y1
         viE8vrOBgOla3vpZrCK0jmC0DWZoCdlpKP/oNEQ2pmCgAY3dbau+2PUKlSjLx0mGIfU0
         l41gwJitgxz4nB8MAyH/p+qQsMSwdrtdkzDhY/yaH5S5nLIZ+0iEe+XN9mydlUKcf3tG
         Svpaab42B6sJSy/g0MBZHsts11Uq/tFSzR6sLW1372DD5JsooXQXBtPtDT9tvohUM7zs
         W12g==
X-Gm-Message-State: AOAM533SfcU8JhltNkOj1pBfWXaj7OJo/IrVmI98YzijY+u0N6Kip/WS
	4lrX9CRR2cP2wHHHw4xKR+Y=
X-Google-Smtp-Source: ABdhPJzaCZ52Gm//nMvaCG4cnVeA8+BFNVP9R4nI02Yzvc5gEDCUEHOMUKy3vSeOdlze4Lc/VUX1vQ==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr16432297wmc.112.1629129555724;
        Mon, 16 Aug 2021 08:59:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/23] staging: r8188eu: clean up spacing style issues in core dir
Date: Mon, 16 Aug 2021 17:57:55 +0200
Message-Id: <20210816155818.24005-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up coding style issues in the core directory
reported by checkpatch --types SPACING.

Michael Straube (23):
  staging: r8188eu: add spaces around operators in core/rtw_ap.c
  staging: r8188eu: rewrite subtraction in core/rtw_cmd.c
  staging: r8188eu: remove unnecessary parentheses in core/rtw_cmd.c
  staging: r8188eu: clean up spacing style issues in core/rtw_cmd.c
  staging: r8188eu: clean up spacing style issues in core/rtw_efuse.c
  staging: r8188eu: clean up spacing style issues in
    core/rtw_ieee80211.c
  staging: r8188eu: simplify multiplication in core/rtw_ioctl_set.c
  staging: r8188eu: clean up spacing style issues in
    core/rtw_ioctl_set.c
  staging: r8188eu: add spaces around operators in core/rtw_iol.c
  staging: r8188eu: clean up spacing style issues in core/rtw_mlme.c
  staging: r8188eu: clean up spacing style issues in core/rtw_mlme_ext.c
  staging: r8188eu: clean up spacing style issues in core/rtw_mp.c
  staging: r8188eu: clean up spacing style issues in core/rtw_mp_ioctl.c
  staging: r8188eu: clean up spacing style issues in core/rtw_p2p.c
  staging: r8188eu: clean up spacing style issues in core/rtw_pwrctrl.c
  staging: r8188eu: clean up spacing style issues in core/rtw_recv.c
  staging: r8188eu: clean up spacing style issues in core/rtw_security.c
  staging: r8188eu: add spaces around operators in core/rtw_wlan_util.c
  staging: r8188eu: clean up spacing style issues in core/rtw_xmit.c
  staging: r8188eu: clean up spacing style issues in core/rtw_debug.c
  staging: r8188eu: add space around operator in core/rtw_sreset.c
  staging: r8188eu: clean up spacing style issues in core/rtw_sta_mgt.c
  staging: r8188eu: add spaces around operators in core/rtw_br_ext.c

 drivers/staging/r8188eu/core/rtw_ap.c        |  88 +++----
 drivers/staging/r8188eu/core/rtw_br_ext.c    | 104 ++++----
 drivers/staging/r8188eu/core/rtw_cmd.c       |  22 +-
 drivers/staging/r8188eu/core/rtw_debug.c     |  42 ++--
 drivers/staging/r8188eu/core/rtw_efuse.c     |  96 ++++----
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 124 +++++-----
 drivers/staging/r8188eu/core/rtw_ioctl_set.c |  20 +-
 drivers/staging/r8188eu/core/rtw_iol.c       |  12 +-
 drivers/staging/r8188eu/core/rtw_mlme.c      |  80 +++----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 236 +++++++++----------
 drivers/staging/r8188eu/core/rtw_mp.c        |  10 +-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c  |   6 +-
 drivers/staging/r8188eu/core/rtw_p2p.c       |  46 ++--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c   |  16 +-
 drivers/staging/r8188eu/core/rtw_recv.c      | 112 ++++-----
 drivers/staging/r8188eu/core/rtw_security.c  | 188 +++++++--------
 drivers/staging/r8188eu/core/rtw_sreset.c    |   2 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c   |   6 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c |  60 ++---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 122 +++++-----
 20 files changed, 696 insertions(+), 696 deletions(-)

-- 
2.32.0

