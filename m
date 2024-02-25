Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2EB18AF9
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882428; cv=none; b=NzXB33GuBaCCBqtz9koUU0hHuA3Wn2UyeLND1WK1xPohc/YDEfwgCi8/DIPuDOY0JhQNpfK9x4oQAR4Zs2i2R7tJezXX9Ttdxlf0Gnc7be4L/X5AeIp5616gapKiQRBvhLgox0Ei80gS+/tGn799pT1D9kESrx0rn3VJ4BKRIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882428; c=relaxed/simple;
	bh=qjkOQIYrB+b3SDuD/Mmb+CjT+hxWEsGBCNd0xK0IDgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JyEFIrJWmYblOwVHM2UtLWgaKmHzQXjLDNij6paHXLx/rt7ssJTHw7tYOHQx1HJkRmEJbZZyzFhXRzsfTwyPr7vEsQbQHWHAX6mx1eZnHk7fA4GQ5itLRy3f/DaYTfla0LgfYJ1E9IDmcJ0LCnozuwBeQ3l19JyY1tMKzttP0HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuEUahBB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuEUahBB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412a59a5fc4so18215e9.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708882425; x=1709487225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytGyvZO1YlLW5fNgsIpaBkD9SXVxmGLiy1vtvLCSkQ8=;
        b=DuEUahBBEkVGajs0RVfr/fKsXgPTF8H9yCVyerZy3+BmdzuRtSJCSG+5wonLONJ9SJ
         Ee/Y3ZlGuZolF7PKPNJEI8f56i+i4z1P0D/VDjTEV164jpsljAW1TrxBFQF/OU9FW6u1
         PD00TsyTFdBCoewtEmnwcfrMZCgs2lnt1vVy+QeiQ3TQR8EJ1vNS6qH2aFG4xd3QPzz2
         UHQFYkoZis3ik36cct4a4UmC/DdCWlhMqDHfF+k/+rZrsFs/1U6yymSVddvgZ4wOKVKC
         XhsdvsBoHS3yGIGG/F35NXI/qO2JQYz/Z9geSAHlQkPYOMtV+bewnbzp2JkWFIRJbxJx
         YR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708882425; x=1709487225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytGyvZO1YlLW5fNgsIpaBkD9SXVxmGLiy1vtvLCSkQ8=;
        b=aJq4dI6yahNAa38LwIsKrUv1TUDQUy/j5+p3lWWJeDO4pcFHJsaZ//n0zgQMTs7WP4
         fM5nLKenpbe6nyf7tVPp5BmV7maJ496bCWYYvMpUSUP1wzuZ8WJ3HSM9Ha5HmgWYrLoH
         shyNdawU7KAInDvZJNAQJuo7jMAyO880u+jncTpZyOPSf6UouKj6flt0zW+DhGdxaLci
         NMjOyO4GSo5ozAJq7N3xJn26dtDmnoXwFsUwT15iKnNWpJoSfLv3xBHh/kjJA2u31Epk
         H4LbTSULRKAM0YtFDBut8KrP3DG0v2WYpcu1o+E1obZhG7nOw+wwyoOrs1ZxlxFfVfG+
         M8EQ==
X-Gm-Message-State: AOJu0Yyt2OsJAg37ObcoIaFd8TM7y18I7GQz+k4CM6BkhHgEjlTW9cqh
	okNIWw3uxkEL1CVeDbTyVA4c2lGAZk3utSCEUkkVVw5dKvqy77tu
X-Google-Smtp-Source: AGHT+IG3Fzm7unubc19KRHGByezVBRcxLtmEKwPtHEZJeLOKIByYV2vnHk7uw9gbD3KuukGJSUYqWg==
X-Received: by 2002:a05:600c:450c:b0:412:981d:8da2 with SMTP id t12-20020a05600c450c00b00412981d8da2mr3462869wmo.36.1708882424628;
        Sun, 25 Feb 2024 09:33:44 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:79c9:6db8:8198:3c60])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b00410bca333b7sm9400108wmc.27.2024.02.25.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 09:33:44 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Fix defines in rf69.h
Date: Sun, 25 Feb 2024 19:33:37 +0200
Message-Id: <20240225173341.1278918-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes several misuses of the define statement in rf69.h
Duplicted defines.
Define in header instead of source file.
Unused define.

Shahar Avidar (4):
  staging: pi433: Remove a duplicated F_OSC define
  staging: pi433: Remove the unused FREQUENCY define
  staging: pi433: Remove a duplicated FIFO_SIZE define
  staging: pi433: Move FIFO_THRESHOLD define to source file

 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 3 +--
 drivers/staging/pi433/rf69.h     | 4 ----
 3 files changed, 2 insertions(+), 6 deletions(-)


base-commit: 455c5e12a3b7d08c2ab47b7dd54944901c69cdcd
-- 
2.34.1

