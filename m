Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B1168
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 23:47:28 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id p37so13033853uae.8
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OsjqkGqy6pSC1mMC8XAbvqLyGbXxj+iPNK2s4dSfdoI=;
        b=BpPKfTU9PLl/3gxNIUmI6BsxTslJeFHYClQVDUdZ/WM8hwSwthcEXCT6yWA7hYh6d3
         oyWdTRpE1SF/sQnHcwWByTpW86izTuXwkgw+C9VlOAV4SIfI4MIU8OGb5Plr1b0Mdq9b
         weCK6zBIaI7W21cyO9Qx0lo+iBap9dkwcksx7A2bKWTPKWvt5DW61FdifC9bokl4FOXk
         xHE+6v9MMKYIW6N7rFAWSoelTk5SJ2W7kNLmv350DmbDve+0nGToFEeiBIO+Zb7x32TJ
         j/LTYb7/e2hGdqRQmMvcAFwbtP1mWDeaT1WlZjFOI3IvNGwqvyKq5Idq5j9S1/H5jRpf
         W7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OsjqkGqy6pSC1mMC8XAbvqLyGbXxj+iPNK2s4dSfdoI=;
        b=DiPualgMQ33ghJU3buqkZhp63cjpZV3vnOM0OBR21V+JHk4MTvjXdxMj003bmcENG1
         Kr94YPWfod5LoOkQMrLiRazJ308C4NQ3hcrhn6I9jJzDDjpJekVCp1UHueEVkoJ9w3A5
         8dcRyuqKzZMVQoPC1DY/VPJxuH0IvCxNdDrZYhulztruUW4tWRsWr2ENLdyfOUDuNlxn
         WeBhSPlX8HMtr7h8XwT6QriqhnEmA0uV2N1r9E9St5t/1CeTKTiiV/vpudhKjWmLo/U9
         wEfsvFdi5hWTEU5qwE0QFxgYxt/rwLpZDoAmGy4FrNAsff4gz7QeAGSn597rUgG+7jxd
         SV0A==
X-Gm-Message-State: AOAM530ARdF7tmEfaHOyT3Ggk+SBbg6k7bfjqW0tniRyOsVHtmCbQJTT
	wz0bkAc2tUfLrg19Eqsiw4AS+s1xJXKyYA==
X-Google-Smtp-Source: ABdhPJwrSzqlFKGcNBdOv3GhMjwTcnWT88Ui7uhRd4SwoIwTpxZaMLTkf0RmU9SwqCwhWBuLF43qJQ==
X-Received: by 2002:ab0:133:: with SMTP id 48mr21245117uak.132.1641599247302;
        Fri, 07 Jan 2022 15:47:27 -0800 (PST)
Received: from localhost.localdomain ([181.23.94.152])
        by smtp.gmail.com with ESMTPSA id az22sm92911vkb.15.2022.01.07.15.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:47:26 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/2] staging: vc04_services: cleanup macros BM2835_MMAL_VERSION and BM2835_MMAL_MODULE_NAME
Date: Fri,  7 Jan 2022 20:46:18 -0300
Message-Id: <20220107234620.49900-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches cleanup the macros BM2835_MMAL_VERSION and
BM2835_MMAL_MODULE_NAME.

Gaston Gonzalez (2):
  staging: vc04_services: remove unneeded MODULE_VERSION() usage
  staging: vc04_services: use KBUILD_MODNAME instead of own module name
    definition

 .../vc04_services/bcm2835-camera/bcm2835-camera.c      | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

-- 
2.34.1

