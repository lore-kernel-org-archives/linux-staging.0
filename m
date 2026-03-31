Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC124508FB
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991824; cv=none; b=ojjZN0UYwm16EXxto7MRpRgSmv8heAztlsRoPlJEaVM5HkTrg+YaEwEyXXb3RgnxVKmQOG6I4Jg3lxxjN7/tCj28i3iFoCuYiXbBVVt8O7Rd6PoK2IHOBzyt2wwn0Eek67mBHzXKTa5g7dqHCyNymJDlLArzaTGER5TntlEMKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991824; c=relaxed/simple;
	bh=BZg+POCyc0aHse7ifJCDTBN65JYsXS0lgfnAw42OYyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEOFDf3UyfPuKlQDXRc9EP84AbjLUbbnAAvXf8UlTY/wpc1AevY9FiLAq/AHJhOdQj0W+NCgjAGSXXMLdL/nJlt3cBmt+a3MZLC0xgxG4tk+946IKAS8UDe8/eRd5QB6svPzWhF5Z82mrq8Ms08gSOBwcfwF8/WV6zsdlDBqKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvAyD4/d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvAyD4/d"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so3442745e9.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991822; x=1775596622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PAOrgazS9H3VM+uxXKBMbAaIq8gwz/zdEtYxUAlRNo=;
        b=nvAyD4/dxVcOwTXFFI8Mq9XOadGW/57+PlR7TNCRgVT6KfrMUSP+Q/51YDxK9wCJqK
         Lu4+I9QmTuyosy5lyjot6d/hWa575mfLwt6tzXhJmj+1hedBk1ZyJ0tQ1U104UNsMNuL
         oV5YzcOxmYX/ZKJ8f/sXGitJXIj7wWlXNLkh3e55dwIzJO3ZwX8eejxVEv7nNRcCbBFv
         BvmSNBzE11+PPZk/X8k59OQrJJyuDrHoh9eJtHzaIalPiGZVipvtrnlSVcDqavCeaPE9
         7sPMOAshcpNRYEV2ulSFMyjp7i1rzGMPk2nlkuQk195shTjN9zGtxeR1WF94SKz+SgfK
         k5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991822; x=1775596622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PAOrgazS9H3VM+uxXKBMbAaIq8gwz/zdEtYxUAlRNo=;
        b=lRqaiOd14RWVomskuHb1BCDPLiJAAFCtKMf05r8/RgwoxYZXnt4BbYz3HmEzbw3sMu
         VQzFIzDxS/O+O86bvWT+GKhl1x5EgKsBme8REO+1dcazQYtVMk7wUiOVpF0WJzsrbNEx
         z+XA1b0GMM8v3hi7Jslh3GYlB36lwoIo0ApbRqyD2L7d1+VsT+i/GyKFmPIR8hZfUMQk
         9VrGICrBXhNmVVpwGHDvPy0+UrlfhFrBnbWoUKGRi90yD/7K+bCYcT8stPQF8iIKif7G
         xBySo9h+hadLmwRcka5dMouQtZ0HgNuBoCWrayCKEZ0JIQSa1UEy6FT27+ig27+/aFZw
         g1ww==
X-Gm-Message-State: AOJu0Yyq+y3Nz8o/czjR6+LBoF4yQUq86P3JRqLp/M+o/UzxT6bAUI7X
	9K5NfDlk1TREcPUIakFTVF82hKzfXEVSKjw/sIua4sGdrnSX+4myGhjq1zp89lHb
X-Gm-Gg: ATEYQzzCnqchluyKj+6npRi8thX5j0zc5oDm6hdScK4V+GoDAYzauzH7yz77TJKUhL2
	NXJc08tto/RpVeJaONoLc5z4m74qnI10uKPxwXrodpMtFsXwGpgGl7A0lJBOeZ8QL4bYRhJ8rmc
	mVFr58ctfZ0zec0rrXPkGeVmQXk5AqZmxBwZ6BI3LriDb3JuO9vkqImWE+FstMjBDajM2WR84dq
	G2css0r5EsTpraQ54H/Y3EB5jmGxK3MgMVRmuVz9ZRzvFKcLxCLXXDwF/s1yslxrUu8zZupwjUe
	2lB0Inyy9CMWianwx4SqN5s2T7tOPyb8hlZsvVsfhO/UfIExa7IeMyAs6f6v4eaUzBA3ZYZo1tH
	CxEtz9qsiruV1bwzy5vjqsdYLh4uBaTmXv0P7g4berrnlsfyviHEVloLcCsuMYtYEUtGmGRcnl5
	TolTJ2zHZlsAaGMf0pcd6rbgP8Fp8RwrC8fHagt9z8boSESQ==
X-Received: by 2002:a05:600c:a51:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48883590a07mr14626735e9.8.1774991821421;
        Tue, 31 Mar 2026 14:17:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:01 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] staging: media: atomisp: clean up ISP configuration path
Date: Tue, 31 Mar 2026 23:16:10 +0200
Message-ID: <20260331211649.421777-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOT TESTED, REVIEW CAREFULLY.

This series cleans up technical debt in the ISP configuration path of
the AtomISP driver.

Resolves a long-standing FIXME by gating ref and TNR frame configuration
behind the ISP feature flags that already govern their allocation,
rather than unconditionally attempting to use frames that may not have
been built into the pipeline, and removes a duplicate call that
overwrites the same cached state with identical values.

v2:
- Replaced NULL checks with feature flag guards to address the root
  cause rather than the symptom.
- Updated subject line and commit message accordingly in patch 1/2.
- Expanded commit message to explain why the duplicate call is safe to
  remove in patch 2/2.
- Updated subject line in patch 2/2.

Jose A. Perez de Azpillaga (2):
  staging: media: atomisp: gate ref and tnr frame config behind ISP
    enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0

