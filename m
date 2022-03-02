Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26FB6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 21:37:21 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so3492704oos.9
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 13:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFoBwGzYxG06VqMrwANucJbCVjfifnyESi4CFIqSN1M=;
        b=nNmzwVxiWRwKwN4k4KLmSPlj1rv5VnF1B49cvukbQeWS67WDJ9QAg2++oDNyT57RI+
         i3D/z3/XivykP7cyczWy6+V9jzG+nkqBPJ62f/HjrMdvkBuC87pk/VGRN9t8zWS6Y2EM
         KyJpZ4YIOm3TVLwg7kxxYIi87jCvCuIRJXmgF8Pf34HDKyVwwfh9DCgR22gZKlNLpy8N
         r00TjoZ2DT80BdXz+b8w2yoD3T7MByJS8lJq19ZEgoJHozGvZzMmcd4PfV3HO15XbCZn
         J1YFY+bYn7SzI7WmIKBHHCBSct2mNdLtbf8N8y/EQXk/EdkFpF71tW+JZpmmHpIm/4D5
         u5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFoBwGzYxG06VqMrwANucJbCVjfifnyESi4CFIqSN1M=;
        b=RNT+0alMuLI49FxPSTVp1YGOZB9G4jstv0TY+6JA5vUzzHB4FM2pJndOo8oKwodmvM
         pnYIJLLb27tXlfq9tNAzLHNXJsHFub3bp2RpY4bL1tLEMLbifUvAOvMif6kJ4feWsDK6
         Yl1/+8QNqhSKHILXPxA3kPg6bzPEtTYhjPtOwU5gnWor4i2s2ikDRfhfMY8l8QS8MaZ+
         PtTX3n+D460EpZsWYl1MYs2ZN6E7PKa1DoYcOcVxj9OFFoGetNG402Ummt+13rAqhmFF
         fhOUzuUkih16Xa3eM4/sAu8NLbOvqD0k0qqKWkD7jJ9Ft8AC4Tnx4GK+2tvEEzmt1ekP
         PBtA==
X-Gm-Message-State: AOAM530QP7NzQ4E0idVTXFba3y7/GKy1Z0Xe/3mEpgfXYNZcuMvqhboU
	B/fDt2HRcn5ee/CDj2GyngEsmZwpKms=
X-Google-Smtp-Source: ABdhPJy6tfwEOrcQ5ol2+uAric46RZz/5NMzYCGjrl0bET88DJqM5wvmKMOPttH7p4qIgAgYHzs5RA==
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id gk24-20020a0568703c1800b000d722ed20b0mr1549165oab.32.1646257040662;
        Wed, 02 Mar 2022 13:37:20 -0800 (PST)
Received: from localhost.localdomain ([181.23.87.56])
        by smtp.gmail.com with ESMTPSA id s12-20020a0568302a8c00b005b010d92dadsm69132otu.69.2022.03.02.13.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 13:37:20 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	ojaswin98@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/2] staging: vc04_services: address W=1 warnings
Date: Wed,  2 Mar 2022 18:36:34 -0300
Message-Id: <cover.1646255044.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set comprises two patches that fix two "no previous prototype"
warnings in vc04_services.

Gaston Gonzalez (2):
  staging: vchiq_arm: make vchiq_platform_get_arm_state() static
  staging: vchiq_arm: add prototype of function vchiq_platform_init()

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.35.1

