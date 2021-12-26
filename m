Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE52C9C
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 08:25:43 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id bn20so20633726ljb.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 00:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAYkYUz34vDfmPxF9cy0ZNORdc1GXTwn4ICVP/BMoeo=;
        b=Cdt9njQ060eTyJ482U+YmuZasI/aoW/AM6k2Om4IrjblKbsfMfX3Ns9Rn7Nb7npeSK
         W7YCyd0cp3i2poh2rJHnMKAtEm616s607HuytrKTTP39/WXqTBmvymG5ZtmPHjinu8G6
         qyhp2jYO23FZs8x+hOR3SEkM45hSOBNpvoJuPgLm5CDvwBhxj1pzhrBdw7RSzycQhFlX
         Gp3CGZNSnzHa4VVwIIJDdMm5IqxKMTbLIjOHaynaTJiUIrs4vW5aYMrDzNA7pQLwgYn7
         m9u+q6RnYu45Ipo3By7QBLREPRbgtn9bBjdOZFlzbeRPjzMQNTaKCYw8nuTCNmI8gfjH
         y84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAYkYUz34vDfmPxF9cy0ZNORdc1GXTwn4ICVP/BMoeo=;
        b=mzABt/S57ggXZuOJn2x3jJqe1hn9389hMlf3rroo0ef4xnZE09XaEsEuUS6yns22eu
         4Z/K6oFwMnnpmccW5MEtZNPczl8TSj3kvFMKsBj7+G2yFs8XFuyGKyKJlnBAbOpMCdpk
         fepytdPTjp4SLJECwYqtlkhrXmMxodOjVDBrizb89pEmPkwnGLAUvGooRTs4xUVQMDFt
         MG1lqO9lx2VhVM77A6FGuwS4c71bDlHC/nq42jXTY3JNkuhrw1hDJrOvkzW53HS73ZAZ
         01QBCL6/sNuYw2GgD2UwaNYurSZN8M9RUd2nPcmpGnbc9pCJx1xqpIhr6Wc3/LszwnjD
         xIZw==
X-Gm-Message-State: AOAM531CFllncn9VMw6gZiG9e+cUT5LXwR8YbCUm50BZf13D5+NBvR+6
	u2fJBd0yKqb7Mw2cIYkeO6GQtw==
X-Google-Smtp-Source: ABdhPJwCLnovYDajFgtC0vLk0ZLarDVxe6L3Q7U94afPWmYrblYqmeKO0tAwOlv0+033UervqZyfyQ==
X-Received: by 2002:a2e:50c:: with SMTP id 12mr9269654ljf.57.1640507141836;
        Sun, 26 Dec 2021 00:25:41 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id z5sm1309023lfd.184.2021.12.26.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 00:25:41 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 0/3] Renesas R-Car Gen3: add support for MOST device
Date: Sun, 26 Dec 2021 11:25:27 +0300
Message-Id: <20211226082530.2245198-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set applies misc fixes to the MOST dim2 driver, and adds MOST
device definition to dtsi files for R-Car Gen3 SoCs that have it.

Nikita Yushchenko (3):
  staging: most: dim2: update renesas compatible string
  staging: most: dim2: use consistent routine naming
  arm64: dts: renesas: add MOST device

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 13 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 13 +++++++++++
 drivers/staging/most/dim2/dim2.c          | 28 +++++++++++------------
 7 files changed, 92 insertions(+), 14 deletions(-)

-- 
2.30.2

