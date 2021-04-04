Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79970
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:09:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q26so3085395wrz.9
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcLF+WCv0M4wIqTfEUJhCyuPrAeNDbmNX5DkS26TIY8=;
        b=Vgz3KZa9eMWbWMRoa9HkH6mx86HoCm6NjAVUjwqUlOkgm3fcGAYrC3JWUbKqyP3LWk
         7wZg/nwIBbA8ef9o+XzxBiDsQY+50tHemJh+/wTcaUDjtjTIr6MDtf+RyUCS3xeIWGP5
         oL0JanyLiqXKgfUmYZF+mIrTnK3DzyDNaEWlGJIWPNTYLqEtC/J7M2RFCCT/EiJjndcT
         sWq4Pdm6AQzHRW789FzzYAITBJ1dYk0DdS/lE1WilOwIsSfgjDRfHrFGLQf1f01nwNV7
         SGaIpsIuLHDOihPrqAwRkLY48tZExvT0AlrL0nneBofEANazlf40ak0oSEKQ6ZqCYyLk
         IuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcLF+WCv0M4wIqTfEUJhCyuPrAeNDbmNX5DkS26TIY8=;
        b=pBua7QAVCtd8b8+x+uodM98CLfidHXejQDssKk+MU5n09EhJpetIXYrkEw90SjY+UJ
         HTXkgbCK+B/ddDGCnJUC1WB50kYaIZG18xuWzmbgqTCxJ5ckxK3pO0habOE8ygNvb2Hm
         vHc4ogQuJ45UcjUsngIwCLphnHZV8DSWuqLNLKel/2v1dxdW9gE8HZ7GFKm86pFMdY/o
         bJrPkDDu0fGcbJoQavo9JZhLEiZ5buE9coHZ7/elJ+1HRMQjOsIzBuOKlN6FSNR1G+LJ
         fINpiv6m/B2WtLlTNh92s11eoR6mVyQpw9eJe9R4uYhB0RB58wvL8IiJIxMFqh6fxKM6
         xjSA==
X-Gm-Message-State: AOAM533wlwfHs6K+I/3TCgIr984C0s8Q4lCefvMFPmkBpk7L37sdFbIb
	qDfIuHf+kqmf2mGXk5OziKo=
X-Google-Smtp-Source: ABdhPJy1RATGo/LYhD1xiVQyUD4S++zSSES6oN8H0nwoHiiljngyMvSAmRZY/QT2U7l7OvN5XWo1Aw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr12818998wrs.219.1617545390898;
        Sun, 04 Apr 2021 07:09:50 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id z17sm12320797wrv.59.2021.04.04.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:09:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 00/30] staging: rtl8723bs: remove RT_TRACE logs in core/*
Date: Sun,  4 Apr 2021 16:09:16 +0200
Message-Id: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all RT_TRACE usages in core/ files.

This is the first of a series aimed at removing RT_TRACE macro.

The whole private tracing system is not tied to a configuration
symbol and the default behaviour is _trace nothing_. It's verbose
and relies on a private log level tracing doomed to be
removed.

-------------------------------
Changes in v4:
	- completed checkpatch fix in if condition
	- fix reference in Suggested-by: tag
 
Changes in v3:
        - written better changelog in single patches

Changes in v2:
        - isolate checkpatch fixes in separate patches
        - removed two if conditions in core/rtw_wlan_util.c


Fabio Aiuto (30):
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_xmit.c
  staging: rtl8723bs: fix condition in if statement in core/rtw_xmit.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_security.c
  staging: rtl8723bs: fix line exceed warning in core/rtw_security.c
  staging: rtl8723bs: fix spaces around operator issues in
    core/rtw_security.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
  staging: rtl8723bs: fix error prone if conditions in core/rtw_eeprom.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
  staging: rtl8723bs: fix logical continuation issue in
    core/rtw_pwrctrl.c
  staging: rtl8723bs: remove unnecessary parentheses in if-condition in
    core/rtw_pwrctrl.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_cmd.c
  staging: rtl8723bs: fix null check conditions in core/rtw_cmd.c
  staging: rtl8723bs: remove unnecessary parentheses in if condition in
    core/rtw_cmd.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme.c
  staging: rtl8723bs: tidy up some error handling in core/rtw_mlme.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme_ext.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_recv.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_recv.c
  staging: rtl8723bs: added spaces around operator in core/rtw_recv.c
  staging: rtl8723bs: split long line in core/rtw_recv.c
  staging: rtl8723bs: remove unnecessary parentheses in core/rtw_recv.c
  staging: rtl8723bs: fix comparison in if condition in core/rtw_recv.c
  staging: rtl8723bs: remove commented RT_TRACE call in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ioctl_set.c
  staging: rtl8723bs: place constant on the right side of the test in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ieee80211.c
  staging: rtl8723bs: add spaces around operators in
    core/rtw_ieee80211.c

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  53 +------
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   |  56 +++----
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  90 ++---------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  79 +---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 124 +++------------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  39 +----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  56 +------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 147 +-----------------
 drivers/staging/rtl8723bs/core/rtw_security.c |  41 +----
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  25 ---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  24 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  82 +---------
 12 files changed, 101 insertions(+), 715 deletions(-)

-- 
2.20.1

