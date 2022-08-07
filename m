Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521883C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:31 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gk3so12853830ejb.8
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=4DbdbqqYHLYjY1fnsQWsetOhJTERfsuO97ho7gqprHU=;
        b=WgpDMRTAmwcwOVfKxtC2doX1oY+haDJPhSkMHbzPPmO+RzZFwvzy6P3ngLzXYfgs2n
         dO7KCQCfr18zC/med0w1iGWVPLKqiT48DHPpd7Yb0ws850Dp7IfmL/0CERfu56TyRrK8
         gllzlpyXA/dghYPamVGZGqONK4whyJ2OM5DIcJJynoUbHxDA4qu65P3xgFK4RaMv3ZaU
         d3Wmr8KjPSJiqnR2Q/mmKKNfW9Nmn84S/QETGbunHUW377al7lmN5WcOmKX8xsFDDi49
         X5bJ3+rbtiBJaucK6SToLjI7ChH/9+Yc8YPjSkllv1/7ty+gUvIEz3/BzLaRZ66gEeS0
         qlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=4DbdbqqYHLYjY1fnsQWsetOhJTERfsuO97ho7gqprHU=;
        b=sXJ3R1neR1KghIGOpTDZHjvQJWqr4mMWKokfXI6DY51Lqoy6D9ept6V3Pt7zc6HQqG
         VNuTagindnQ9StsSlyKa5b6tG+z1AORReu2NgHXHZY1M/KVlvXeoGIzQPJFDaPpQ4zto
         DDRtc4pJV6yrom190Z204xUJNkW5V6WUBwkCLgqPaCN0hplXzACE83YmkZ0+L4JSUor8
         uLh+ErcKerxjBXJw8nKbVfi/fBZMBqEej9GY/ul90t8JOgJFLZhH4gZZ+9BwBOoorOJj
         PexCfAuFeH7So6H3ToP/R6b2OERw2TLxainUXv62e+AhEZen68X6wxZL8MDXJEj6QITS
         Hrlw==
X-Gm-Message-State: ACgBeo0k7x1KVHqZEExVJbn3Iij5mHRj8KNlegDeZBliT9tPv4fd6ASW
	hnv+d4VTSkvg+2xbZvk9DthXLx5GVqs=
X-Google-Smtp-Source: AA6agR7ARq0IP4FbqD5slOMEUKyugAIvVmmMZpOWTNvRPu9O224fTi7e++mahIVTC2Fib6mviWTOlg==
X-Received: by 2002:a17:907:6eac:b0:730:a07f:38bb with SMTP id sh44-20020a1709076eac00b00730a07f38bbmr12045871ejc.750.1659896009528;
        Sun, 07 Aug 2022 11:13:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id et13-20020a056402378d00b0043ba24a26casm3398622edb.23.2022.08.07.11.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:29 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] staging: vt6655: Create two base functions for four
 macros
Message-ID: <cover.1659892670.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Create two base functions vt6655_mac_set_bits and vt6655_mac_clear_bits
with parameters for four multiline macros. Multiline macros are not liked
by kernel community.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

V1 -> V2: Devided vt6655_mac_en_dis_bits_u32_reg into
          vt6655_mac_set_bits and vt6655_mac_clear_bits
          Changed variable from bit_mask to mask

Philipp Hortmann (6):
  staging: vt6655: Convert macro MACvEnableProtectMD to function
  staging: vt6655: Create one function for two macros
  staging: vt6655: Rename function MACvEnableProtectMD
  staging: vt6655: Convert macro MACvDisableProtectMD
  staging: vt6655: Convert macro MACvEnableBarkerPreambleMd
  staging: vt6655: Convert macro MACvDisableBarkerPreambleMd

 drivers/staging/vt6655/device_main.c | 46 +++++++++++++++++++++++++---
 drivers/staging/vt6655/mac.h         | 34 +-------------------
 2 files changed, 43 insertions(+), 37 deletions(-)

-- 
2.37.1

