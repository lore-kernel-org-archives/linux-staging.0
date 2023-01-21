Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9CC395
	for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 21:44:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id k16so6461334wms.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 13:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JMz8jZOn4WuQGzxI1nWAGOXEamTbnJyR7XirPT2J+E=;
        b=ldKvwFSrCl7hVwFot4l5iBMpc1sshkOnBhWyjZ8uXc2xtYz0k7xSrk/+QPZbUQ3PE1
         simOTXey3Y/l2mb34EGSIXdOEBMAYIPHNSYR7yYcV/tbzw+Ue8jNUJCal2qM6fHvxkl7
         F4EI6iiCNSeKo5NmIdPVOPtO4R1ldVF2wZUaYdF8nYQdwfpxq7DVMnaY7AfQtJAbBvfd
         9gKr5mO3uEFn6/IjL2kID+8WL4UZ4NhqJMu44W7BOx39bF5hJ54mKcpa7GJBKt30kFnS
         +gCwkroVuwTHyo8a6PDy7poR1ZHGn9oeT35lNasLH0tW8Heg76/KwNk4iylHCQKhCFS+
         xQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JMz8jZOn4WuQGzxI1nWAGOXEamTbnJyR7XirPT2J+E=;
        b=4WKOjl1DnTkVks11ENeU03uCZJul/QzzTx5pxZ2PNezt197m9e3kcBnLGeQ5256TWI
         9fkTfI3fGppMWlD7LwlEmwVBspfr45IWT1hvOeWGyzRf8fR7X2+8CLWwDuDHNQ/BTbEs
         8AROmxp/Q1UVl7gxSuGPmDyA/toB6uevLUmenScznaF6JxrLVC/g5n+ioLlLEzXDX3vw
         22o2FmIRZXGRfeYZU0Qm8sP4Ey7EkP3AFS94cPW/5ZBB1QDnfKANHe5yDf4FrD0J2vy/
         6yAMqJ/Kng7raGPGGuN9+tTDXZK3tL/N3LMB7V4OH81nmvKyctE2JASZXf9oSLqIW/Fh
         1/tg==
X-Gm-Message-State: AFqh2kr0ngEuujcItVF5bAICOlpkc4sJ2ogX6AUYGYyIlmrDxVLf033z
	VQu7m6Fq43V4Gp7l2WcCJ2o=
X-Google-Smtp-Source: AMrXdXuoH5txVOd/TjaR7XaiRSnW9Faj8rj8sRmdFETP1CNLIVrTZOkdrcOHYn7j0l1HHz8u94bRmg==
X-Received: by 2002:a05:600c:5120:b0:3db:21b8:5f53 with SMTP id o32-20020a05600c512000b003db21b85f53mr2772897wms.1.1674337489431;
        Sat, 21 Jan 2023 13:44:49 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c314b00b003db2e3f2c7csm8820956wmo.0.2023.01.21.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 13:44:48 -0800 (PST)
Date: Sat, 21 Jan 2023 22:44:46 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8192e: Rename CamelCase variables and remove
 one from rtl_core.h
Message-ID: <cover.1674336211.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables to avoid CamelCase which is not accepted by checkpatch.
Remove unused variable.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Can only be applied after the patch series from 20.01.2023.

Philipp Hortmann (3):
  staging: rtl8192e: Remove unused variable bfirst_init
  staging: rtl8192e: Rename eeprom_CustomerID, SwChnlStage and
    SwChnlStep
  staging: rtl8192e: Rename btxpower_trackin.., Slide_Beaco.. and
    Slide_B..

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  6 ------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 13 ++++++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 10 +++++-----
 5 files changed, 23 insertions(+), 30 deletions(-)

-- 
2.39.0

