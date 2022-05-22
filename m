Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F653203
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:48:42 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c10so16734393edr.2
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=cal+UUAdqVRtgFFdWFWVka7hHFm8ijtTTm++T222BFc=;
        b=PMNdlQIFLJ94dGRdMrBfjNoJp3MEHek6CcUoZedEt2akvfGYLWYS1bmW+4RB4Dj3zK
         8Uo40MQcuprhAyobBAbz+omBb6pKvt13IEINVCBvvPGvU6cdjgKEtQZ6d7o9u2DPUKAI
         3Psje1kimgnZmywyyojgFyt8pmIFkXdr6Vj1XUCp+4KRZsjY/BZLgXsAgo8aeV20AGlH
         cySgh8yCsnrFtFoMuRKEmX6C0SaBaxUd5ClD1dMbqABAor0EW6VjtEAyoyRCz/0rgWM2
         3wlGwyLh7DYwdj69JBd9vBq1nQtvgs7BNXwEqOXNekYogSsyrrNTEsnqiuMR3RuuLI6r
         2J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=cal+UUAdqVRtgFFdWFWVka7hHFm8ijtTTm++T222BFc=;
        b=QYkFeYue40yr++qQkq0Ceb+bnPWPD43LuL6wtyQoghdlUHL3e36+Y+Bln1yG/i9R17
         IOn9iAdvznKtWcU9zbXAe37NuIfkauRtM3KNWaIpUanhIiDMpZsS1yHa2bu8ufUeqwVx
         vUsRekh7XlCN4vQhOwpgixqdDbu92ByFS8LkjtKnNig1U5EXtkeglEjnaqczWSN8AtwY
         HL9juuPiN/YPzJB2kBY61qdoBqGYuoh0HrVAblcbW46iKDWSk/lFEJdEmEPPAquncM7l
         aGu1tgUtZ2ow1k0JRlDl/R9bcRtiWfY3mPKoeWOafCXpYhTsHd2JlDHnwwFGFokWA2qR
         oGEg==
X-Gm-Message-State: AOAM531yQCzH4Kc+JnqV8FuA04K3u2dioHxAqZiGxkIH96wt0MMmZqqP
	Rr9RANYrw/jtdRtwEdX2CBQ=
X-Google-Smtp-Source: ABdhPJzC1qddUXh8u05N5xaK7gedpL0zcp0K8nAyFx2iPrKRYNTQhFpTHHUmrH9XRMPAPX1kbVV01A==
X-Received: by 2002:a05:6402:1399:b0:410:9fa2:60d6 with SMTP id b25-20020a056402139900b004109fa260d6mr20654315edv.35.1653248920381;
        Sun, 22 May 2022 12:48:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id g20-20020a056402181400b0042ab9da73e6sm7340682edy.94.2022.05.22.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:48:39 -0700 (PDT)
Date: Sun, 22 May 2022 21:48:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: vt6655: Replace macro VNSvOutPortW,D with
 iowrite16,32()
Message-ID: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro VNSvOutPortW with iowrite16.
Replace macro VNSvOutPortD with iowrite32.
The name of macros and the arguments use CamelCase which
is not accepted by checkpatch.pl

Add missing big-endian support on 2x iowrite32.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (11):
  staging: vt6655: Replace MACvSetCurrBCNLength with VNSvOutPortW
  staging: vt6655: Replace VNSvOutPortW with iowrite16
  staging: vt6655: Replace MACvWriteISR with VNSvOutPortD
  staging: vt6655: Replace MACvIntEnable with VNSvOutPortD
  staging: vt6655: Replace MACvIntDisable with VNSvOutPortD
  staging: vt6655: Replace MACvSetCurrBCNTxDescAddr with VNSvOutPortD
  staging: vt6655: Replace MACvRx0PerPktMode with VNSvOutPortD
  staging: vt6655: Replace MACvRx1PerPktMode with VNSvOutPortD
  staging: vt6655: Replace VNSvOutPortD with iowrite32
  staging: vt6655: Add missing BE support on 2x iowrite32
  staging: vt6655: Delete upc.h

 drivers/staging/vt6655/baseband.c    |  2 +-
 drivers/staging/vt6655/card.c        | 67 ++++++++++++----------------
 drivers/staging/vt6655/device_main.c | 28 +++++-------
 drivers/staging/vt6655/mac.c         |  2 +-
 drivers/staging/vt6655/mac.h         | 57 +++++++----------------
 drivers/staging/vt6655/power.c       |  4 +-
 drivers/staging/vt6655/rf.c          |  4 +-
 drivers/staging/vt6655/rxtx.c        |  4 +-
 drivers/staging/vt6655/srom.c        |  2 +-
 drivers/staging/vt6655/upc.h         | 35 ---------------
 10 files changed, 66 insertions(+), 139 deletions(-)
 delete mode 100644 drivers/staging/vt6655/upc.h

-- 
2.25.1

