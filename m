Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8D2C85
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 06:12:08 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t8so5300735wri.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hY7mBaE1rfc79Xt1tO6nEvrIJo4wYzKOrnrvEzqBGbI=;
        b=kfFT9hj5OWPpI8H6w2EX92FLH0+5ndq19A/vjdlRucIRQD8riSsBvBQdmbWGTPH3rg
         N49nq+J77k1pCf/s1H2Z8HGOZSyXuGuME9zcEJuCAVaJgXiIv9lvPrnlPEnewnPH2L98
         4X9S7nucDxHChp9ojz5sAIKBYCfEX1RHnE+mmb+H1PeU4Zidq6CaVLUSld74omNb1i8H
         2kTWqVEE5sKNuwF24I7QND0jZlpBoOGL/j+6Fj/UaS1ZOsb8rJpUKYZ+RRtTU7nftqtb
         0V9KbjOuJ0j6x5Lbl0mw7iWKDwkxKrSRmLz10tNvBdeW2+Yq1Kx7iQYOWlce2PZI+9ET
         bkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hY7mBaE1rfc79Xt1tO6nEvrIJo4wYzKOrnrvEzqBGbI=;
        b=ByEjEKu1wV+6lrF+ZDtilEsStYw06vG6jiwC9ipw45AQzC7+tUtJeXYnC0ddYTHzCt
         lOryEHvDLzFs3i73kPYIh8jiSCH/ItQHYO1zh1xPi8F3dACWpHvgOa6mKNrWnKzJmvwv
         shYD5QCjXqRgSSfQWfR+/pyUlZiQBvUfSiUbqeAJatfzprnDKpn8T9TGFShcS2zhHjHZ
         TX1jkAVJ06ftc2FdDN+hXarUTZXlCj7IlKx5Mq5o6r6VSEdZ3OD+jzNibunJ7jr8NXr6
         0Fjm3kXsKu5SwmlNgAcpS7h+VY+07CuXH7AveaQY3R1N+kaTWhsz+niiB0VIh3BqsUYC
         5uiA==
X-Gm-Message-State: AOAM5302+NRDx9EXkS1uAgTRpsIy22nvMOD3xeMZKKTruSoULf0oYa6z
	9G8+OQqT9KUgLtENEknxkaY=
X-Google-Smtp-Source: ABdhPJxO1g0hZP/rindHKZdsa6Ep9hQS8U+nTlR8t2sm8gOLLKyDW25wBNMh6LbL2aV5XmPAdWStFg==
X-Received: by 2002:a05:600c:2057:: with SMTP id p23mr7782941wmg.25.1633500726733;
        Tue, 05 Oct 2021 23:12:06 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id e8sm3893071wme.46.2021.10.05.23.12.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Oct 2021 23:12:06 -0700 (PDT)
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
Subject: [PATCH 0/4] clk: ralink: make system controller a reset provider
Date: Wed,  6 Oct 2021 08:12:00 +0200
Message-Id: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
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

Best regards,
    Sergio Paracuellos

[0]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210926145931.14603-3-sergio.paracuellos@gmail.com/ 

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

