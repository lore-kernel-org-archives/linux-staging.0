Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192AFDF43
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803149; cv=none; b=WOKdpa2bm+w1Hcr8VnXXRx2RyeiVQJ3prvtB8B9av2yyprgyuRcokRGH3F4u6k5TYwyUHAkqDSCyqBvPDUYQhNCs7+QzQjc0A3uo2J+q97zwn933o4O2P0NBcFCgMeA+c5hekXvFRt/RW4WoHZMV+eEUXhclMY0pfwB198+4HO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803149; c=relaxed/simple;
	bh=cBVp7Eifp7yDkONw50FbDLe9jRStO/EOErIG9jhddpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OT0OyVNlqL/WBY8GCu5tM+xEl2xLZ0NIjOO6jo/qCC/tKS1M7vaFOhBVKFK20md0AIF1dRb5Lt4jRQeSFfcdK/z6vw8jWUmXvxje3UqIvA8i5ePlIR9rsRfVNN0KKjaixbAuGDf/HKhk3t6Rfs2Tg9DTJebm0KwBDyVCLY6ooFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCR3rxg5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCR3rxg5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5785c1e7448so2701523a12.2
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803146; x=1717407946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jJQAZCfqqzKp/yT4Fe8nzJklXty4v0i4TpeOod95No=;
        b=eCR3rxg5G7W5ahlefj1b+j2Mgx4YftpR/SrSJD5CmvRg675kB1q+otfiRYqOvPe6k7
         06mq+lc6F5XXplVERKz0ZROnkXx+J8WJzLUAjDeXkNOTl+n76vhLnys1c4f6JJT3v2hW
         zPjCE25iB6Jbf9y26cXjbizQu7UbAAGL76PiASd9jIQfpz25S/aCU51XGCDLOaBXzUPU
         hLQS8JyVPrgejJez9Ys4hfsY6rkSAdMkdyZURtWWnyLgJ4XKMxG3pG8GLp8E0Q5JKRbK
         cEaiq4t22+a2vVXG7ls6Qed+6qDjMcItZNAcs8zaiOAO6vSXKZlSpnk7P3+iygbR7oVs
         QGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803146; x=1717407946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jJQAZCfqqzKp/yT4Fe8nzJklXty4v0i4TpeOod95No=;
        b=ZVb7NAFwQwQ2QB0D9kjv1U7tdqpxdjs9vBDV94tCqhwDsE0x7r3CflHaNDwOY1gYKl
         55/b2Uuj3v70GL2NQmKTOCH3qzeOyjifZ2McXkvsKGqrP5W90KGK62PigmiirTwAqJ9L
         MAb5PROLEI1A/4I0+u2f5k8XBFhtITfwDHGVMUeIbj0g9QPR5Hg+HxMIscHoJ/bUQXHR
         15f2YwT/Tw2PX2O+HLejuXbewIJlcXwVYmTASwfddbG5IcsE6ClibVDhwuZkzF/tab/S
         hfl+1mZvJar7PLygU/dnEist8SIYFzzR5iR8Cr4ZwAgXhvvYx76uXZLkeYVrUAtg+/K4
         mpmg==
X-Forwarded-Encrypted: i=1; AJvYcCXyc5jgm8t4rc4YrcWDiDRVakG8QGnaWLfu0hNtT6p67bGQkKiBKG3D9uJpZ4VRtO/lilzlka6UwMQUc0W1CxChpbyLpVsH0Z5cXm8U2g==
X-Gm-Message-State: AOJu0Yxs58thaYQErmjJgcylUSB7ef+btn866sY8gQa2u09cjEaJABoY
	JZ41uKBmhUeF79nLMFStUjuZ/WaYyTErMS/v41B/vVVkB34ouDKUCtxASA==
X-Google-Smtp-Source: AGHT+IEj3c842/5ft9ggGZPWNRE5Uh6s2O92WQgTQa2GXAvGXatkoz3IByBSlddnC3LBVgPOKO2w1Q==
X-Received: by 2002:a50:9e6d:0:b0:572:9dbf:1de5 with SMTP id 4fb4d7f45d1cf-578519ba565mr4991060a12.40.1716803146254;
        Mon, 27 May 2024 02:45:46 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c6c72ed3sm2304178a12.87.2024.05.27.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:45:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	namcao@linutronix.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8192e: some refactoring
Date: Mon, 27 May 2024 11:45:25 +0200
Message-ID: <20240527094527.2046-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors two for loops in _rtl92e_dm_rx_path_sel_byrssi()
to reduce indentation and improve readability.

Compile-tested only, due to lack of hardware.

v1 -> v2
- Removed patch 3/3
- Added Nam Cao's reviewed-by tags from v1

Michael Straube (2):
  staging: rtl8192e: reduce indentation level
  staging: rtl8192e: remove unnecessary line breaks

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 160 ++++++++++-----------
 1 file changed, 77 insertions(+), 83 deletions(-)

-- 
2.45.1

