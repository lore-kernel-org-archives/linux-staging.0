Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A5259E
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 10:01:47 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f8so926278edd.11
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgR6eBkPH1N3b2kMo1NenojBzQbPmoeGNNkcW0tcO3Q=;
        b=c4uiGenEROW/33JFGMviN5Yo6XpyRXGRc7txx+97Osuz3CdwfT8RiLp/LmnEzdokw+
         9m9CO0RET8dbNJ7OLJY8pol368NKOjY+XeqyKsz4lkcuV+sBip5VXWCnnHX0gI8WgJUo
         lx2Eys2jOVbeI7IBbkhtISi19z5CE5Vd2x9DMjC4RZRPpbvfY+Df1TSWTO9BpLuB50wU
         LbOvWT2PjhPJP4H9DvonCd2DHrDHrjX/NX4IC/FRJ4YQ5aDmmyXJz7Tk0pU1cIzUcfdg
         Bt33ooB21cYbG9sbXIcGOR+7ih9bREFIQz5ke8C6hHkKmbnp+xpGnap5UBrWh5cwaTPt
         y7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgR6eBkPH1N3b2kMo1NenojBzQbPmoeGNNkcW0tcO3Q=;
        b=HD07ltcT6ZkR5HmP4MOj7ZzWbAemHyOK/rH2KgWrPiQkqBVQLFxTt4rYcR9fvDDp7A
         87UE9ITPC39eKL/EMrDB3gmFwb48rtFt8jOW0b9RI58I27zC4kx/oSgPaFVfFynxH+r0
         HGx6hKTuFE0/ysNv305hEk524eSJbKPbPRzoY3bkNozYftZ88E/JenAx0CHkL49EASFZ
         1AngP9OGpIJxXHsAaHxG2WFWIu+cNxUqlFOmLjEBQLX2agjn8un5vilkfCVQN3ZdsdTH
         bdaSDPTx9mx6VPAb4pawyHOtLD2MjQnk3ZJ+KlVc4qKkLoseWDdGrryz6wt7v+m6OADV
         bq1g==
X-Gm-Message-State: AOAM532UMMdzkWCZZe/cqgAp/tp/rwTAEkzak/slkzuCATe+LoTkJJ14
	LOFd1/xXa14/GsIAcA9QSxA=
X-Google-Smtp-Source: ABdhPJzToUxZvFo+v9qOwXHEJQ6zBDAA4MX5SPMeisOunhDidlO0ekNdGunsfDJPkvGMUTB5T7TLoQ==
X-Received: by 2002:aa7:c71a:: with SMTP id i26mr1705111edq.281.1617357706011;
        Fri, 02 Apr 2021 03:01:46 -0700 (PDT)
Received: from agape ([5.171.72.128])
        by smtp.gmail.com with ESMTPSA id hy13sm3932350ejc.32.2021.04.02.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:01:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 00/16] staging: rtl8723bs: remove RT_TRACE logs in core/*
Date: Fri,  2 Apr 2021 12:01:20 +0200
Message-Id: <cover.1617356821.git.fabioaiuto83@gmail.com>
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

Fabio Aiuto (16):
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_xmit.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_security.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_eeprom.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_pwrctrl.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_cmd.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_mlme.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme.c
  staging: rtl8723bs: tidy up some error handling
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_mlme_ext.c
  staging: rtl8723bs: remove commented RT_TRACE calls in core/rtw_recv.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_recv.c
  staging: rtl8723bs: remove commented RT_TRACE call in
    core/rtw_ioctl_set.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ioctl_set.c
  staging: rtl8723bs: remove all RT_TRACE logs in core/rtw_wlan_util.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_sta_mgt.c
  staging: rtl8723bs: remove RT_TRACE logs in core/rtw_ieee80211.c

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  53 +------
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   |  56 +++----
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  90 ++---------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  79 +---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 124 +++------------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  39 +----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  60 +------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 147 +-----------------
 drivers/staging/rtl8723bs/core/rtw_security.c |  41 +----
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  25 ---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  26 +---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  82 +---------
 12 files changed, 104 insertions(+), 718 deletions(-)

-- 
2.20.1

