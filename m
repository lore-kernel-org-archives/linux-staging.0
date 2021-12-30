Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161B29CA
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:01:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s1so52452896wrg.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5lEVdYlzZfTaki180D8atXlsL/EBivmN1Gj1imf7WQ8=;
        b=oIVpwi1LF5eTKikUrWdbpaoj9pI9gXvIxBK6yvL17bTigNVdUW1pKf1D8d/GPHNxkn
         JC2KBk9kgWfKNo61rbq0tNF2LV4uE8iQShdBe13WzCmYNz2C/mEvFAVDnOz6IU6NhhDm
         1GNdQWsueWhDqk/rLaE0kwU4ley5gzmsF1CySLPEQc0ytucekjc8S/0LrdVs2HhsSzN+
         M1QSfHL3N2IzkE001mK1Untz2eEu+fg85YDNk2jyIxUc+csA0/vY6LM1AyOrVUMLjoFW
         dBp0j1Zn+KwteQoUe5mpu/I3U0AqavZ7uhCuaemPukjuYw5sPYLDxkLgfypBS2WZmsyt
         STPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5lEVdYlzZfTaki180D8atXlsL/EBivmN1Gj1imf7WQ8=;
        b=qfQ5QNZwPLnoqX0M5N0c/HfCtR8wpfHFIN5p8SPi/5TAnFht5B3ttontZOTvQ5JiBp
         ZQ1mIPWtM8NJDXq6tpVaHx8QkRPdxAhO+Qg7I0yEB8+BFLIngWBdG+nwnLexCgKw68in
         u6oBPEfSAr/i7BrSqUykjqeItVh1TjKKppo4CdkTNPAZDDjsTrK5Wy2GJ/F07Orei1x6
         uahm2OGOsuIASZaYbpfbLKSRIjg8DXZ8013joMhFCVRogA+4Q2N7wsUYjSX8nkQWWk0Z
         TaPJC9Rmjpbm1Ym4CyYlERF3uVTHKmIk+iFQEVROkUml728x0WesjaHV0OoPy0rVKzdd
         BsyQ==
X-Gm-Message-State: AOAM530LxSMxLFJ9yBKUTTzE+TT1YOAFwQjYbLElwpUiPBnZwja4CfNu
	u5DTOYpgVD/xJvW5zuPf6IM=
X-Google-Smtp-Source: ABdhPJz3YyOlFd4kL21Rw92SNWkwx+qIiiQ4xiYMKJ7WT3VOlWvKFgw8AZ38MXSIEZBmFwP8F3+X3g==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr26202624wrb.264.1640894465542;
        Thu, 30 Dec 2021 12:01:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id o8sm29042286wry.20.2021.12.30.12.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:01:05 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: r8188eu: clean up struct hal_data_r8188e
Date: Thu, 30 Dec 2021 21:00:52 +0100
Message-Id: <20211230200059.13406-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused and set but never used fields from the
hal_data_r8188e structure.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (7):
  staging: r8188eu: bRDGEnable is always false
  staging: r8188eu: UsbRxHighSpeedMode is set but never used
  staging: r8188eu: bTXPowerDataReadFromEEPORM is set but never used
  staging: r8188eu: bAPKThermalMeterIgnore is set but never used
  staging: r8188eu: remove unused fields from struct hal_data_8188e
  staging: r8188eu: IntArray and C2hArray are set but never used
  staging: r8188eu: FwRsvdPageStartOffset is set but never used

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  3 --
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  8 +---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 15 -------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 10 -----
 .../staging/r8188eu/include/rtl8188e_hal.h    | 43 -------------------
 .../staging/r8188eu/include/rtl8188e_spec.h   |  7 ---
 6 files changed, 2 insertions(+), 84 deletions(-)

-- 
2.34.1

