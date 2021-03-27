Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607970
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v11so8360198wro.7
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X4aEbSweInpMrEdY1R3L9wFkvEdj8tp2TtPXbUgDRuo=;
        b=EYT1ny/vSv5xvDQh2Fs/Wy3NcUbNzWNLQz/kjaxdrxI/lfn9oJLBMVpHe2EtiQXRdf
         tpNwez6bN/+Zh872clO0uxp5h0JsuxW/xdNx6q7NSpLicS/28kGWgu/Wl+O+ZeroNV1L
         L3sN7PSdd5HMTr08lA8TkX4q8+Awr273BM3l2LXzLJ3Xy/IJ0k3NIJukhzJSb8TFPgsk
         gjqD4gOgL4P6pDqH0W+QIZQGL4TDhzO46ocayRRz3Px3ONbZfWYT923Ob7CeRk5ePjPa
         f4UsmGMXd2glGIzKH2/3zbIHnSSXC6tWKMbc/yKwXQULGbmWD0wLITANMgLCGzozleTl
         HZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X4aEbSweInpMrEdY1R3L9wFkvEdj8tp2TtPXbUgDRuo=;
        b=eP0VMPYk/rl/PZN49pTAu+R520UTz8qZHmM+UmOTR3dBU+8U4kGbFqDUDKYhdVcraz
         8rdBu8sP1brGz+QDJet2RC4Ce0kQw1PM7dwr0x1A2kYFfF/mcaUKsdbfC0+zU7xjhAsG
         V1qXJWP/I6rp6mmIb8G2q3UAlcsErd5UuYkzW3zZzQ9rT33OQDvWikxpf1wg5DYYeTfu
         41wHIDKkAhpWJMfAF/oWLR3mNMt8m3/BHrzdxAuppkuC7gjE5SsP6/cmCda9Csy9pkkP
         Ze6VlLWhPNw/xdzwiqeiVnMGnvzqzP4cnxh+UiZTGFmtvp5LHW3vIZ8ZJITM+7fo9HPR
         D24w==
X-Gm-Message-State: AOAM532OHJ2EYTvKI5kWD0o2Lzv2oj/FiqRcbNPCzf06A6m9Sj/mJeMN
	lrNowh3eovwPXjMtz/oM3Wk=
X-Google-Smtp-Source: ABdhPJyb7U7Thj0oDh7B2RzmzEzPhoWBt22bKnCR0FvIvqY3tQfgqmPI3LjnhHc8G6hoxlgxH8tjcA==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr18558562wrp.402.1616855079067;
        Sat, 27 Mar 2021 07:24:39 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id u3sm19441977wrt.82.2021.03.27.07.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 00/20] fix checkpatch error on macros
Date: Sat, 27 Mar 2021 15:23:59 +0100
Message-Id: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patchset fixes, where possible, some checkpatch errors on macros.
Delete unused macros and some unused struct fields tied
to removed macros.

Changes in v2:
	- deleted unused macros
	- ignored following checkpatch issues on macro:
		* issues requiring to add parentheses to macro
		  expanding in args of a function
		* issues requiring to add parentheses to
		  very complex and unreadable macro

Fabio Aiuto (20):
  staging: rtl8723bs: remove unused macros in include/hal_com.h
  staging: rtl8723bs: put parentheses on macro with complex values in
    include/hal_com.h
  staging: rtl8723bs: added spaces around operators in a macro in
    include/hal_com.h
  staging: rtl8723bs: remove unused macros in include/hal_com_reg.h
  staging: rtl8723bs: remove unused macros in include/hal_data.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/hal_data.h
  staging: rtl8723bs: add spaces around operators in include/hal_data.h
  staging: rtl8723bs: remove unused macros in include/hal_phy.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/rtw_debug.h
  staging: rtl8723bs: remove unused macro in include/rtw_pwrctrl.h
  staging: rtl8723bs: remove unused field in rereg_nd_name_data struct
  staging: rtl8723bs: remove commented code line in os_dep/ioctl_linux.c
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/rtw_pwrctrl.h
  staging: rtl8723bs: add spaces around operator in
    include/rtw_pwrctrl.h
  staging: rtl8723bs: remove unused macros in include/wifi.h
  staging: rtl8723bs: put parentheses on macros with complex values in
    include/wifi.h
  staging: rtl8723bs: remove macros updating unused fields in struct
    security_priv
  staging: rtl8723bs: remove unused fields in struct security_priv
  staging: rtl8723bs: include macro in a do - while loop in
    core/rtw_security.c
  staging: rtl8723bs: remove unused macros in include/drv_types.c

 drivers/staging/rtl8723bs/core/rtw_security.c | 78 ++-----------------
 drivers/staging/rtl8723bs/include/drv_types.h |  6 --
 drivers/staging/rtl8723bs/include/hal_com.h   |  6 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   |  8 --
 drivers/staging/rtl8723bs/include/hal_data.h  |  9 +--
 drivers/staging/rtl8723bs/include/hal_phy.h   | 11 ---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 28 +++----
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  7 +-
 .../staging/rtl8723bs/include/rtw_security.h  | 23 ------
 drivers/staging/rtl8723bs/include/wifi.h      | 48 ++++--------
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  1 -
 11 files changed, 39 insertions(+), 186 deletions(-)

-- 
2.20.1

