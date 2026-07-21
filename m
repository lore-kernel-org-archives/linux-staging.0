Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DA314D05
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651756; cv=none; b=C3zvYanXENCYCQqhC0+K4AUI8dgDBsPQfS/iP7ClXkaMKmqB8WwU2U1hBmzcyzq9g2R4NhMr06Jmj1YJV4R8Q88xTaENeSkEZzAGqjqwPdli4VTvdg9dAp+bG31Ys0tyoqnnF4UFvG84UiJhw1D279rYfiQwkeFo31TbCc/u2Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651756; c=relaxed/simple;
	bh=LUkRNKzepSaZx852sFTD7IAADviE3NHX3PZR7fWHOQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MCZX+wXa2Nla3Ier453K9gc2rtZVWp7azWh4uA/Pcn3eQ744+uih0iz5JJ5yEvlctJSBqoTUr/SoRlkJ0rZ2T9nbmQXn2Jhkvkx07pNwWkn/F5R8Sxc/bcsedpJdd8Vwvk4/w27iq5TUE5n11Kkr4D059wvmpXiJrUN6m7tkaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qju3F4gh; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qju3F4gh"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso5070187a12.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651754; x=1785256554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MlzGXQvHorwQ6k/VUetDD3RH9v8/Ym8L+R4VPXISEI=;
        b=Qju3F4gh/ASWJg0vhhFyql2HRl+Rte52an/4qjgj2gEsZFkNDTbFZPXLBhBi91WjaB
         nVbyxvc/pFC8soJ9T0muTbb81hNq/nWuwQurB2xPUkV+YPF6DO14Nb0F03g80pDcUxYM
         lhQiHt2THtaM7ZDYNk3wL2u0jMsajfip7sKpwg7HwspQPVbk3IgFefUAkvx/ntquWY/G
         ljkTD8uWxzddFHjt2VFVtqk1+q5wpubg50CQottJcn160Ltzr02MxEzC+arYqRDEl+6t
         JE86jEvXK/tf2ttH+5U7EPrEtITURc1idUIiuWmHBRreFt3vJlyla8mADt99CtwBtJMN
         K6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651754; x=1785256554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MlzGXQvHorwQ6k/VUetDD3RH9v8/Ym8L+R4VPXISEI=;
        b=p51d1dkZRFzkw7mYS2Jzkyz7N2Umd6we3VgBhjd1NF/PS9SOh+OLffGq3ap8kYYqdB
         LtIQ6sJVWIZ51w8PIOMjU+aBHU3PDGB4CsRjMLXgzAQALDeHPPGOrI8PuVRJKKrmbxfr
         Mlt92LyP+18rJlJauRhhJKKhncDa53qKD3Zm/5ZpdixcRfDU84GN1P2qgJX/pxHT7Znr
         3crGm7fg8V3/GYSZv4paqA5gJSBgCIY8RiVzYCB+7b0d2JuimKmY4pE4IvDMykaazLyC
         83bUVcZo5yxAnLXvhqN69i7JKADhuBMAu4C85n1Qoma1Y76a1IH7VWCT9O6wWyavnbL2
         38Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrJZUFa94dJg8PmNwMUBoZQpVNMHxB7Yho0Q9YDNL1YTC+FLRZ6tI1x+oDBH6ChhFUoKvPimgsCsZkbRd45@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5j+IlllCY9pmfhh8kPrIdRS8kcCVwjRI7WfLfjCFMs2xJ9boj
	K8xo4sg17db1nySTnZkZIM0/1tJTLJ5IPq31VMtovoh7awrD4jd0aGnw
X-Gm-Gg: AfdE7cnk6ARKYlhfSVrJ4JKx7mdjm8bPybLbju4RpZ5dafjodqFyPHDdD+8SZ4YzaS0
	QUgrSHzAJSU2jPy6GCm+7NK5DprgqAveZDa2ChEQAanzNmDtHiB0H12cZY9iq8hakTW9WV4Sjns
	9xNJFFXCq2b56k0n0BdeEXcxk9+ywcP/vh4gj9g9re+920ks9W2yQB4kwL/OgU6xeikihyrLY3F
	4uGXaU3nwHjYiJ2nBNG1lbY+oB8e3xmGTAd0TDm3EhDSXCNiI74i1+PuY7mABgd2GtHvf121wqd
	CMe1WXPCqjTxQPVSpJ7hS9cacmPFelm2402L8oIjeSs3+4mBOzMRADx8hL9/FWI26ohw8QrQR8M
	jNSwVNyiumcMlmKHkIT4nSE4RpFIxWg3AH65tdmn+xU07rnw/3LNIMFa7A8VhbkT15SoXHllZJB
	Lm0yarnQhTWfL6hRl3/SOO/tjg
X-Received: by 2002:a05:6a20:4388:b0:3b3:fc6:622d with SMTP id adf61e73a8af0-3c3ada195d5mr21213199637.38.1784651754293;
        Tue, 21 Jul 2026 09:35:54 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.103.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm482146eec.22.2026.07.21.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:35:53 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v4 0/2] staging: media: atomisp: Cleanup unused module parameters
Date: Tue, 21 Jul 2026 22:05:30 +0530
Message-Id: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up unused module parameters from the atomisp driver.

Patch 1 removes unused 'pad_w' and 'pad_h' module parameters.
Patch 2 removes unused 'dbg_level' and 'dbg_func' module parameters, 
and updates ia_css_debug_vdtrace() to filter trace logging to WARNING 
level or below to avoid potential kernel log flooding.

Changes in v4:
 - Fix macro constant name in ia_css_debug_vdtrace()
   to IA_CSS_DEBUG_WARNING.
 - Guard vprintk() with level check to prevent log flooding.

Changes in v3:
 - [Add brief note if applicable]

Changes in v2:
 - [Add brief note if applicable]

Prajval Chaudhary (2):
  staging: media: atomisp: Remove pad_w and pad_h module parameters
  staging: media: atomisp: Remove dbg_level and dbg_func module
    parameters

 .../staging/media/atomisp/pci/atomisp_common.h    |  6 ++----
 .../media/atomisp/pci/atomisp_compat_css20.c      | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ++-------------
 .../pci/runtime/debug/interface/ia_css_debug.h    |  7 +++----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c  |  4 ++--
 5 files changed, 12 insertions(+), 32 deletions(-)

-- 
2.34.1

