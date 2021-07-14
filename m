Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D470
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 15:11:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso3604427wmc.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPksOXWvTkUtcqvTzVQpJTHtPXY+kFhB7qHKvutpcB0=;
        b=JG2p07c0aobB2lS4GYpnWCxwQPzu7y6gVZXOhSQMuqKjQ1LWf2siyRefgpKZ8AWl6M
         wjH6rOclkgo9fgk8O8rvAwbkP7i7JGkPshCENJ5CoTt5ek/IoWym4Gi3kYPQFcjkZu6N
         0jVGT99wHgFbIo6NlJKyUyQ9kdy6nBhrK4QQ9FGL+skc53oO0gaEpvckzY7pherxCduz
         CSJkTJzuknLZWOLjCIYftXqMAGVwBP0SN8w2cFEBRw6UoMZ2MrJdT/jYaCR2ayY8C+TS
         xZ+2aQ5OPnaM6N6aPcSwXmNNiwwyqGL1ZfBWUmyxdHxNhDE3j0cy2HmjXhYqBKMsulTE
         1WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPksOXWvTkUtcqvTzVQpJTHtPXY+kFhB7qHKvutpcB0=;
        b=MCCGBkelitY0s5lo+EbIB877SJ+ExlpwDvVL7lcD+jekzZwhNWNVgam4v1PjhHIfQa
         UiYBOT0/vss/9oSvquHKaI5AUZafoLnAg4qLGgr8L/3gxOOKW4hJq+8y/K9s/nurx6rC
         A2jR9kr3McrUkXoQuvsWX3QYQD5MzrX8A2bwdCpnTXrisdEbiFDAvkQEcGVSOBJmECZc
         YolEREL/HQc4Id+JhiyYPCz3eBa6JRSHhaJpAcun5u5k7X+1jpXR6h/KOH0kNXzV9kop
         1fSkgO4I+zJL8By7YlgXAiSMl7cdOEJDL5irD4CnecdbLaIle9o0PpgiVUN5dM/lI6fI
         5Hcg==
X-Gm-Message-State: AOAM53146z+IFESrDnMcKdQH/wUFLqHAeKyN0JMEUCJ8vNkH+PJlYD1h
	VVnZZFVcm2Of8OnIOU5fY1g=
X-Google-Smtp-Source: ABdhPJzQMt1B+bHckwfLgt0P/bulirlyZhkN4ZmSGmG6ut1o03bIKamnZj5vG8mWPJJGF8TJV54vQA==
X-Received: by 2002:a05:600c:8a9:: with SMTP id l41mr4775924wmp.152.1626275475909;
        Wed, 14 Jul 2021 08:11:15 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id n23sm2257926wms.4.2021.07.14.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:11:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: add get_channel implementation
Date: Wed, 14 Jul 2021 17:11:11 +0200
Message-Id: <cover.1626275102.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds cfg80211 get_channel implementation.
One of the benefits is having displayed channel info
in iw dev output.

Done some code cleaning as well.

Tested-on: Lenovo Ideapad MiiX-300-10IBY

Fabio Aiuto (3):
  staging: rtl8723bs: add get_channel cfg80211 implementation
  staging: rtl8723bs: convert IsSupportedHT to snake_case
  staging: rtl8723bs: fix camel case issue

 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 53 ++++++++++++++++++-
 4 files changed, 55 insertions(+), 4 deletions(-)

-- 
2.20.1

