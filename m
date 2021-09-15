Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93546D18
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 21:11:18 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v5so8454922edc.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oY3HGbrOF2mt1BGRMipDyincASpxkHi2fa1P9CCKn98=;
        b=UWhHDP4TFkZlolbythk/tC1BCOEUC0tdeXllzWskzXnrW45nyHs79dEbOBWrqE5EA2
         hdTk3SPt/NdXmwbLl92AmXLnSJz7egRBNOS5uX5jUb3ugH/ED84Tv7YbT07QK4HdhVc/
         xUc+JcacGgHOEa/2cGorLkqgeMM8Xm1GkgwGnL6RA9h+u++EyH5XF250xpT81TjDSqSS
         fHzq0xDPMCnOn1EPHFWA0p2uzYpnhJaaC3KEos3qdb0ZiWXLXj4J8Nig5W1NlkJEXB/3
         pISVwXA+7Y8nuOYEtatp4bKiHWMc4a1r7XOGF+mm6wd/6ps8EX7dQu1SdGzKBmNp9ewj
         7iGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oY3HGbrOF2mt1BGRMipDyincASpxkHi2fa1P9CCKn98=;
        b=g5VwPwRmwn4/zPr0tjJ1oRkfscs2AhbywZUJGm7pMBmfQgKc6fNJ6s3Oxc08ascqVd
         kmYP5P+fp9SIW/TwoUx8QC3A06TcvA0y6/fCWJD5CPyXb2mtbZ94zSBbLsF7goiKycBk
         f+mmRidZAjE3U4C+3qQG1zHYexBuvK4a0qmJyKaryrwtqQfBQOdcjFIKz5/1vzUGnZY4
         eXUMok6SP/peDaOduwTNr15RB/eULkuBYOn8x1cpDDuMjXzRwPzV0iqqI5XqvA8x3If/
         kRWOcdUC7aG21hTijpPts07VKThu4bwDimQGF69LQcAG1GjWvMkWUfFTni2T3qDSBrv4
         381A==
X-Gm-Message-State: AOAM532L+P9mGebWUseBSi+milpbPGQaSL6Z3BL2sH61i8yrrLdcdcSf
	u0IUGFY33WLuUvNQi6u5lnU=
X-Google-Smtp-Source: ABdhPJzmjbd+2afGOT5gExnCyvOaVzU0/g0nY52JsN3kLUH5lDNbWhvMPeTuYaWo/Q81yPPPtDX8pA==
X-Received: by 2002:a05:6402:14c3:: with SMTP id f3mr2295146edx.312.1631740276984;
        Wed, 15 Sep 2021 14:11:16 -0700 (PDT)
Received: from localhost.localdomain (host-95-235-105-169.retail.telecomitalia.it. [95.235.105.169])
        by smtp.gmail.com with ESMTPSA id t3sm511618edt.61.2021.09.15.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v6 00/19] staging: r8188eu: Shorten and simplify calls chains
Date: Wed, 15 Sep 2021 23:10:44 +0200
Message-Id: <20210915211103.18001-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_ops abstraction is useless in this driver, since there is only one ops
registration. Without io_ops we can get rid of indirect calls mess and
shorten the calls chain.

Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
For this purpose unify the three usb_read8/16/32 into the new
usb_read(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_read() and use in it the new
usb_control_msg_recv() API of USB Core.

Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
For this purpose unify the four usb_write8/16/32/N() into the new
usb_write(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_write() and use in it the new
usb_control_msg_send() API of USB Core.

The code with the modifications was thoroughly tested by Pavel Skripkin
using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS] and by Fabio M.
De Francesco using a ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].

Changelog:

v5->v6:
	- 1-14:
		Minimal changes to patch subjects to achieve consistent
		style;
	- 15:
		Fix a mistake in the checks of values returned by
		usb_control_msg();
	- 16-19:
		No changes.

v4->v5:
        - 1-14:
                No changes;
        - 15-16:
                Fix minor formatting issues and use "Reverse Xmas Tree" style,
                according to suggestions by David Laight and Dan Carpenter;
        - 17-18:
                Pavel Skripkin found logical errors in the checks of the
                values returned by usb_control_msg_{recv,send}(), so fix them;
                Dan Carpenter suggested to do error handling before success
                handling, so change the code accordingly;
        - 19:
                Add this patch in order to get rid of the shared buffer in
                usb_read() and usb_write() and remove this field from struct
                "dvobj_priv".

v3->v4:
        - 1-14:
                Split a patch into fourteen;
        - 15-16:
                Add these patches for clean-ups of the code that is going to be
                reused in 17-18/18;
        - 17-18:
                Make some changes according to a first review of Greg
                Kroah-Hartman; furthermore, remove the unnecessary while loop
                and a couple of if' test; handle the errors returned by
                usb_control_msg_recv().

v2->v3:
        - 1-2:
                No changes;
        - 3:
                Fix the version number of the patch.

v1->v2:
        - 1-2:
                No changes;
        - 3:
                Replace parameter REALTEK_USB_VENQT_READ with REALTEK_USB_VENQT_WRITE
                in usb_control_msg_send().

v1: https://lore.kernel.org/lkml/20210904150447.14659-1-fmdefrancesco@gmail.com/
v2: https://lore.kernel.org/lkml/20210904212719.11426-1-fmdefrancesco@gmail.com/
v3: https://lore.kernel.org/lkml/20210904220048.12822-1-fmdefrancesco@gmail.com/
v4: https://lore.kernel.org/lkml/20210913181002.16651-1-fmdefrancesco@gmail.com/
v5: https://lore.kernel.org/lkml/20210915124149.27543-1-fmdefrancesco@gmail.com/

Fabio M. De Francesco (4):
  staging: r8188eu: Clean up usbctrl_vendorreq()
  staging: r8188eu: Clean up rtw_read8/16/32() and rtw_write8/16/32/N()
  staging: r8188eu: Shorten calls chains of rtw_read8/16/32()
  staging: r8188eu: Shorten calls chains of rtw_write8/16/32/N()

Pavel Skripkin (15):
  staging: r8188eu: remove usb_{read,write}_mem()
  staging: r8188eu: remove the helpers of rtw_read8()
  staging: r8188eu: remove the helpers of rtw_read16()
  staging: r8188eu: remove the helpers of rtw_read32()
  staging: r8188eu: remove the helpers of usb_write8()
  staging: r8188eu: remove the helpers of usb_write16()
  staging: r8188eu: remove the helpers of usb_write32()
  staging: r8188eu: remove the helpers of usb_writeN()
  staging: r8188eu: remove the helpers of usb_read_port()
  staging: r8188eu: remove the helpers of usb_write_port()
  staging: r8188eu: remove the helpers of usb_read_port_cancel()
  staging: r8188eu: remove the helpers of usb_write_port_cancel()
  staging: r8188eu: remove core/rtw_io.c
  staging: remove struct _io_ops
  staging: r8188eu: remove shared buffer for usb requests

 drivers/staging/r8188eu/Makefile              |   1 -
 drivers/staging/r8188eu/core/rtw_io.c         | 299 ------------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 261 ++++++++-------
 drivers/staging/r8188eu/include/drv_types.h   |   5 -
 drivers/staging/r8188eu/include/rtw_io.h      |  89 +-----
 drivers/staging/r8188eu/include/usb_ops.h     |   2 -
 .../staging/r8188eu/include/usb_ops_linux.h   |   8 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  37 +--
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  20 +-
 10 files changed, 166 insertions(+), 562 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_io.c

-- 
2.33.0

