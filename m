Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912243FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 07:10:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b6so20912964wrh.10
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7XgklqB8Vn+B2YoCcgc/2VGbqHKZvTCvhUGQR7Kyng=;
        b=A19cEXqlQMRFb+jqfANOK/viqfpKJ+hehCInuILpSUt+d7JCq7KGwzISB0t6IM4sLI
         0orQRYHCH1LwMj9QEO0Yar+yQagoxwI3wQoF6JA/XMd0fA14rOv51H/gPSsmKaO97kLu
         3bSFtN9gHl6rC43IhuNXRs3WMvJ2DcNHvJoVSU5zl4fFS9pH6Ssf1xWSYVijfBjMOvIy
         hNjxYrr+qfEyTSrAh1ay5aXmeY61N4Q1X6cPr+PUwwChjihShCXNNVWnvMZkPS13YJmx
         VwG4MonA2t7dolh0wJqAXTzpRERFgDRZK6uP0wzp6j1gRQNSMlShOmZb3L3lU2CmYTIE
         lS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7XgklqB8Vn+B2YoCcgc/2VGbqHKZvTCvhUGQR7Kyng=;
        b=eKG+28QqCdge74P1GqRzdOMwWdq4BlyhZLg+C4ystyLMqZ6F362cKua2Nrcvyiuomh
         Y7PX3nXxdYW2oshKsgzKH/twIT9BNrNA5CTK7tbQaczlqqbyH+xkbC9RYs9CIACL1d/C
         xLo08MNKvqOIyOLgW8oHNnYwaWRtavbqCyK7e6BC7DNIvKUXtAR/8o1H6R1TqUCuWZmp
         0v9lj+qPs9DClqxogO95mWwo5ztG2hiaZR48rPafnWbdO2MwnCgralE5UoZ9jhz2zG10
         ikzd+D8gjRnk5sRsCeedBGo+hBy3kug7ahpK2V00IxsdH7fcM4RFu7jFe6WxTwdO0+VD
         7YJQ==
X-Gm-Message-State: AOAM533XajBRmlHfYDmvSMDOqSIBebMTKegQg2hPIoiY9K8PuA5HAtCa
	mp7qV6T+twAWXKMGiH5fF69jEWxyBB4=
X-Google-Smtp-Source: ABdhPJwaet6WvxSmY+LhhHoWOgdBrAHShvs6Eyg13ez8tuJ1nN61/7K0kkxHz7V7v6B8RzBjq7EAVw==
X-Received: by 2002:adf:8006:: with SMTP id 6mr24618832wrk.38.1630307413876;
        Mon, 30 Aug 2021 00:10:13 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id k25sm15397466wrd.42.2021.08.30.00.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 00:10:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: remove lockdep warning
Date: Mon, 30 Aug 2021 09:09:22 +0200
Message-Id: <cover.1630307025.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchseries removes a lockdep warning that turned out to
be a false positive.

All "lockable" queues in the driver are initialized by
a single function. This confuses lockdep which puts all
locks in the same unexistent class.

Fixed it by doing the initalization of queues in place.

Done a small code cleaning and removed the no more
used function.

Tested-on: Lenovo ideapad Miix 300-10IBY

Fabio Aiuto (3):
  staging: rtl8723bs: unwrap initialization of queues
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: remove unused _rtw_init_queue() function

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  3 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  3 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 12 ++++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 15 ++++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 33 ++++++++++++-------
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  6 ++--
 .../staging/rtl8723bs/os_dep/osdep_service.c  |  7 ----
 8 files changed, 52 insertions(+), 33 deletions(-)

-- 
2.20.1

