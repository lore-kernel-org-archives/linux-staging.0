Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204822580
	for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 17:20:10 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id fd6so13287323edb.5
        for <linux-staging@lists.linux.dev>; Mon, 20 Jun 2022 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hL7ahHjXLTtDBm4Zo1lgep1oM+nfQRKvYlwijREaM3Q=;
        b=LgttyniPQt4WnC8F+XhtOu3KXpbw+EU1ypNXIZNZ6sejWgT6UdE0Js2EgBn/mh/4v7
         V3BTvIYUuv/VyQnPASBHgiUTEBm+V49O/Bp1h6lL0kDyP2FFU9n2Y1yXBDmviqiOj8cV
         WxNqLrVOqJL1Al2G4YDwIED9c4JrMR0WxIECLn/E9KRvbyx52awl1se6QxAxGNW5f5au
         BV3z3maRflaA/J/0d5Kwohtz0gr4BIdBiHQ4vYiTC+HH01/HNcnAhe22+NvX9hOzVYwU
         9xJ+86noDsiBwF7haFzlwYt5g9TJQcnBeXfLAXGVteoH9kQXjj9s4KyNuvwRYxGaT63U
         VyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hL7ahHjXLTtDBm4Zo1lgep1oM+nfQRKvYlwijREaM3Q=;
        b=WCtUi14ZR/YNUx/SphJEM850GDpLRwIgXt6t60r/BjxblmlS2FlVLTzY3ct/pBKwuH
         LsaIOrz3amS/MmaCnuYyRUL1OIjO+yLRyq54Vwkyga3LJSzzyIyYBj2pMmZrwokcH2MQ
         o1ZTiFoGfxbhhGOPBOfJ/0G4KnU+ng3DEG3ElG9X3YssecHVKJLNTRy4sAZPIy1q2SWT
         VvpEqPT1SAqSrtKLRhOtREjk1SkhH5sI/eclLTA+71C4SYceFi2spnI8UXCT3jTwSBKe
         izARkHfaQtT2HzjHe4/CeOH2GYH4uUhalPqJgFYH9GcEz9tPPOS+Rrh6Ms6LJw6QO2GG
         HCNw==
X-Gm-Message-State: AJIora8v6XYT1ldGwDbusYG9UQQP30lNMrJLFMdZnz77OFru6rTWTik4
	3imOnj6sqoPsIl4U9tk1kpY=
X-Google-Smtp-Source: AGRyM1s332Opp7vmMFHI71MQj8TqEt5Gtku8OuHELM9Cl2EAnzPta/OJ7HE1WBA3utEFgT6XVF0S2Q==
X-Received: by 2002:a05:6402:3224:b0:435:80fd:333 with SMTP id g36-20020a056402322400b0043580fd0333mr7518995eda.76.1655745608289;
        Mon, 20 Jun 2022 10:20:08 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:9959:ca73:b489:46f5])
        by smtp.gmail.com with ESMTPSA id b9-20020a1709063ca900b0072232a898f1sm3409066ejh.103.2022.06.20.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:20:07 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Subject: [PATCH 0/2] get rid of useless header file
Date: Mon, 20 Jun 2022 19:19:32 +0200
Message-Id: <cover.1655745123.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stuffs in basic_types.h are either not used, or already defined in
the kernel. Get rid of it.

Nam Cao (2):
  staging: r8188eu: replace N_BYTE_ALIGMENT with ALIGN
  staging: r8188eu: remove basic_types.h

 drivers/staging/r8188eu/core/rtw_recv.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c       |  6 +++---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |  2 +-
 drivers/staging/r8188eu/include/basic_types.h | 19 -------------------
 .../staging/r8188eu/include/osdep_service.h   |  1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c   |  2 +-
 6 files changed, 6 insertions(+), 26 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/basic_types.h

-- 
2.25.1

