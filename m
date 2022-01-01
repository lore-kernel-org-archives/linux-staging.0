Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBC2C80
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r17so59593615wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYN4CGdw687VcG/7qXWY+NuX3XQ4M4+2ldzGKsRJ3TA=;
        b=J1E/6Kg2zk61N2ivT8+YH/IDBZHU13efDb7d27eEhfrVEaM9LcOmpe+fq2K4A5sVW0
         CbSzKdhlFwPCzqlW7c3ouJXlCvCODkkt2kycmaxdzbuRio4jkiJDLEVWxiIki2xUxypo
         hzudeHHMYdQ59BLhY+LE0E72DPn1X6VYboO9dLBPcu8wiw7Jr8UFMcBrK+qKKZUTTmC4
         ukXNkZNRmP2OQa1JDN1bwYEd2/Wu/QOvYcFdJw8fBP5wRaCNKod3Vd+v9iclYbjUfuSG
         9sxMiRmFAAEQ2tzoi3e6Rkikq/sU3GKOPrTqFKrZv5E0SbJ0cI+N9+P7AIlOjsjRQ1Do
         Dq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYN4CGdw687VcG/7qXWY+NuX3XQ4M4+2ldzGKsRJ3TA=;
        b=KvLrs+ogkr0FYqbbVZdaSIib6YJPvsz7vDBELaTN/KJ5eAGyRIgu3vS5K+0Tc9z3a5
         3ALrVKyTknyrg9VQcCtz94Y+Mqi/cdkz3IWKhn2ZoR1vj1qkcZdp/+tWadAOI3NZs23j
         NHXzBzWo1bPMgm5YNe9SP0I8WGbF00GSCJw/uzEFxtOsXX9QWGztrH6zO8+cu+D6eSdk
         l0X1LEw//ngBp0qyJEH2eGfOZneQOMrXMcKMpUGsBK2DPLNvH2xKlgbRiHwNXlTyZdTZ
         hkZo2h4Cv6nWX3AnZEgMWGt36aV/gHRrH9oPakEAJmhMUHErxVLSbgji9NT7gDv4ouKI
         FM1w==
X-Gm-Message-State: AOAM530wqG7UB7GljIDwrU668KE1nwfC5oejMV1kQ2hyqaagCnYb9LGG
	AgedFhBaFxqZjfjwKzrO3Xc=
X-Google-Smtp-Source: ABdhPJyeq7SmwVC8Np6cJVXbkr+D9cBGhap5+P8F3NVcvAJt+YKsZXoJUCs+ajakXMAx+aVYgHoRyw==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr32226629wrn.131.1641025084286;
        Sat, 01 Jan 2022 00:18:04 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:03 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/7] staging: r8188eu: clean up struct hal_data_8188e
Date: Sat,  1 Jan 2022 09:17:51 +0100
Message-Id: <20220101081758.9716-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused and set but never used fields from the
hal_data_8188e structure.

Tested on x86_64 with Inter-Tech DMG-02.

v2:
- Remove interrupt_handler_8188eu() since it does nothing now.
- Fixed typo in cover letter. hal_data_r8188e -> hal_data_8188e

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
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 20 ---------
 .../staging/r8188eu/include/rtl8188e_hal.h    | 43 -------------------
 .../staging/r8188eu/include/rtl8188e_spec.h   |  7 ---
 6 files changed, 2 insertions(+), 94 deletions(-)

-- 
2.34.1

