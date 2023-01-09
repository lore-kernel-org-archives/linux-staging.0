Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDC8C09
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 19:08:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 18so14029959edw.7
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 11:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jT0Oz+3cAXi9MsBWfMsEAGfcOwY189DZFhtGxbqiu6k=;
        b=i74hD6c0B4mxb2STWM/PpEPCub6GaziRLOYPHLIoa2zbv2PpwPLtN01V7ElTf171HW
         T8IIR+xM7X2+gmmrVHG2zU8YpngBo+ob1KufO7mJP/Z42YILUyGQcKHS9uTwxPRGCIT/
         QGDCVLGKyWN3fDLo1QMrPl2zatm5EzXK4+7Zr9eHmHVXVzBm6gBpJ1vHa5TjTs2pECBn
         QrRTtO9t0SpobLVZCzF7JKjku15b+nyNersKNW32qtGUr/ha9sEYKgoXoph+pRhDQ5cj
         80BY+LOhy5TUjVjbkjb5AJUY50o0dmcOFKMz04QYQIfnaVHewDwM3mGEaijBazjvMvvM
         qOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT0Oz+3cAXi9MsBWfMsEAGfcOwY189DZFhtGxbqiu6k=;
        b=2ba1gJnP4CiZ2AVLM1poNnOGAlrb4BT54KnAwSy6fJ9kGG9KMQ34O53twg9vKruqym
         qsFUgsEGJG2+rB7lvYrlhRlzI9nT1w0Frwfc3ktdAn33egziES7uww5X22XqVNiqTrCR
         TID7qe/+mtXk3zEPMbex7n7F+ab6SLKzoYcX8oIZxpqaBmxzhjVcvisoETnMIGLm+CAT
         oUET6CbUiPI4vNW5X2OQ4YCB6tTrJGFo96arCnkb4ISWPCVN08Yl/R+HpxFVmrs1aDVL
         i7IIgiKX2nX7NUBmSnGCPtmxqbBDvqAANDW7dAwlD6GfR8Eyq9fvJ7/AI385KeFFge8c
         t76A==
X-Gm-Message-State: AFqh2kr136QEhbfebrCBACSgK+vHoEwnGLb7hTgXG6Yyit+W9ySXdExe
	0dOeex7E2+8T6wm1zODBlgs=
X-Google-Smtp-Source: AMrXdXswuPq44IMreZvlfHay82vYyAUa7RxeKhJFOvI28aJakPgWh6URDQQ3l21lPgjn98EmEXX0hg==
X-Received: by 2002:a05:6402:3603:b0:460:21e2:749a with SMTP id el3-20020a056402360300b0046021e2749amr13780038edb.3.1673291298223;
        Mon, 09 Jan 2023 11:08:18 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm4048389edb.93.2023.01.09.11.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:08:17 -0800 (PST)
Date: Mon, 9 Jan 2023 20:08:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] staging: rtl8192e: Rename variables from r8192_priv
 start with ChannelPlan
Message-ID: <cover.1673290428.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables to avoid CamelCase which is not accepted by checkpatch.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
V1 -> V2: In patch "Rename TSSI_13dBm, Pwr_Track and NumTotalRFPath"
          Changed TSSI_13dBm to tssi_13dBm instead of tssi_13dbm

Philipp Hortmann (7):
  staging: rtl8192e: Rename ChannelPlan, eeprom_ChannelPlan and CckPwEnl
  staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and NumTotalRFPath
  staging: rtl8192e: Rename CCKPresentAtt...
  staging: rtl8192e: Rename TxPowerLevelCCK...
  staging: rtl8192e: Rename TxPowerLevelOFDM24G...
  staging: rtl8192e: Rename MCSTxPowerL.., LegacyHTTxPowe.. and
    AntennaTx..
  staging: rtl8192e: Rename SetRFPowerSta.., RfReg0Value and
    bTXPowerDa..

 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  14 +--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  78 +++++++-------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 100 +++++++++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  10 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  42 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  30 +++---
 6 files changed, 137 insertions(+), 137 deletions(-)

-- 
2.39.0

