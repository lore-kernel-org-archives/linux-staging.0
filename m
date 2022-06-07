Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864B7C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 19:26:02 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id i29so13076613lfp.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COofM4p4XVL9HB7oV/hO48snBSXqaKhyKNYxseRZ7lY=;
        b=G/nza0Fj5r13MS+16/+zxQ6N7QIcMnCbPyyB2FoNYT48p6k8Zbpu1sSpGFr0CJTfbH
         VswbNromqseElL/xO/gEFqDm3627364XoAnLx5K2lu0/J9b/kf9t5ODKTW2oGdKSLLju
         S6vrMJkkpzqHDTDRyl/QzUoRHtecUkDCtAbsXVFnuLKvCk5lEjdPWVKXQ9FTSuw3bIcJ
         HpbdAAqn0XuwrQQEYTfeZO/Wc7HYpB4FVMMPAj4WVnKLPPF1al9SFXh7fXNKryst34EL
         lmKC9VhAf6fnjCHU8jrap9sczA4sULSggG4fX0bL5FtJ5kkKgqS3cvAhbREmA2pwbP2a
         6lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COofM4p4XVL9HB7oV/hO48snBSXqaKhyKNYxseRZ7lY=;
        b=y2RDEVF6yAclfg/4kd4rJ81yeSRyW5LdlEx2PeBtc5PhhihugQTI3IM0ZtVLMBYyfH
         Z60+lGQR2G82MejQWtct9e2oYlI2ZG1mqGQJ7Xu9XI1/mSiigSGUkIg2kJtBv+R8vVi5
         Wrx9OBHVHE9bUxHDseFB+VCj4qrOKWnLyjuAytdtLlZf/xj3Y8lWQ0tgac7OOhxNNJOK
         v8OEIv64MinWdVRhAQbDXx7KdDUwp+31C+I+fIXWejkA+/HJyhTFbxrf5bP6SL2OFLVB
         Y0vOml4g19ZuUMYJz6zIHIpQj8Pd7zKEse2JLnxFihIOOGObV9VqeaDWIcoWt8Equ+pm
         jjxw==
X-Gm-Message-State: AOAM532hTjtol3mEhwAv821KuN8E0ZcTdiSOd31pgj1hzoaJaIjY4TDR
	nahM3uxZf/8RzRgK6vNj85M=
X-Google-Smtp-Source: ABdhPJyKEAxr9oRjbnZ6aJpkt4b5tPhflQzr57mAeLwVZjPfmS7fp/DaRCKqm8By83TLXeK8nIlIaw==
X-Received: by 2002:a05:6512:53a:b0:479:1725:51f2 with SMTP id o26-20020a056512053a00b00479172551f2mr16188235lfc.688.1654629960872;
        Tue, 07 Jun 2022 12:26:00 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id a27-20020a056512201b00b0047900ad3f90sm3401917lfb.29.2022.06.07.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 12:26:00 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 0/4] staging: r8188eu: add error handling of usb read errors 
Date: Tue,  7 Jun 2022 22:25:53 +0300
Message-Id: <cover.1654629778.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

it's reincarnation of my old series for adding sane error handling in
r8818eu.

*Problem*

Old code was returning just stack variable in case of read error. It's
not the best approach, since passing around stack data might cause
device misconfiguration or even kernel data leakage

To solve this I've changed rtw_read{8,16,32} prototypes to return an error via
return value and data via passed pointer. Some work should be done to
propogate an error down to calltrace, but it's good way to at least
start doing sane I/O error handling

Tested locally on qemu with TP-Link TL-WN722N v2/v3 [Realtek RTL8188EUS]
device. More testing is welcomed, of course :)

_NOTE_
Series is based on top of staging-testing branch.

Changes since v3:
    fix build error in 1/4 caused by unused local variable

Changes since v2:
    get rid of `(void)res` and return an error from function instead of
    hiding it

Changes since v1:
    addresses issues found by Dan and self review. Mostly related to returning
    _FAIL instead of -errno, since callers expect _FAIL/_SUCCESS

v1: https://lore.kernel.org/linux-staging/cover.1652911343.git.paskripkin@gmail.com/
v2: https://lore.kernel.org/linux-staging/cover.1652994483.git.paskripkin@gmail.com/
v3: https://lore.kernel.org/linux-staging/cover.1654543286.git.paskripkin@gmail.com/

Pavel Skripkin (4):
  staging: r8188eu: add error handling of rtw_read8
  staging: r8188eu: add error handling of rtw_read16
  staging: r8188eu: add error handling of rtw_read32
  MAINTAINERS: add myself as r8188eu reviewer

 MAINTAINERS                                   |   1 +
 drivers/staging/r8188eu/core/rtw_cmd.c        |  15 +-
 drivers/staging/r8188eu/core/rtw_efuse.c      |  33 ++-
 drivers/staging/r8188eu/core/rtw_fw.c         |  72 +++--
 drivers/staging/r8188eu/core/rtw_led.c        |  16 +-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  62 ++++-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   9 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  20 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  21 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  21 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  27 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 ++-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 136 +++++++---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  30 ++-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 251 +++++++++++++++---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  33 ++-
 drivers/staging/r8188eu/include/rtw_io.h      |   6 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  47 +++-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  19 +-
 21 files changed, 693 insertions(+), 178 deletions(-)

-- 
2.36.1

