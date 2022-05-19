Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A62F48
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 21:09:44 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id g16so7650976lja.3
        for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8gYyU3h5xXcUaprA3xNu8bw+7vAf51vN7b/Y2uG8LlE=;
        b=khHNK76O0MdKU5YuZTbfKkZWnkhL8wePXdC+Omz4MZ4jZpm+24Jjk/mEpkAI3cNrNh
         MY1UHKQnguqv2Eho3hH/m/tXxmHU2cMVuNILfsdCMMwfn757BCJOZeNuW1Ms37LTMNpt
         +8YxXL7tjVCIHzqFpSc5obOVQxgQba2Icf8pcICCW/xeIZInC4URJsR26wPf8tJH3uzA
         ahqWMlA2fU7TH2/UHJ8n/7GRptTNi3t4tKY2g5nj79bo43ACTXSL6aVOvRaOuLr5dSu1
         mwLkwyTEetNkPWxTktS5BOXyOATL3H7hS0rnlg/rh+SiRUwxShN+5xF5bIF3TBWwazpE
         22Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8gYyU3h5xXcUaprA3xNu8bw+7vAf51vN7b/Y2uG8LlE=;
        b=iPSkSEommzJDzC86q+4U2wTriDI8iLuMEBxt8u1YAw/5HVtmnadGrcbGnIsSt2hcQX
         PQb+6IboW806nCWwFU2mhFS77BCMAb/heoe5oIBGrBVRnk5duY0E/TadAOgkpNe3w3ho
         S2o2vucIQgH6cpymgd26FCNu7jCqpNq9uQC8m94+oaM+bVnZQfYAHbysMN1oiZqn7yAE
         FSrcFz+JYG8XM4BCHZnmzoyWazw47bAvINngxc/uuAvR6uMdUsU9Q0G8i37m+2vGTxiK
         YY4dlUGNBTozbVVphtDnHRt5xIK/azVs9EeqI81qpTg3sabHLhkyVKmWmX3vsVrmLeoz
         1F5w==
X-Gm-Message-State: AOAM530Q2Tl9TMFyOoHk89J6AryRAuieX4zV0Y5lnS0CT2GcxAfS+4M5
	Ntj9N2JEiId3v6lf8STthRYMAEeqrxKfFA==
X-Google-Smtp-Source: ABdhPJzUeqRfvm32FniVrCo648fPtw5Ofc0h8BH9vqxORMMSDDWPSrcRbfEQG93iSjjd5VJhtT1Pvw==
X-Received: by 2002:a2e:b0ef:0:b0:24f:ddc:cfd1 with SMTP id h15-20020a2eb0ef000000b0024f0ddccfd1mr3651354ljl.519.1652994583038;
        Thu, 19 May 2022 14:09:43 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id y5-20020a197505000000b0047255d21202sm396875lfe.305.2022.05.19.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:09:42 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2 0/4] staging: r8188eu: add error handling of usb read errors
Date: Fri, 20 May 2022 00:09:38 +0300
Message-Id: <cover.1652994483.git.paskripkin@gmail.com>
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
Series is based on top of staging-testing branch and should be
applied after Dan's patch https://lore.kernel.org/linux-staging/YoXS4OaD1oauPvmj@kili/


Changes since v1:
    addresses issues found by Dan and self review. Mostly related to returning
    _FAIL instead of -errno, since callers expect _FAIL/_SUCCESS

v1: https://lore.kernel.org/linux-staging/cover.1652911343.git.paskripkin@gmail.com/


Pavel Skripkin (4):
  staging: r8188eu: add error handling of rtw_read8
  staging: r8188eu: add error handling of rtw_read16
  staging: r8188eu: add error handling of rtw_read32
  MAINTAINERS: add myself as r8188eu reviewer

 MAINTAINERS                                   |   1 +
 drivers/staging/r8188eu/core/rtw_cmd.c        |  15 +-
 drivers/staging/r8188eu/core/rtw_efuse.c      |  33 ++-
 drivers/staging/r8188eu/core/rtw_fw.c         |  72 ++++--
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
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 130 +++++++---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  30 ++-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 240 +++++++++++++++---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  33 ++-
 drivers/staging/r8188eu/include/rtw_io.h      |   6 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  47 +++-
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  19 +-
 21 files changed, 679 insertions(+), 175 deletions(-)

-- 
2.36.1

