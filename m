Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C12C89
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 11:23:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id m22so7854073wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47s/bZHvgq69ktivg5JJy6fUXMerQl2jUwwg3kpWhpE=;
        b=g1QA2+UjfP3hztVr1sVD8MWAB6aunYsFT2KalsjBUEvAk3VvWMKn0W9UZ8byMcobWs
         ao8H4xXe914XRE4bMNt7FAsQXCl8p5gO/uQ9SRBQOC7l92/aQjSrf/BQhlOI19dqUM3j
         oZwk22G51nlNTL59CVUt1xx/B/x/wFoToPdAxOsNL/BjCUHw69Dw7fn8Ez9uotXGJS4Y
         XPqVsYnyzzNBsicY0FLxjVEZsMhjuuLR2NtwX3mcxa9Pp2lBZrJW7E5L10aZxVbu2UW4
         4olTHkGlmzesj+dVnQdLEC5gB4XjV1dwFpjL6FP6ZKIpbcT5lSKSWxR3lj23sgGrxIsO
         PuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=47s/bZHvgq69ktivg5JJy6fUXMerQl2jUwwg3kpWhpE=;
        b=HUf9jVEAmQbccAYozQ2Wem4HpEoP4rVqa3Rjf3NbGcCkBf4cULoTX6qjG2PGWPg9HY
         htmzONaxuOxTGAcvjsSC7d7umlX1HI5c/gIvD4WO0TUGFXjRb8kKUmWyM1VJ8DBXs7tJ
         KNDsRQwE7+8W39TLDnfAMCVorCVfM1XzoPSGt5SU8Dm1gQb3EUJi6KtkAYxTMXf3/XsK
         9JCBAKbgI81OaQ8JG5ZY9ahmQ9S2KZHkDhxUly3ylq9Y1JG5YXaYyDG+zirJgpIMcg+0
         GMnNrqmkPNy1S7yivvFAMBrtIVJD1XNRUznhcxFfkauPcQHrOSfSTccjrDCuSPucR4Xz
         ZJGw==
X-Gm-Message-State: AOAM5305OG6HxWI3/A0+pidPR2tcsfF05uNk0rWfcXGd6N5CAIsQNQG5
	Mbq4zgncK3cTIG+y+pDmhyA=
X-Google-Smtp-Source: ABdhPJxO8m46fxb9zABvCoD+pMl/Q0dgsharY/sFYhpKLR4z8Rul9+G4k+vwxTx1LRFFmTI+0V9YeA==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr9556452wmq.145.1633519387985;
        Wed, 06 Oct 2021 04:23:07 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e14sm10801985wrw.33.2021.10.06.04.23.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 04:23:07 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org,
	john@phrozen.org
Subject: [PATCH v2 0/4] clk: ralink: make system controller a reset provider
Date: Wed,  6 Oct 2021 13:23:02 +0200
Message-Id: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series add minimal change to provide mt7621 resets properly
defining them in the 'mediatek,mt7621-sysc' node which is the system
controller of the SoC and is already providing clocks to the rest of
the world.

There is shared architecture code for all ralink platforms in 'reset.c'
file located in 'arch/mips/ralink' but the correct thing to do to align
hardware with software seems to define and add related reset code to the 
already mainlined clock driver.

After this changes, we can get rid of the useless reset controller node
in the device tree and use system controller node instead where the property
'#reset-cells' has been added. Binding documentation for this nodeq has
been updated with the new property accordly.

This series also provide a bindings include header where all related
reset bits for the MT7621 SoC are defined.

Also, please take a look to this review [0] to understand better motivation
for this series.

Thanks in advance for your feedback.

Changes in v2:
 - Address review comments of Dan Carpenter [1]:
    + Avoid 'inline' in function definition.
    + Return proper error codes (-EINVAL) instead of '-1'. 
    + Make use of 'devm_kzalloc' instead of 'kzalloc'.

Best regards,
    Sergio Paracuellos

[0]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210926145931.14603-3-sergio.paracuellos@gmail.com/ 
[1]: https://lkml.org/lkml/2021/10/6/204

Sergio Paracuellos (4):
  dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
  dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
  clk: ralink: make system controller node a reset provider
  staging: mt7621-dts: align resets with binding documentation

 .../bindings/clock/mediatek,mt7621-sysc.yaml  | 12 +++
 drivers/clk/ralink/clk-mt7621.c               | 79 +++++++++++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        | 27 +++----
 include/dt-bindings/reset/mt7621-reset.h      | 37 +++++++++
 4 files changed, 140 insertions(+), 15 deletions(-)
 create mode 100644 include/dt-bindings/reset/mt7621-reset.h

-- 
2.33.0

