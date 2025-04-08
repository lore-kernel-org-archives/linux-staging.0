Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB86255E39
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151828; cv=none; b=LkV9vAMEN2iGozkbkmOptHMr4o9T68M68IOXxOn+6sPG6iYFceoAjcuDIcm1ovJzRW3+pVFOzKWFv6YMzIKl/4esTcLDjWwvKH2Tzik8WIylYN1ONmykDWM0nSS/QYNG3bZkRL2cVcr2LMIxIMoKNZgpOdOvfV/9erTy9AaMklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151828; c=relaxed/simple;
	bh=ZLk8GslpxSlsrtMxBElb3wimefBQ759wHGmHWLKEtjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENuKvyTHaA57TlngEyrCDDPTgFk+0mWJ2+c31dt4Tprd2hB/ZcbGtn92CkPHESt4Dwqxbxx1uG4So494zDgFwDL8mCcetn1sXyyqXed/zOoac2GYihPRuJfiR/QCzcR1uGZGZgQCVokMLpb9GoLlKvBSx1AuwW0jiFTeQ7l9R9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fXH48826; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fXH48826"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5147978a12.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151826; x=1744756626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GaKb0l6WtN6m4tMcZM1SociJ/kaCRWmZW8SSNvMkBc=;
        b=fXH48826x34HmAKhE2rgFw249lrJ3FHuZWWzaozFPklYP1d557BU402/kFCTIJyGG6
         VSvKg5BPueGTIwr44MT6tfOw4/YOBANYAmIUR6WN+gYSnRRNvy0etPivLSW7hUzB6lo9
         iqSsQGVP8LIinFz30iy+gv/Cs5WkWAmj335Z+IWxjcrHY4c+Aj1G6GYqS8iH5+C9EgwP
         PKy5RWqEo6xbygeN23CB4Zoc+uOKoo0sJWeImhIj+phJueKgMC1c168xYawEzE/macRz
         HrvXa+wGkLCeILHcOxIcmltfcnYOWXGPhFsQjvnOCukX+7htWMDOO9JuQbsSE41DR9O/
         TVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151826; x=1744756626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GaKb0l6WtN6m4tMcZM1SociJ/kaCRWmZW8SSNvMkBc=;
        b=Yv9mhEX3yskzaSTq2FUoO2Yll5glqq/rSpfBilZIT76pWymEjPI5omBCFCCNgokFSM
         HA9SGZUYxPDVebp2foK+wQOUSR67jPTqyVlWlripDMek9qhhlS+AjmevfPgOlCCZmXOE
         yKRRlPC3EY5wiGNQcbFLmiLvG0tw0DwI2W8NWFUiAhmuc83efAeK0rBU9RnPfOtAcsl2
         GVxcxedMtPKsxwl+T+lecVBDrV5PuHFv9ONTctfQFP3S9VUB8Wz16xL5a5iZqM5ENKw1
         FIzesEzaC6NOqnQ9tyaO2Rkapm3IsPY+sBTyFMhB7fRaxAnz/rNoKZ03AhADPDGxV8Ff
         ffXw==
X-Forwarded-Encrypted: i=1; AJvYcCVO6Fnb4+JXmZUL6SAWFsoDHd69utDOVrNBmuQBABCI8z0PKF5NroYmo5JR1D1NnSdsiQK+5dpbKyhqqzgs@lists.linux.dev
X-Gm-Message-State: AOJu0YwW2TXeo7ggW4FmnHSVfZBfkjBMw18Pyjds0Mad29iru65ACpdk
	7B/KSN1tMqrrVyTkkdW8R3tRTMVss/9GxRhgbPKRYYEUpaDIOW4PpIS2Xgayk/e9IMFGOlBZsYM
	=
X-Gm-Gg: ASbGncu+nVoBwF80dJHmOl3RD7RwLoxPMtm0GrG+fhk7StvxpDKB5qDtDH0JI2LwOnQ
	SqDYX6VOxk7nzjurecvBDhgNd29vo51q67pdL8YVTKAvKYgGlPUlW2yhYZntmKxXIagnc8i66Td
	0Y0paLWvAk66535KghOdpcR/Aq9HzBfaIJlRtv+Him0ZLKt0gyJ6EGMuIFIX7OfOSxTYKdCVFF4
	6zU38fL00t7i7DsPkK7m1DrLdGfhqpMJE77DrUQ9O+Zs/P+SOnGdW81XzDpcHn+bTc/EYHJ5dLr
	J7j9WazLsNiSU2gHhzs0no3mB9Ip0Bcq9jbaGhN/V8CvmS7Gfhn8t7lSF/8u4P2Gm16ODaiBX6T
	UfJ29XVZVqw==
X-Google-Smtp-Source: AGHT+IGrPMXPOwwtImIdhnJkimYrLfyFGrVUekqyPsAsS35wEYdQ6vRnnwJcB5BtTLUD6D09rfpyfA==
X-Received: by 2002:a17:90b:5241:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-306dbc2bf38mr1120900a91.28.1744151826420;
        Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787778c7sm106350885ad.255.2025.04.08.15.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:06 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/18] staging: gpib: agilent_82357a: gpib_board_config
Date: Tue,  8 Apr 2025 22:36:43 +0000
Message-ID: <20250408223659.187109-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 29c390b4f4e4..baa8f149024c 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1292,7 +1292,7 @@ static int agilent_82357a_init(struct gpib_board *board)
 }
 
 static inline int agilent_82357a_device_match(struct usb_interface *interface,
-					      const gpib_board_config_t *config)
+					      const struct gpib_board_config *config)
 {
 	struct usb_device * const usbdev = interface_to_usbdev(interface);
 
@@ -1305,7 +1305,7 @@ static inline int agilent_82357a_device_match(struct usb_interface *interface,
 	return 1;
 }
 
-static int agilent_82357a_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int agilent_82357a_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval;
 	int i;
-- 
2.43.0

