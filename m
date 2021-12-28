Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB422168
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso6116859wmi.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lu4/fHAfh41aETiOWVku5MFHqWQLQk6Fq5oSTsjrPzw=;
        b=PSCPMwpvMkPUP3bOXCV70UftvKStO8rHjRG3ouV0rLXVBAz+y3VfCZaVv+0jdkhO7I
         nEJLcJhkSCePccyIzvp8xwo2o7NgIdDiH2/ZShgX0xZwYcXQynIMjh+LPuZHtUJ6xwUo
         dW0swwdvKszGh6ykNxkIO4BTfxErv9Sh1aNaUzEUt5uLefZTAGVglqpyR/xHq8cPEVID
         01qFYqkZHd2aPorsU9pbPZOyHiR74Vi6XXFH9Ui50gUC2Q8ogRRzmED6ZFeCEHEGWDv2
         l/mOYqqLvE4mA9/d2CvmSS94suGk4mbhqjJ9Xaq9opvY7Jh3jfN3lereZ2FF4ciUsMYu
         iQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lu4/fHAfh41aETiOWVku5MFHqWQLQk6Fq5oSTsjrPzw=;
        b=Ej89wjTv/5JBaLUGAUqftThkqgfHAzJ1a4XfDv/eqqe0y3ZUMDuY8QDWkjmDeZkDml
         B8OYkUHfhtHcdd7KvNqN9oEvfCQdoUq23rC6qtxolLh0xgW+WSCeZy0+l0fShYKlddII
         bYyfQrekfNSgyltQdLDtgeluEdGl7iWZmTeTJptTo/CPtyZOevNryBWjf2Ob0p06LB6y
         c46GRxti4cBJ4sErwp0qcG5LVUnoZBVWW43rLowOkbCszB+W+krCoZ/amcrQzDXQ2DNS
         DfpBHXmxEXfD8FoNlm+KkfZJpKZL3Q1dS7TKz9JeN6AVRG0/GAlfwy4FfhgyaiaWBnST
         AilA==
X-Gm-Message-State: AOAM533M7kNVzlrAL5hQvAyscM1o4HAApVvE+OLxWMzWt3qRknABPFs+
	MVDJZCF+KMKc33uXccFuqM8=
X-Google-Smtp-Source: ABdhPJxOadgYueHDEYGP8U8DNVklkbgPfi495a2cA88dHFw4ejnCV1gUTiBhd1UImtPLRAuP5lLPvw==
X-Received: by 2002:a05:600c:35cf:: with SMTP id r15mr16579717wmq.106.1640686303125;
        Tue, 28 Dec 2021 02:11:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/10] staging: r8188eu: another set of cleanups
Date: Tue, 28 Dec 2021 11:11:10 +0100
Message-Id: <20211228101120.9120-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set contains some cleanups in different areas of the driver.
Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (10):
  staging: r8188eu: DM_PriCCA is set but never used
  staging: r8188eu: remove GET_CVID_ROM_VERSION
  staging: r8188eu: remove unused enum odm_h2c_cmd
  staging: r8188eu: remove ODM_CMNINFO_ABILITY from ODM_CmnInfoInit()
  staging: r8188eu: remove write-only fields from struct rtl_ps
  staging: r8188eu: FAT_State is always FAT_NORMAL_STATE
  staging: r8188eu: FAT_State is set but never used
  staging: r8188eu: TrainIdx is set but never used
  staging: r8188eu: RSSI_test is always false
  staging: r8188eu: merge _ReadLEDSetting() into ReadAdapterInfo8188EU()

 drivers/staging/r8188eu/hal/odm.c             |  7 -----
 drivers/staging/r8188eu/hal/odm_HWConfig.c    | 16 ++--------
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    | 19 ------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  9 ++----
 drivers/staging/r8188eu/include/HalVerDef.h   |  1 -
 drivers/staging/r8188eu/include/odm.h         | 29 -------------------
 .../staging/r8188eu/include/odm_RTL8188E.h    |  2 --
 .../staging/r8188eu/include/odm_interface.h   |  7 -----
 8 files changed, 5 insertions(+), 85 deletions(-)

-- 
2.34.1

