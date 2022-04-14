Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87A7B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ks6so8709285ejb.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB4kilg+/jA91cTYXeFtmrlj5e57Ul2uuK4gQaNzlZw=;
        b=nKjsgM333Aqv36Jl50BZR8f5Q58KG4h1RfldtzhYuK4xT5FDh0eDV4Xo3qM5CSzz7U
         bOtGoNbyHlftPQ0y/Z8tIbJ79jQkXqEyoPvP7YPdeMD7TjxIw8CUHRouEhzyxdBa0hW/
         tLgngXExu8pkPHdL6DS09WjgrrxQ6E5G/yvL2IR3ex0o+ujLDY0ZpAV3xNr9Z6H4fucx
         UvKLUqXj3T5OVUluZxuL9tiiLWJxOWhwc2T/gAl3GEvlINdilBw2abTWvf0sDNfT2z3H
         v1mWsjSEP/nE1uB1fnH3fekvWqieAWA9CE+vytjMvu1/Mb8OZoagtCIf36Qernep1mnU
         32cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB4kilg+/jA91cTYXeFtmrlj5e57Ul2uuK4gQaNzlZw=;
        b=uZsitwOX2eGm0maXAqm1vysJ0/7HNRp9DrxGXHo8o/2KzTir0ocGwUQfrWWbV9UL6X
         gCnWnEEwV7h8EVp1rxNRNLpBBMYB64YKXKTFr9VyrZc80HKPtBydNuds9vOSHXeKSMmk
         X7ff39JTOIm8+w+t5E5QSg8TRj9zrtkrnCaVucmbQXVwwqCzHoB8TJT4YfilxyaYwo02
         1ViqU8alIp0C7J+QcOXSKY8et2S37vcfgCSGBNUuJhm1fSfD6RvH9Aw8lVQ+FUWKESw6
         NhfGpy9j8FdmNC4mHQKq81rSN9WbvUozzw7rC3SLcpos4HtQQDn4S8QAgokCu2WjfxL5
         ccKg==
X-Gm-Message-State: AOAM532hIFoYc8iZE+E5tQYueVfV44zL70qOgBA+K20ltGJrqA2sLSrP
	XG6GxvdQL1Wz3lUnDpDC9vo=
X-Google-Smtp-Source: ABdhPJylS83UA9NAUOMN8mCqXYytG7ayAcCQNLZ1+NLN8soWkn4QWK+JG7C5Ja+ktAorYgS8+RE4ng==
X-Received: by 2002:a17:907:7f94:b0:6da:64ec:fabc with SMTP id qk20-20020a1709077f9400b006da64ecfabcmr1395566ejc.717.1649925548124;
        Thu, 14 Apr 2022 01:39:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: r8188eu: fix and clean up some firmware code
Date: Thu, 14 Apr 2022 10:38:46 +0200
Message-Id: <20220414083853.3422-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes wrong size of struct rt_firmware_hdr in the first
patch and does some cleanups in rtl8188e_firmware_download() in the
other patches.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (7):
  staging: r8188eu: fix struct rt_firmware_hdr
  staging: r8188eu: clean up comments in struct rt_firmware_hdr
  staging: r8188eu: rename fields of struct rt_firmware_hdr
  staging: r8188eu: use sizeof instead of hardcoded firmware header size
  staging: r8188eu: remove variables from rtl8188e_firmware_download()
  staging: r8188eu: always log firmware info
  staging: r8188eu: check firmware header existence before access

 drivers/staging/r8188eu/core/rtw_fw.c | 75 ++++++++++-----------------
 1 file changed, 26 insertions(+), 49 deletions(-)

-- 
2.35.1

