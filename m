Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAAF2586C3
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151841; cv=none; b=OI1Nxgyqnxbi4+MR5IAWulqrpOnnEFTi3AyTvwEcrG/IYS1poQadxwtbNMFtNrz0kUVgllHqbUEKD9XQOhc8BEPyZeMjMmewhnQD1e5mgwnRD2AjFNrN9zk3rhHgzyG+SN4RQeWVAtg5hlDSPCBU/PXBtqR7KTV1jZ29DhWPvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151841; c=relaxed/simple;
	bh=9iwshM7hWyj+34mNfcFVZWAX9kiRF0QdbJ5coR1x4Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8hqTm4txfgUO5Wkry/uBnMUmu70Xv0m74quVEmLvc76zb3HU/b84W2rtLDOiZBmqUMkX1nYRsvEw+oYbKxf8rR9tqUlkIGl0NjVYlDR8G99SPCTIveqkm1k+/Nmlh9mXKCJIBzmgrTs29EkpZsi0r/nry8Bqu7DczcVJ9YNNng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SCSJkmPh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SCSJkmPh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5658843b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151837; x=1744756637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxc+vuThRPlr4vVmJwstL+y+K8nrAD8PwkhX56e3dqU=;
        b=SCSJkmPhZSRJ27LF5/66vhrv0V5AtljTW92DQj0tgnJcNQ0rowIkSyzU8hXgJJH5EU
         DyVh8UKFzET7T0xpMUnTh3gfHTYZ9CFaxNeNOpB14sa4Rux6tKxcMitAKbM8PwUNFsmM
         MME+lGAZmeVWW7LHgAKCrfdp5LmrukR9dfE9UrLgxXtEza/8sWTgCvKmyAi3kMPiznBf
         kuatkBKeUv60S5CMuRtwsWxZ0TZ8/6rV+eeA1hWhnZYBkXvi9CYUrZgbGCFP70XjGzz2
         s6PmM3mdhj0BmrPpVri90GZzVRo/T2xEa4clKo+1czKih5cWZ1wlkL0ZxXuUzGv/IStL
         0SnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151837; x=1744756637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxc+vuThRPlr4vVmJwstL+y+K8nrAD8PwkhX56e3dqU=;
        b=rHz5uxrUKoKKBCIUOJv3TVVCotz4Dt4MOkO5HVDq2lfQzXPj4PTlfD1KbieINzXiyz
         cdpg8FC1TSVFAZVvldWXvDU9mbkAw6ivv7QQXZnNVhlBbszZhMiGFCHU+4vKXUPNcOr1
         Mfz+3Yt1yWv1sExYJM8xmMZGN/PXXJxHnPOyJo1e4AU+Eb9ZdKLNcdA4iZoHHB6ioqd4
         6vkdeFW8NTP/fHf5hRusMSS64JCOy57/O5tlv3gc3YInUrW5EofY/r4XSSW6kfnOINJF
         80q2R17dM4fjYnM2FWyoGSdpb3JMbt62p8vjcNLCgriu2cc1byLOVWGiea58dcrpaP1H
         CUfg==
X-Forwarded-Encrypted: i=1; AJvYcCVwb9nl4r30CRny7VNFfMVLTk/Xcso95WheAh+eZCn2WOPGDuZ7EHNo+mwDeQexw6k9qQtXHPHDVmNugDGx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb3lV2ibBAmPp91ScKMJY03AUjJe6yDcynT2mu38ykTmfmnIj5
	DDB00V3ro8rxQtkcDmHcsZlCkz37M3HHWqSUqDG7nemZSEucv0iYLkAcIVbq2BuI6r0KlURnhhc
	=
X-Gm-Gg: ASbGncto1jbhZMDuWOfFBG8UlqcPMw3Z10OOw8otU0SNN4jZX3Hj9vzmOpOCVEObWP0
	RHF4n9W4lbH1zGXCRoAsROA2SBtmnN1ST+ULrudjXIh/Ctu9Zkl2jBPlSmv4RomwIz+Nzmyu+QV
	2GtzPfqUg53uu4nsPz1Yl/tlqFlzPlUFPey2Ut1f8PoDC7XsTAAJhQEmFCenjLhxqd2xL3PRJ2s
	5pLo1YKvRceeR+UvmsFBVnFU+4XAP1WRoC6p/ryqoaFwyuyd6LI7oZIBD52P88i2pKi14jnX0y/
	q4ZSboc8ZXb917SZicM8AKJNVaalANit0CVAJ8H8XHxIHX9eoqI2fLyn8isruNcvYohdJeNSm/f
	TUyd2ce+jaw==
X-Google-Smtp-Source: AGHT+IHPoxf9asXBsP5DpMwhkaYv3aLdgjJ1ArC1Vg1k1/0iauyZJVN+qs3CvfAuWNHRW1id8Z6R4g==
X-Received: by 2002:a05:6a00:238a:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73bafbc6a32mr234006b3a.5.1744151836772;
        Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3745sm11527953b3a.172.2025.04.08.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/18] staging: gpib: gpibP: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:52 +0000
Message-ID: <20250408223659.187109-13-matchstick@neverthere.org>
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
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 82627ca838e2..c9cd1dbd7e6f 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -20,9 +20,9 @@
 
 int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
 void gpib_unregister_driver(struct gpib_interface *interface);
-struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
-struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device, struct pci_dev *from);
 unsigned int num_gpib_events(const gpib_event_queue_t *queue);
-- 
2.43.0

