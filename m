Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF02C98
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 13:13:43 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n11so2674067plf.4
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gthT7Vq77opBc/rSgVQR3VqXY4Alj06CFLF17FWMuIY=;
        b=En2gcfJ9Ru+zVl0TwpHEs5pyKOGRbt1GMa7imWuY4HgR3Yl9auatghwvmBLRFEkmLb
         Sci9S6TlpqOLHMeusZ9UngOP3p7qHuAhKCAIPKZYttR1rQVAv46ZDJ/Y3W/VH9zrZWfK
         cqmB0YpE9d8IdqDwQNstkODz/1kpCcLDt1AhQrCftVBsgyDy2DySzoXP3DhvEtnD9GdG
         Sn9rF/9eTCoPQkF9L4FZG94aWdMyiJnSIIBHtJzWze7/Jo9w/EL3ZRbfoEeBoKwYwT97
         oC5AIjUXacawMexdTVNnjEi2kqUm8csbhKJugHm1EE33AF6spmmtcLQu8ZbzBDHTUipa
         EvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gthT7Vq77opBc/rSgVQR3VqXY4Alj06CFLF17FWMuIY=;
        b=xzJb4hlBxtIGp5aYvoQyITrysKqvHXRCOzlGxe1psvyUBBVNCUdooRyV1sDOIQ+vUU
         jzG5n4F9mLtaGP7NIvzEi4wKrBPdfpd/sjQODyoD5IW99Alb1298WTm48jBZmd0EGPH2
         nyYLCV1Kyjhk+XmmVQXQkjwUuzmKkosCnRGQO5EURbIj2vr9qmwRR0Le1a6k2i4iz0Mh
         3n7wdGuGlMpi3YQ0z/KKffqLY3eRhaODBtfZfM+E65hPY7tOa/h+IyMslqvacCckHbs/
         pUSgvhYzL4eKTGegr6hg4BjoCstJy8nSwfMKnsFhEM9gl56Vz3iZGnUB6B/U36iqe4Du
         2huQ==
X-Gm-Message-State: AOAM532e/iRGSPDlvTk6FObO7Be4cLvUE9t+v3jVYNFNB0ifIq6VUQny
	XG7Vdk1/pM/P7lrFYj3mlHM=
X-Google-Smtp-Source: ABdhPJxrMM6Ff65aYDgRfbdlr6m89hp34LDzrCVzxEHOGVdkhNvkQ9rUXGQN9hEdMcmqXdyIIETMHA==
X-Received: by 2002:a17:90a:784a:: with SMTP id y10mr6678931pjl.211.1634908423193;
        Fri, 22 Oct 2021 06:13:43 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id mq3sm11932413pjb.33.2021.10.22.06.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 06:13:42 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kushalkothari285@gmail.com,
	kush19992810@gmail.com,
	outreachy-kernel@googlegroups.com,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	fmdefrancesco@gmail.com,
	marcocesati@gmail.com,
	straube.linux@gmail.com,
	philippesdixon@gmail.com,
	manuelpalenzuelamerino@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mike.rapoport@gmail.com,
	kushalkotharitest@googlegroups.com
Subject: [PATCH v3 0/4] staging: rtl8723bs: core: Cleanup patchset for style issues in rtw_cmd.c
Date: Fri, 22 Oct 2021 18:43:17 +0530
Message-Id: <cover.1634906059.git.kushalkothari285@gmail.com>
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
  v3 staging: rtl8723bs: core: Remove true and false comparison
  v3 staging: rtl8723bs: core: Remove unnecessary parentheses
  v3 staging: rtl8723bs: core: Remove unnecessary space after a cast
  v3 staging: rtl8723bs: core: Remove unnecessary blank lines

Changes in v3:
Enclose the version number inside the square bracket in all the subjects

Changes in v2:
[PATCH 1/4]: Moved unnecessary parentheses change in PATCH 2/4
[PATCH 2/4]: Added the extra parentheses change from PATCH 1/4 here.
[PATCH 3/4]: No Changes
[PATCH 4/4]: Fix whitespace error. 

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 94 +++++++++---------------
 1 file changed, 34 insertions(+), 60 deletions(-)

-- 
2.25.1

