Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D776173
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:07 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id f16so2379503qvs.7
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BcD3XeKrvg91MeNcipf4GPVPCVuvU776EyzBAaNx5+Q=;
        b=Dos2KRiMe165B/Nr9CNkUGafaOtwJ3BvWME+t8fT5mu1+xjlWMiHyluv6NLNXpyju5
         7yGHG/xFFKOlVMAfyOcdOUlltSuIm/uA6M7TMMe3chZMVqwX5TxfetBYwXD+xoDAFSQO
         Smf8GkHzscOqHSUF92P6q1hrjN0WiK5WcWCMsGRxPLPpiRYb+nH9JHQlhOur9ppHdLul
         TRU0kXC8sCpu9RqMXQTGu55dBhmI2FV+Aa8saIWCZQB0U1PgMsIqa0lNcGpBkOMMQvO/
         r9JaFYaHNZFIUE/fDCXB9D8S5056qahvxqLwaRWXISdITKC+A2xyMbNFhh6V0QC7KxKC
         wn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BcD3XeKrvg91MeNcipf4GPVPCVuvU776EyzBAaNx5+Q=;
        b=EsEZaWOdYEJSnkQlxbZ15xL76H2s0pFpUooaOySHAFdcS0txmOtvs9N8IIswZ1Ydal
         VR5DV4WercqPenvQIEfqdxyBXMBEW6+Eq4OzQS2ZE7C6tyAcFijGL6nUnroSKpW3UolU
         VVoWrcACQllH/iJW/bLv9PspWLftiV6ZABDrmpqWSPGj+MtX/CiC6iVj8x9428TGrQsf
         i5bn8LNwmDF2IDaCNGkcdTWOBk47w9lsLXuHNT2qvTfuToHK9e3BuH/NIXK+B4zcrKcs
         SQpPdVn2K0n9qQEJMkoR3uaiQLtC6+wYCv/rFNLVCPL4k6lgl0n2FCih60OnUPw319oz
         OCkw==
X-Gm-Message-State: AOAM5327bUlqVE0y/1xgAfNFZjJXlpI98MVH0cIaWIxxOhcnijSY0lIZ
	FQHG3yiInYesQI9XBI35dxMMzg==
X-Google-Smtp-Source: ABdhPJxs/r6pA2FKvdj9zfVm2n1+2vY60gW4Cda6wEnscWne1NBHlxji4yAiFPhT50kqTortHC16lQ==
X-Received: by 2002:a05:6214:5b1:: with SMTP id by17mr2537121qvb.7.1624492146275;
        Wed, 23 Jun 2021 16:49:06 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:05 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/9] staging: rtl8188eu: remove DBG_88E_LEVEL and MSG_88E macros
Date: Thu, 24 Jun 2021 00:48:53 +0100
Message-Id: <20210623234902.7411-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set removes all callers of the DBG_88E_LEVEL and MSG_88E
macros, then removes the macro definitions themselves. This code does
not follow kernel coding conventions/best practices and it is better
to remove it and ultimately rely upon pre-existing kernel debugging
and logging functionality.

With these macros gone, there is only RT_TRACE to go (and the other
definitions in include/rtw_debug.h) and then the file can be entirely
removed.

Phillip Potter (9):
  staging: rtl8188eu: remove all DBG_88E_LEVEL calls from
    os_dep/ioctl_linux.c
  staging: rtl8188eu: remove all DBG_88E_LEVEL calls from
    core/rtw_mlmw_ext.c
  staging: rtl8188eu: remove all DBG_88E_LEVEL calls from
    core/rtw_ioctl_set.c
  staging: rtl8188eu: remove all DBG_88E_LEVEL calls from
    core/rtw_pwrctrl.c
  staging: rtl8188eu: remove all DBG_88E_LEVEL calls from
    core/rtw_xmit.c
  staging: rtl8188eu: remove DBG_88E_LEVEL macro from
    include/rtw_debug.h
  staging: rtl8188eu: remove MSG_88E call from hal/odm.c
  staging: rtl8188eu: remove MSG_88E calls from hal/usb_halinit.c
  staging: rtl8188eu: remove MSG_88E macro from include/rtw_debug.h

 .../staging/rtl8188eu/core/rtw_ioctl_set.c    |  5 -----
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 21 -------------------
 drivers/staging/rtl8188eu/core/rtw_pwrctrl.c  |  9 +-------
 drivers/staging/rtl8188eu/core/rtw_xmit.c     |  2 --
 drivers/staging/rtl8188eu/hal/odm.c           |  1 -
 drivers/staging/rtl8188eu/hal/usb_halinit.c   |  7 -------
 drivers/staging/rtl8188eu/include/rtw_debug.h | 12 -----------
 .../staging/rtl8188eu/os_dep/ioctl_linux.c    |  2 --
 8 files changed, 1 insertion(+), 58 deletions(-)

-- 
2.31.1

