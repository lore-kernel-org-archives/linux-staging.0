Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AB29CA
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 19:58:28 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so1370429pjb.4
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtAnGb9XvJP+SUKtVNc4/aYf5/Kl26imun3S9nDbKeo=;
        b=qeWR2w7jUQwHd/Sf/jNXm6upvsSuphLttWjerFG8fsYDXifng/VYjAFD0r/W7dtlWl
         wLL9TX0UKjsYyinNj58nCHIpPDxTcRGVeEihR5L0+5dfk6aSUfzn8B87jQqb059Zr/DB
         T2pWhtmJIXSYArsUCQEGI7JLdFGmUttQWmxyZBWYhkgx9p/dzrDs9gpReEznVBaoYm+Q
         e551KCBCiuS7NOb2UHKMxIB6sc2lU0ZoRn+drnoe8f6H9eE1QyW2Jv4fgEWmkskHDP++
         p3nuQjOBHU4qw6yXWg8SvFd3YHN16piL6SU8Ze+p2PV0NVgMPvFQFYR0Nu9x3/mcbeOA
         OCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtAnGb9XvJP+SUKtVNc4/aYf5/Kl26imun3S9nDbKeo=;
        b=j3iUFnFh04yFYIhNOYJ1akiyR4h4D0BVr1x3z4cOlV1AeyAUYr0K+lyVT35ZuBLVRI
         BhUQNQ87jNN16ekjwFNZZKY9PzNgxdI0WTyzc8QuLNB1HUcjY4nkf5ghPEu/jq59wart
         y7rqiAgwGgHC7o4iV5O+MiyrFYJMfFgk0q40+931PbJsJJQEWe+wBqjA81HPZBsJQRmi
         LIW4Br/SeSdOQ9598ZTkqUrIsBRpgjVv2lDGrfGVtQQev0Mx20QEwzddzz3Tnjg71+NR
         yUkhnNQ657uye8goMDtqa643NPJbZ9wsJJNm5RfXWOkYhUaSEhPU32G20sv7xlh4mnFz
         0mfQ==
X-Gm-Message-State: AOAM5339Tyd4Zbh5AOiDihnlK1db6E2jCA6sFIXR1xwyHDz3Am22dmL1
	0qYDPQraZttTJEMYKtQXyXY=
X-Google-Smtp-Source: ABdhPJz01i1ABc8WWSYIUSF7MS3R4eN6tYdC8edzLdQD2c8THGdZzSKi2kjM+2UsexItK3Tzpdeq1g==
X-Received: by 2002:a17:902:c40b:b0:13f:68f:6750 with SMTP id k11-20020a170902c40b00b0013f068f6750mr7099779plk.58.1634846308278;
        Thu, 21 Oct 2021 12:58:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1fee:e3e7:7dfb:56c1:efef:3c0f])
        by smtp.googlemail.com with ESMTPSA id v9sm7198898pfc.23.2021.10.21.12.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 12:58:27 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	kushalkothari285@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/4] staging: rtl8723bs: core: Cleanup patchset for style issues in rtw_cmd.c
Date: Fri, 22 Oct 2021 01:27:49 +0530
Message-Id: <cover.1634845504.git.kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches make changes to clean up style issues identified
by checkpatch. 

Kushal Kothari (4):
  staging: rtl8723bs: core: Remove true and false comparison
  staging: rtl8723bs: core: Remove unnecessary parentheses
  staging: rtl8723bs: core: Remove unnecessary space after a cast
  staging: rtl8723bs: core: Remove unnecessary blank lines

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 75 +++++++++++-------------
 1 file changed, 35 insertions(+), 40 deletions(-)

-- 
2.25.1

