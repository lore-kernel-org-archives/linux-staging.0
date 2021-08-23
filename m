Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9E3FC4
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:12:07 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id me10so8992019ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDIUnkK4xbCjU6orBxqS1XAry/viIvb3oHvJd/8YwME=;
        b=VFP2IcMlNvcHRWRVqG2qnZHlLJup3EmPZMZ0q2ea2+NUPd2Ga88qzYo6tvjbcs8Bun
         XiLFtfXieRIheqS0c9JmNHvfkO9x/n655lAUOg/tWQ3wkdfQla7UNeNE6KrJFhe6e9VP
         knzpPWzwnKCxbgUXbN0XQ6xWDUZGmG+ed5fyrtfYGBG/nXfkVXscOmLrwPiuYixxlEDc
         taxWK1D/br2SzCT3ArDfWTV9y/e7vibYHWfhkX30CkszTnMo9IcuGk7M/0azAmRwGj2K
         b2eykixSg9sc/SHxOoruIG+nZE1h+KVr17q06603I012ZBN3TuMBbyXPuCbYvMWoaWVN
         N3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDIUnkK4xbCjU6orBxqS1XAry/viIvb3oHvJd/8YwME=;
        b=scc/tR7FADiGx+2MwpS1VKcj1BrkTDernN39eNDosoxkgnSvnUDv1V2Zh5JDcGvL4L
         SAwN5/XnlvaxiabjhMsOhLq0cxDEOdbJARXMNZV+V5NxG8+x4JRQpoiSxHLgYMHGn/76
         +0V3Xyeeh111+PyCGZ+aVUQVbYr3NYwCtYW52O0Uj5EBQRwKVq0+2sUEDtzhW7nia8js
         v0Q7iHrLjelOluMUvdbQYnP6VIJtGi8vEQsacjhiC16M8KPGBmnNvBZISLO1bioq6dT9
         nxZyl6u51ehJUFFNQN5I3MgcNffO97Kvd9jXZ20epuLU97Z3k7+dzCQcQEfxgP722JF0
         HQow==
X-Gm-Message-State: AOAM530Nxvt0sq4RI5pvjRG4j93BgRl+9Ki2SaodxcjbqQ1zDdifdWe+
	XbdVNVfkr0QBAGvZqasygYI=
X-Google-Smtp-Source: ABdhPJwBPAUw/FNpMnosY1z0oIkZJsm81W5pE/n+VkJmbXmtVAvRxH2kulap4IQyUDy5lH4uGyfrOw==
X-Received: by 2002:a17:906:c252:: with SMTP id bl18mr35987014ejb.519.1629727925463;
        Mon, 23 Aug 2021 07:12:05 -0700 (PDT)
Received: from agape ([5.171.81.132])
        by smtp.gmail.com with ESMTPSA id o17sm9118706edc.58.2021.08.23.07.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:12:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8723bs: remove wext code
Date: Mon, 23 Aug 2021 16:11:58 +0200
Message-Id: <cover.1629727333.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes all wext code.
Some code cleaning is done as well.

cfg80211 wext compatibility is granted
by selecting CFG80211_WEXT in kconfig file
(so userspace programs can still use old
wext handlers).

Tested-on: Miix 300-10IBY

Fabio Aiuto (5):
  staging: rtl8723bs: remove obsolete wext support
  staging: rtl8723bs: fix code indent issues
  staging: rtl8723bs: fix logical continuation issue
  staging: rtl8723bs: remove functions notifying wext events
  staging: rtl8723bs: remove unused rtw_set_802_11_bssid() function

 drivers/staging/rtl8723bs/Kconfig             |    3 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   68 +-
 drivers/staging/rtl8723bs/include/drv_types.h |    3 -
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |    1 -
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 3220 +----------------
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |    4 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |    1 -
 7 files changed, 44 insertions(+), 3256 deletions(-)

-- 
2.20.1

