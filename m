Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C81361
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 17:04:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id q4so15010695plr.11
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 10:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmD1Y3FuSgJFnbljMkxDOtUVVLs24UFlNCPaPsg6xOY=;
        b=Mh07LbtqoTeCVzsFhz/vKKMlTjLn+MMrEPpLv1VuUjVqt9ON/ZoDq8BYXo3v5jo1tL
         oYA1O2VagGZBN1lbL2YkJaprYSqCCRuz5ZbgJPNGipo3WRNXOHhM8eJy7AZoBtGIarG3
         bGQzjnFQGbGYnbZSdd029qdmApixmfnf+RM/x5eUDavFmJ9jgMi/MtJJsNqGCLtHVbW2
         Ro/Z5fknq8ACOysBGTQTYZbXiVn8R7uAV8Sv4OENewlkgnL97Bn7qj7sGELUipW5kDX+
         ERVkix+JnxgcJE/aYHzyu3c8x95TuyG3OmWebaxj8xS9cseMOa1ENN81qBrHRCDYqsvh
         mhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmD1Y3FuSgJFnbljMkxDOtUVVLs24UFlNCPaPsg6xOY=;
        b=5T3zjF2JRTwcUNnxyIFDn8j5U86rkzCvdnCZUBy7bbuQy5ebetydaWZ75r6eSxedno
         2k+AUN9R8cWMdKIuLhR05jmAfRGeANshxtma2Pj49imnjdgIOEFhHrAHVVOj4urItGjS
         ATpJMJEL5DRLn1+gx76hVUqwpuINsPQzyzx8T1Py3G609hSMBJPh8G6o/XUh6Di543vF
         lYRE7Gb+F28bsayB5gbQCAF1DKvTl2hFZMEmCUtmAhGP524CPhWQvRY9NNMK2fg8mcU4
         sC5GjIpZvvb43a7PIXkRWgUEJYZLS1xaojB4uxdMX3kPm3N1wHcwcZY1awF5g+ctUu3f
         hlNQ==
X-Gm-Message-State: AOAM5306IzHMGfx0fMIq6T0R8vv5MA2bSjCIPj3EJ+qvyGwB3I8l49mk
	PQDc1Yt5sM76+sPBPW/WeoU=
X-Google-Smtp-Source: ABdhPJzXz7U3mrkdPNE1Q6j+ppNQpbTwg9CnxGJza60znNlJ2sutBjB/gEyoPenHlCLbbPgLCv0k7w==
X-Received: by 2002:a17:90a:4fe1:b0:1de:fc11:331e with SMTP id q88-20020a17090a4fe100b001defc11331emr16790099pjh.145.1652720667833;
        Mon, 16 May 2022 10:04:27 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:6465:4732:de67:bb26])
        by smtp.gmail.com with ESMTPSA id b190-20020a621bc7000000b0050dc762819csm7141292pfb.118.2022.05.16.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 10:04:27 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: fix checkpatch.pl warnings
Date: Mon, 16 May 2022 22:33:03 +0530
Message-Id: <20220516170306.6008-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes following checkpatch warning:
    WARNING: Comparisons should place the constant on the right side of the test

Compiled tested only.

Vihas Makwana (3):
  staging: r8188eu: fix checkpatch warnings in rtw_p2p
  staging: r8188eu: fix checkpatch warnings in rtw_pwrctrl
  staging: r8188eu: fix checkpatch warnings in rtw_wlan_util

 drivers/staging/r8188eu/core/rtw_p2p.c       |  8 ++++----
 drivers/staging/r8188eu/core/rtw_pwrctrl.c   | 12 ++++++------
 drivers/staging/r8188eu/core/rtw_wlan_util.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.30.2

