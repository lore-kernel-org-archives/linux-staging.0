Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5D168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 03:45:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t18so14250012plg.9
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 19:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=dvwTLzMIYV8rIX2vp2D7TYVhSv3EaE9p1XD2xRzEULA=;
        b=lT+R58S0wjQMnjEW48O9E8XXmIHQ9F+yHZgkJw35WHAmFdvtMn1szbHULjQnpjT68M
         PfVNQFxaFgZ49gnUxNg6EOn1J8QbkEUkvlJaoxRVj85FCEp6ZOa096U3b3Mb95KhUjoI
         ctpzXfRlPmOw7K6EPOwDeg+vUCfguqJRQny6tbXO4RIsLWjBJEaEU6I8U0rV/ir2I7/z
         AmXmkaMqDTbXx7rFL/4hiCuWgAf8atkyGTW9Qz42LXE4zDcH4PeMxZaKuJAtHJxJ2Rhz
         lsRehL2kra9WQ9rsMO5KscghXTUxD2XGQ8aDEJ0nG3GHgvbrjA0AWL176lFhRCaEa/Rs
         X/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dvwTLzMIYV8rIX2vp2D7TYVhSv3EaE9p1XD2xRzEULA=;
        b=V1ri80XBz4VshMgG+PPhw46F2TaGDQwomaBVq5TRGm7742r+mt94X8507BxUOWm0/K
         HbNm4v/sBkh6cpPIkXnaPLalS9ZWMQcI1nyuFAadg7B/xNUBo++wPZuEWiNCkQFIrK7+
         kvOzeI069eB0td/iE8yZV1sz9rixlW1xnuEPCXrUs/aQAgItJEbVnP0td9OiqTOnkr3y
         wffg2Dxrr9MPVAinQ45J5RWLvyrxAXuX4Jy8BIFHiUybgp1VNQASLmiqSIlpqgd9hFmJ
         LQX4gefIxOEPELWKYHPaFXywR43caRC95ZKq1F4h81Hd5UZs0A/w29p8XYH4mUb0WZhs
         b46g==
X-Gm-Message-State: AOAM530Hr3ya1cDlWiOb2QNgpaVMvg6TSR9CNHPWil6PgQO58Tbtns/a
	R21LvrgYaoCzSBdF17eV92s=
X-Google-Smtp-Source: ABdhPJz+zSvrtPXD+6KPv7j0xG9F61AIZUg9TVfs/O8kB4VB/6qzzaVsXis1oJRYSOxqSJ+B7lnlnw==
X-Received: by 2002:a17:902:8f91:b0:149:87ff:ac85 with SMTP id z17-20020a1709028f9100b0014987ffac85mr13052389plo.162.1642995901227;
        Sun, 23 Jan 2022 19:45:01 -0800 (PST)
Received: from localhost.localdomain ([27.7.142.194])
        by smtp.gmail.com with ESMTPSA id p38sm9853390pgb.36.2022.01.23.19.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 19:45:00 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [Patch  0/3] Staging: rtl8723bs: Fix codestyle errors and warnings
Date: Mon, 24 Jan 2022 09:14:53 +0530
Message-Id: <20220124034456.8665-1-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series fix the following errors/warnings:

-Placing { braces at the end of same line of if condition
-Removed extra spaces in declaration
-Placing necessary blank line after declaration

Jagath Jog J (3):
  Staging: rtl8723bs: Placing opening { braces in previous line
  Staging: rtl8723bs: Removed extra spaces between datatype and variable
  Staging: rtl8723bs: Inserting blank line after declaration

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 54 +++++-----
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  5 +
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 98 ++++++-------------
 3 files changed, 63 insertions(+), 94 deletions(-)

-- 
2.17.1

