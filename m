Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70147B;
	Fri, 21 Oct 2022 10:33:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id d6so4310121lfs.10;
        Fri, 21 Oct 2022 03:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgAh3eOsehBHDRMN9LqNbEShmB7iObrHTkO9H5vd/vA=;
        b=kyo0932RUqFoS76pXGEb6enHdCW8tgABYyWI+add2taDA+ePymUB7IKoMR2iX68ai5
         Fn7wR1QcXLDfp+6hJ+iWUh8upP44qRHzChr+H/zjhUcvaDKtDmo7kB8zmTHbhlxYLd0e
         EJFHMZD25S7PHb9CF78GiK2abCsF+uqZM99Ytk6uMhKBvyG1btiMsr2rmErrI3oHAw+S
         d1TGNOU0D4bEaBIf+FRWcFRqGsetOH36xDK96Ru6J3C0IXzz82spi9ZtQVHAaSUgtwU7
         G0xagF0T+RRtY4WRijQ5L+75Wf51owiadfMWfjwgycuxTG16PZ4l2TCektxrRc6VdYcQ
         gELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgAh3eOsehBHDRMN9LqNbEShmB7iObrHTkO9H5vd/vA=;
        b=5LCXayJppduH7UpCVTNiwjKwWVYbhHeE8tWXzpECphVXLne45ksAxx08igSgAUePUT
         3adi4IYIXOQDO+NAcvcCqvWefC1w0rX9dcXIvDizpJR6SHwYEgidpqGnxFzqdUMmL3xX
         ZUZhX407WATVW+UzFewwyziz90Ul+k91nZhfBiIwN4CtFzYPBSwuYA7vVc3vg7LQRX/J
         07cwSfHuDruXyMYh61B2Tm+QvO6p9sC0AttlAdr4hMTGS8uRlh7iibgITy6kovvQ/7tF
         sQFW6pLrOM1lf9wcLJ358Z44bDLx6eePhyupegZZLVVGpXTE4Q26tSo7RQODvNR3kQLW
         UkdA==
X-Gm-Message-State: ACrzQf1ugOXbQk+Q3Kwx3EEmv64Ojso7xKBGEVKl8pVLS32RaMW4Ydpa
	isyitfuft1IMkG7N5ANfFfc=
X-Google-Smtp-Source: AMsMyM5H5HQi404bwAYD4Pr2ZzoQ3xkfQaC4zGB+6uor/t8JI/PCmKWwFsXrOfd154GUyjofYZDqow==
X-Received: by 2002:a05:6512:1052:b0:4a2:7f09:4f1f with SMTP id c18-20020a056512105200b004a27f094f1fmr6723174lfb.59.1666348413568;
        Fri, 21 Oct 2022 03:33:33 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id u12-20020ac258cc000000b00492d7a7b4e3sm3119775lfo.4.2022.10.21.03.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:33:33 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 0/6] a series of checkpatch fixes on the file: rxtx.c
Date: Fri, 21 Oct 2022 10:33:04 +0000
Message-Id: <cover.1666347511.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: refactor long lines of code in s_uFillDataHead
  staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
  staging: vt6655: refactor long lines of code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 535 ++++++++++++++++++++--------------
 1 file changed, 323 insertions(+), 212 deletions(-)

-- 
2.34.1

