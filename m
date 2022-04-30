Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63611852
	for <linux-staging@lists.linux.dev>; Sat, 30 Apr 2022 06:49:20 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id i19so19018080eja.11
        for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=SsreJQYKQ3osOJJ7R4XJPTSnpgPqyNjlOrOA93ltxMg=;
        b=EbXh4L4wrahZY13aJEmPgKPSkgpoKL+X8sfKTUiZtpRW/SOWLkuKb1Dvssh5xVuZGL
         dkChXT4qwRPSKNy6wR3BfCj62j6ljqdg921BpJ3lAP/tJKUGw+SQmYEki2EMIZGUefip
         8/g61Y35vzTFfEhM/SEeue9vO+yTxzFCfNJ+cAt++iP5aOunZrZ4ZkwkU1IzsLaJinKr
         fEVXSJMkoIXPMfBsEX1ui2aWdh7hDRcqKL9KAbdCrJZOLPWs3LggDPrx4tycM9YY6g1q
         SiSqj1slHRViBnz4+UGVgVinSCVHi9393BS+SC3tw4Nlp5GRXWswlh46MMihqw0KSSt/
         hU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=SsreJQYKQ3osOJJ7R4XJPTSnpgPqyNjlOrOA93ltxMg=;
        b=Vd0KINmBnh2ouGBL3OwQnJ+/5LcROHpqL/6LDwPhFAaRWmFdq8ZHEw+ySSx5QTgxwF
         Gz2rkxqifH9szS88X1/8+K6ABhVmSeTyvgapNO+oWmCZc2KZQyWWeuU4Fkpk0D6kE/0h
         3ZMwUvnWkRuOhrmlqoXduNfXUwMp8aDRfVwFscPAanCxmAewo0dufpWC2imjLb0+Gh0z
         bYYaC6ogRuoV6vEHl9+sB98BVOxbKKwiw9xD/J1VBQ5rkw+07xNMthP+zOB/gQrxgU7N
         GajsTWqVkeQhlMxOK3B0p0oKz6Voo4gss9mqOuIC93hYi2mWPY38fnbMrk7O/07dyC6W
         ZSyg==
X-Gm-Message-State: AOAM533893lx606Kd1W2qNRARRLtSgQZH0esfyaspKMCXirQnzXr5mz+
	mPSsXBsrqqG0D2dKvQG/Ne0=
X-Google-Smtp-Source: ABdhPJzRjYImVzS8NrAIxdImHcj4dQ5BvLZRRujZ8brjvtLn+5gQ8yzypws2mYIh+ztKw7OClCR/cA==
X-Received: by 2002:a17:907:6e1e:b0:6f3:e850:2453 with SMTP id sd30-20020a1709076e1e00b006f3e8502453mr2672599ejc.147.1651301358750;
        Fri, 29 Apr 2022 23:49:18 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id l24-20020a056402029800b0042617ba63a7sm3848157edv.49.2022.04.29.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 23:49:18 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:49:16 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v4 0/2] staging: vt6655: Replace macro VNSvInPortD with
 ioread32()
Message-ID: <cover.1651300094.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro VNSvInPortD with ioread32.
Avoid cast of the return value as much as possible.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Added missing big-endian support in CARDbGetCurrentTSF.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

V1 -> V2: Removed patch "staging: vt6655: Replace VNSvInPortW with ioread16"
          as it was already accepted.
          Joint patch "Replace two VNSvInPortD with ioread64_lo_hi" with 
          patch "Replace VNSvInPortD with ioread32" and changed ioread64 to 
          two ioread32 as ioread64 does not work with 32 Bit computers.
          Shorted and simplified patch descriptions.          
V2 -> V3: Added missing version in subject lines
          Added change history in cover letter
          Removed remark in cover letter "This patch series is new.."
          as it is obsolet.
V3 -> V4: Added patch: "Added missing BE support in CARDbGetCurrentTSF"
          Removed testing example from cover letter and placed it to the
          patches.

Philipp Hortmann (2):
  staging: vt6655: Replace VNSvInPortD with ioread32
  staging: vt6655: Added missing BE support in CARDbGetCurrentTSF

 drivers/staging/vt6655/card.c        | 10 ++++++++--
 drivers/staging/vt6655/device_main.c |  6 +++---
 drivers/staging/vt6655/mac.h         | 18 +++++++++---------
 drivers/staging/vt6655/rf.c          |  2 +-
 drivers/staging/vt6655/upc.h         |  3 ---
 5 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.25.1

