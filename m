Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4728EF
	for <linux-staging@lists.linux.dev>; Sun,  5 Mar 2023 22:32:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so31270411edb.9
        for <linux-staging@lists.linux.dev>; Sun, 05 Mar 2023 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678055565;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FkLezU1h/3L/ss9ve9w6OXWpd2aWbqNzCprM55jaH+g=;
        b=dSfz1NxECbm8siUO8cR8Ynt621uP/tsNl17IZ0CgauYV+0xMW7s6ofY9uQdCjeOnoU
         mtN+xZ+7gpDcS7mX7yIpn6ljatOA/nP8kvlcf3DTYLCGeUnIOzyWGb216yYEqXOcKLof
         M6+nlbl+JduR94upm9bSMml9lnW5llBDkofZ2zCuDDnLOesb6Q2jW8vymmh5LkgDZ0uA
         HbRsOWCcLmlC0vRjl2qpkM0IL957Q10/scFX7vW720FsTfZ6K8Io9IJBJPH9v0pwN2hW
         p8BFJE/TS7sx3ly3hsTmventbt1yc3oJ1Yb78m4Hp/Ou5j80pLcsr4m/PD3QCI17VQG0
         msFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678055565;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkLezU1h/3L/ss9ve9w6OXWpd2aWbqNzCprM55jaH+g=;
        b=JLi0RsXGrVZGa8UmBhztDd3sAMUy2K67S8k0ABuEKi3p5KVqLARjBwjXaMdbnDQx39
         wqQj+/JSmUwP59m4dlPC5L/HqcXRgS0BOAayUaqh/+ed89GK+rmtXaYIKLOPGsusWHkn
         qooW1qm3PqgMzYsooCj0FKsJ7uYrff6EmzI825klmG0Zle0C1FofMWv2C9uatfW2tak2
         pa6V2jyvlA9L+X9DZXKj8Y9dN8iD+nbVKt+f53QOvYQL3RSlYmf1EPRoFULRjOKD+rv6
         sMCpMmPOYnirQrlG4wq7p8c+/vB3ftE9K/6NATFPrd2w38jMQ1COPC2CDTMvtW6CrobE
         epGg==
X-Gm-Message-State: AO0yUKWaTcSE3CcMUWWl3mQhuKIvMuM5K2zQ0eYKJOMxJ+ZloDg/5NGM
	ErFT5Z3HArV2L5e4gjXKHiw=
X-Google-Smtp-Source: AK7set8pgpXNMQLaADSjKZjVv8BuoPNNSRqNT/NfcrrIikujbynBEGzUUVOlqf6qyk7CmQi8xfaYKw==
X-Received: by 2002:a17:906:c1:b0:8dd:76d5:dbc with SMTP id 1-20020a17090600c100b008dd76d50dbcmr7180280eji.0.1678055565084;
        Sun, 05 Mar 2023 14:32:45 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id rp21-20020a170906d97500b008de50990fa7sm3695056ejb.21.2023.03.05.14.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 14:32:44 -0800 (PST)
Date: Sun, 5 Mar 2023 23:32:42 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Removing empty arrays ..RadioC_A..
 and ..ERadioD_A..
Message-ID: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rtl8192PciERadioC_Array and Rtl8192PciERadioD_Array contain only two
values set to 0. Reviewing the other Arrays in table.c and looking into
other realtek drivers (rtl8192se and rtl8192ee) this arrays are not
containing valid data.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the patches:
"[PATCH 0/2] staging: rtl8192e: Removing rf_type RF_2T4R from driver"
"[PATCH] staging: rtl8192e: Change filename r8192E_hwimg.x to table.x"
"[PATCH] staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh"
"[PATCH] staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script"

Philipp Hortmann (2):
  staging: rtl8192e: Remove empty Array Rtl8192PciERadioC_Array
  staging: rtl8192e: Remove empty Array Rtl8192PciERadioD_Array

 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 24 -------------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |  4 ----
 drivers/staging/rtl8192e/rtl8192e/table.c     |  6 -----
 drivers/staging/rtl8192e/rtl8192e/table.h     |  4 ----
 4 files changed, 38 deletions(-)

-- 
2.39.2

