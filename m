Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056428F5A
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:43:52 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5334f8a40e2so4096879a12.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167831; x=1696772631; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWdo0Xen3j1Z5vpJFXzKckOo4KzL4gSS+suSALE7N7s=;
        b=SOQqwxAG/mtjLzL6jK4iaWKj9NE5b1GjgDA9bPvYMCB6GgK91+e1Jw6pfh9v+VZgNw
         LRn5fH1Lu2hhGCHzGBlgnOYkpSfkQqI3cn6yczAMhBqKfQ4u1oghu+qVvatEvyQP/y+I
         TShsg7kRoMbD6zzPSG/3/JWIHs92sHfxeOppaL2l3oZnblivBILIA/v3i5KBPDWq9Z3p
         A5yhBX30tCUqTJwMgEv9vf//EbRYNDHeUlPmgrAzxE+xVLYDuOibhFWxIZBvGjRjz9ve
         xaNjn0ok4Zw9F6AmZrI5HXbdi6XKAElfXCGFXqfcKEOYA2JrYInM5eGhIZeA7pOjSduh
         ef6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167831; x=1696772631;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWdo0Xen3j1Z5vpJFXzKckOo4KzL4gSS+suSALE7N7s=;
        b=QEfuRB68tWk/YCAftFE0Mw0XxdB8llzukovP0a6cLeIqziZ0UmkXfL70Vw5hGQUbh5
         xUtG0JD+NH4s1QrANxraPpqQtZU+KMtr+cG/XEjrmlbHZt7wmqvZz8lkKjglTRUQ94VP
         OuYuDkacEmcfDuwzAEFlVfjQe//VVsdVj3LI900ZjJjDDuu4AAj6uionABVRL4t1sOGJ
         TcEyrrMt/38MTZTInh8Rhu+EYqurwWM1UHF+4zN5eM75pnSytw/aA41PswXtWOA0XFs0
         K53cvfAimgBNT4ePZTZ5L9bndwS+/sLk+5LNANeWUPsXMgdqISScFsJ4DybQn898w1mY
         QzyQ==
X-Gm-Message-State: AOJu0YzDD+v04PiFbF14D7rgBa4+uB7e/p+Yf2Ywt6ib0qQ88viTL30O
	bEd2PW23ekW4PQ3dAME0F54=
X-Google-Smtp-Source: AGHT+IGJGDepRSWl8XWYqnjABUG4wibQ/FteSnWEM1qITlmjBWrSE9kTGtNocO5auiwqLEYGWOtfWg==
X-Received: by 2002:a17:906:2098:b0:9a1:f96c:4bb9 with SMTP id 24-20020a170906209800b009a1f96c4bb9mr8720043ejq.6.1696167830793;
        Sun, 01 Oct 2023 06:43:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b0099bd1ce18fesm15753463ejb.10.2023.10.01.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:43:50 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:43:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove broken function
 _rtl92e_if_silent_reset()
Message-ID: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When the function _rtl92e_if_silent_reset() is called the variable
priv->rst_progress is set to RESET_TYPE_SILENT.
Since priv->up is always true the function is left at "if (priv->up) {"
without resetting. Now the function _rtl92e_if_silent_reset() is like
deactivated because the equation at the very beginning is false:
"if (priv->rst_progress == RESET_TYPE_NORESET) {"
This leads to a state where the driver hangs in the reset state and
cannot go forward.
In 30% of the cases the wlan is disconnected and cannot reconnect. The
rest of the time it continues working but no reset is done at all.
Further requests for reset are ignored. Remove broken function that
has never worked.
Some related cleanups are included.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Tested r8192_private_handler with:
	sudo iwpriv wlan0
	sudo iwpriv wlan0 forcereset 1
Tested channel switch.
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (11):
  staging: rtl8192e: Remove ibss_maxjoin_chal
  staging: rtl8192e: Remove dead code from _rtl92e_if_check_reset()
  staging: rtl8192e: Remove RESET_TYPE_NORMAL
  staging: rtl8192e: Remove broken function _rtl92e_if_silent_reset()
  staging: rtl8192e: Remove unused variable rst_progress
  staging: rtl8192e: Remove unused variable reset_in_progress
  staging: rtl8192e: Remove unused parameter from _rtl92e_sta_up()
  staging: rtl8192e: Remove unused parameter from _rtl92e_up()
  staging: rtl8192e: Remove unused variable is_silent_reset
  staging: rtl8192e: Remove unused variables priv->reset_count and
    reset_cnt
  staging: rtl8192e: Remove r8192_private_handler
    _rtl92e_wx_force_reset()

 drivers/staging/rtl8192e/dot11d.c             |   3 -
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 100 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 147 ++----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |   5 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  54 +------
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  18 +--
 drivers/staging/rtl8192e/rtllib.h             |   2 -
 drivers/staging/rtl8192e/rtllib_softmac.c     |  10 +-
 8 files changed, 66 insertions(+), 273 deletions(-)

-- 
2.42.0

