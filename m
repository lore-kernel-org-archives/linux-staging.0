Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D482564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bh17so12919717ejb.8
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iryodbly7hWSxF2KcHp9s3S3xjPavYjEFSYWyJwJex0=;
        b=KKcV/Buz4A73ob6dE9LrdOVhfmWRWjTzVhH1UcRUQ/DxhvWpgE8iDdVVFglekx+DJ3
         8ze6MXC/PlPWRLN51JXqgSwYcg0vHH3xKBrFcLgvk4CoN0kYN/Q5qTWf3JMZq6PuYOhZ
         VprNKGGt3OIdHTBykMUe/6vgGBoq2JC6BvQfn9s4I22tAOPHvrVFOZQrPyCOzZ4x7K+V
         iMUf6pkuP2I3z7309POjmkj4ZAxyffAxHeIEHXRH8mGgPoKbhGPjzYsYmYN9mTBCcFtu
         wMbuHqyX8ho+lpZdwQO5Vx6au7xe0fBELFZ/h2ngWo7MEHo1oZ1XdP/RJe2T4Muk4lci
         OUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iryodbly7hWSxF2KcHp9s3S3xjPavYjEFSYWyJwJex0=;
        b=rgfXwP4ulK8U3dJer2s0joMqldkeTJuUEOUp/4y5gavgSwViIzslQQ2/TBBO3LsBzc
         Hs0FkFfSsHNJcdWCxai0pkdRJxKeItbovSnVM7vbcLqvlpWUbkqcJZP36AfIUn+gyELq
         6/iyN1vNqF/llvCW563T72ns+/r0CvwnlnCjk9UvBk33OEnV6M0Yz8hRjiAonY6bsYBT
         jjK8YpbOSN08Dvoa6lW1LNI/FspskXm0vSQ8EpFuFp8WwACB2zllrWF3y0W7ronG3EA8
         kgciZcOnUJk52uZ0XogfX5FOdFIyE/3NyXPaOOENg0O1gCumpyyqLS1ZYuQo3CCTHHaq
         I8bg==
X-Gm-Message-State: AOAM531fEjNQsIhQOLHwWGCDYoSrVEz5Cig+KhS5UyB3Wy6OPkmYKXT9
	DPxrId1MhUfrajNfIG9VBnQ=
X-Google-Smtp-Source: ABdhPJyHaNrp1jjFDEs1meOdh9ln+yMcVNcVUC+B3c9ThrEOAVW+Mf4cnMYxjO+irnJhXPZN5+3a7A==
X-Received: by 2002:a17:907:8693:b0:6e7:f5f4:c4d5 with SMTP id qa19-20020a170907869300b006e7f5f4c4d5mr14423085ejc.640.1649359703188;
        Thu, 07 Apr 2022 12:28:23 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: r8188eu: some simple cleanups
Date: Thu,  7 Apr 2022 21:28:11 +0200
Message-Id: <20220407192819.10661-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some simple cleanups. Most of them are removing unused macros,
structures, etc. from header files.

Michael Straube (8):
  staging: r8188eu: remove unused macros from basic_types.h
  staging: r8188eu: move struct rt_firmware to rtw_fw.h
  staging: r8188eu: ROMVer is always zero
  staging: r8188eu: remove unused fields from struct eeprom_priv
  staging: r8188eu: remove unused enums from odm.h
  staging: r8188eu: remove unused prototype usbvendorrequest()
  staging: r8188eu: remove header usb_vendor_req.h
  staging: r8188eu: clean up rtw_ioctl.h

 drivers/staging/r8188eu/hal/hal_com.c         |  2 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  1 -
 drivers/staging/r8188eu/include/HalVerDef.h   |  1 -
 drivers/staging/r8188eu/include/basic_types.h | 73 +----------------
 drivers/staging/r8188eu/include/drv_types.h   |  6 +-
 drivers/staging/r8188eu/include/odm.h         | 29 -------
 drivers/staging/r8188eu/include/rtw_eeprom.h  |  3 -
 drivers/staging/r8188eu/include/rtw_fw.h      |  5 ++
 drivers/staging/r8188eu/include/rtw_ioctl.h   | 79 -------------------
 drivers/staging/r8188eu/include/usb_osintf.h  |  4 -
 .../staging/r8188eu/include/usb_vendor_req.h  | 35 --------
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  1 -
 12 files changed, 8 insertions(+), 231 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/usb_vendor_req.h

-- 
2.35.1

