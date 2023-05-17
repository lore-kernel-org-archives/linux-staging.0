Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F379C2
	for <linux-staging@lists.linux.dev>; Wed, 17 May 2023 09:04:25 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so11651245b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 17 May 2023 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684314265; x=1686906265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUc9lLyQf9aYyptLyeJxPh8/DrRPyUTIKLEQWo2K660=;
        b=gWpAkc30PAltN16lMMGe/QdWYtflp+TNoc9wLhhlvuyRMh95vJHLeNitm0cux8JNrk
         Fiq22vC3d7xcmx/YyjCXRChg1/RW5m9wDhDq3NOW6NV3vm0c5oP7GoUtMe+G/szO9qqC
         7pJyhGT/LwV9aNDLvqC044uhivYJJdu03L172XlUDpuSUN1dGFsxp5e8MUWKG3A7zEen
         oMRPdXY3P4DSL6Do+5X55DzWqZCUBjbt3gHzHgr2Y7+Oq80N/4w9SwZbpEFjTx6yL6pY
         PpnlUCFbagYn5kYcU9X3cUsJHuJlGc5mt+BVfuJMFO5xLY8mODplaFecZg6aSmcd6qrW
         uWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684314265; x=1686906265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUc9lLyQf9aYyptLyeJxPh8/DrRPyUTIKLEQWo2K660=;
        b=JHaTf45mLKed77OJ9z/MTwJvT5jw6NuFU+Lkv7Lg+D682nhI2QBH5EqXDeRdW+uOOn
         XN2FSYwx4yfOxaKw/hhJQM2CG7G/mw/CAjCfgijIX1MpnDvAOIQ+WqsSMmuTCaKMlXW6
         6uqnGjbCHVwcAwNlo5FX8cHBmVaAZF5u3R7JJD9Mo6NdJlltb/SrLgfBLBK1XLKOCXWs
         0YHe5UyTnbKYEQnF3TFIACQVpvFkN0HmrFxJtAsRBi8GXowzPpAyKXGsj9+uuSQ1C9vS
         4K3NRVoPmWsEk0A93mYNGLuLQIpuJL/OkMjuFKqnhmU5KyYNk6QABXtsFI2jp7YRCz5n
         aI5Q==
X-Gm-Message-State: AC+VfDz2FrluneOaoTyx6bMuCjTFSkN4EhhVNGgrEt17o+l2QFFWPnqR
	vFcf2Ai6O1Zh8e3bYr/IsGU=
X-Google-Smtp-Source: ACHHUZ4vOR3QupHmVVCmEb7VZ6m1AwAtAzZWR1FTc4fwfDIGRvCLCchZAUDCQRRue42UiQoVz2tXvw==
X-Received: by 2002:a17:90a:d389:b0:24e:3752:194f with SMTP id q9-20020a17090ad38900b0024e3752194fmr1833153pju.21.1684314264609;
        Wed, 17 May 2023 02:04:24 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-22.three.co.id. [180.214.233.22])
        by smtp.gmail.com with ESMTPSA id n3-20020a17090a2c8300b00252b3328ad8sm1115266pjd.0.2023.05.17.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 02:04:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B1C9510627B; Wed, 17 May 2023 16:04:20 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Cc: David Airlie <airlied@redhat.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak R Varma <drv@mailo.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <simon.horman@corigine.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Archana <craechal@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v3 0/4] Treewide GPL SPDX conversion and cleanup (in response to Didi's GPL full name fixes) - miscellaneous 
Date: Wed, 17 May 2023 16:04:14 +0700
Message-Id: <20230517090418.1093091-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3160; i=bagasdotme@gmail.com; h=from:subject; bh=dZDNhhPGFvHolPMmiGh5wOVtV6NNAujS6dpd28Nzfo4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkpM3pkjzAXL//d/SQ+U+Ozkln3wsN7F188LijS6ffA7 //9OXqxHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZiIWB0jw83GshU8V6a28329 c/ngXZ8XqYauzfvqfq3eLhu1P9FQOYjhf0ZEfe677uYeBaPyRdOqpOJP+Mxf3FLO6DCt3VlD+KE vOwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

This is a v3 reroll of my SPDX conversion series (v2 is in [1]), targeting
spdx tree. Several subsystem-specific patches are split and sent as separate
series instead:

1) Networking (bonding, 8390, i825xx) - already merged [2]
2) PCMCIA [3]
3) Watchdog drivers [4]
4) UDF file system [5]

The rest is in this series. 

See [1] for the original cover letter.

[1]: https://lore.kernel.org/linux-spdx/20230512100620.36807-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/all/20230515060714.621952-1-bagasdotme@gmail.com/
[3]: https://lore.kernel.org/all/20230517061338.1081810-1-bagasdotme@gmail.com/
[4]: https://lore.kernel.org/all/20230517072140.1086660-1-bagasdotme@gmail.com/
[5]: https://lore.kernel.org/all/20230517083344.1090863-1-bagasdotme@gmail.com/

Bagas Sanjaya (4):
  agp/amd64: Remove GPL distribution notice
  mISDN: Replace GPL notice boilerplate with SPDX identifier
  drivers: staging: wlan-ng: Remove GPL/MPL boilerplate
  include: synclink: Replace GPL license notice with SPDX identifier

 drivers/char/agp/amd64-agp.c               |  1 -
 drivers/isdn/mISDN/dsp_audio.c             |  4 +---
 drivers/isdn/mISDN/dsp_blowfish.c          |  4 +---
 drivers/isdn/mISDN/dsp_cmx.c               |  4 +---
 drivers/isdn/mISDN/dsp_core.c              |  3 +--
 drivers/isdn/mISDN/dsp_dtmf.c              |  4 +---
 drivers/isdn/mISDN/dsp_tones.c             |  4 +---
 drivers/staging/wlan-ng/hfa384x.h          | 21 ---------------------
 drivers/staging/wlan-ng/hfa384x_usb.c      | 21 ---------------------
 drivers/staging/wlan-ng/p80211conv.c       | 21 ---------------------
 drivers/staging/wlan-ng/p80211conv.h       | 21 ---------------------
 drivers/staging/wlan-ng/p80211hdr.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211ioctl.h      | 21 ---------------------
 drivers/staging/wlan-ng/p80211metadef.h    | 21 ---------------------
 drivers/staging/wlan-ng/p80211metastruct.h | 21 ---------------------
 drivers/staging/wlan-ng/p80211mgmt.h       | 21 ---------------------
 drivers/staging/wlan-ng/p80211msg.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211netdev.c     | 21 ---------------------
 drivers/staging/wlan-ng/p80211netdev.h     | 21 ---------------------
 drivers/staging/wlan-ng/p80211req.c        | 21 ---------------------
 drivers/staging/wlan-ng/p80211req.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211types.h      | 21 ---------------------
 drivers/staging/wlan-ng/p80211wep.c        | 21 ---------------------
 drivers/staging/wlan-ng/prism2fw.c         | 21 ---------------------
 drivers/staging/wlan-ng/prism2mgmt.c       | 21 ---------------------
 drivers/staging/wlan-ng/prism2mgmt.h       | 21 ---------------------
 drivers/staging/wlan-ng/prism2mib.c        | 21 ---------------------
 drivers/staging/wlan-ng/prism2sta.c        | 21 ---------------------
 include/linux/synclink.h                   |  3 +--
 29 files changed, 7 insertions(+), 461 deletions(-)


base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
-- 
An old man doll... just what I always wanted! - Clara

