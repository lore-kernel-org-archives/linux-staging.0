Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E546015
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 16:24:31 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ez10so33941455ejc.13
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=EpBkigZDhPdfhuuO8b2HxzOasU8CDpEiB+HyHCiHWt8=;
        b=po6uQkahdsywOnTCYjRZtZ5cGXET4QXRdc5MHCTVuF8bIYosXLvwPTjBs4D+F0koMa
         p+gBuIsV5KTiJL1YdkWt+zgO1ocpRVE1QfOKajsYeJUai6m5aSk+CO+pPnpppk4lwEFV
         syFqKpsUbCAZ0Bzev4H2WGMlgIpub1TlAK5hz9ZzFPTG41KhRd3RKuFKCe2TIjha4/Y8
         onsxE/7xTjYTCARe8PgFOQroCHe0hUswEJvZqPKWuMlB1Lnd3JV7QjHqBud0JgpWmLZ9
         X2NeIuiR2dHNXxiBflLOn4qYMFIwWy6Rbxs8wUYsHDwGVZpTor30Aw/nHHrpxvyo8YLI
         v+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=EpBkigZDhPdfhuuO8b2HxzOasU8CDpEiB+HyHCiHWt8=;
        b=QRctMEEQ0/wl8FJa7QBjFLYXjgAYxrNd2N8qDXs8DOTS6j3LAJQ5OJs4BqRosYZ7Hn
         yVcJB0xZ/A8+hfWHONFxjgLd21uPeLAhmY3vTZx/gxgKAkJqiha9PGkLOyrbCpZiyW28
         Ls/4y6Z9ldhAHlTtcd78e52ySVDZ8FQgPdMyG/DbDvg6TFKiWiC9F6PHIQ+MCwYKTzMe
         TDfdm6e0fNrCNdmG6OUOfDxqh6UnPnO4y7xyk7aQSXHdJTs0+vUvfiZ8uxBjwWzQX4gR
         Bqkx4BcgC0+a5Evpf7Zx33dO9uATCb1MF+zAqdTwJWNW2jE2q3RYHdcV0fo51BCN6WWF
         sEcQ==
X-Gm-Message-State: AJIora+YKE/U4U523qg4C5//egf0TRAVFWiEJsfGqYt7tfrSx68M/kvT
	RPclECVp0qs4Kob4wJzvJNc=
X-Google-Smtp-Source: AGRyM1uh7GzYNjbzMG3aYFISLknlIn55CGjxcIrNuxKZsOMNIm+wYGrNvOlERr/NAkXe/qaxFyEd5Q==
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id hr1-20020a1709073f8100b006ff1a3d9092mr36057925ejc.319.1658334269693;
        Wed, 20 Jul 2022 09:24:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id gj10-20020a170907740a00b00726c0e63b94sm8000447ejc.27.2022.07.20.09.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 09:24:29 -0700 (PDT)
Date: Wed, 20 Jul 2022 18:24:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: vt6655: Convert multiline macro to static
 function
Message-ID: <cover.1658333350.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert multiline macro to static function.
Multiline macros are not liked by kernel community.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (3):
  staging: vt6655: Rename byOrgValue to reg_value in a macro
  staging: vt6655: Rename MACvClearStckDS
  staging: vt6655: Convert macro vt6655_mac_clear_stck_ds to function

 drivers/staging/vt6655/mac.c | 13 ++++++++++++-
 drivers/staging/vt6655/mac.h |  8 --------
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.37.1

