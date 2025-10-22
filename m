Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565834EF15
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142916; cv=none; b=M52hql96SH73MNoB/Yk+xCi3zO+ty6H3uZdL1WlzsOVLCHjdMTuULVNJuS7uZ9MnyocaPZYSgxjHDjZbEqkswdVVQ/xzjI1EARBr7jVhy1Om39pezp/UYGLSX/jUaaLpJc7fOVrNlvRZs038a8cUBOPYdoqpQNm3iVuMiwmhM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142916; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwwSmNvIcObkj8dMOdeXW7pOKi4cXJzibMjJh9f+DLzIpr9ebNEmzY+dajOxXooe7An8Ylm5iA1pBbykjo+hWt0x960fHGOcP59t9SiHzEnfheS5TuKbseskkR/nMRsEyguAtTNFQgHg1Saho+q5/9yEEZhUDmVNX1SbSFOv/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hfs/d6D7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hfs/d6D7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6338695f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142908; x=1761747708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=Hfs/d6D7HXm0OL2Trg6iKIx3SCeVb5tWcksce25t2Ve7x0raIVIooPnTdqDPv6oTeP
         LYCJozhcu8HcrRJTUbLBmDpX/7rDWI/QMY9Kj37a5usK068jbRRtkofxGacXEvFP9E76
         L1ODaAj0ypE50h7zqWnD+na0LEF7GQ1M9UKtOv/aDxmKkQlVwD0U+VnJDst/Zj9Gm2Gk
         ywauE+QyWqZ7Fzqol9b+rzMNln4qrw9aTW/VaPOfmk394Cy1tOFxfnJyFWC3LixMBPLL
         s1YtzZEWXlBK9AfwqqQOESWdPCreRXOwUmXawSkAZMXXW3UxGkx97f5uvPOkh3BasLSp
         7ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142908; x=1761747708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=o7fn9g3M/Ra/wZwiaXpW+8khvzKT6NlsI1S8ehIj8URsA1ebsYfY1ohm12zB8Iu0nd
         28Yhoj5me9eIPale78FAfEVrrC/o6fD0QDbdz1SvdPhI3lBmONO0hwznO8c13KxLmslB
         ojxXbJ3GXQiVkYh4sEGhGUJRWdMJNq8GL9uLofOwSyvbAfiQ0s67qnNjrDvoq8pCjSWV
         h5hLT1RAXa5L/PzLL43socfD90OXJvVZG88u6Wjk+LAGugrTSG8H/rLpPXYRyT53C4Xv
         QKUhSZC5zMLtpXW9JhgdMgmtvgiU1z2yANskWNjgxqeyUCz9HvIV8XZWFK2cnaaWWIqG
         6riQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKlhA2pkIrrS4rRem2yXzvAG6nS8yuskvulp3dOtszLbhyGEHM84oA5oLnDNONh4Cuset878VaFDCLrbeQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyXcWERh8670PsTD4hKQ4oJJXPTt1pNG98BKdRIOyRLyar32uwd
	Gmrcm2Lla/cFt4ShW7yj08L1mbfT+q4L8Bb3rb3KjjNjRLEbht3pAvpM
X-Gm-Gg: ASbGncuxJkH5J3wqOJRArFSXHkMxeoMNgmOXH52taJV4WLLDGLqn6NxhRT2MjqNmkjp
	Qq9mGo1NZgQnCdGf5LqB/BOcBCmKVeywR1Jt99hEgeBGBWQJDvztpJtkR/Rk4q7jDWDV8Dt6QbA
	4ZF7Xx4u3cUEiM5pMGJfyibApMn9vC6SdhWcZkTVJYzWx0iMcJoXanmkmfAsXQhpU18mKOhIG0R
	2o7OIETPJT+gQybV5mw7EGAgOXq64iEr6xFgj3dux6xJvZZ6L/93DlJl1x8RnqNT8wR1OUX1d/F
	8efRflnTSU1Yb57ZVF0thHsKhXW8DjPOP/J6Tz6NxomK2wh8y9nrw0T3fnDWS6Ue0od7v8QAD81
	5MEHbUrcs8OEQxiGFd+cOFOf1wlrJiXDgxOa/oqZddzlXbCPjYYpqpVMXojDvEM0iNPigDcKzu+
	TCAg==
X-Google-Smtp-Source: AGHT+IFq9V87Zw7qGeTmSRrPB3JwZR7jtskG/uf8ikZdxsnRyJSInvVy1UaH8yLg4G5ahmvQ9XgogQ==
X-Received: by 2002:a05:6000:186f:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-42704d7eb23mr14938377f8f.12.1761142908345;
        Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 14/23] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Wed, 22 Oct 2025 17:20:42 +0300
Message-ID: <20251022142051.70400-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1

