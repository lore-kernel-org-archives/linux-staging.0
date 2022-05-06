Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8C807
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 11:59:13 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p6so6655332plr.12
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=k/db5mDIqxF7tWh2TgTqZMi0bDMawymBz0T7VjfdAXY=;
        b=ftM2/RuajOJCsGPt4mHROqHa9jy0342iIxQeK6RY+ohhEpSkNHmIMdtGnRaTgcbNcB
         aMBupgCqaxm6MxXZGeMQ5ebp+vdKXSYwwgjv+Hor3AomzdmvYmTBIi9LPHpjSe9bPSHV
         kW/wFlnAdG51rsEND5zC1ITDFX+gtArS321KRE/7eYD3oaWAlDaobYHprZfSb1MB4Dpg
         cuBbJDtInMNKyM9o78BLml2DEifpvqDfbFjvfBeeE2MMB7hI62FolwJJgI6fefxW54B1
         4VMBgs/IXpcNtH2n9OYReZP5oir7n6a3ZvcbbRqO11Bb8BRNX15itfwEco1RinOw9LFi
         e7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=k/db5mDIqxF7tWh2TgTqZMi0bDMawymBz0T7VjfdAXY=;
        b=MfUDPH2ISxvCnVWnuIeYZDZpCpuzjLODjOmxZFev1UsR6uCTMVX4ekgOAiOjY5Zim5
         Q7weGizh+Qh6HFizbW/XVkfRdCNtTkNQP30vZOj9l9EilyMqDx/W9GGi40ChfMWPIl6p
         dfzJRZTNU+pnSYkDTpJ7qxEP4zy5vgRyyeuYZe/vFJGesuYrM73N6foeblsCYqR2VdpR
         mmhqoTMvG6Qm1yHfZGpVe7Ba7rvWi2MTaqDX8XvQVRbFwcy8faGL4uOI3u1kdGqG71h/
         HwrSnYHjK08sTpqBbh+j4MvapEwnNBghPKYztBRBVV4n2yr/gRxyjiBRq/QgOLgyEfE5
         R7nA==
X-Gm-Message-State: AOAM5334bGl7IE5V+21Wt8ednPCGAvCu0OSmCGGjBkH0i6QO5+Hf7GZK
	sB6WLK9gvOvu9KybikLJTTJMc3h/Ja4=
X-Google-Smtp-Source: ABdhPJwzlpHqgyZVbWY5+k5LR3EhCUN8ijXNyBkObccZ5nKE9GvaM11n/yjQHU1caBwSWd1Pc845Xw==
X-Received: by 2002:a17:902:9304:b0:15c:fe50:6581 with SMTP id bc4-20020a170902930400b0015cfe506581mr3205572plb.132.1651838353236;
        Fri, 06 May 2022 04:59:13 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id g67-20020a636b46000000b003c14af505efsm3132460pgc.7.2022.05.06.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 04:59:12 -0700 (PDT)
Date: Fri, 6 May 2022 19:59:07 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] staging: rtl8712: fix KMSAN: uninit-value in
 r871xu_drv_init
Message-ID: <cover.1651833575.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changelog v2->v3:
- Add error handler in r8712_usbctrl_vendorreq().

v2: https://lore.kernel.org/lkml/cover.1651760402.git.wanngchenng@gmail.com/

Wang Cheng (3):
  staging: rtl8712: fix uninit-value in usb_read8() and friends
  staging: rtl8712: fix uninit-value in r871xu_drv_init()
  staging: rtl8712: add error handler in r8712_usbctrl_vendorreq()

 drivers/staging/rtl8712/usb_intf.c      |  6 +++---
 drivers/staging/rtl8712/usb_ops.c       | 27 ++++++++++++++++---------
 drivers/staging/rtl8712/usb_ops_linux.c | 21 ++++++++++++-------
 3 files changed, 35 insertions(+), 19 deletions(-)

-- 
2.33.1

