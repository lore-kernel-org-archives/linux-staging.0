Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21961FCF
	for <linux-staging@lists.linux.dev>; Sat,  4 Mar 2023 19:12:56 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j11so3573717edq.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Mar 2023 11:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677957175;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wix47mHK0JiUR1csrqiZkjc5mC3uJiOQ3Vzx3f1g+ig=;
        b=PaLIUQwss3xHYhvRzDWUskLnpvLXeTygdlDzzhMD0fbUvkEbsZxG1ek8tl5Fo+Mkdd
         0rHDmkXf3or51oChn+UBtHWrOKY1yz8GbwVrEA1MX0w5EXBHO/mhRTcSRUE4XAg6c5md
         guIz/GDLADsbJrO1MgVFB1lNw+hZk9Sz5O8jwLw9FRftPHohULmhbxFm/GbKKzPQviLp
         RCSlN3Yo/0M4ft4QTb2fIc3PaMZLFhzrMnhH5R4cdjzfRC1D+KhQA2ipQeAA8KvD8j4j
         A53jAsF7SEuaucu8vENeC9dPU8jEPOcdL3B5CGWD0sqJrub95kyzWSbSitKG1SqCzgxb
         4Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677957175;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wix47mHK0JiUR1csrqiZkjc5mC3uJiOQ3Vzx3f1g+ig=;
        b=fTd1XRyGGCWD9QLSRlJIHmO4LzsETXma6NP4xCO4eeucIss57cPXtqsKKAQw/ftPwW
         Wgh4LawCK/9sFjEwjE2NBXQaKLGx3+drwjWiuVOzi/KdzSsyNtwacvxTkv8h1/pgKLtN
         DbLhNJtWVa0eQcdiFqBGeALWN8vmIPgRgMVxIn6bLTeZRDjbEQQsi2vhO2KNaVKOr9uX
         8/ZVtjpjAbOrqjLQiczoRddbmpF0L32jYRVo8+E1QnEhZQWxWp6OneTuYX+WjpB6eDKa
         6RN3XILmmSTSUZ0v7A4pD9D6qugZxdwo/3g/cdwLfn1PWE3VSHHnxjx1ZcELJQeSqcr5
         q/hg==
X-Gm-Message-State: AO0yUKWn4PDwvSiNOvlwSJwNXQY1JkQ/F/htuPK6pNHZ+UMG+mUyVf3h
	sKRjGBX9Cj6rZMOKisy4T5Q=
X-Google-Smtp-Source: AK7set8MCwgrMCv1RkmWlIs/GhUpLqQeTbCzBu7Uq/tSb8/yCCEzHF0heJKlhhgpHYdJvOC1pPrLPg==
X-Received: by 2002:a17:906:3f5d:b0:8b1:94cc:10b1 with SMTP id f29-20020a1709063f5d00b008b194cc10b1mr5417384ejj.7.1677957174699;
        Sat, 04 Mar 2023 11:12:54 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ot19-20020a170906ccd300b008b9d2da5343sm2338450ejb.210.2023.03.04.11.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 11:12:54 -0800 (PST)
Date: Sat, 4 Mar 2023 20:12:52 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Removing rf_type RF_2T4R from driver
Message-ID: <cover.1677955334.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removing rf_type RF_2T4R from driver as it is dead code.

First reason:
The following table is used to configure the phy base band:
u32 Rtl8192PciEPHY_REGArray[PHY_REGArrayLengthPciE] = {0x0,};
A valid array has at least two columns.

Second reason:
According to a list of devices from wiki the seven shown devices do only support
MIMO config: 1x2:2 in phy modes b,g,n. The only rf chip that is used is RTL8256.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the patches:
"[PATCH] staging: rtl8192e: Change filename r8192E_hwimg.x to table.x"
"[PATCH] staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh"
"[PATCH] staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script"

Philipp Hortmann (2):
  staging: rtl8192e: Remove empty Array Rtl8192PciEPHY_REGArray
  staging: rtl8192e: Remove conditions for RF_2T4R

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   3 +-
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  26 +----
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |   2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 109 ++++--------------
 drivers/staging/rtl8192e/rtl8192e/table.c     |   2 -
 drivers/staging/rtl8192e/rtl8192e/table.h     |   2 -
 drivers/staging/rtl8192e/rtllib.h             |   1 -
 7 files changed, 26 insertions(+), 119 deletions(-)

-- 
2.39.2

