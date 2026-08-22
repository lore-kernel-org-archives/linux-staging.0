Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10D272E56
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423045; cv=none; b=Q3BOLV2aR7aLLJ3FpsUT4celaCIIb8tqw8C13r8OtmojrktZQUwlH7DU39Er0fGqoApgAkuFINH1U4R4rdpcfeMechGEXSuTwKTGzRknFjWJT6eGn4IIY0dyWkSll4PApypl6fgEBFiJMhXwALp8F1+1Jx1Z470JLl09PpCRfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423045; c=relaxed/simple;
	bh=4zPc/ZZike/L4Bcu12t2boBGS4cMo1Od/sYm/18e668=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyrkntMZwQW4tcYy/zhquHmquduD3YQtER3jxWp0UgicqzspvFR8J3bg6qGoTD4ZgPtefFwqiNGiPNr8IkIbk4XwlAOOM0xDMf1wk8Ey+P3iEjhxZbKw/5pQlW7rCfkVuE0Dkg0sJ0m+m773WDy4FV+GZTtBlNj+jhaFmniaZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2iOuxbr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2iOuxbr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2322941a91.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787423043; x=1788027843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ujflSLSzMEMOpxvOd3qSfVXzOSsK+OKfVTJr2wK67U=;
        b=A2iOuxbr3WjfrHi9fbz2d8ZdLU6U7KHw+o11MV5172EWwLOu+DDnk3Anip2o6HXBN3
         9Epj6HZFr474JqHJbojQap8bA3o3daFaaQbZxuvTSewAQL77P7ttbjEp+TFPj2zq7NVg
         XcaJ57W2a1qCiap6sV8ZLg9T3x/CX0GEyxApSsXbn7hnglqiYL6BPitEO0pppNnP4KCx
         dXZEmHN5htgC8S4vYD+YmD8t9eyMKTP+6q3fj9G5Ut2GjskmXeyHdGstuJu9Z7mjtxkv
         Pyz7xYkOZHiT2Wo5+AYSyQJXwrNAE874KWpcURaOUaA0Zve6GcPO+aCLQ20demD2Ktdt
         SKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423043; x=1788027843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ujflSLSzMEMOpxvOd3qSfVXzOSsK+OKfVTJr2wK67U=;
        b=qOeBleVdScU2P+1A+7trhDBd9GZReix3gN313uAIZGVOqv33AgGN+W0o9m5zcFuKWx
         REKjjCpeBjSSN1Ky9QqdTDqg9JttlI/Nvw/DTcy/0wu1KoRNLn6YlqMT9P2kjJOb0KUj
         Y2d0KPsFYHqVRwH8gnJ6Utdn3cx2v7Nyf2fAJZcK69BHCkmeBAV4A2OrFLHI6qnl6ZXA
         NIxp31JdulecU0/eRHjuQDSrNk13KDQlrrEo9HZNGj/ovkjHXIbxeZj4Gwp7TVrHjPK5
         f0LarYcloFIHUA3yuvAvw8xrRR4gsPf2XW+u8LvCdxmiSysBYwmn1ST5pVVJhkWr6ugf
         RL9A==
X-Forwarded-Encrypted: i=1; AHgh+RoJChQWzkmYfIQiO02xyLE3hdw/lsj7fVpUO+QYaS6CMXI9WxNbm+eqtPm/AWJXzTz/CpcY6PWPHAUqjfKQ@lists.linux.dev
X-Gm-Message-State: AFuF++nx/jexFHdOJiMDIjzyyZCFV0eD3FHaitF5kKefONRP8irK729/
	cso2+LYoHYmvV8dg1jwAx/EgCrIUl4hDB99SI3MEAuESjE/esPjP0OVC
X-Gm-Gg: AR+sD11ag/tblcwUhmW09yBO4MYur6ejnQMIG4vin/NB0q6auJZ5CJTo1phCFi/Z0H+
	W+SENS5oKdyK5WJU8xlKSXwnhEY1NaHsUd4rRvxyym8ndrxP+oVPAQn4QZ+y3ryJ4j590wOyFWB
	iU+z4gN7l0RLAdqC42hnsAAGcCY7BoqXE6YYmgR9pvphAhcYsyOazK0CO/h4d0SPekCHOqQ33/9
	WTH2vwfUqgTC/+WQpF+f0eJ2zyXEIQVUqTNSPPPohX0YDc6qHFKaQ1D30MFYCuGnRFti9cM+V8j
	meUXGCseEhAkAyU54LC16XWdbRldO974u9/fXMx3ceIQ0g0xhMXRa3FrUDI4MnM+35wTzNv5n5v
	kc2T4OjV6X/S+gR0ZlqqYrc7P+0DzQzdw1r74+t6rb7qRUiJInFhLrWNgD3377hXdv5JZo66aLd
	mZF/+memy+O7z4A2VAVbblTHjEWVC5FYDrqpggzzrRFVpM+vHZj12O4K0BPZNqJy7WwPEfDleB9
	r0fqNXHXiIH12LYn6NFJnuB6uv98zHlmqeUH1F9hsXHy8+ojREbzMMAG0kJRiJyUPReB+HjZTAY
	JM/dcnfMTqMf6afvZjI0W198
X-Received: by 2002:a17:90b:1b04:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-395c33406e0mr25073570a91.2.1787423043343;
        Sat, 22 Aug 2026 11:24:03 -0700 (PDT)
Received: from i-use-omarchy-arch-btw ([203.110.242.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm13677462eec.16.2026.08.22.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 11:24:03 -0700 (PDT)
From: Samrudh Nelli <samrudhnelli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	azpijr@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samrudh Nelli <samrudhnelli@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: modernize locking with cleanup.h
Date: Sat, 22 Aug 2026 23:53:45 +0530
Message-ID: <cover.1787421961.git.samrudhnelli@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the mutex locking in rtw_pwrctrl.c by utilizing 
the guard() and scoped_guard() macros introduced in cleanup.h.

Patch 1 converts functions where the lock is held until returning.
Patch 2 converts functions where the lock is dropped mid-execution.

Samrudh Nelli (2):
  staging: rtl8723bs: use guard(mutex) to simplify locking
  staging: rtl8723bs: use scoped_guard() for mid-function locking

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 154 ++++++++-----------
 1 file changed, 64 insertions(+), 90 deletions(-)

-- 
2.55.0

