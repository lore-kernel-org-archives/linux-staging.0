Received: from MTA-10-3.privateemail.com (mta-10-3.privateemail.com [198.54.127.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3976335061
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052198; cv=none; b=siaTyK1intvhlpnnhJdXqPr4NpwC7q0lXqiqYxvRDiKy4irNN9WEHdGUyqJukYIbC45Zxpb8Gt6PibQrrP2kAe8bmiGdYcAaifohs2PAQzFo3Z3b2h761YSZY3Fja3pjZTC6kXQy6BQSdOr3+HW1fFZHrHwEp9Hqz3xb+bkBImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052198; c=relaxed/simple;
	bh=8cc/fv7/OOSomgfno6O4D90HKCc6nbLeOKP6JrzujBY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T8xFv+byGSff4pHkBlB9f+L5RdwOJyfGbHVNWH6zLMBkfBl5vVujTIwjHFIv7CrFE3xim8J38+jpP34qsvkbA81Jf6/0TsMNyJef2j72Vvo7Ng1re6EumnpyNyLvimV/o+Vr8oHkFroLwR/GBANIkBMILV/PnNTlND5rp/EFl4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev; spf=pass smtp.mailfrom=lukowski.dev; dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b=STk6F8Kp; arc=none smtp.client-ip=198.54.127.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b="STk6F8Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lukowski.dev;
	s=default; t=1761052193;
	bh=8cc/fv7/OOSomgfno6O4D90HKCc6nbLeOKP6JrzujBY=;
	h=From:Subject:Date:To:Cc:From;
	b=STk6F8KpfijOKfpPhTMQRl9QE0wiwaa+PSkwzOwGM9EbzoaBpF72BX5NvcQ/r1qCm
	 15JUDmGHQTOgFn7UPB3KqMwGF0w23QjZaegh5QN6Ppdu0tErWlQh6bmB6mghQzanEO
	 xILyI7Js9BDCw8r9AzvwrmB4VXibbsAzc4HXMPttV6vwrXfA7hzmh4ALetsvKCbYKQ
	 1xfeiLV1PZmTYO5I/TBdCyUodoywhcUgMZ8Vl4a+GqMd2i1QjE92BaT6tx2eaqdkQT
	 kTbpjOLIdHoWGrOHENPkuxjTm9/VWjTElIFgPsU0F91aBbUDucW4YmNyfiFwE2CAhd
	 pS851kgCpzXfQ==
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
	by mta-10.privateemail.com (Postfix) with ESMTP id 4crXhK5bBhz3hhV0;
	Tue, 21 Oct 2025 09:09:53 -0400 (EDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [150.228.61.72])
	by mta-10.privateemail.com (Postfix) with ESMTPA;
	Tue, 21 Oct 2025 09:09:46 -0400 (EDT)
From: Olle Lukowski <olle@lukowski.dev>
Subject: [PATCH v2 0/3] staging: most: replace BUG_ON() with proper error
 handling
Date: Tue, 21 Oct 2025 16:09:27 +0300
Message-Id: <20251021-staging-most-warn-v2-0-cd51e1e717f6@lukowski.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Rha25i48h6GRaEjTNDWdKBoC
 He3cgCX7yX//RWEEpPApVohUWbhGAroQwXd4EJPyL4w6FpbVWuFMrmeQ4/PKBMuLgW0ylOryVj
 jHJTdK9Gd33vz1hQeWKaYPvtFVj/7r5YV1mg6709nY9vWd9fHPMZFRj56ytBs2/YFEOz7xLUAA
 AA=
X-Change-ID: 20251021-staging-most-warn-51deb2e454aa
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Olle Lukowski <olle@lukowski.dev>
X-Mailer: b4 0.14.3
X-Virus-Scanned: ClamAV using ClamSMTP

This small series replaces BUG_ON() calls in three staging MOST drivers
with appropriate error handling.

The affected drivers are:

  - drivers/staging/most/i2c/i2c.c
  - drivers/staging/most/dim2/dim2.c
  - drivers/staging/most/video/video.c

All changes are mechanical and do not alter runtime behavior, except that
the kernel won't panic if a driver invariant is violated.

Tested with checkpatch.pl and compile-tested (make M=drivers/staging/most).

Signed-off-by: Olle Lukowski <olle@lukowski.dev>
---
Changes in v2:
- Drop WARN_ON_ONCE() per review (Greg KH). Many systems enable
  panic_on_warn; use plain checks + error returns instead.
- Link to v1: https://lore.kernel.org/r/20251021-staging-most-warn-v1-0-4cdd3745bbdc@lukowski.dev

---
Olle Lukowski (3):
      staging: most: i2c: replace BUG_ON() with proper checks and error returns
      staging: most: dim2: replace BUG_ON() with proper checks and error returns
      staging: most: video: replace BUG_ON() with proper check

 drivers/staging/most/dim2/dim2.c   | 27 +++++++++++++++++++--------
 drivers/staging/most/i2c/i2c.c     |  9 ++++++---
 drivers/staging/most/video/video.c |  3 ++-
 3 files changed, 27 insertions(+), 12 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-staging-most-warn-51deb2e454aa

Best regards,
-- 
Olle Lukowski <olle@lukowski.dev>

