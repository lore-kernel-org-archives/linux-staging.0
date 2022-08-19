Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787D17EE
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 09:36:08 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id dc19so7726665ejb.12
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=saoJnBxEaO+QQVXY4266Gj1br8WpDROo4vZ+Je19JwA=;
        b=KySJnoXIyAm5zzKyqv6CYaECOOK2i/eghNqj38+952UKaXlCJeD9umbpuBUD+DhBxA
         +7iNlZCVqVZ6lNW6BszfKDL62pbUcHmy8mMOuGdkBbHVV1AxgjiYw9JSP1hcRJwibKzD
         1KTYtaUFYf0viD4Vty+sOtD7/tIhxtP5S4Ex0Cn02m5qcb3dFvGZ86oHEzHaf+4EsMZ/
         85dlQOxZTIDKMxGvGJou26OAVXYUoEwQLe9GBU/jEc6D86noWEHdHzMNni661F4iJyCW
         xqtiNWOTGnDzySzYUQIX+Zsj1LGkevyDP8lc0rFJpZqnM96pzmQR5rrIROqM3/UpwrZP
         dR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=saoJnBxEaO+QQVXY4266Gj1br8WpDROo4vZ+Je19JwA=;
        b=VtJyUJi7W0yw1KZw3dL4RZFgK6NYdbZ5IHb0NPFVMyadhM80S5ozDlkDt/49RxSuIK
         /vCRFE61K3iTDuv+OFFS8sGk4/0moPMzP+ee5PENq18bx5NtRiefE9FOMEPZwVunqHNP
         0Flso327O/6sglB792FzyScel82HNcZCyPNvJi7e13Vy+2WPhUYK6Hwy0ZP5Wc0VJJuD
         7S+G3/PV+JipPtG39VakL+mJs/7mGgsV4jysAHLL1JTdbN2Cz7Bz9XwmLQUNej8YC1zj
         ePqJE2mokgR0e+kvOkh4EeDFXUgL5jyYLBmKEFkbF/R4HxcLIzvjLKqBDAP1v4Kncnea
         vrrg==
X-Gm-Message-State: ACgBeo0mZknw/Lstrl/QLIdc5ZFHz6Vxu9AJ152uLq4oNhRhjZvZTnZY
	xCZAZG+Su/L3JMG0mqeKtpM=
X-Google-Smtp-Source: AA6agR4lTrNI2mcEZvS5k2TuTODOw4yv8DGD4JjtHsZCIXKOET793eOiCfJyndbg48NHMB+TfulDbw==
X-Received: by 2002:a17:907:7205:b0:739:1735:8b9a with SMTP id dr5-20020a170907720500b0073917358b9amr4228836ejc.244.1660901766556;
        Fri, 19 Aug 2022 02:36:06 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906941800b00734d4bd1792sm2055929ejx.162.2022.08.19.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 02:36:06 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 0/3] staging: rtl8723bs: remove useless files
Date: Fri, 19 Aug 2022 11:35:34 +0200
Message-Id: <cover.1660901124.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
useless. The first 2 commits are preparation, and the final commit is
actual removal.

Nam Cao (3):
  staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
  staging: rtl8723bs: remove member noise_level from struct dm_odm_t
  staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c

 drivers/staging/rtl8723bs/hal/odm.h           |   2 -
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 130 ------------------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |  39 ------
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
 4 files changed, 172 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

-- 
2.25.1

