Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640E1FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:53:03 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ot30so5513131ejb.12
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGWC9z9Vble15uohjVceMy9pmNPvA8ixj7T4/I7j2vg=;
        b=eysorBVn3uf8H6RmlcB4Y5q6Uiqu9VJI6vguIsiW8ijsMcWha2M5Ru92qDdfkK6V8b
         m0G4kxUXDhxG6GKopOg+qvJ2uiA5n99+BgXGelAtrejCQqxzFpn1W0DYhRp4GCPIKDGo
         peGizf/+uC6QCAf6xooViaBPcBd1YMVj/T4cb506C5+X9RfR7LaXaN3wivuqCRG1yIWb
         I98umR3e+WW3aeinfhfyP87cEizGuQFvEOR0dnfBLPVQf8F1Xi/Si4k7IsKMpnz2f6Wp
         ABItaMzMaExtIQg0PtS3ue/0PIyQv6okQ2MEkrGJ9tocmknXtPS3yPh57jlH5018rUy4
         8cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGWC9z9Vble15uohjVceMy9pmNPvA8ixj7T4/I7j2vg=;
        b=UopNBAbOXEcOBxAY5f7JIGo+gARXHaCnpJUn7sm+WwyHLVkMpz4ocXjRHrz/uYnNVu
         nFT41KqnDbcSwNJmxgRbBF9dl1Pfh7HhZQRUzL18ijnnWftLUtLJ3xbo551Lh3uqu54Q
         PFvM4ZAeldrcjzgkK61f1REXPXg/LqSQiMWbTeGY+ygCeQNC0AER6Iqw7SrsqGXcVMTK
         nMzZXk7sUOySuOGb9aiTPmY87G9rN+vmSCsQB/uMmIpUlvc+xWzhzy5DRgu8jvdwFvbp
         JMjx4cTaznNUBbzMsWRKqE36IWM6qmJcANL2IfmDtVelLxBZMVc34OOeYGGW8ohxnpTJ
         wohQ==
X-Gm-Message-State: AOAM530hKN2bKOjIkIdsA1A103jUldojFPPfzi622nv30pGuPq12xJjG
	yEM3h1Ba3xIWVDtaDs1/aAaCYJZP6TQ=
X-Google-Smtp-Source: ABdhPJwGAoEhkgr7k86IejYdeWPiUf8Ssp0RP2typ0RgA6GgyE6WRpNu7wrCgyFnm/sAyvBNhuk02A==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id nd33-20020a17090762a100b006da7952d4d2mr7550856ejc.260.1649004782072;
        Sun, 03 Apr 2022 09:53:02 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm4018138edu.11.2022.04.03.09.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:53:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove GetHalDefVar8188EUsb()
Date: Sun,  3 Apr 2022 18:52:50 +0200
Message-Id: <20220403165255.6900-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the function GetHalDefVar8188EUsb(). This is part
of the ongoing effort to get rid of the unwanted hal layer.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove HAL_DEF_IS_SUPPORT_ANT_DIV
  staging: r8188eu: use support_ant_div()
  staging: r8188eu: remove dead code
  staging: r8188eu: remove HAL_DEF_CURRENT_ANTENNA
  staging: r8188eu: remove GetHalDefVar8188EUsb()

 drivers/staging/r8188eu/core/rtw_cmd.c       |  4 +--
 drivers/staging/r8188eu/core/rtw_mlme.c      | 11 ++----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c    |  8 ++---
 drivers/staging/r8188eu/hal/usb_halinit.c    | 36 ++++++++------------
 drivers/staging/r8188eu/include/hal_intf.h   |  6 ++--
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  8 +----
 7 files changed, 26 insertions(+), 49 deletions(-)

-- 
2.35.1

