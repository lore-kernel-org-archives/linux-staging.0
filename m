Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0242C9E
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 20:25:34 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id gh6so24628669ejb.0
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=DvUXFRCJIqFc9YeD+6DOXUW8ZXQvEyCkX7qLIzxFXSQ=;
        b=c6/Z01NmZ2pcbUbcH4akZAUFxcwPNhF+dqta3z6Vx/ymhZng2oCQPHJl8D7I9pWRdd
         aXZecfL/mx+JcFNWVMTFcda6PuKshb2sqVaGoXIScNqGUeqmSFSAsDktsk5SJRh+sZ1k
         9Z6M2BFFZgHHnqnej5YeeLLAfquyVN8gHAAxTn8hegRq2Z1uWmkFZgR3txvKfRAflmFH
         BNKB1ykOCk+92o4MumQhLfJfCOseBeOMkJLRXsgO34v/6EzlgxYgBgB5mf+tRT+GSZiX
         kEoE940U0cHEWNt9O7Y3jrzkqWwdtJJCWMNjdPU3cRfaysYkldj2RD1eGBZeXTCUnL5w
         uIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=DvUXFRCJIqFc9YeD+6DOXUW8ZXQvEyCkX7qLIzxFXSQ=;
        b=y0KFTxh2+XnohIGuQG+1Ac3U9vqeWd+gb1y7dlfgQ5xfYNqfKBYkIlO4xzIuVnOJEz
         W2NePL0tpkMBUGS2iZKhQoutowcEsv4H8LzMZKJn7s2UJXgqYNkzCB/O+Y1WFicCYGbr
         ChfBCf8NQM+sYGFSsNVamA7+OI87SNjC94ykrstl/5YVXcVkvf51u0jNDWoHp/XoltwK
         9P8JTE+K6TE0sihB943vmCHbjfwhFfCdNmM5bfLBacLPqwkKQOCtz02EILx/a6EKYX0k
         sczOW7ZQ1nYfsHpk04NSpL0U5G/E4NMCteCaExxT81gJW2EaqY3GsuSjoc7DA25X+maR
         LCvg==
X-Gm-Message-State: AOAM532074+2LJWzSvPrJqWcE1cwo41BKDgWU+Wi8J2d3uE5lqZO8K3o
	XUTm2iP8U6VPGDpecstVqCGqEc6B6extZA==
X-Google-Smtp-Source: ABdhPJzbG/n5nZ+7htjtIi7CYIoPN9Ye3uz+miHrtt9nEMd+TB3Eao3PpmIgeQspdKJJWdyCmIe4qg==
X-Received: by 2002:a17:906:2991:b0:6cc:fc18:f10c with SMTP id x17-20020a170906299100b006ccfc18f10cmr8460862eje.744.1651436732353;
        Sun, 01 May 2022 13:25:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id e28-20020a170906845c00b006f3ef214debsm2879018ejy.81.2022.05.01.13.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 13:25:31 -0700 (PDT)
Date: Sun, 1 May 2022 22:25:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: vt6655: Fix name and return value of
 CARDbGetCurrentTSF
Message-ID: <cover.1651435890.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix name of the function that uses CamelCase which
is not accepted by checkpatch.pl

Replace unused return value.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

V1 -> V2: Changed function name to include driver name
          Updated this patch series from changes of previous one
          - Corrected patch: "Added missing BE support in CARDbGetCurrentTSF"
            from #ifdef __BIG_ENDIAN to le64_to_cpu()

Philipp Hortmann (2):
  staging: vt6655: Rename function CARDbGetCurrentTSF
  staging vt6655: Replace unused return value of vt6655_get_current_tsf

 drivers/staging/vt6655/card.c        | 20 +++++++++-----------
 drivers/staging/vt6655/card.h        |  2 +-
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.25.1

