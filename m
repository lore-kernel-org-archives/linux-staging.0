Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBB36A
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 08:37:43 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id f27so11098865eje.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 00:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRcKVfIS8NDafd59OlyUFdzDuB31g5yY5UyB64GKppc=;
        b=SyvdF3FbMU8xxvtzWNKLFujAL/SkyCinpdysIw+4QBwISd7ANJfgSeWN+jfDXJXkdu
         5APNx5TeLxTQ6PyGMl2MxqO0y3MVka/YypI1qgGto/Ciday9F57hFisf0cWQdjxRYcXh
         FMO8YgnvK99GoYJy3ZcyhTBWR7c0aJx4Me/S4sptvnaSjKSKJW4vFLXNaN61CT24mKZb
         Vl42J9QpTGalvPOiY8Udw+dkc5n5k8/0fEpf9lC5zdQciS3XqOLcbsU0yv/UJTQDaXft
         9+kXPwwkDWlyLBp7i+NI+VWLEiaMLMpROkV6vygm3e6cyQ6Uc/0jLGtTkWiMEdA2/BxV
         6eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRcKVfIS8NDafd59OlyUFdzDuB31g5yY5UyB64GKppc=;
        b=fbL7epLL4w1aUg0LihNmodN6hnKEKmp5Kjo5vCZMrK3ejWK8MIrRYwLH/GwnxhVRXi
         uzGr2MPPPjay06vYZqCtEHtnzGFGgMw2Q1+R2XtP7H6RtLVMDWKkNUXG0J5BDcT0KwsO
         tBBPeGpji7/4rKb2a7G9gfOZwIaP8qTYQG+xVmpVp4/Q+jrNyByDGb8WIvAtQ8XJYkzd
         VJ4K1jfGS/34pIMaH98yzreKyKqf0o/CKiq+kSMvCnAn7uCkWS0tBO52gwKSDZhmI4Q0
         MTYRwIbZS629o7PCxYe/2BUKk6NatQF/FaEazM++cdrHJCnGoY/JIQNHFIdexxgsKwm2
         MlyQ==
X-Gm-Message-State: ANoB5pkA4yTSPEtFjbBU2kvdNb56WmCrjlQpAGfeo5gK0FmuhHJvCtlG
	0kCgGVSpo1dINqvW+SRNv7A=
X-Google-Smtp-Source: AA0mqf5EOz8LdwplhrJ1YQ0zy9XkFlFd9VEaRauyBvfRrYu9Hn+N7W6MWtKOYca0QissDU/Oq/WnMQ==
X-Received: by 2002:a17:907:2348:b0:78d:f796:c00d with SMTP id we8-20020a170907234800b0078df796c00dmr1042024ejb.251.1668155861940;
        Fri, 11 Nov 2022 00:37:41 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9a.dynamic.kabel-deutschland.de. [95.90.187.154])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b007ae566edb8bsm643190ejh.73.2022.11.11.00.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:37:41 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: some _FAIL, _SUCCESS removals
Date: Fri, 11 Nov 2022 09:37:29 +0100
Message-Id: <20221111083733.3144-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more uses of _FAIL and _SUCCESS.
Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: convert aes_cipher() to void
  staging: r8188eu: convert rtw_xmit_resource_alloc() to common error
    logic
  staging: r8188eu: convert _rtw_init_xmit_priv() to common error logic
  staging: r8188eu: binstallGrpkey is set to _FAIL

 drivers/staging/r8188eu/core/rtw_security.c |  4 +--
 drivers/staging/r8188eu/core/rtw_xmit.c     | 37 +++++++--------------
 drivers/staging/r8188eu/include/rtw_xmit.h  |  2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c   |  4 +--
 4 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.38.1

