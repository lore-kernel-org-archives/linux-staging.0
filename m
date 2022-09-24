Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE87B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:02:55 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id hy2so7121019ejc.8
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=wfUcmKhPkbst2bNR+/Z5KGtnzdZkiA1TNUkahMWEMN4=;
        b=ZkqWTcZTnyxSeY69RGtWJAw+Q9kCPpB7+VjeCnqKyrIYTI2ApZ/jb8HLzcov9GykTR
         VP4kU+V+NPWR6j66h7vkEsEBAoLIBmg7KePBWNwBikVJq+AEhJ7o1u/MDQu1gWy00Yca
         1dEHMzpZIxnAKbcJcAdPKsG4AnzJ3BnaiFPZyPafiRSaXK9H19x+v0zDTtxLAd9p4ytQ
         cOyh9AiIOnkahLXocj7LCBO4MW8t5xhg2nFu90qpNhLcCayf2peU+Ux6/WEbyj0lWCNR
         e3r+jqLl9QgWh4TaquJYG+x+yxM8FXKZcJwQUlV1OJYf5UKf2/CJy61GyECE415weijN
         +5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wfUcmKhPkbst2bNR+/Z5KGtnzdZkiA1TNUkahMWEMN4=;
        b=O9TL0xSl6XoaGOU4fu97bLsgIJ5NUEl5PqX+d50NReDP9KnWhXlnvR0jMguflSIjw+
         FvJoTPcl0X8WKEVUX+LDNCGiM7NQLYyCNX1hHtqehywcegbmOizIw1sY14ovaRRio6WD
         fFLXzAG6cnphKLFzoMK5xiwIq03Fu4/LwPm5PD1gZB3Bi3mwlsE0s3ljuwIrowyCLNhE
         N63URhS/ZN3jphXliw1hP/KfXJWNVbp+oVwAHv8fEKtQWL3cqB0j4F3Fx7oe0gSV70Lj
         oveoAzCarmOJ7E3BS4gMMLrVQXOCegelNwhnhuuYsKmC8piik24+AiRum0MzODZUEb5i
         z2lw==
X-Gm-Message-State: ACrzQf1z0Y/jxgXB97XPMNJUOQG4X6e3q9fdVLSBnrWD3MUUBdexqSZt
	bgU7kVnAJHCbVSJ9EJ5T+yo=
X-Google-Smtp-Source: AMsMyM5MyIZsvbH0u2xCWze2Fr1Ch4ioI6wowdE96K7iApBqKhftZLXPM7n7kJNfndD9IgXiS8544A==
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id be8-20020a1709070a4800b0077c51b05aebmr12660139ejc.61.1664056973990;
        Sat, 24 Sep 2022 15:02:53 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id ee35-20020a056402292300b004570cbdb38csm1479945edb.96.2022.09.24.15.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:02:53 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:02:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Rename and remove variables in
 rtl819x_HTProc.c
Message-ID: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename and remove variables to avoid CamelCase which is not accepted by
checkpatch.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (10):
  staging: rtl8192e: Rename eRFPowerState, eRfOff and eRfOn
  staging: rtl8192e: Rename eRfSleep, eRfPowerStateToSet and RfOffReason
  staging: rtl8192e: Rename dot11Cur..., bCurTxBW40MHz and
    bCurrentRT2...
  staging: rtl8192e: Rename bSwBwInPro..., bRegRT2RTAg... and
    bCurrentRT...
  staging: rtl8192e: Rename szRT2RTAggBuffer, bRegRxRe... and
    bCurRxReo...
  staging: rtl8192e: Rename RxRe...WinSize, RxReorder... and
    RxReorderDr...
  staging: rtl8192e: Rename PeerMimoPs, IOTAction and IOTRaFunc
  staging: rtl8192e: Rename SelfMimoPs, CurrentOpMode and bForcedShortGI
  staging: rtl8192e: Rename CurrentMPDU..., ForcedAMPDU... and
    ForcedMPDU...
  staging: rtl8192e: Remove unused variables ForcedAMSDUMaxSize, ...

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  24 ++--
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  28 ++--
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |   2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |   8 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  56 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |   2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  28 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_pm.c    |   4 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  24 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  16 +--
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |   4 +-
 drivers/staging/rtl8192e/rtl819x_HT.h         |  53 +++-----
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 120 +++++++++---------
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |   2 +-
 drivers/staging/rtl8192e/rtllib.h             |  10 +-
 drivers/staging/rtl8192e/rtllib_rx.c          |  10 +-
 drivers/staging/rtl8192e/rtllib_softmac.c     |  32 ++---
 drivers/staging/rtl8192e/rtllib_tx.c          |  22 ++--
 18 files changed, 215 insertions(+), 230 deletions(-)

-- 
2.37.3

