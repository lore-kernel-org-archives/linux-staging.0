Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8F1840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:35:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p34so2310852wms.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733298;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cDeguqASDwAgU6ia/rYFeY5FWxDs06bPutkb/feHzo=;
        b=ieSdwsGeEwVPjdmsQ97sOkx9XAFxePci4TT9J1QAdbfMTpmscgtBlRWHGApbUdyMAx
         0scADfX/bY/oHRKPmHSW9xbKiMtzawfCNjuLshaElL3fJQH+UkI+pjQbwxMd1LFzyYWT
         TvZ3vjrArdloK0pB6dUlrTHSMwzFU0J4My1/RHLFXVSW+2AmIJW32MNO1QzB+mOjKm4o
         mcvTxNMRkBYdbWTkFtgJjWtuTumCX2kVoWWj/DlPmbTUN3Gr03rUroApyJqlJ3DvPeRB
         O3jAvtbIjtChHwCZdOeatx57+GUSBueBvYQCcMEJUxM7U3wqrzXkiN57JLW8J4snDQJ1
         /C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733298;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cDeguqASDwAgU6ia/rYFeY5FWxDs06bPutkb/feHzo=;
        b=53KBm85SvGiZ29ExjxIVveHdKn1RazNmlOkDxNCZdLtjSjUp/TAKNu+G55yaYwSPGA
         GR7fqidEMfGOS6ju3eXhiWhTC6abT9rtOYOXaKaEPhJ5DknAvxTruYjJIRxWGo5/wW2f
         FmDMFtVH7rsfqAk6KTYsK+0G5JqtkDECCFSYI/AKCBPBgiOeZJpmsbCGDe+Mh7V1Dx3s
         CYtUYeh+9ksEZo4rJuHyq7XGpu/E/rJOSZXscw/hwPwEop7y95CkI6A6UHt/qXMUSwgg
         jEZFFltbTzatekfzW4c+MaWMHxkV9F8Yg1pGDMB3RR2T1RhcrOuj08fKtrVE2O0dzkhT
         AH2g==
X-Gm-Message-State: AO0yUKW/2sLO4lENOO9wF2qhxCvaWKOBiaOmlaAWg8UXQaSPyc8wDRU1
	v7WzLuyxcowBMU4pHtdunHXRezIkXmQ=
X-Google-Smtp-Source: AK7set8DpW+O+nvS+3uJziKm3LHxgzOxcCzAbTQQfGc4OarR5XqpNrJRHRMsmgcI4PG5RuRPYxozpQ==
X-Received: by 2002:a05:600c:468b:b0:3eb:f5a2:2d49 with SMTP id p11-20020a05600c468b00b003ebf5a22d49mr4315258wmo.0.1679733298456;
        Sat, 25 Mar 2023 01:34:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c470e00b003ee6a91b596sm2189298wmo.29.2023.03.25.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:34:57 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:34:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove variable priv->rf_chip from
 driver
Message-ID: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

priv->rf_chip is initialized to RF_8256 and never changed. Keep code that
is executed under condition (priv->rf_chip == RF_8256) and remove dead
code including unused variables.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (11):
  staging: rtl8192e: Remove priv->rf_chip in _rtl92e_phy_rf_read
  staging: rtl8192e: Remove priv->rf_chip in _rtl92e_phy_rf_write
  staging: rtl8192e: Remove priv->rf_chip in rtl92e_set_tx_power
  staging: rtl8192e: Remove priv->rf_chip in rtl92e_config_phy
  staging: rtl8192e: Remove priv->rf_chip in _rtl92e_set_tx_power_level
  staging: rtl8192e: Remove priv->rf_chip in
    _rtl92e_phy_switch_channel_step
  staging: rtl8192e: Remove priv->rf_chip in
    _rtl92e_set_bw_mode_work_item
  staging: rtl8192e: Remove priv->rf_chip in _rtl92e_set_rf_power_state
  staging: rtl8192e: Remove rf_chip in
    _rtl92e_get_supported_wireless_mode
  staging: rtl8192e: Remove priv->rf_chip in _rtl92e_get_channel_map
  staging: rtl8192e: Remove priv->rf_chip

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 -
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 431 ++++++------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  23 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  10 -
 4 files changed, 138 insertions(+), 328 deletions(-)

-- 
2.39.2

