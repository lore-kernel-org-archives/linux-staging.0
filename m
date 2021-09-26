Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6C3FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 14:59:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c21so14337201wrb.13
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aNtDTuzOAT+YuiF30Z3WS40pgPV+F0Fyu3AoNR9Jqc=;
        b=BnzD6wDSAOJGpAE8g+zqjJ8lSPCNOBe1KfdAu3gg85bMB9cg7Mc5ojDS//WRtgDBMK
         Mk280sBRIn+IeIumLrI246xdzCF5ApQ1VAgJhWczn9EHxJsNVftc0GPmZrO8R54AZ6qv
         /tXXbvoe0Yqg49u/ePwVS/HLDGg2+CJ8ElQeLppgzebH6Q5fZtoCDRPtEiZ1X9m14iRm
         o9RaAzwZFkH66txn+V9cvmKb7pHFjIXwfKqLKmS9PNBs91074OAgwQOSnnkuM3/H9UYW
         99Ln0mb/YYknyhpnCojTF59XoKdpfeEt9+uULGVlsyGU+2URtQV5sjHPnmq2OnrPmFj/
         GXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aNtDTuzOAT+YuiF30Z3WS40pgPV+F0Fyu3AoNR9Jqc=;
        b=sgTajbwmLbdnEORcQAFqCU3t1CNWnx1+QIBkS8LSENTnTaOgOxpIuSIxbRHQTRgUGe
         eiwpoHY97KXTXNLFKwu3+HQLjilNh31vyz/dcvX5X2eXiLlv4NTuvDFRredSpySBaWn+
         +xVc3hWKHwA2ocXPvpEI1GMPj5StUEKBSsSCjiJ49DdmeVXdCTDDwqjuBmvCg5R9k3Oa
         8rppuOUAS75F4OTFrMHhr2Ty6WSNfiuUhjMf/BOMQI4J0nMeZCHdPNior+4Lj3rGq/dm
         QiYw5hb4llefzgWCb8P/oGmoiGYX50FFUhEli7X1nAjuuTrgMsmaJ8MTT+L2Htecnbu5
         UqYg==
X-Gm-Message-State: AOAM533vzJPvky9Xzi73h9m9nThBQ3b9PyYhsFXCXEsEO+6K1/Kbx/49
	i/+X35kvn18GK0n3ixS3V8aE/mFxbto=
X-Google-Smtp-Source: ABdhPJz5HQT/5F3ODgZeID6PuqLBe26fEAIMr57W/qTuVp+IPx1rwLYnD1Bpa/8/zbJ7jjZgR2XCTw==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr11896994wmc.141.1632668373619;
        Sun, 26 Sep 2021 07:59:33 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id n7sm14143840wra.37.2021.09.26.07.59.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Sep 2021 07:59:33 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: robh@kernel.org,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: mt7621-dts: complete reset missing stuff
Date: Sun, 26 Sep 2021 16:59:28 +0200
Message-Id: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Mt7621 SoC uses reset controller from ralink rt2880.

In order to get 'mt7621.dtsi' file out of staging there are still
some nodes which are not documented at all. This patch series
add documentation for reset controller in ralink rt2880 derived
SoCs which corresponds with 'ralink,rt2880-reset' compatible.

It also align new binding documentation using defined reset bits
along the device tree file itself.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (3):
  dt-bindings: reset: add dt binding header for ralink RT2880 resets
  dt: bindings: add ralink RT2880 resets device tree binding
    documentation
  staging: mt7621-dts: align resets with binding documentation

 .../bindings/reset/ralink,rt2880-reset.yaml   | 39 ++++++++++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        | 23 ++++++-----
 include/dt-bindings/reset/ralink-rt2880.h     | 40 +++++++++++++++++++
 3 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/ralink,rt2880-reset.yaml
 create mode 100644 include/dt-bindings/reset/ralink-rt2880.h

-- 
2.25.1

