Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E173FC3
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 09:02:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id x6so2614110wrv.13
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 02:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqCyO1mG9ovNges4P3yiXDZD1penTas/8IEFz1KTDdI=;
        b=P17ld7iBxQ3i8w4fb/Ij9aE9sSXdPv2eKQQiOZwnyGvHbkOUmYO8YiKdcFlxp0UFVn
         l8nkMIqLjBxt1Kw82AqWsf5mx3ode/CSMiQkoIiXbTK2Q7yVfcaVUmkblXKBOdXjvE/N
         ZaEgEt3sSa2LI51hy4ZROc/BThUVd142muMbHK5WGBXeWPRiO9P7kIWJTTeQaM+wjvhk
         oEgO8iCRMqSh9R0/iKk7+UNx+M058ZCqeLnPamFci3Jo4TFSeinpsqV2l2of206UaRNH
         VLqXVFgkE9moT1yAXmnpnxCO1C8hTlHaCE/IDys1yHoAMhhG9mvjEqnu1/qi+HsQ6PFK
         m4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqCyO1mG9ovNges4P3yiXDZD1penTas/8IEFz1KTDdI=;
        b=y/TuvRJXX2QLYE4vgKPf3uMK8tTbVwib9XZD6XhN+0/1kkZWqIHod0usauZDmYHBVJ
         eB8RmuHmJG3HdxidsPh8z0I8Vk9ticUZ/bcqxDiA2UDTSF8DIUDzuWXRPh4o21VoJiPq
         ViTFGgk7hB/A4Ij02ukhz1N9qHQneJG0Kix9MU7yJ+TiM78QNmz/okL2GdCY956TKNY5
         qz+dupguh1TyDHMJLJ+GVepSPEx2yK51tP6bgRV/nbBjOqhZ+iwB2lX+BSyQG77Hnf4I
         hSPA+uNQhacSAz7hLNYQYS47V8NGK+a1CuP3xHsPt9aQgyUZVep0y7pjPRL7bUxR8xUV
         5MUw==
X-Gm-Message-State: AOAM531IRn6p4E3653Y+8R3yfw9qcsAA0WfuZGlQdG/UT+tspzT1QSUF
	HiXOi/SGbg66aU6/k1uYyhg=
X-Google-Smtp-Source: ABdhPJxAXDP3qv6YPXzvn7hHyTgu3aJUH3M6woXe70hweKKO1SvalSh4fCZtsmc4DIkJGPiY64lXqw==
X-Received: by 2002:a05:6000:1623:: with SMTP id v3mr3790400wrb.288.1631696537566;
        Wed, 15 Sep 2021 02:02:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n186sm3565530wme.31.2021.09.15.02.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 02:02:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/4] staging: r8188eu: remove unused fields from struct hal_data_8188e
Date: Wed, 15 Sep 2021 11:01:52 +0200
Message-Id: <20210915090156.4169-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some unused fields from struct hal_data_8188eu.

Tested on x86_64 with Inter-Tech DMG-02.

v1 -> v2
Fixed a typo in the subject line of patch 3/4.

Michael Straube (4):
  staging: r8188eu: remove unused macros from rtl8188e_hal.h
  staging: r8188eu: remove write-only fields from struct hal_data_8188e
  staging: r8188eu: remove unused enums from rtl8188e_hal.h
  staging: r8188eu: remove unused field from struct hal_data_8188e

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  5 -----
 .../staging/r8188eu/include/rtl8188e_hal.h    | 22 -------------------
 2 files changed, 27 deletions(-)

-- 
2.33.0

