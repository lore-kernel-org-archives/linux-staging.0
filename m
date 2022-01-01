Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4B168
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:49:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v7so59582520wrv.12
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oc4vHIztuApNOLOp3YEk7PmhXqir0UKoefFYx9DVldY=;
        b=aezyM6ppLiaomO/tHGsfgwGLHO/RUl+UFE7NWmOcjDt1qhRnn77H2nOLj4s+bkVXHE
         9k3pgcY2Re9qJH2DM0uLylFVKyFhT1BqYVBoXfyCuMhs97mLTyjLyOw6YozKzAUjedt8
         GUkevTOZ1KpZEKvkveNghuMW15kMra7RXyqIU0raPfr+rsT7+uFOFWdReRNDvwwXefKY
         sr/RG3V30hQ+DFh76nnI8rdM8FQ8B1albaARNU6a989kfvBdwhZ+LxbEYRqoFalD18xV
         AixBvjzW0amQ7KlvE1CVo3AqIEyypXv0Gy5R1YD/Gg8+CcphrHoNXuWPerjzS6O/5ofm
         0mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oc4vHIztuApNOLOp3YEk7PmhXqir0UKoefFYx9DVldY=;
        b=UO43bQejDdsWEZ7bch3NgDYqDme3YCHjbPWSDXny2HXnE6LnDVIVESOKxSK/+fq6YI
         9OK3f6uGvx2KDpxnnHItJskBSwnhVbEo4IhYltQf2HH2CZbXhb8yUQIrtjgSogKJVGQG
         y8clc+4CIO8bUciXnHrYLN1lwWq+guRBPX511lzhyi3qazs2Yr6cT3LuAgDTiV+kO/It
         fQc+amV+mgdNVz1mqGBiwL7DvhNpsJfSRT9atovT29p2nVrikbJsiMcHwELJOVseDurz
         q/0LSBrGBxbt/RdrlN7t2VnXk9TgC1GkyClFhIaxHdhy+0JBBkfI6KTqyKDg5qd0dXO5
         f5GA==
X-Gm-Message-State: AOAM531ayN5odyzmMKOyALfBCPYx/ct8cwC3VrF42psjMgK+Tp5pF1WO
	VXaKjV/w6T7RNZpU1Pj98Xw=
X-Google-Smtp-Source: ABdhPJy7kwNOt2BxTMLYLRflTbLwdF7BcFIRxttt6Rc/XktfO5A63LPCX5iAlReoH/i+U2QeEbUxGA==
X-Received: by 2002:adf:df09:: with SMTP id y9mr31376047wrl.594.1641026989128;
        Sat, 01 Jan 2022 00:49:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::d7e8])
        by smtp.gmail.com with ESMTPSA id o9sm14806578wri.97.2022.01.01.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:49:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 0/7] staging: r8188eu: clean up struct hal_data_8188e
Date: Sat,  1 Jan 2022 09:49:30 +0100
Message-Id: <20220101084937.3411-1-straube.linux@gmail.com>
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

v3:
- Remove INTERRUPT_MSG_FORMAT_LEN from rtl8188e_recv.h.

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
 .../staging/r8188eu/include/rtl8188e_recv.h   |  1 -
 .../staging/r8188eu/include/rtl8188e_spec.h   |  7 ---
 7 files changed, 2 insertions(+), 95 deletions(-)

-- 
2.34.1

