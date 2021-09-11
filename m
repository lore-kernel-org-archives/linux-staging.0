Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E83FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id e26so3134920wmk.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKII3Em85GyFUd+5hxL85RzFtfvRmJ11W1HrzpygBZ4=;
        b=URQg6z1jECqKTCbCvTfRwLLNc6qlLOmgo7dUIiZ7oyshy0EiZ6z33cSJg31PjAJSrL
         0U3izzVHjPWtpkbIjeZsnaN0VEudmvwt0B/10bX2wjV/QRpmzX9gYnJvv/hhbKqBewRK
         XxbFQy0SRn6gRsX0Af1Kl6M/LucLEoPSEDKdNtdWiwG9B/1geOzTSjd5X7eERRdOrNKj
         mAzjdw4MudxW6HsspsZ/swPNjYmvFioZwtjWyBE6B0bn6Dl5PA8DS+5yJh/BNWjwoUMF
         RwKclO5rlJp0V+S4j3guDgyDlzZyTcm4+bTnQRVJ1RsWhtfkINF+g+wf4PyvFgneuXlU
         NwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKII3Em85GyFUd+5hxL85RzFtfvRmJ11W1HrzpygBZ4=;
        b=p/tq1H7gwm/ekWzS6cUAJ6bamUlNjDO2pZfTZNcYLC8Jl5aro5DeK+91UKzHyG3Iwi
         IDZ06Y++FryPK12d0GP9N0CPolH41CRGJpChq0Vgm+Ql4xOf16MTwLmjh0QSR5c7oSbT
         HyXuKyzVFGUsgaFXNDM+BQXxF7WoYS7ehqIXE/7AaopUyzcMKXG3hq8Z6QLEy2x6V2sk
         PeR/ISMJ0DoIjyTZ+750Q6HwwzemZpMHWqXeJFWIh6j8519d7r446BXjatAz16bKR4MP
         KmCgx3Y52mb+w2fwu7eF/nA/oytCurJGJEgv23ntkjjRTY7TrvrQmXyyaCUVJCTLHf9z
         fhKQ==
X-Gm-Message-State: AOAM5324SA/El9sVYXFEJc9x3DiVNU8mvdR/KSgOe34c8KvAaPgv+jAR
	PLYaXffXz4VDvYb8vqayJ8w=
X-Google-Smtp-Source: ABdhPJzxob19wjYW06XrZiII6gI5UMEr4reug45vt16neQ4dK/Z5v8dt2Gs6WKn56C73IWsZhjw47g==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr2720004wmb.190.1631366822441;
        Sat, 11 Sep 2021 06:27:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/18] staging: r8188eu: remove unused functions from odm_interface.c
Date: Sat, 11 Sep 2021 15:26:17 +0200
Message-Id: <20210911132635.30369-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused and/or empty functions from the file
hal/odm_interface.c.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (18):
  staging: r8188eu: remove empty ODM_ReleaseTimer()
  staging: r8188eu: remove unused ODM_AcquireSpinLock()
  staging: r8188eu: remove unused ODM_ReleaseSpinLock()
  staging: r8188eu: remove unused ODM_FillH2CCmd()
  staging: r8188eu: remove unused ODM_sleep_us()
  staging: r8188eu: remove unused ODM_InitializeWorkItem()
  staging: r8188eu: remove unused ODM_StartWorkItem()
  staging: r8188eu: remove unused ODM_StopWorkItem()
  staging: r8188eu: remove unused ODM_FreeWorkItem()
  staging: r8188eu: remove unused ODM_ScheduleWorkItem()
  staging: r8188eu: remove unused ODM_IsWorkItemScheduled()
  staging: r8188eu: remove unused ODM_SetTimer()
  staging: r8188eu: remove unused ODM_Read2Byte()
  staging: r8188eu: remove unused ODM_FreeMemory()
  staging: r8188eu: remove unused ODM_AllocateMemory()
  staging: r8188eu: remove unused prototype ODM_InitializeTimer()
  staging: r8188eu: remove unused ODM_CancelAllTimers()
  staging: r8188eu: remove unused ODM_InitAllTimers()

 drivers/staging/r8188eu/hal/odm.c             | 17 ----
 drivers/staging/r8188eu/hal/odm_interface.c   | 80 -------------------
 drivers/staging/r8188eu/include/odm.h         |  6 --
 .../staging/r8188eu/include/odm_interface.h   | 45 -----------
 4 files changed, 148 deletions(-)

-- 
2.33.0

