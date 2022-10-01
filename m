Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6D23D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:40:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id a41so8792253edf.4
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=ETJVbLfrYhX3YxSoT9eLhG/lzYMnFZKSAgMNf1s1J/M=;
        b=Ad+rWkCs5M1qWq2V0bJJoXrdu3xvcK8tel4seiyX28agWoxn5kW8i3evbKAuUaWT60
         q1Zccf19s3zp1a2Zn1KE38Lrb7YKc0vqFW5aMD6zIks5XDzt9tlg4uKExqwnNmvQyyg7
         g2cy4vofjNnZCSUI/BvNnwMa6iJShoVu7337/toBOJ+S/PQEETWK/r15bdQCX0VTBete
         GpOFoITINOFdNDh4qIspui1cwiDcwBWcW6ZSJRkRQ+L9YknCnq/TwVRw+AA03p+Cc6yp
         uTTrsIkeejgiDRGgg+J9xak3lSqpIHJv6D6RPkUFdqrFQeJX5JgnrkOc3jhgm3IG9ukh
         m6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ETJVbLfrYhX3YxSoT9eLhG/lzYMnFZKSAgMNf1s1J/M=;
        b=CDzGks/x/+d5p+yiugjaY0bQj0Ff1NxL5NOG4ChmFkNPnMwUHNX80ii5K85C/Mzl3D
         /R8o5yEq+hhXfNfmtgqJ5vLun1ULB9avoUzW4hk+1yWvmdY6B7t9FOUDqr0C9cbcTZOf
         u2j9o7Fl29+bcZVGSlRmYdgTt6q+lz0AtD6gUhcfkXRAOlpl5YbuHF42Qb/8hVFse9kJ
         KmWOKCmstZp7jDzfUrvS6Wyeu9d8lIUJ0AOg8WTRxnroJD6dugtqYSQhsgGhCKJ0NGGU
         kR1Z055hVphr507QRMGjbksKnro/ppnjn9eUrr1G56Ebgn/BP1IAY10syFkEQOIvUNti
         /JJQ==
X-Gm-Message-State: ACrzQf2Z8BAo+fTCwMgykXF2NU3Yk9uU4jau52G1/YMQyD2qNzpftZo5
	SOpyU1dy3lJO0qycYqOh+u4=
X-Google-Smtp-Source: AMsMyM4KDWZiQhxQcwmK8kgSBhakvNBOtpcQN5hjg1hksR34Dmjzll+AFm+6Z46wQmqPiup28OZ+/Q==
X-Received: by 2002:a50:fc0a:0:b0:458:73c0:7e04 with SMTP id i10-20020a50fc0a000000b0045873c07e04mr6698418edr.270.1664617220803;
        Sat, 01 Oct 2022 02:40:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id lb9-20020a170907784900b0073ddd36ba8csm2466309ejc.145.2022.10.01.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:40:20 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:40:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] staging: rtl8192e: Remove unused and unchanged
 variables in rtl_ps.c
Message-ID: <cover.1664616227.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unchanged and unused CamelCase variables that lead to dead code.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (10):
  staging: rtl8192e: Remove unchanged variable bFwCtrlLPS
  staging: rtl8192e: Remove unchanged variable bInactivePs
  staging: rtl8192e: Remove unused variable bIPSModeBackup
  staging: rtl8192e: Remove unused variable bInPowerSaveMode
  staging: rtl8192e: Remove unused variable isRFOff
  staging: rtl8192e: Remove unchanged variable RegRfOff
  staging: rtl8192e: Remove unchanged variable bDisableNormalResetCheck
  staging: rtl8192e: Remove unused variable bForcedSilentReset
  staging: rtl8192e: Remove unused variable ScanDelay
  staging: rtl8192e: Remove unused variable bDriverIsGoingToUnload

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  8 +--
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   | 18 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 20 +-----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  9 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    | 61 +++++++------------
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    | 48 +++++++--------
 drivers/staging/rtl8192e/rtllib.h             |  6 --
 8 files changed, 55 insertions(+), 116 deletions(-)

-- 
2.37.3

