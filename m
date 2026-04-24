Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C938A72C;
	Fri, 24 Apr 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777027762; cv=none; b=czYjxl8s6vfNEVZH1ANu2bQqX3Pt2csBgGQuLNQzrViWH1r6OZWS+dTiTocmU0LnZNPlfpiyPm766HT1m5C1ZVvBuQWPuR3Jhat5umIrfDPjET1nsoTw51eLnh/mOMFPNevAY6rAfNSITa6omTX2kGgbQPfTLjMx3ogKQmDIgVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777027762; c=relaxed/simple;
	bh=dgEnmis+w1/mHACY1d1/wSgNW49oVl9g0u3C4GaOJLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfC6BYZCMEyQxjkY48JcUVqdaW/1y0qcQf5pxAnKOkPZG0R6iP7dACDdVZE6gHLwL9nRipuh7TOXHVaglsV0YcC3RukYgYbkMU3TdeZTqPsJblkFRKG2cjYEt1oWVEf5Xv1zn1/sfkMpNkneoH16oPsDSN+r3H6hMvnLUAFyldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6vI4gKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6vI4gKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC531C19425;
	Fri, 24 Apr 2026 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777027761;
	bh=dgEnmis+w1/mHACY1d1/wSgNW49oVl9g0u3C4GaOJLQ=;
	h=From:To:Cc:Subject:Date:From;
	b=s6vI4gKlkLDbmbMRQdVF2kz+MZepPzqZbB4jCTCs/Uy2JKRCY+Y9xbpQGCTk16axe
	 Xxt7nGzas2OZjWCMvvXzGcnBvvqE+AgH/V4udpkwpwSpnNv/rbThXc7ZlDU5xhD392
	 zvV9vha1G2vbhaDsgqMY/WaFIK95YewOxzbsQA+isqNLvTNcszV+SEAq7mWOAUg6j5
	 FVzF8Bs8kyw8WL4Zcx5IZ9Z8RTscI0I7CCQZyuBEIpQwc4vHjmWuXbqB2gPzjtwv+O
	 TFeUM8wtLme0uKbyY0CNzy4RWvCltED+3HhHiEXmyFP4KA5QJybqOQIlzNtIVuXdAw
	 +muYVTgJBxgww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGE63-0000000AzPr-2iqs;
	Fri, 24 Apr 2026 12:49:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Martyn Welch <martyn@welchs.me.uk>
Subject: [PATCH] staging: vme_user: fix root device leak on init failure
Date: Fri, 24 Apr 2026 12:49:10 +0200
Message-ID: <20260424104910.2619349-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure to deregister and free the root device in case module
initialisation fails.

Fixes: 658bcdae9c67 ("vme: Adding Fake VME driver")
Cc: stable@vger.kernel.org	# 4.9
Cc: Martyn Welch <martyn@welchs.me.uk>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/vme_user/vme_fake.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed526..8abaa3165fbb 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1230,6 +1230,8 @@ static int __init fake_init(void)
 err_driver:
 	kfree(fake_bridge);
 err_struct:
+	root_device_unregister(vme_root);
+
 	return retval;
 }
 
-- 
2.53.0

