Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3708F54
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 21:28:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b20so94863453edd.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680298078; x=1682890078;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+z6UjGGFvmkTQgSojG8SkLIMfAa6UVmOIxZHbH2bXuY=;
        b=XBSb7b4HcDw05s830VnK6YTJzhgYe95e5BolIV5NYpWVbqSej5FdFJL5kzxgTrlgAI
         OE6qz1Xm/6oP2koRvSyIai7baOdFj/Ci+RXvv5m4odWTMIPWKKWASHLHqXq5dQBZfOlU
         8LYZvlptxt0XyuRsBDpVOL/Py58wBDmvX5gpHChVk2RgajIl5OM6ZznKKznISIrmfx0Y
         2k+xsS0i+QDT69/8x13RmJzBBG4M3sA4SaNwFAbgORfUOEoBl6J//BtVAqwRQ1Kts/68
         c6JjHVIP+yfIB6y6TPj4eW3D1XMghQW6n0g/IJ8TcDnwQ2zEwEqE9dw3kWjENYvyLaWj
         9JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680298078; x=1682890078;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+z6UjGGFvmkTQgSojG8SkLIMfAa6UVmOIxZHbH2bXuY=;
        b=cIkKBH3ARjEWwpaq2wl+xX6M0IfR6UaDSdG6VU45HTr+69Z52MPNbR40NuDT821HDG
         lI2NoV6CbB1NMEx8aKdMRBEfTAF/M5GhHGONzQO/8zuz6GQ1eWzxyGOEuuie5G+Ex139
         66hVvMkUYpTz6DaVGRS1LMOQBn4I5N+HoL9vdkq37TX6+4w9GW8CraltF/JjPwxO0h2C
         bSDOo5Bt3cc5ZDoRCZ84RLQRoTOu5WpLwCzrvM39uLDEPRNsAvXdC6p5+oHsX+9Gur7J
         KoTmd2Q4tK1ieBpCa2lQRkgIpdmmQhHS2iduk8WG6y0eO74vShQIqRPuKvRVfrUdPs7v
         SExg==
X-Gm-Message-State: AAQBX9dxtt49F3JiQTmfBls/XxE071hMRGPOSFOEHW8x3xZuHRhrnEnm
	5W3B5FqDd5rzTmfAkJ51bO8=
X-Google-Smtp-Source: AKy350bHsPPBiOP1I2P7F+AENVhC4y/Eg3R+A1rtxj8z+tm1AgxpwwZnrJlZXqCNJjJ8beCSN0d9lw==
X-Received: by 2002:a17:906:2098:b0:8d2:78c5:1d4e with SMTP id 24-20020a170906209800b008d278c51d4emr6084743ejq.5.1680298078547;
        Fri, 31 Mar 2023 14:27:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id jg9-20020a170907970900b00947ae870e78sm1053689ejc.203.2023.03.31.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 14:27:57 -0700 (PDT)
Date: Fri, 31 Mar 2023 23:27:55 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8192e: Remove enum RF_1T2R and useless cases
 for customer_id
Message-ID: <cover.1680297150.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove enum RF_1T2R as the code using it has always the same result.
Remove useless cases for customer_id.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (5):
  staging: rtl8192e: Remove enum RF_1T2R
  staging: rtl8192e: Remove local variable Value and powerlevelOFDM24G
  staging: rtl8192e: Remove case customer_id = RT_CID_DLINK
  staging: rtl8192e: Remove case customer_id = RT_CID_819x_CAMEO, ..
  staging: rtl8192e: Remove case customer_id = RT_CID_DEFAULT, ..

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 26 -------------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h |  7 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  5 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  8 +-----
 drivers/staging/rtl8192e/rtllib.h             |  4 ---
 5 files changed, 1 insertion(+), 49 deletions(-)

-- 
2.40.0

