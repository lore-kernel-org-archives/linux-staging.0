Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B933FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:33:56 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id g8so45621257edt.7
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+8PZXNRc5ZTxd7WuoBWNH6vWt+Frn9DdJuHENk685Rk=;
        b=htbmNl2o3YA3698zSUgpUR/7+4z/HV/NNO8yUyeUSTsgrZg/Y4g6NzbT9CJkOOVHUB
         C0WUxhI5ydrshPEVZgT5w2SeyJ0xbjtJqoTFsjK6BkbJshkvPUFXv5zSL0SQWQpNhdpa
         9Iy0xqfm/J90enfGK2Jcn5aODyTHcaXIn0CLxRhHNp0hFRsTvin9OeUp5H1w5nE6qoZ/
         Jwc2MTZ64XuI8nPeiJcPR/cU6eUlVqee1STvcspUSItS6d0lGd5RfU+nm3EuXLR/Lkj4
         /9KHrvhnuhsBOXgvyfHwGgjeZpydR3xRI/T/Sk+UzUYqKaIu2gAP+pZ+wB1YQceIf1r4
         tpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+8PZXNRc5ZTxd7WuoBWNH6vWt+Frn9DdJuHENk685Rk=;
        b=TAQmF7K6V890sdO6p2czreAmNSoOgxhhreLhvJCjZSbjAF9pX8ODw4wpxLiGc5W+Td
         RJRpG32cRmwNxuxr9Y8c3bNZrTHrkTB9AUXN4xyndXC9L8b1QZttw55lsI68jGzdjI0y
         DvNgiGyhPLseHm1DhL8ZjYP6CRjZYPsCrdKg1fbGjMoe3Rnirtv3ZSCnZxKvmcJuCX0R
         MnY9ux56qxZp9Ls+b+83+TJ1nyHAcHWhmqTcKCkJAxygPPoCT1+XPWdY+imuIH+ByJBF
         b+Sfrn3yPrxaVJGI5BwXoDKDTYQoPjKC1cfgq7QLhTaMC/v7X6cIP8NDm5RP0eOrQJCP
         a9yg==
X-Gm-Message-State: AOAM530jazH2YsAhdfrfFQCioEms6M5kXuquvqZwNY7VxLGStbewKv7s
	FfTbOAIvK8gWtL70XfT9ttU=
X-Google-Smtp-Source: ABdhPJyhJtrlU2Its5h+KQJZDgFdjzIYD7xZB7Y1ldhgbzlcBEMuXC1PNCc0zbXf4f3so7+ETiRJkg==
X-Received: by 2002:aa7:df92:: with SMTP id b18mr9787595edy.47.1632558835293;
        Sat, 25 Sep 2021 01:33:55 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id p21sm6056514ejm.88.2021.09.25.01.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 01:33:54 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Yujia Qiao <rapiz@foxmail.com>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] staging: vt6655: replace camel case variables
Date: Sat, 25 Sep 2021 10:33:41 +0200
Message-Id: <20210925083350.13996-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replace the following camel case variables for vt6655 driver:

bShortSlotTime -> b_short_slot_time
ldBmThreshold -> ld_bm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: replace camel case b_short_slot_time instead of
    bShortSlotTime.
  staging: vt6655: replace camel case ld_bm_threshold instead of
    ldBmThreshold.
  staging: vt6655: replace camel case port_offset instead of PortOffset.

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

