Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50C3FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 23:50:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z9so28532395wrh.10
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 16:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlSzoC7+vYGsfYhRVPf9602RHAilsb/3ia2lRqV6Ta0=;
        b=tENuzhQMiSw5/A9fuaRYyuzQbcVXgmSz4/Zyirf09Ze+uEJZ2h/dBnuwlXYIbMHMIJ
         /7KRZktUpPHf7Cg7DB80Wwg38JPz4g3OE4eB6Q5gf4dFwV6Y+0bc+b0nQ3s7hCSNAmV9
         FVfncEJa4Ttho6GmUeNWA1xuKGtAlwGk1ublBrg/6Dk3sejx/zWCB7OCzTMQh/WxQd3r
         ugz0Ou8TD5ld08yT8uh2jgDthrlVMfdRmWis5pgQquTOL3H0MMi/QXx5bjcQfgLIXGun
         zVL1HYIvRA+CuTcqTAOrS8o3zRLiO1duCrQLE4u9yeSi/N1Yflu4ed63WCGt9InIxGt9
         ycmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlSzoC7+vYGsfYhRVPf9602RHAilsb/3ia2lRqV6Ta0=;
        b=Ecl6QynlO5+v+cBZDgDtbEBJQOPEY3HbKo3rOfKlXHqW643oxhq053PvsRAwCZEMAH
         48qqRCG+rX4sFPr0QsSwx91mt3p4bVz8foZM+5UAA/anBsP4qMO9jm9CqdPvFC+KWMOD
         sIbxRWvTU2AIJoN7V1WLkqOJYimP/jo0EB5RMprTabo2DN58OhVDiWsW5WmFgbbyIG2p
         Udy/UqZJmAVJvQi3KKrGTz+d/Z8goYYcNr9e8Izou7rTjYpKjrn9udozApMu18kKKssC
         f+q4cVm/mpL8aJUbw2AxJu2IPOCYc9FsQudZ7BwXcL8XT3tw4dSmb0CBforuvK4oE9bN
         jSVw==
X-Gm-Message-State: AOAM531OUSDacFeTSLOtNR/zdLzk6QLaj4EQ1oL5LVo4sVjHxF57GlZs
	5RN7obUh9ZCc/7czqNnnyHc=
X-Google-Smtp-Source: ABdhPJyQwTRuk886qhJzb7vqBg+Mskg3FEEzM4Ur6ehoceQhDRMxYug0amLzI1xAy/TbmtOuHdR7CA==
X-Received: by 2002:adf:de83:: with SMTP id w3mr16449923wrl.342.1629762601700;
        Mon, 23 Aug 2021 16:50:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id r4sm562124wmq.34.2021.08.23.16.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:50:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: remove unneeded header files
Date: Tue, 24 Aug 2021 01:48:56 +0200
Message-Id: <20210823234858.2633-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the header files if_ether.h and ip.h as both just
duplicate in-kernel definitions.

Both patches were already sent as single patches but only the one or
the other can be applied due to conflicts, so I resend them in this
series.

Michael Straube (2):
  staging: r8188eu: remove if_ether.h header file
  staging: r8188eu: remove ip.h header file

 drivers/staging/r8188eu/core/rtw_recv.c      |   2 -
 drivers/staging/r8188eu/core/rtw_xmit.c      |   1 -
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c |   2 -
 drivers/staging/r8188eu/include/if_ether.h   |  94 ----------------
 drivers/staging/r8188eu/include/ip.h         | 109 -------------------
 drivers/staging/r8188eu/os_dep/xmit_linux.c  |   2 -
 6 files changed, 210 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/if_ether.h
 delete mode 100644 drivers/staging/r8188eu/include/ip.h

-- 
2.32.0

