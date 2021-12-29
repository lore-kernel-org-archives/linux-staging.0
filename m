Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16FF173
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w20so37581948wra.9
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+w/0DPocm9k0GSpXvxdlfmQQFWX62L0w+etSyEbhZE=;
        b=nLJ/u4Dzj/KRfqnzrBoIlPOgkdUMurbKc+ZciWpeagh5i2dxpr5ESWC3x2J6YBbAdX
         47ItxCUvm/fLwl/5p4Nej+1oMa8hZsGOBN1o7rjDAmYp+FOnQw2Mry2gr2Ttk14BWFWZ
         4XsFbl3dVDmVwXRnNQYRjiIhkb3k73ZCwK686J6kZFx9n/AIHOrerwiJgVbGtacepuMx
         /SibnHi9P43511Oo/4TZQgolJoYgW8TYOLUOEHHNwfiDa9IcVcXrVe0nSldMzQmBamgV
         DcT8rapfd+JuJao9RlBz/OsnOYoxkRP5CfYpn6p64LYSUQA+RcG4QpcNiGTNZdV/r5kk
         T/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+w/0DPocm9k0GSpXvxdlfmQQFWX62L0w+etSyEbhZE=;
        b=G1w+kI4AsaEOBIMSQE5FCmOpdKRDcs/kgnr0+dMcYMhYXkHjs4tS48cPGcVg2rbKu0
         BzOyv9f5bOldJNcrhyDmFH1uwiiiHflUgcLC3laKYECKk7+uhIGr1KZxrjLw61+m0DEk
         P5lHw0r5TCSl1jh4OXmWIhmsYKjsmShllTIhnpBYf4JA5t9VcLB9jP+X+ViViNAFV7kJ
         z1RXVQ+b/KUkfl7fT3BfgTBbHAUrZJX0BFzfBIs9h/fYRN66WLAN3kdKz3z7ugVV0JoF
         DgpeAPeD5fV/yWNjTA9ZLTfj3vQJzS/6jy5f/QIFWnvR9IECBojBVLQb8hJ/8eyK+4FO
         ZcCA==
X-Gm-Message-State: AOAM5334x8TozkCKNMJ1gbA/FELyZQSNxFBikHNzooFxYvpfIhKu9NQl
	TuPZeKLTN4hsPPwmhjv/Tk8=
X-Google-Smtp-Source: ABdhPJx3Ys2u6SmNHo6xV7YUFziwlUJCSW1qIB2Z3C13etTLSKxMHubMlKWWo2qH0/fj1aBnw4FmJw==
X-Received: by 2002:adf:aa9a:: with SMTP id h26mr21711756wrc.437.1640811086409;
        Wed, 29 Dec 2021 12:51:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:26 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/32] staging: r8188eu: remove odm_interface and odm_precomp.h
Date: Wed, 29 Dec 2021 21:50:36 +0100
Message-Id: <20211229205108.26373-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes odm_interface.c, odm_interface.h and
odm_precomp.h. The motivation for the removals is the ongoing effort
to get grid of the hal layer.

Patches 1-11 remove all wrappers from odm_interface.c and finally
remove odm_interface.c and its header file.

Patches 12-32 remove prototypes from odm_precomp.h by making the
functions static and finally remove the header file.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (32):
  staging: r8188eu: remove ODM_SetMACReg()
  staging: r8188eu: remove ODM_GetMACReg()
  staging: r8188eu: remove ODM_GetRFReg()
  staging: r8188eu: remove ODM_SetRFReg()
  staging: r8188eu: remove ODM_GetBBReg()
  staging: r8188eu: remove ODM_SetBBReg()
  staging: r8188eu: clean up coding style issues
  staging: r8188eu: remove ODM_sleep_ms()
  staging: r8188eu: remove ODM_delay_us()
  staging: r8188eu: remove ODM_delay_ms()
  staging: r8188eu: remove ODM_CompareMemory()
  staging: r8188eu: remove odm_interface
  staging: r8188eu: make odm_ConfigRFReg_8188E() static
  staging: r8188eu: remove unused prototypes
  staging: r8188eu: make odm_DIGInit() static
  staging: r8188eu: make odm_DIG() static
  staging: r8188eu: make odm_CommonInfoSelfInit() static
  staging: r8188eu: make odm_CommonInfoSelfUpdate() static
  staging: r8188eu: make odm_RateAdaptiveMaskInit() static
  staging: r8188eu: make odm_RefreshRateAdaptiveMask() static
  staging: r8188eu: make odm_DynamicBBPowerSavingInit() static
  staging: r8188eu: make odm_FalseAlarmCounterStatistics() static
  staging: r8188eu: make odm_CCKPacketDetectionThresh() static
  staging: r8188eu: make odm_RSSIMonitorCheck() static
  staging: r8188eu: remove odm_TXPowerTrackingInit()
  staging: r8188eu: make odm_TXPowerTrackingThermalMeterInit() static
  staging: r8188eu: make odm_InitHybridAntDiv() static
  staging: r8188eu: make odm_HwAntDiv() static
  staging: r8188eu: make ODM_EdcaTurboInit() static
  staging: r8188eu: make odm_EdcaTurboCheck() static
  staging: r8188eu: remove unnecessary comments
  staging: r8188eu: remove header odm_precomp.h

 drivers/staging/r8188eu/Makefile              |   1 -
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  17 +-
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |   1 -
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |   1 -
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   1 -
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 234 +++--
 drivers/staging/r8188eu/hal/odm.c             | 890 +++++++++---------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |   2 +-
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    | 118 +--
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  58 +-
 drivers/staging/r8188eu/hal/odm_debug.c       |   2 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  63 --
 drivers/staging/r8188eu/include/odm.h         |   2 -
 .../staging/r8188eu/include/odm_RTL8188E.h    |   4 -
 .../r8188eu/include/odm_RegConfig8188E.h      |   3 -
 .../staging/r8188eu/include/odm_interface.h   |  42 -
 drivers/staging/r8188eu/include/odm_precomp.h |  54 --
 .../staging/r8188eu/include/rtl8188e_hal.h    |  11 +-
 18 files changed, 635 insertions(+), 869 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/odm_interface.c
 delete mode 100644 drivers/staging/r8188eu/include/odm_interface.h
 delete mode 100644 drivers/staging/r8188eu/include/odm_precomp.h

-- 
2.34.1

