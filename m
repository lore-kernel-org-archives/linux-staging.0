Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB14B3FC5
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:10:23 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hx25so40155ejc.6
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W9vZwmlkrDBjvEWyCMDm/dnLCct5DvZtNMR1EOH464M=;
        b=O+XyRFkRhNILNdeUWZgUoamaUVDiY4Van3n3NvBFXRPsO/RNK3cBvycVR5kV5P4A1C
         0LIVBpLG6/ihvlIP+w3eaB9judjq+TEFuK+e8Ld04dr7PdMqwJeYqxlcpeBmELzGYYj3
         msFdvvAbG6wrDaEtX6A09Cq14sX6lTccRUb7ptWguk8/yt/q1G4UqP5i7Ilv5L1hQSdz
         eBJ5W5I+U5EP6JGKSDWgorAJIoLGcvoUdK2nRYgg1THK1ndbLcy8Alb/CAzpdRe6bcTp
         Su2UjZJskkUVZwcjwOKg2lzX8/lTY5SIGD0BJZmPMVO5koGfBlmDeGqEDS2FuWwQJ7eb
         f2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W9vZwmlkrDBjvEWyCMDm/dnLCct5DvZtNMR1EOH464M=;
        b=lEzkkCD3Nt5ls61eSk278UhmpAOY2qdeoeoOYNXcXw+w0eTSQiSwOH8q5sWFiCwGPv
         mMk4f84us+e9KgdXkrf1K2q0tTR2oQmD+vylUSyUGs4SeWhvTTn7ARDcqSqqJzabzLx7
         Ysu3FH8m6pyEfgwhF6gBgxrn3/J45gGN44yiCnbnB0jc1fqg0D9GXWg+s321TkHdw0A/
         OzT92tUrGjNmWfUqtkP9MYk4Rniv07ZfbmMhdvW76WUeDGeg+Y7FGBgN16neeDz4+E09
         u1L4PtJViiHCTeygl6d5b/4ddxZF20yyTAl0206nkjzN0q65u1zuiG760bGQQXokdaJh
         PckA==
X-Gm-Message-State: AOAM531t9Nhu+CLR42LNEf7mDoZM1kFERhYCVY+urh2dp9e+fheLRD6u
	/2GkocE62Wqqb9S69l2DWFep84iFMPE=
X-Google-Smtp-Source: ABdhPJyCAxJTcYtbPJOTf3H833YeEg4AAyF8nk4KVRiBXBpuEs0lBnPEOJJafFv4DQ5K4SAMD/8W5A==
X-Received: by 2002:a17:906:2bc7:: with SMTP id n7mr13605981ejg.238.1631556622092;
        Mon, 13 Sep 2021 11:10:22 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id d25sm4258999edt.33.2021.09.13.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:10:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 00/18] staging: r8188eu: Shorten and simplify calls chain
Date: Mon, 13 Sep 2021 20:09:44 +0200
Message-Id: <20210913181002.16651-1-fmdefrancesco@gmail.com>
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

Fabio M. De Francesco (4):
  staging: r8188eu: hal: Clean up usbctrl_vendorreq()
  staging: r8188eu: hal: Clean up rtw_read*() and rtw_write*()
  staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
  staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()

Pavel Skripkin (14):
  staging: r8188eu: remove usb_{read,write}_mem
  staging: r8188eu: remove the helpers of rtw_read8()
  staging: r8188eu: remove the helpers of rtw_read16()
  staging: r8188eu: remove the helpers of rtw_read32()
  staging: r8188eu: remove the helpers of usb_write8
  staging: r8188eu: remove the helpers of usb_write16
  staging: r8188eu: remove the helpers of usb_write32
  staging: r8188eu: remove the helpers of usb_writeN
  staging: r8188eu: remove the helpers of usb_read_port
  staging: r8188eu: remove the helpers of usb_write_port
  staging: r8188eu: remove the helpers of usb_read_port_cancel
  staging: r8188eu: remove the helpers of usb_write_port_cancel
  staging: r8188eu: remove core/rtw_io.c
  staging: remove struct _io_ops

 drivers/staging/r8188eu/Makefile              |   1 -
 drivers/staging/r8188eu/core/rtw_io.c         | 299 ------------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 250 ++++++++-------
 drivers/staging/r8188eu/include/rtw_io.h      |  89 +-----
 drivers/staging/r8188eu/include/usb_ops.h     |   2 -
 .../staging/r8188eu/include/usb_ops_linux.h   |   8 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   8 +-
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  20 +-
 9 files changed, 157 insertions(+), 526 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_io.c

-- 
2.33.0

