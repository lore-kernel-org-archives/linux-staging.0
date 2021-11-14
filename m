Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87672
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:48:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id l22so38336494lfg.7
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kq8l3SK94Kza+Lx51oJZ5qCJhBwYc4lAosdZK3UHqnQ=;
        b=qtRkpBbFoFU56CCdNTDVCSNE7ZBrmPXjL0VdA9CknRqF1Ki/b/UPICEJGr0uH7Vr8u
         hHT+0VoFBiOtPYxX+xSbBstOS7O5bHwFu6VifA7FwcLl5Ki1pGPwLxVKWzHS5k8fTgDE
         N+d1D8Ul7rwhBfxIqI+8Vm4c8p/DgSleVoKfKgUm+VKw0BshWBZDS/bhWWhjBvWYWYZS
         6+AvKMujMvJOIlxHyS4NFaOQq6/a+hO/XRu10ChcZzCoTlHiIwE82og6+V2F1YnIXqYl
         WQ1NyAE7c7VrmjzZhDdWXOBV8Tpi7/ntAuVLnwPLhh1HUHTJFVgevhcPAeiMo+IZm5zm
         n6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kq8l3SK94Kza+Lx51oJZ5qCJhBwYc4lAosdZK3UHqnQ=;
        b=Qt6ofT1aAX5FyHj19owdKKBjmWFCEe785AK7O5tUpxeLMg6p8Th1dNXoTPoLc3pfc8
         ovd3ykqyRcgzeN57yL5eYna9k2cxlF7ex1po5MdgdegtPWBdzSR1t71UiSCGSLbm+EXO
         Qhd3mBxDGLmwbXCMQ44j/hcN5PWjoMDj3quOFwsoaShMuFEsAVhgtRGMuJgsZSdy0sx6
         h23nxxVUWrUnDKIHkJWBTUUwIs1Hj7XT1WnRipto+UPB+cJnKEuy5MjHFIzZgL1/cvIq
         pZft0BjGVBbwm9qcSLh7Mc4yqYxCEoB7eHeBrDthMi8YspmBHseqCYEfIrM+gTzpXQFn
         ozbg==
X-Gm-Message-State: AOAM530c0nc/1Ml3KfWJioGMGWJB1+Y10qHD1E2SMsIxESepqUErlIAN
	99Q+gKqheldN/xRLZcCqFD4=
X-Google-Smtp-Source: ABdhPJzvOBq1gK6yT7oQyDY5RONej39BkP3mhL2dgUyGTkVI1OBLFz7i1UXqizTMVMVM9WccB1HLDg==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr24802279lfu.59.1636930106612;
        Sun, 14 Nov 2021 14:48:26 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anton Bambura <jenneron@protonmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder driver
Date: Mon, 15 Nov 2021 01:47:29 +0300
Message-Id: <20211114224732.11550-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Video decoder of Tegra114/124 SoCs uses additional memory buffer required
for decoding of protected content. We won't support that content, but it
is impossible to disable access to the buffer, hence a stub buffer needs
to be provided. This series enables decoder driver only for Tegra114
because Tegra124 support requires more non-trivial changes on both kernel
and userspace sides.

Changelog:

v2: - Changed tegra_vde_alloc_bo() to return errno and fix unassigned
      error code in tegra_vde_probe().

Dmitry Osipenko (1):
  media: staging: tegra-vde: Reorder misc device registration

Thierry Reding (2):
  media: staging: tegra-vde: Support reference picture marking
  media: staging: tegra-vde: Properly mark invalid entries

 drivers/staging/media/tegra-vde/vde.c | 147 +++++++++++++++++++++++---
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 152 insertions(+), 13 deletions(-)

-- 
2.33.1

