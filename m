Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFB3FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d21so42482787wra.12
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LgmkxB9IHfY1uiiQk4BtfVCxmgcHEet8wgSzFroByM=;
        b=NyVEAwTiwEM3kZFLQRtZBJV5k8a3zLhjr3EAW/NYhVrBZI2QS0FXTbqic2QnP2+A1W
         EMp/1+hHQ26i9mFlzg3XUJ0D2i68OTrNEBLnlMiCc2qrzryfbCCHRA9vBe0cwhuneE6r
         N1ztK9PLyx7eOmWL6rfmUoKqdHr5lM2hJX5b3G50De96zY2fCh24duEh2NFzRLyyqrUm
         nIzzu+gXy21M+AOv3sCHWLK73EejLEygTi/E++ZNFZDgxl/+qAH1aD/NkjxLlcHRrRCP
         PQKWAP5BnkP73UAbx54V/ZhvXOR7tqowIHDYk0NuQeHTuS/+DYDncOC/i1cV2NXyej/g
         J9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LgmkxB9IHfY1uiiQk4BtfVCxmgcHEet8wgSzFroByM=;
        b=2Bs7k+maa1TvW14P3W/xMgQVLTOatP/PZE3tvyV9w55qsahPOc5etTb6/m+NUBN3/b
         X500ELxbUa+neh0JIMyw7i+vNjgbZ29E5S8tgVmH1Avdt4OrEwHKhslESzaMGus4RG9R
         yusCKfVApYcisRhmTFkmEra7QbbYGL6mmegIgrymDKahYYcegYvsqgGBSJcHhvDyp1jH
         xfWk5Eklv3h1RK9yW5Ac80fTRDWj0fPv8pkppWJJE0IicL5iwXeaeD7lVEHk3/5qNpub
         HvZX1qBIGeWzLDypndnT+HGjEPWE5V5UU8WQVXMHLPcwAQKEdbW/Poor/IwIy042BX6y
         0gxA==
X-Gm-Message-State: AOAM5311u/4dueSu5bH4JnFKInYYmasW08yjnhRatju/e0BtSE2B0iO9
	CbK94PTYMqAFxBkYWkg8Jdw=
X-Google-Smtp-Source: ABdhPJwFnjZ39WZxAdya+gK2+R9rhlIoLIOOlrKMBu2VZNalUj6oWNaPTsH5VkM+I8A4xSlTvWn9fw==
X-Received: by 2002:adf:8919:: with SMTP id s25mr37724403wrs.185.1632253640965;
        Tue, 21 Sep 2021 12:47:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: r8188eu: remove dead dynamic tx power code
Date: Tue, 21 Sep 2021 21:46:50 +0200
Message-Id: <20210921194658.10654-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes dynamic tx power related code that is not used in
this driver.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (8):
  staging: r8188eu: remove odm_DynamicTxPowerNIC()
  staging: r8188eu: remove odm_DynamicTxPowerAP()
  staging: r8188eu: remove odm_DynamicTxPower()
  staging: r8188eu: remove write-only fields from struct dm_priv
  staging: r8188eu: remove PowerIndex_backup from struct dm_priv
  staging: r8188eu: remove dead code from rtl8188e_rf6052.c
  staging: r8188eu: remove DynamicTxHighPowerLvl from struct dm_priv
  staging: r8188eu: remove odm_DynamicTxPowerInit()

 drivers/staging/r8188eu/hal/odm.c             | 59 -------------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 57 +++++-------------
 drivers/staging/r8188eu/include/odm_precomp.h |  4 --
 drivers/staging/r8188eu/include/rtl8188e_dm.h |  6 --
 4 files changed, 14 insertions(+), 112 deletions(-)

-- 
2.33.0

