Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995872
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 09:22:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so14151619wmd.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuqtcpP3rIjEbiNh0/a5W1SAUG+Ekfy76reIa1RHBEs=;
        b=FBdSJbcIU22yHl9jEkdT9tdDwyM/ddbwcyu/1ryWWeq5VZPT0zMi6z+prg4eD8jejv
         aHUloUPy+VVV6R1nNICO98ZjQljfH1cfBS6JUFo/deRZKpBHbIup/HLpPKGE9SY4ChoX
         b7+sBMskS4v+ognRYOvJlvk9hQtMFAdaVCivaignNFVGRvjLMEhYUHzdZGTeDfmN0LPI
         X5ZPw9mvbupp8U1Y7Qa/oayw7QmWP2TaMrZ8qCp5upXtTVQ5cM2a5gd+LOH4pzGvfsQj
         cm+5nPkD9dIRyqiEUctarquvPqFSiYuBpNXbd2Q4ecHrnasWdj36E83/yJ22SbdTnKEM
         P3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuqtcpP3rIjEbiNh0/a5W1SAUG+Ekfy76reIa1RHBEs=;
        b=V3P+8SbfuiAEGycUiU0y2pfkmkcohhr1m6fvyppMtc5s9RLoHGaze9QkG4nxUHSoiO
         09tcLwDyVYwyycPAcxDQiMQwUeuxksnkHt+wXQ0vU9TvpO+8QusmXwvyWDjHkkpyPiy6
         W5Swm07ydJmiNmZ2VQRREFfthEpEvHd7D010JBgxOJSg9cPOCYVi1kb+nhJ7s9bK/OqT
         ed21hZZ0blk7O3Q4kDFeq5/Xu1zCWpF94MqSWgZU2/mIF6fvli3MDJVCpHLfshpuXuJL
         zXP3jLUqdNSo9hemCzY0oqOYrg8AsibL+Qp65mGyDSz1+UCW/l7DjUaFNlD4nKFweaHd
         /o7A==
X-Gm-Message-State: AOAM533Lv/gqx9o900NGh4tJpyzp97RMzb/lspcdmiCvMt5baDaO0Wkk
	oBYShQHGYGc8OkAwFSb1MwY=
X-Google-Smtp-Source: ABdhPJz1FCF7O+QYJq4HCDBbwo6YpsC55+HdwAa/JhSVk36SzPhTVgILbgJjiEGpxFeRvswxJe5/rA==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr15753616wmj.122.1630315321065;
        Mon, 30 Aug 2021 02:22:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id j1sm18378248wrd.50.2021.08.30.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 02:22:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: remove code for other chips
Date: Mon, 30 Aug 2021 11:21:49 +0200
Message-Id: <20210830092153.9283-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some code that is valid only for other chips
than RTL8188EU and is not used in the driver.

Michael Straube (4):
  staging: r8188eu: remove Hal_MPT_CCKTxPowerAdjustbyIndex()
  staging: r8188eu: remove set but unused variable
  staging: r8188eu: remove ICType from struct HAL_VERSION
  staging: r8188eu: remove unused function SetBcnCtrlReg()

 drivers/staging/r8188eu/hal/hal_com.c         |  13 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  19 ---
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     | 139 ++----------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   2 +-
 drivers/staging/r8188eu/include/HalVerDef.h   |  61 --------
 .../staging/r8188eu/include/rtl8188e_hal.h    |   3 -
 drivers/staging/r8188eu/include/rtw_mp.h      |   1 -
 7 files changed, 12 insertions(+), 226 deletions(-)

-- 
2.33.0

