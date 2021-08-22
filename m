Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E773FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 14:35:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y34so32036872lfa.8
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PwGYchbluTL/Rr9Br9K/KBCWqoTo7qNfUvW33GFs/0c=;
        b=VGvPzdShKdBQiKQY9zD6gpq7KzRdfQ2f5/TaNPZXr3yjeNbwJ45X4P5EoIO5kciMX4
         vRQYy+h9uWhVXRqanof6Db6c1qkb9j/78RxMkJ60h+4YOSTYT46JLQjsBxWLKcM6VpDo
         JUWF/O/452ijPzbfxNx2auDMR7ZXXtwGWz/CExryRxzqQYaO/D0afYED1eDamiwlhYG8
         Hs7LMYjoz0qH/le3MSPGvFBWS37iJJ3cpshIwgNyeha/jBccamh0slOjyRXcZbTclt+l
         OB2HJNPuvE2T1gdwmhXaCaYGqNTlfwpGsKbq8gsI3OY7VF0LxWg4IMTE2+htsTfKkBQC
         rM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PwGYchbluTL/Rr9Br9K/KBCWqoTo7qNfUvW33GFs/0c=;
        b=o+WstC2wcM6AyeuENAb1VgGM+vJ371WiFN/2R1etUouEJYxFaPnsltjqjKouuF0/Kk
         5rgAprI+dA2TokdYIvskg8EvYUQJlqloAhWT0jlVc8YxIARRpsPq2srz/3eyutJbzOte
         S33O6Y2T2tQ/gvqdnOPYHW245xyNgVLhSUR+dOm8FHCFHpVwDea24G4f33snlRUXauyj
         OuZFEPLIRNqpV/tHneiSUPRmrVEdAlDtjnHTdhkrs2JgljN7OZqjH2Nce36JuojZ26Ot
         tcPLrdsArwkO4VuBkB82J8QKVZXFTC5iTz6zN4BZBcKUFosIcLVuMmXVRWIolYxHbjIK
         A5kw==
X-Gm-Message-State: AOAM5339cADS102Zwl7DCleb/KcpAw57mpVIFQ1VxVbtzM7WR8UvWy7k
	Stb4VWFaCE5JS8pa+0N2WU0=
X-Google-Smtp-Source: ABdhPJw3AP3vBo5MFlZTq5EldHh5XUCerXexdGTstNkseXTKontATGYDg212fkAxA89RmWxvCaI9sg==
X-Received: by 2002:a19:4958:: with SMTP id l24mr21230787lfj.48.1629642921651;
        Sun, 22 Aug 2021 07:35:21 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id o28sm1208965lfg.238.2021.08.22.07.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 07:35:21 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH RFC v2 0/6] staging: r8188eu: avoid uninit value bugs
Date: Sun, 22 Aug 2021 17:35:05 +0300
Message-Id: <cover.1629642658.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
References: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Greg, Larry and Phillip!

I noticed, that new staging driver was added like 3 weeks ago and I decided
to look at the code, because drivers in staging directory are always buggy.

The first thing I noticed is *no one* was checking read operations result, but
it can fail and driver may start writing random stack values into registers. It
can cause driver misbehavior or device misbehavior.

To avoid this type of bugs, i've changed rtw_read* API. Now all rtw_read
funtions return an error, when something went wrong with usb transfer.

It helps callers to break/return earlier and don't write random values to
registers or to rely on random values.

Why is this pacth series RFC?
  1. I don't have this device and I cannot test these changes.
  2. I don't know how to handle errors in each particular case. For now, function
     just returns or returns an error. That's all. I hope, driver maintainers will
     help with these bits.
  3. I guess, I handled not all uninit value bugs here. I hope, I fixed
     at least half of them


v1 -> v2:
  1. Make rtw_read*() return an error instead of initializing pointer to error
  2. Split one huge patch to smaller ones for each rtw_read{8,16,32} function
     changes
  3. Add new macro for printing register values (It helps to not copy-paste error
     handling)
  4. Removed {read,write}_macreg (Suggested by Phillip)
  5. Rebased on top of staging-next
  6. Cleaned checkpatch errors and warnings

Only build-tested, since I don't have device with r8118eu chip

Pavel Skripkin (6):
  staging: r8188eu: remove {read,write}_macreg
  staging: r8188eu: add helper macro for printing registers
  staging: r8188eu: add error handling of rtw_read8
  staging: r8188eu: add error handling of rtw_read16
  staging: r8188eu: add error handling of rtw_read32
  staging: r8188eu: make ReadEFuse return an int

 drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
 drivers/staging/r8188eu/core/rtw_efuse.c      | 125 +++--
 drivers/staging/r8188eu/core/rtw_io.c         |  27 +-
 drivers/staging/r8188eu/core/rtw_mp.c         |  70 ++-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  13 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   5 +-
 drivers/staging/r8188eu/core/rtw_sreset.c     |   9 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |   8 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  21 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
 drivers/staging/r8188eu/hal/hal_com.c         |  23 +-
 drivers/staging/r8188eu/hal/hal_intf.c        |   6 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  33 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 285 +++++++++---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  27 +-
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  22 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  18 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 439 +++++++++++++++---
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  57 ++-
 drivers/staging/r8188eu/include/hal_intf.h    |   6 +-
 .../staging/r8188eu/include/odm_interface.h   |   6 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   2 +-
 drivers/staging/r8188eu/include/rtw_debug.h   |  13 +
 drivers/staging/r8188eu/include/rtw_efuse.h   |   4 +-
 drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
 drivers/staging/r8188eu/include/rtw_mp.h      |   2 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 179 +++++--
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   3 +-
 30 files changed, 1138 insertions(+), 389 deletions(-)

-- 
2.32.0

