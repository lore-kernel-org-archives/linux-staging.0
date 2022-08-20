Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B02F56
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id e21so4294803edc.7
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zxudM2tcPvdpF6lvNkQWPZ2gRI9Z+4KijeRHmXked3o=;
        b=lGuqy5RuA8LlN/SiSPC0Zgm+nIRAWvuxmyWCh+Z7y2RZ4rfhPsIMLB6bAtENbZU69O
         FvRVSaQsFXCsoiPp/aQUN54t2x8DdzgZS2z0a29giaM5xgI6M+m1DYNT02aqmXE7zQhm
         Oqbi3U2igj6+I7yeIQVeZfSE0mj6dC7F9h/dzao0JW/eWWmcXqqgB270gvPDHN+cOef2
         XmT68N9tS77HnK5kgd9bcd1M8eNvlMoEsj30PVvQphg4UfdvifKnSdNGEBsUlPyOa7uj
         nHjJGmKK0OD16DBc6gjJT0EmFKybTvPQzjoU+DsukqBJ6ZfG/qXCJ031vz628yHTSXPG
         EVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zxudM2tcPvdpF6lvNkQWPZ2gRI9Z+4KijeRHmXked3o=;
        b=wM3X9GdXDKE8EqPG7tgW8HOJEAzTajnBJFlwFZg1T2KxwySsw/QI2J5yvKtvQBNuNM
         rMPI4RoV7G9NMIDBU+t+IB6TfMn8p2OanAOD7AMPW3+QrIltR7ebtT0GDr7z4UIRHafo
         CPR2AokPYKYK4N+qvj988TvoyyHwEKUzTfPVGJx+3b2ncXv+BSQpvX6KT5lccxj5ozxY
         O9V/NIeJ3pyzZzqkCOSNdZeNOPZ2rvkm1P50mya8/8xfCjjMOOiphUEnWRbmP4L93Q8U
         fWXgdn4K9N08/t2d7KCu5SxQzpREgLYM8zB+5e+Gmn8kopg7/CtJSe3eDXhd/2f/xGL5
         K8vA==
X-Gm-Message-State: ACgBeo0SujpqtgzVD9eiMEtn4uSXHichTIr55vAGDYmk4s2FkalyCIWz
	JK7M41yk7n/My2Qra7BIIJU=
X-Google-Smtp-Source: AA6agR67n8eYzr+YF+2nu35VSIKhyqXQWQDOmBUTahlwivUqUcAFqFT16f42A/fNTIP1avPdfM6zfQ==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id fe7-20020a056402390700b00431677664e7mr10217794edb.0.1661019396245;
        Sat, 20 Aug 2022 11:16:36 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/19] staging: r8188eu: migrate os_dep/xmit_linux.c
Date: Sat, 20 Aug 2022 20:16:04 +0200
Message-Id: <20220820181623.12497-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the functions, or their functionality, from
os_dep/xmit_linux.c to the core/* part of the driver and finally
removes os_dep/xmit_linux.c and the xmit_osdep.h header.

Tested on x86_64 with Inter-Tech DMG-02.

Please apply this on top of:
[PATCH] staging: r8188eu: remove rtw_endofpktfile()

Thanks,
Michael

Michael Straube (19):
  staging: r8188eu: make rtw_remainder_len() static
  staging: r8188eu: make rtw_os_xmit_schedule() static
  staging: r8188eu: rename rtw_os_xmit_schedule()
  staging: r8188eu: make rtw_os_xmit_resource_alloc() static
  staging: r8188eu: rename rtw_os_xmit_resource_alloc()
  staging: r8188eu: make rtw_os_xmit_resource_free() static
  staging: r8188eu: rename rtw_os_xmit_resource_free()
  staging: r8188eu: make _rtw_open_pktfile() static
  staging: r8188eu: rename _rtw_open_pktfile()
  staging: r8188eu: make _rtw_pktfile_read() static
  staging: r8188eu: rename _rtw_pktfile_read()
  staging: r8188eu: remove unnecessary initialization to zero
  staging: r8188eu: move struct pkt_file to rtw_xmit.h
  staging: r8188eu: move rtw_os_xmit_complete() to rtw_xmit.c
  staging: r8188eu: rename rtw_os_xmit_complete()
  staging: r8188eu: make rtw_os_pkt_complete() static
  staging: r8188eu: rename rtw_os_pkt_complete()
  staging: r8188eu: remove os_dep/xmit_linux.c
  staging: r8188eu: remove xmit_osdep.h

 drivers/staging/r8188eu/Makefile             |   1 -
 drivers/staging/r8188eu/core/rtw_mlme.c      |  23 +-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |   2 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c   |   1 -
 drivers/staging/r8188eu/core/rtw_xmit.c      | 232 +++++++++++++++++--
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c |   4 +-
 drivers/staging/r8188eu/include/rtw_xmit.h   |  16 +-
 drivers/staging/r8188eu/include/xmit_osdep.h |  48 ----
 drivers/staging/r8188eu/os_dep/os_intfs.c    |   7 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c    |   1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 226 ------------------
 11 files changed, 251 insertions(+), 310 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/xmit_osdep.h
 delete mode 100644 drivers/staging/r8188eu/os_dep/xmit_linux.c

-- 
2.37.2

