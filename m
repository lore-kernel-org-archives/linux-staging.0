Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1229CA
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:00:17 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id l19so17218543vst.7
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMigLaitifOukkJI53gEbD34hZV1NeNoJ7lOXzjShXQ=;
        b=OXHLliz3vpImECLH3fMcowjVcW8mgxeq4cZzmCHjriSOelou4M5R8h27jOqA2tJRC/
         FteXQxq8F90Un8aSxiZQWP9DMVvqD7eZlKtssOywBjwzC4tdifKGoMJmEFoordE3mWWz
         vW//s/xDTf6KwKLeoPN53bfSvYGXB8nYX7PdNGLj6+UQAfERJ3RlFxDMOFR7L3N0CIk8
         wzHniGE/W45cX0HTBtYwQjQOgwO+xveKGJalKd7myoqgTYKme35Zs91fYFXh4qTVh4pN
         BJPVG/+ldu54nq44vfGcbrgYFaczN6Cf55hprAqOeZofnHLtrqEV0hsGRB29FzySRYbo
         wgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YMigLaitifOukkJI53gEbD34hZV1NeNoJ7lOXzjShXQ=;
        b=kikDvf63KQS14UfjcM27hYnI0p0Nf/wj6c3faQUn3Vq+H0mXrkkDxTXjd0YTxXMLrY
         6y0JgFbwj/gl9U18snAvl9ORXsTB74+xxq/Sq/hi0+65OEf7xqHsLNTJmnnJ28MdnH0d
         wSywfKUl7dPVWRYHDqsd/mLuYhGCaHFKWRFNIuW5RHZVmq089VKD9NFEB0HwV5MESwrn
         JHb8DCplzkwaEZ1i+08ibvslMV/zRlROnbB6aKKuWTeW1gTtyp0JOBUuic/7GwKuZwMs
         7C6/wzaXwWGvRn6KeiU3WEx8tQ64Du8tFwvTs73/0YsgxdpuORPMSURp+a6z4e7kra18
         K25w==
X-Gm-Message-State: AOAM530FJdiecCxnJjc79UY5ejBTyowG8BBEFy5vNc7Uwymu9c25L4Vr
	lgHY4DkYJHWGpIMTEWaEd3w10BTTUlEHOw==
X-Google-Smtp-Source: ABdhPJyh0fDRqtVxRvkW8y+i6KNPZZ7Pc6IqHlHwCInffwdxmEYGwWrktd51Bio/37YTPhjZjYHLxA==
X-Received: by 2002:a67:c896:: with SMTP id v22mr10782275vsk.39.1633291216576;
        Sun, 03 Oct 2021 13:00:16 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:00:16 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/9] staging: vchiq_core: various style cleanups
Date: Sun,  3 Oct 2021 16:57:49 -0300
Message-Id: <20211003195758.36572-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches consists in some code style fixes.

Gaston Gonzalez (9):
  staging: vchiq_core: cleanup blank lines
  staging: vchiq_core: cleanup code alignment issues
  staging: vchiq_core.h: fix CamelCase in function declaration
  staging: vchiq_core.h: use preferred kernel types
  staging: vchiq: drop trailing semicolon in macro definition
  staging: vchiq_core: drop extern prefix in function declarations
  staging: vchiq_core: cleanup lines that end with '(' or '['
  staging: vchiq_core: cleanup unnecessary blank line
  staging: vchiq_core: fix quoted strings split across lines

 .../interface/vchiq_arm/vchiq_arm.c           |   4 +-
 .../interface/vchiq_arm/vchiq_core.c          | 764 +++++++-----------
 .../interface/vchiq_arm/vchiq_core.h          |  99 +--
 .../interface/vchiq_arm/vchiq_dev.c           |   4 +-
 4 files changed, 335 insertions(+), 536 deletions(-)

-- 
2.33.0

