Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11247B
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 21:07:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id v6so20859551ejg.6
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 13:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfQqV82MfqCTkqi+JFVujPJySbqXceDsA7yHZUhQU0o=;
        b=bYsdL8d999TdaNref95ZP6prSkX1Hb9ktXNMyZC6ZY6WtZGdEQI4UZZ/EIiDIcvSWL
         TB1Zf+0P2T0BvtECPdZ3pIygJFq1WgVl1FvTLpyhfrrl0zUygDXt70veARKusjpOpmdO
         Y0WKTjXwlh/6i3aZw3qHLw25ElusLg1Gt3hgsdMGhp+JluZm4jzmK/XuJo+lHRe3usTa
         f26CTrX4Odr5SLp6b5j7bUqFGXnFIG/oBECGCPSN7Nplu5JRMWcABh/+2atEehKSWO90
         V0tkTMzYWqIGVZNQefGo/0r+1xlG8XR/GjfSs0bz/WNGaBB7hJaF2GrXaJr+9/ckGZzC
         BspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfQqV82MfqCTkqi+JFVujPJySbqXceDsA7yHZUhQU0o=;
        b=EWp/ZnjtpwcP0lCp/RRA+on2o/eJEEC0sTd80qoBjnefyWkAPBUNun8I5w4E0RAcqr
         bFBqnt643nm7q7AKzcdty+84jXj4spB76GdjlyU6eLp2mLKgA9ANcxA6TssXBnhd9Msp
         yEYvVzawfQ84cAyNWxuEwG3Ol6uNIFAADFg6YtJ64BYu0tS2GlkBzj2bPlttRXjOoP5E
         fdtDvDNc7mNqzRM7kpYYqFXfmNEXMUeyQ2+oswiG/sA1BSzMY/z9l2CETzVQUXwUe8OG
         EEZA+zY0fKBbX9S/q3IpFIGOnGgLdsFKTDjOF5qwS6+EsTyltHQzBr4xNAuTsRBJmyaL
         XKGQ==
X-Gm-Message-State: AFqh2krBM0T/vQLA/3crBYbg3i3CcSPIaZkWNOsk2Q0/5/stR4GGmDpW
	3hPCs3JhkLBtt5zzjsivlJ8=
X-Google-Smtp-Source: AMrXdXsDOxij77MgD3b8rp+35Lewl4KVR75a9ZFsUXoTJiuUSDh7eFLPeFWJlyLPF7r2tfA0iZBkmQ==
X-Received: by 2002:a17:906:3d6a:b0:85b:daf9:dcde with SMTP id r10-20020a1709063d6a00b0085bdaf9dcdemr11248955ejf.61.1673816866035;
        Sun, 15 Jan 2023 13:07:46 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbb0.dynamic.kabel-deutschland.de. [95.90.187.176])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7d74b000000b0049e08f781e3sm1010421eds.3.2023.01.15.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 13:07:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/4] staging: r8188eu: some error logic cleanups
Date: Sun, 15 Jan 2023 22:07:30 +0100
Message-Id: <20230115210734.18610-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts some more functions away from returning _SUCCESS
and _FAIL.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (4):
  staging: r8188eu: convert PHY_MACConfig8188E() to common error logic
  staging: r8188eu: convert phy_RF6052_Config_ParaFile() to common error
    logic
  staging: r8188eu: convert phy_BB8188E_Config_ParaFile() to common
    error logic
  staging: r8188eu: convert PHY_BBConfig8188E() to common error logic

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 35 ++++++++++---------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  7 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 15 ++++----
 3 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.39.0

