Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3C3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 16:25:33 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id s17so39822579edd.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqXZqy6TiqE8eE00BF1LDOzBg1qch1dHyP2OJeEPPiA=;
        b=XazMtSJSZkz1wAJVLRJT1NXQav3+p2ru3lzc0Oz4oBgxrL/DZuNeWb1gWdwSvcqopE
         Vh9nj/eNuLTqz+NhKMRNPY8abUgcpXRQfw5bRKYGgiSC9C+lmS4QRQqvTuwK/deBsS4z
         hu7I+d7PGPXXL3zTWs1nx0ODCNU+O2AovTTfVvUHjtkXszDJsA27+N2fyGWu13gQfZBX
         46r9Dcl3kkIVbLXPeISF6GzVNsYuTewz7BHx45IWQD+vnyOzMPH1OZ6aG8SDUzYJwSt0
         ZOmnjV3Qu90ckuUKQdPoTzTLrERthCRnCB68VDNPIQF9hpml7+EJKQdXTU+BrqGLKDjK
         NfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nqXZqy6TiqE8eE00BF1LDOzBg1qch1dHyP2OJeEPPiA=;
        b=mWYjY0n6t3BYlAO/ndXRSGfVLxm3o7E6snifB6WJN08d7X/amcvzzNUmrp3dBilIKi
         8nfojAKQDCq+cvfS3GQ4xMLZN3PEKIgVSlNHs5unRqvBZwRQP0Q2VXbXCyHWYETxDE24
         eLQxS12eXks6UqrxfjGTPIa6Q6/LtAKxUTD0y9Nj9mUjEUsSit8f5Zq0vgauJtqeok6S
         Bs+Q0xZfHdWXG+doD79geMFze/MkkgJ5P3TvR4gWvCqSP9PgCY3cWRukRdCvhYjrsADB
         shSGQsqS5yAY1ivJ2XcKoZKPWLNSwKzqcAs6MEkev9WB5o7j+dxtk7Km7IEdWYlPGUbL
         wqbg==
X-Gm-Message-State: AOAM5314tl9vape36boqEnNjVduHlrknuaxUgN/K7ib/4Ti9cr4DtYlO
	hRuPcqC9UHFfbYqzbOi6cjk=
X-Google-Smtp-Source: ABdhPJzz9IowKn8GMH2gzlTte3YhVM2UvIVb7EE6s1r3A7uSbgkK9LmsPpX3A5ORbGAQrx0+AkWSyw==
X-Received: by 2002:a17:906:a394:: with SMTP id k20mr7954254ejz.137.1632673532093;
        Sun, 26 Sep 2021 09:25:32 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id z18sm8983208edq.29.2021.09.26.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 09:25:31 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] staging: vt6655: replace camel case variables
Date: Sun, 26 Sep 2021 18:25:17 +0200
Message-Id: <20210926162527.21462-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replace the following camel case variables into
equivalent snake case variable for vt6655 driver.

bShortSlotTime -> b_short_slot_time
ldBmThreshold -> ld_bm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: fix camelcase in bShortSlotTime
  staging: vt6655: fix camelcase in ldBmThreshold
  staging: vt6655: fix camelcase in PortOffset

 drivers/staging/vt6655/baseband.c    |  58 +++++------
 drivers/staging/vt6655/card.c        |  90 ++++++++--------
 drivers/staging/vt6655/channel.c     |  10 +-
 drivers/staging/vt6655/device.h      |   6 +-
 drivers/staging/vt6655/device_main.c | 150 +++++++++++++--------------
 drivers/staging/vt6655/mac.c         |  46 ++++----
 drivers/staging/vt6655/power.c       |  24 ++---
 drivers/staging/vt6655/rf.c          |  12 +--
 drivers/staging/vt6655/rxtx.c        |  12 +--
 9 files changed, 204 insertions(+), 204 deletions(-)

-- 
2.25.1

