Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EB2C80
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 13:53:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so14648467wmj.5
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UrcIjjq19+8x+tKdvPz3//oFylEYXfeLOia6PAhgG84=;
        b=Sy8+MnlQ+25SMuIu0N+NgpipUOZcsBukBwyRyI2MHCq8tz2rwvtZVRX+cOfEqUjWI7
         Qm+OxXcwGlDyfAtT0JyB6twkw/WwCaX6rBTv0A/3OAe3KJuOyp0EzIIt16aa+6oW8Ghz
         szOxu0X3NzadPS9NZ7OtqxZVjMxEEpZm3nbszaiBjyxwH6EtWUPNsD35ZhtEycCMfU4t
         oGJimkqu9h7JCxIQcBgggKfwKS6YnyLDVSKldelN2EzeS1bChe6126ul013Tc7QlNmTI
         U45gAEftWxiOyDz5Nz4dW8GGmjj0xhKd3e5TpgLI8JJGvcs55uMemJKKJro3R6zE0yT1
         pUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UrcIjjq19+8x+tKdvPz3//oFylEYXfeLOia6PAhgG84=;
        b=Sb41NStpoG1ctfF5ra7FSsoqzf22cKCsm6qdQ8Lx8wgklzTuEcS2S4oIB0cXVbMk0y
         iIoj7djeajcKl9F4OR6K7zlciWtsdPyc4YxTAHjGE5cjiJY/vzKBs/3Xr/5S7DtiEKPm
         TC10rrPtkSxSOQj7vcBqdThKkDz79YMp4U5FKshBXkRw68vLBTLQrwYogpypUwD+NVAz
         B6NBCZTo4Zjdhj0Ht7ILP6XdYX/0tdbDj3XdG81k3/l0L81VxO9T22DDeK62kpjArTHA
         nONstZA+0i2+71u6IznSQfqulF6Vvlr5mSsc542p13h2o/mqzkCI5R9zGs7CHs4DZWVa
         kLTA==
X-Gm-Message-State: AOAM533hkfkDXSzYget6E5J+rI+3eywC84atOCVdmbqPQrk19f/6oiFe
	ZcuZEiXnN3C1KV8SXLsjcVM=
X-Google-Smtp-Source: ABdhPJzmSE9FJESXNt5pVdJT4gR5HGp8c9JvwxnSAj0ZecIcZ9m5lJadTnpEwsn7rzTzs8Fw9j7zNw==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr29455080wmi.2.1638107616379;
        Sun, 28 Nov 2021 05:53:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id l26sm13598510wms.15.2021.11.28.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:53:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove rf_type and rtw_rf_config
Date: Sun, 28 Nov 2021 14:53:21 +0100
Message-Id: <20211128135326.9838-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes rf_type from struct hal_data_8188e and the
module paramater rtw_rc_config.

Tested on x86_64 with InterTech DMG-02.

Please apply this series on top of the series
"staging: r8188eu: remove more usages of rf_type".

Michael Straube (5):
  staging: r8188eu: remove rf_type from writeOFDMPowerReg88E()
  staging: r8188eu: remove rf_type from bb_reg_dump()
  staging: r8188eu: remove unused HW_VAR_RF_TYPE
  staging: r8188eu: remove rf_type from struct hal_data_8188e
  staging: r8188eu: remove module parameter rtw_rf_config

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  4 ---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  6 +----
 drivers/staging/r8188eu/hal/usb_halinit.c     |  3 ---
 drivers/staging/r8188eu/include/drv_types.h   |  1 -
 drivers/staging/r8188eu/include/hal_intf.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_hal.h    |  3 ---
 drivers/staging/r8188eu/include/rtw_rf.h      | 10 -------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 27 +++++++------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  3 ---
 9 files changed, 10 insertions(+), 48 deletions(-)

-- 
2.34.0

