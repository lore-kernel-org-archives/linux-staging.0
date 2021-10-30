Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826F2C85
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 14:20:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v127so10198957wme.5
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZFTYT6IC4NLo8CTX3uHADufxZSHsQHANfpdDkatrvm0=;
        b=hJxH6Ugw++00fYcTpUDu9jMLnXmwJTbIkf95xjTu2Nr8Aq5KxRBgvwvSd0K3Xi2eXn
         Ahq29tGkixhXxNXNQfJdDhasqP0vQfu/BU3WZM9mqXlsvOpSxXO+UQso12fDw6OwAqh/
         oxcGiB26rfk6UfdUsMaZON0Ag84rISE72AabU3g33J+cx1HpcNaxEKH+LD8ddJHGP8gD
         QsTkWqmqAbCIoNDv4E4rFSF0jti+EuaQcEK9eO3lf6v+S4KvwOnu4AeorzQ8W4wO2Tk1
         5lHoKVwL7L+xvegGFXDGgIo1Zvf01wS28lfitbN1Rl9Wq5Hi52QzkC47lXbUnXKP+IUW
         tYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZFTYT6IC4NLo8CTX3uHADufxZSHsQHANfpdDkatrvm0=;
        b=z/9mB4UAt4FfEqJk7dpRMaMvgxpTH/vZb0AZu5SQFxHfuhMh+UXWgKx7l+pe00ACbT
         /NFKcEBftu96pbU7Ja56v64Q+JJWQOSXAFOMt7VpmJ6E9Zxww5V87/XW6Yp/KOQj6mYM
         4ieyI0v7NvYQn2osl6wH1UTBf8nvQt4v1ytmNac90cOpdKrbUQ7MqS1a91s3IF1l2yiQ
         Igg4V+yL7Z9Elr3nJI+2vnzZtDeSKRUlj/PYnSWLBFLYjsdk+tgBS6GbNCYZBqkh5mCS
         Rhpb+IuaxyfImBC+Ir+hy4y0P4H2S2T9WLvtl8EyUBRnUII/LFniJ9p2AqthxH8LY97Z
         D8wA==
X-Gm-Message-State: AOAM530vlBU0uGUBLAArNNs2bXuaD02v2cZO0whZQrm6tf8sSAnCFqvR
	MoOVnxdqOiesHTF55sJjQP4=
X-Google-Smtp-Source: ABdhPJyLolcJnyhOlakjMd7/G2CYaY63bgSXRgSX++VpQLBOLJU7CiZ8qGTExh8xJ52gMaBhnQ/acg==
X-Received: by 2002:a05:600c:354d:: with SMTP id i13mr18513917wmq.189.1635603610627;
        Sat, 30 Oct 2021 07:20:10 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id m12sm8208521wrq.69.2021.10.30.07.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Oct 2021 07:20:09 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	sboyd@kernel.org,
	john@phrozen.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v3 0/4] clk: ralink: make system controller a reset provider
Date: Sat, 30 Oct 2021 16:20:03 +0200
Message-Id: <20211030142007.27085-1-sergio.paracuellos@gmail.com>
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

Regarding the way of merging this:
 - I'd like patches 1 and 4 which are related going through staging tree.
 - The other two (patches 2 and 3) can perfectly go through the clock tree.

Thanks in advance for your feedback.

Changes in v3:
  - Collect Rob's Acked-by for patches 1 and 2. 
  - Rebase on the top of staging-next since there were already many
    changes there and PATCH 4 of the series didn't apply cleanly.

Changes in v2:
  - Address review comments of Dan Carpenter [1]:
     + Avoid 'inline' in function definition.
     + Return proper error codes (-EINVAL) instead of '-1'.
     + Make use of 'devm_kzalloc' instead of 'kzalloc'.

Best regards,
   Sergio Paracuellos

Sergio Paracuellos (4):
  dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
  dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
  clk: ralink: make system controller node a reset provider
  staging: mt7621-dts: align resets with binding documentation

 .../bindings/clock/mediatek,mt7621-sysc.yaml  | 12 +++
 drivers/clk/ralink/clk-mt7621.c               | 79 +++++++++++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        | 25 +++---
 include/dt-bindings/reset/mt7621-reset.h      | 37 +++++++++
 4 files changed, 139 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/reset/mt7621-reset.h

-- 
2.33.0

