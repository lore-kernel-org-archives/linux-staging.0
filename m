Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85970
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:37:26 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so6147343oth.7
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+AYqAU56uuLxdBlSQMIoaHuTENUKbjs7q2AhKp/GAA=;
        b=H+cnN1lGZC3Lqpoq1JPvwfrhBKJ/H/+h2VuRiT8kwaa6oCMkf1FCdI9oa/1kZ1otSi
         z8YkvP/SZlU8tsV09PzOIqUbM834fCN+0KzGtZj9O+xTow2InaHQD/UJvljl+O5uMU57
         lSKo7VuYQvdijSxULPkvK/SfGbw6rnxoeQcjxg2KkjLPpfgAnwLCDnwrwPBCQAW/TQXO
         JAPgv5q4PBn6Seny1fWQ1kzVCSC1ZqgHCDEFjkzz1sIG9Sz5bL/s/1/LrrQWcLzIkAds
         VlBPIUzrXojPnprnMK71+EnKIQTLYvcuLyOGOX+9gu8PIA43KTticdIu6ty6Xzpt8Q1F
         zZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0+AYqAU56uuLxdBlSQMIoaHuTENUKbjs7q2AhKp/GAA=;
        b=mm2wvOIalWT4u23UHrIZhjnF4lg/GHYsq4PXBrvomZ2+aKm4VqrPuL9Rj4R+0SlCp1
         DLisuzF6Xk9LCcTscNhWRIxlEmWzIOJdarwaDEDk5C7rnkHRHs34vb3C/SlSXtokut/B
         DoOvKDyTuN9vuEQ5tr8b/qZuyT5Gm1ezmHFzlc+beuOoZsAuQXivJbW78+5iKY4LS2fC
         Lv5+8V9Oi/pSllFsuMSeRRW4Hkah+qyBeZ3ayvy7ol2kd/cHkeEUewV+4SvC/Mmhc1s2
         9DhcR8FPFBPK401p4wyTUZRPDEdkuEdhwA1f3cySeNUkdZ6/gCfKlPDxwMYzEgPhzsuQ
         n1iQ==
X-Gm-Message-State: AOAM531S8e5j9zDHIVegBd5df+VW6XhfE4Ghmd0HOmQ1Q6mGk96FsYyD
	cZbfLKMreWHg9jajvYAsQKE=
X-Google-Smtp-Source: ABdhPJya9L60z9ML0olRmv1xTCXD9anpu2Of2vMLzjnixwpRJpO3YarSeAPBjs59rdK6G0elN1OLgQ==
X-Received: by 2002:a9d:1917:: with SMTP id j23mr4754987ota.201.1628188645651;
        Thu, 05 Aug 2021 11:37:25 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1016.res6.spectrum.com. [2603:8090:2005:39b3::1016])
        by smtp.gmail.com with ESMTPSA id q32sm1156726oiw.37.2021.08.05.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 11:37:25 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 0/5] Do more cleanups
Date: Thu,  5 Aug 2021 13:37:12 -0500
Message-Id: <20210805183717.23007-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This collection consists of the previous patches that needed to be
refactored plus the correct way to remove rtw_buf_free().

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>


Larry Finger (5):
  staging: r8188eu: Remove wrappers for kalloc() and kzalloc()
  staging: r8188eu: Remove wrapper around vfree
  staging: r8188eu: Remove all calls to _rtw_spinlock_free()
  staging: r8188eu: Remove more empty routines
  staging: r8188eu: Remove rtw_buf_free()

 drivers/staging/r8188eu/core/rtw_ap.c         |  8 +--
 drivers/staging/r8188eu/core/rtw_br_ext.c     |  2 +-
 drivers/staging/r8188eu/core/rtw_cmd.c        | 14 ++--
 drivers/staging/r8188eu/core/rtw_efuse.c      |  4 +-
 drivers/staging/r8188eu/core/rtw_mlme.c       | 19 ++---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 39 +++++------
 drivers/staging/r8188eu/core/rtw_mp.c         |  5 +-
 drivers/staging/r8188eu/core/rtw_p2p.c        |  8 +--
 drivers/staging/r8188eu/core/rtw_recv.c       | 16 +----
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    | 48 +------------
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c       | 26 ++-----
 drivers/staging/r8188eu/hal/odm_interface.c   |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 10 +--
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |  3 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 10 ---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 70 +++++++++----------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |  3 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  2 -
 .../staging/r8188eu/os_dep/osdep_service.c    | 46 ++----------
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  6 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c   |  2 +-
 24 files changed, 105 insertions(+), 244 deletions(-)

-- 
2.32.0

