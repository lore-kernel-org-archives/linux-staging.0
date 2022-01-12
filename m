Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49E2C82
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 04:22:06 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso9385190pjm.4
        for <linux-staging@lists.linux.dev>; Tue, 11 Jan 2022 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=BdvQPS52cJCNcWplkVhU9iiTtx8MtjvpdiuiGOuSq7c=;
        b=IPTmv2sMvu2/Ii7lbwvMVlK7zNawN3QrAIJD3UoHGH9sQwghFkeyifRl3xy1fTfL8/
         mIB9vswiFwfCbAHX+Kict6Q9A/iVn5UOYEP6tfbofSeWJeT+WXA9pIKG4epBfaTGZdYQ
         zD3lZhsCTDKngJlULJqK1LWS6a8pLdOuFGla42urcXi3WzJxatr1ui/n/i5blr4cbUan
         hjmU2FLmlSZic4z1kpo0gG5VUJwagSGwW8LmyriXvAfI4CWz9ZX+VvVDHuXGFSRLkUda
         pT4bhEkeIfuATtBp1JRdJyX9+rM2mLnQw/CsgQNgK+KGtJV3jnbmJuyJwU3+M7joFwIe
         RedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BdvQPS52cJCNcWplkVhU9iiTtx8MtjvpdiuiGOuSq7c=;
        b=05yva+0EarycoLVPV6TUoELtugDiPlv6Q8h0LSXvmpHuOe8b5QKDNu5xe674oJJMp2
         t8cEQkYGEbrHdyUwlbc2YqnoD7hbNf31igNFGEDLpoHlNFEl2tXnlpy7tQTEWovzPhL6
         YvMUo+7lwTIruX4RfdDOmxU10ErxaC4Fkd9ujrHHnhlpwco3leIY+/BA9CgQLg+Sa/0K
         trUg3lnC2WKc8hujsbLLYGRWpK4lpRWFjI5pTyfC4bSZLDvlJ2e3Fr1zaYrvBvaFJ0tc
         b1Gl4WaGV4dRYcys8NLCkai1NjVie5W6oOaqHa2OCvayYo7egM/g8mtzmIuozomlbX17
         zB6g==
X-Gm-Message-State: AOAM532WQLjE38vBrNR/dwQou9xSGqL97RcNcIjCMKR4jsu4BByf8a12
	wLuEpUNqb44wLr/z+wdZtj4=
X-Google-Smtp-Source: ABdhPJxosyTXf4wce0Cr2Cv0vbps8/hxqDpRi17uliRyVjyEWDVgHN1j33lCIOqlM4BNpHiKVpnc3g==
X-Received: by 2002:a63:7156:: with SMTP id b22mr5086937pgn.288.1641961326343;
        Tue, 11 Jan 2022 20:22:06 -0800 (PST)
Received: from localhost.localdomain ([115.99.137.58])
        by smtp.gmail.com with ESMTPSA id t207sm11237747pfc.205.2022.01.11.20.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 20:22:06 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [PATCH  0/4] Staging: rtl8723bs: Fix codestyle errors and warnings
Date: Wed, 12 Jan 2022 09:51:57 +0530
Message-Id: <20220112042201.5056-1-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series fix the following errors/warnings:

-Placing { braces at the end of same line of if condition
-Placing constants on the right side of test
-Removed extra spaces in declaration
-Placing necessary blank line after declaration

Jagath Jog J (4):
  Staging: rtl8723bs: Placing opening { braces in previous line
  Staging: rtl8723bs: Interchanging comparison expression operands
  Staging: rtl8723bs: Removed extra spaces between datatype and variable
  Staging: rtl8723bs: Inserting blank line after declaration

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 42 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 15 ++++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 40 ++++++------------
 4 files changed, 44 insertions(+), 55 deletions(-)

-- 
2.17.1

