Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41C613A
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 20:17:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6624033wma.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 12:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5Xkr2k/6Nx+TaITzPx/69q4zOkt44vc7RBSXgmnDGY=;
        b=NRxR8B2Uz0daGdwYRqI63u1TDipu+pkE9xDEgEPBJNVuzu3upcqH7PZ4j+RdGksNUP
         P1l9GdjNPKpbtdvzMxZTCrwW8k2Ti1S3Nrk2zlPkRazFEJkD8DaOoU3brjzSDLeCVwRa
         j1bgbAKzCMmdoc5rPhJqNmjit7C6xLjD9HcsW6xpZnfbE/LJdv0e/aj+g94JLefpG7j6
         xmimbU6OIN2s1U4dQ6qt3T7jqq7lvRZFZt8Ycr2stoGl50wMUf2T1knAM/QU8NSB6T47
         98mMT1H2uLSMk8EM38xZYC0dYFcqCLbU9lLLDfPeqx4ynGzak5AWwfSoC4+pH8vLTyNN
         bDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5Xkr2k/6Nx+TaITzPx/69q4zOkt44vc7RBSXgmnDGY=;
        b=Ha38pWx2eMdAZZ4RmMHbmeI937NCSGR2qVqgW7nPgZBM4608hVF0Z1SCjsCYMq/lU9
         bEQlwv8nZA4C02SXz9NcQEPOdqpgJ+lLDEZn/nIM08Qsg5XNAY8cXOfI0yC1Z0fN2kBR
         GD60Pg+vnHWN4dUXuL4a8AQ3tqy8E3nZJ/WEd4+QvX3qWebLyMwLCUMWmfdrYFkiFDZm
         r7FFQyJ/pZjAdO8/grBmvhb6dydSRPMr3Pfdb810ukAAHn9I8XHyjaQ+cRPLTFfDfITH
         5ENZZScKuDdupK3fKWkQm7S69v2GZlDY4Kosbur/thFoUTSxAq2YhEYYNEF9u9KkQBT7
         e5kQ==
X-Gm-Message-State: AFqh2kp50SqXtXx28dBe2Rn1BvuP++5r5QRjWwqlDyxjZm8lT4+RAe8N
	yALRCa4kEmfQFDfPdksYSYD82tZ438Q=
X-Google-Smtp-Source: AMrXdXt0lGMqr8IVTTV0MweFD2dPpnfKB8X+zmi3fEg59TyNNM03xSK1TW6bj81zKQCWXrPkP7nxqw==
X-Received: by 2002:a05:600c:3b0a:b0:3db:22a:1349 with SMTP id m10-20020a05600c3b0a00b003db022a1349mr4063921wms.2.1674245863454;
        Fri, 20 Jan 2023 12:17:43 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05600c3d9000b003daf89e01d3sm3242057wmb.11.2023.01.20.12.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 12:17:42 -0800 (PST)
Date: Fri, 20 Jan 2023 21:17:40 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Remove several variables that are zero from struct
 r8192_priv
Message-ID: <cover.1674244819.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The arrays EEPROMRfACCKChnl1TxPwLevel, EEPROMRfAOfdmChnlTxPwLevel,
EEPROMRfCCCKChnl1TxPwLevel, EEPROMRfCOfdmChnlTxPwLevel are initialized to
zero and never changed. These arrays are used to initialize other
variables that are then also zero. Remove several variables set to zero
to avoid camelCase and to remove dead code.

Tested with rtl8192e (But most of this code is not executed on my hardware)
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (6):
  staging: rtl8192e: Combine three loops to one to init tx_pwr_level_...
  staging: rtl8192e: Init tx_pwr_level_cck_a and friends directly
  staging: rtl8192e: Remove zeroed arrays tx_pwr_level_cck_a and friends
  staging: rtl8192e: Remove ant_pwr_diff which is always zero
  staging: rtl8192e: Remove u4RegValue which is always zero
  staging: rtl8192e: Remove repeated set to zero of powerlevel and
    friend

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 31 -------------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 24 ++------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  8 -----
 3 files changed, 3 insertions(+), 60 deletions(-)

-- 
2.39.0

