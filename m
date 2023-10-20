Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE18F5A
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+yuiqKB"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-777719639adso42389685a.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697805930; x=1698410730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1iwvLTq2T841qY10LF8GOUyS20mcZ4CoMQTfhMBIOU=;
        b=b+yuiqKB0tv95JishoAt2JD6UC0HuWVwiuFdOmi+McWeHjalE75kOk+lixdYv9UAqY
         cecXmiExNsBKFeluKGK4UQ7YFrdqpF/YLf/Pe5WO5GJ+ZbuMRI9JmSnvwGmY7sROI8Xu
         99I5wieWyBRfgKq6kMU15re6tse+L8gCWISHDcVjs3ewRjCQre+9YQ9FVeSRJzu+rqAP
         HVhNolADML2BtLJEB6BzGa/hRxgiwfkrfeoWsPp/U+GxMGkIayYo+dHX3O/9HAyNCSrF
         v1h8m1acyHSkjMjyRrp1ug9OIcNog8A0RDjgSiy13C+x8vsUt/t9AErQBXufdnc1BIYo
         ZyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697805930; x=1698410730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1iwvLTq2T841qY10LF8GOUyS20mcZ4CoMQTfhMBIOU=;
        b=d8VPtEHtst5nxXakq9s9JIhpR0+CS57+hGRYEmLG0X3ru4r6GNmyUA1Z8wH5aeUovn
         RtuoRw7vhdcev9mGYNJJkAvPNJfNtdRuYi6ntT7OR46Bt9ZYJUSI8MLrIFgQB0Nx2bmM
         bW97J4oSHQnBFuA4mYPPCZhJQ0u+Vj32yzVOHIZNboffH1Rhr1ucl/sAyg9kOgiSXZwy
         UaARy31ZP25PHLPsSKexV0mV1wCOL9qKisTHojJZ5e/goSMKSiKAkbdr3DGRVZ9i1rYB
         F6jhuspZbr881af4KScm/F5mHKaH9gIN+Hi5Kjw4xMxO/oOjlvqfrQY4+z3iVYoG1bGs
         KsWA==
X-Gm-Message-State: AOJu0Yz9HK8fxvWs5pROObXPZnkuZHspT3Gd+cI1na+yCzYXGBjD3Ytb
	tGmCbve2D7nGszRasByFzLo=
X-Google-Smtp-Source: AGHT+IEJkzCDPpptDXF5Wq66CNuBmxbL9vD1ANrVpxErbMdo6XBa9bwUqjstTvGGeqJ7Hbco+Mgvlg==
X-Received: by 2002:a05:620a:1097:b0:774:1795:4a89 with SMTP id g23-20020a05620a109700b0077417954a89mr1471961qkk.71.1697805929638;
        Fri, 20 Oct 2023 05:45:29 -0700 (PDT)
Received: from localhost (modemcable065.128-200-24.mc.videotron.ca. [24.200.128.65])
        by smtp.gmail.com with ESMTPSA id c3-20020a05620a0ce300b00770f3e5618esm573928qkj.101.2023.10.20.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 05:45:29 -0700 (PDT)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Ian Kent <raven@themaw.net>,
	Sven Joachim <svenjoac@gmx.de>,
	Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
	Sumitra Sharma <sumitraartsy@gmail.com>,
	Ricardo Lopes <ricardoapl.dev@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Manish Chopra <manishc@marvell.com>,
	Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH 0/2] staging: qlge: Remove qlge
Date: Fri, 20 Oct 2023 08:44:55 -0400
Message-ID: <20231020124457.312449-1-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the qlge driver from staging. The TODO file is first updated to
reflect the current status, in case the removal is later reverted.

Benjamin Poirier (2):
  staging: qlge: Update TODO
  staging: qlge: Retire the driver

 .../networking/device_drivers/index.rst       |    1 -
 .../device_drivers/qlogic/index.rst           |   18 -
 .../networking/device_drivers/qlogic/qlge.rst |  118 -
 MAINTAINERS                                   |    9 -
 arch/parisc/configs/generic-64bit_defconfig   |    1 -
 drivers/staging/Kconfig                       |    2 -
 drivers/staging/Makefile                      |    1 -
 drivers/staging/qlge/Kconfig                  |   11 -
 drivers/staging/qlge/Makefile                 |    8 -
 drivers/staging/qlge/TODO                     |   33 -
 drivers/staging/qlge/qlge.h                   | 2293 --------
 drivers/staging/qlge/qlge_dbg.c               | 1311 -----
 drivers/staging/qlge/qlge_devlink.c           |  167 -
 drivers/staging/qlge/qlge_devlink.h           |    9 -
 drivers/staging/qlge/qlge_ethtool.c           |  746 ---
 drivers/staging/qlge/qlge_main.c              | 4845 -----------------
 drivers/staging/qlge/qlge_mpi.c               | 1273 -----
 17 files changed, 10846 deletions(-)
 delete mode 100644 Documentation/networking/device_drivers/qlogic/index.rst
 delete mode 100644 Documentation/networking/device_drivers/qlogic/qlge.rst
 delete mode 100644 drivers/staging/qlge/Kconfig
 delete mode 100644 drivers/staging/qlge/Makefile
 delete mode 100644 drivers/staging/qlge/TODO
 delete mode 100644 drivers/staging/qlge/qlge.h
 delete mode 100644 drivers/staging/qlge/qlge_dbg.c
 delete mode 100644 drivers/staging/qlge/qlge_devlink.c
 delete mode 100644 drivers/staging/qlge/qlge_devlink.h
 delete mode 100644 drivers/staging/qlge/qlge_ethtool.c
 delete mode 100644 drivers/staging/qlge/qlge_main.c
 delete mode 100644 drivers/staging/qlge/qlge_mpi.c

-- 
2.42.0

