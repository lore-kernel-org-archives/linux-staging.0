Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20597168
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:10:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h10so15883990wrb.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hZgEF3a2cVPPnAn+Sv90zHeceQXR4/tutb38weJ7N6M=;
        b=lDOIZjh9fNoHufgFTYc4oRDdLFKYF4jZL5ZYjuOIjS4aIMgS95OVrnozxdBDhX83vR
         fro6oRqqt27vr1xpRgsi7xFBu9uPw972TFeNW6+RS2ajtFCLzaufJrGIdxS+QGW/nnAY
         mGQdR0SUZWjQkDrXpPgE0cY0Pu9vR85t8wBhEv2eUnkmFpKtBfb8r7QX76jGDZ+reN/Q
         opp10wv7TgBzUGseENNb0u6S4fM9kTk17wZxxHuku5wDimCrDjzOYiB2jSXCnC/Ls9C2
         YJiKxxGPpXWIbpyWIV2QM/4BdkvQxFGtUAtcBIWlulsnJpQnQIjm8Q8TXSZEQ82UetuT
         cRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hZgEF3a2cVPPnAn+Sv90zHeceQXR4/tutb38weJ7N6M=;
        b=uYnctLrohfT/98wWXoHxkLVr70gBvDgT28CxTkLPw5FF90qUfGciUM+tFfSc4lNRlv
         2w5/qJOqmbiDd3kunNMV2tXdiQi4Gwim4NDbz4t6LSUR4RE3f7WoCY06Acv6d7fWQT2q
         q65ZDBAIqsgeMpwDbEEMLqB2T8FA6CIb599JOrGXlX4rT+PsbieH0kufmtkSPyqRD0jK
         rorIXK/9f3JD2BMKLivbakbJqUtynxG9mk8nV44BtBJSdCNNDw1J/Ku5fk3z2cJGKS7H
         zSoLlHTPyJhchTCF6WtahHqPlKSU5w//lHSgAhy4WbcX3BpkGYGJmPz57g4PXRM6Cfw8
         z/fw==
X-Gm-Message-State: AOAM533WYkoTolNUz9VZBTlXCkovqktyYuVZ3JUG+EQg7cmvLsMVuG9Z
	SDMQJKlgXYl07cGZxMz4wX0=
X-Google-Smtp-Source: ABdhPJzy9BKgLEwVK49M6ASBXzOAKjQbHw7f8ApABrhBPNGAQZix9tsOTdrVD1fTfkDkLekTuif5Lw==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr8461683wrq.229.1641813039280;
        Mon, 10 Jan 2022 03:10:39 -0800 (PST)
Received: from localhost.localdomain (198.red-81-44-130.dynamicip.rima-tde.net. [81.44.130.198])
        by smtp.gmail.com with ESMTPSA id x8sm6256733wmj.44.2022.01.10.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:10:38 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	sboyd@kernel.org
Subject: [PATCH v7 0/4] clk: ralink: make system controller a reset provider
Date: Mon, 10 Jan 2022 12:10:32 +0100
Message-Id: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Regarding the way of merging this:
 - I'd like patches 1 and 4 which are related going through staging tree.
 - The other two (patches 2 and 3) can perfectly go through the clock tree.

Thanks in advance for your feedback.

Changes in v7:
 - PATCH 3/4: make use of '.of_xlate' callback as per Philipp v6 review.

Changes in v6:
 - Rebased on the top of last changes of staging-testing to properly
   update dtsi file (PATCH 4/4).
 - Send a copy of this to reset provider maintainer Philipp as per Stephen's sugestion
   to get changes added through the clk tree (Philipp, thanks in advance for reviewing
   this).

Changes in v5:
 - Move platform driver init process into 'arch_initcall' to be sure the
   rest of the world can get the resets available when needed (since PCIe
   controller driver has been moved from staging into 'drivers/pci/controller'
   is probed earlier and reset was not available so it was returning 
   -EPROBE_DEFER on firt try. Moving into 'arch_initcall' avoids the 'a bit
   anoying' PCI first failed log trace.

Changes in v4:
 - I sent wrong patch 3 accidentaly so now include the good version, sorry.

Changes in v3:
 - Collect Rob's Acked-by for patches 1 and 2. 
 - Rebase on the top of staging-next since there were already many
   changes there and PATCH 4 of the series didn't apply cleanly.

Changes in v2:
 - Address review comments of Dan Carpenter [1]:
 - Avoid 'inline' in function definition.
 - Return proper error codes (-EINVAL) instead of '-1'.
 - Make use of 'devm_kzalloc' instead of 'kzalloc'.

[0]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210926145931.14603-3-sergio.paracuellos@gmail.com/

Best regards,
   Sergio Paracuellos

Sergio Paracuellos (4):
  dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
  dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
  clk: ralink: make system controller node a reset provider
  staging: mt7621-dts: align resets with binding documentation

 .../bindings/clock/mediatek,mt7621-sysc.yaml  | 12 +++
 drivers/clk/ralink/clk-mt7621.c               | 92 ++++++++++++++++++-
 drivers/staging/mt7621-dts/mt7621.dtsi        | 21 ++---
 include/dt-bindings/reset/mt7621-reset.h      | 37 ++++++++
 4 files changed, 149 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/reset/mt7621-reset.h

-- 
2.25.1

