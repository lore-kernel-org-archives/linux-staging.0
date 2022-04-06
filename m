Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B97E
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 06:19:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g20so1357252edw.6
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 23:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mhXUcy9K9Pn3mobbZPyUvJVrgWzwSgkEZ6xzrmm1G9I=;
        b=oy5+TSPG1XLg9ubfohlBh0LafhyPO1CagI0zqJWxFoyVCmrsziM4lv5PryW+OhwyGF
         WxZqPjiw7ZIP2K/vf6rbSbhOenF984H+7rUgD8gANx5+un6qQRAtvR0GV3snDkwr8qje
         hng4WSRIik5BjUlo0xinKFituCXPX9sniijZXoJOKsB+2qjXSsYM/EZ4E2G+yMno4p+N
         8QTf5ooyM4heeQF55GQRTHqHk6Yo88QZDh/fkz9MxAPl0EscJw21xI4gKxZf2BBI+Z91
         0w8Azu/Qu9U1gufJCQZDTLAkaVya27WuBtKJfsMvCM8QeD8xev/RepKt8KhZ2CiO2GFY
         Ms+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mhXUcy9K9Pn3mobbZPyUvJVrgWzwSgkEZ6xzrmm1G9I=;
        b=Q9pMXi76P19El02EriYl2aTGXWJB5EqXjD6VXiwaVSMt+RzM76EYYInDaDfJvy567+
         p/ZE47zjBEnuBnP5KbUfYfC1ZImwQZLkfVrcmDhtp9Dv+COSqNn0Cz6SlgnDcdy0hJWk
         F3nWekHl65FtHCrDgLF+C0fJwra2Do6TQ+xfY/otWX+yFuS3XtRkUElJj8mRDH6zx0SI
         hxfpP8mj9is0NovLfSh/veJ3khiOk5Rr5tdiJtWIGCxcdhhykpJPNVm/A82qWn8I0Yv3
         S5CSuZZNK/plEBYtsTOOL66NDOOowp8pNE+eMgmMy6g177BvehS6oUs4tfXlrHWfU12q
         9pOQ==
X-Gm-Message-State: AOAM530sDKodQRky6bARob+tozx/bPPj7t16PSpyVNLVyEaTDWlbGy/s
	hPMKZ3I/szZDynoqFiWkzDs=
X-Google-Smtp-Source: ABdhPJy/ljDagNPU3F2GD5sXL97C5xeiHPwAtW/wOWPCtPWqSEEzpIaTkMk11IsXB8FAUguuWqreqw==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id s11-20020a056402014b00b00418d06e5d38mr7031243edu.90.1649225951685;
        Tue, 05 Apr 2022 23:19:11 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm2475251edj.27.2022.04.05.23.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 23:19:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: use round_up()
Date: Wed,  6 Apr 2022 08:18:54 +0200
Message-Id: <20220406061859.9011-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the driver to use the in-kernel round_up()
instead of custom _RND* implementations.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: use round_up() instead of RND4()
  staging: r8188eu: use round_up() instead of _RND4()
  staging: r8188eu: use round_up() instead of _RND8()
  staging: r8188eu: use round_up() instead of _RND128()
  staging: r8188eu: remove unused _RND* from osdep_service.h

 drivers/staging/r8188eu/core/rtw_cmd.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_security.c   |  6 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       |  4 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  8 ++--
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 43 -------------------
 6 files changed, 11 insertions(+), 54 deletions(-)

-- 
2.35.1

