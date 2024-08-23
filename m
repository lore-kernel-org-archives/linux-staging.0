Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091418594C
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433992; cv=none; b=HQ8erY4K6jiK3yswCJHd2TE6meApNoU6EzU+AZYxX6VKnwLT60pOp9Eo9cIiHO4A63lcsi8JcuxCCQoJjdr0g3vR9WMXuY+q+ieBcgV5SItOv48fUWWU2qPId1tsuqV+yHioezr/U7WbCbLK1eav4Ss079i/kvIFg2kKC3Zi3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433992; c=relaxed/simple;
	bh=9VrMWJ2lG0KpAo7exAdVB3mJa0Ufsh4v/DEgczhDsYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hHm9AZDc5I5xXmff/q9B4yhPc40rE+UeWi+0JyGsahPXdRbpYAxO6qclKMr9RVhMh07aeOKHkWZ3UPK5T5Y8gB/a1E0fcJuPdfq5sbag9yOxbXm2Pg6vjXVX5mR2YpRslzF2NskMMVoNTZZAEDh+n0G2oXPuvrvhEBrGmteoH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+Vh0bn6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+Vh0bn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2672C32786;
	Fri, 23 Aug 2024 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724433991;
	bh=9VrMWJ2lG0KpAo7exAdVB3mJa0Ufsh4v/DEgczhDsYU=;
	h=From:Date:Subject:To:Cc:From;
	b=s+Vh0bn6vNvUCZPBXvsL+y8Np9Y3xwYoprtUYZSQILqbPDXv9S4+1oNxTSEa8RRAP
	 NnP9gHzvUadNd9+xZ/eD6VwGO6XClKaBAmYUTlFQLsvmJa4WARTTtd+CAx14KWVhkF
	 4A4BtDx0R/fPe1B5jl+tsxu93MX6wCH4U60+AXebCMg6ZaSLkDOuMKQFqneJAtKzYi
	 m/mCakWMjQU2i0BdpWRj7GfuhugIVs963s7/9+hB8gaUmNeO+uyqv279fb7GeqCQ6T
	 HN4Hi0QvfaTWaSjeqeWgFJXP8KmoRkCtw3MctYgD/uiJIWCGxnvZvz+fzVZJf8V0hK
	 b+EY769arRsCQ==
From: Simon Horman <horms@kernel.org>
Date: Fri, 23 Aug 2024 18:26:27 +0100
Subject: [PATCH] staging: rtl8192e: remove set but otherwise unused local
 variable iv16
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-rtl8192e-iv16-v1-1-000702673065@kernel.org>
X-B4-Tracking: v=1; b=H4sIAELGyGYC/x2MQQqAIBAAvyJ7TtC1wvpKdEjbaiEsNCII/550n
 IGZFxJFpgS9eCHSzYmPUEBXAvw2hZUkz4UBFdbKopHx2q3usPhbtxKd9wqd0dR4KM0ZaeHn/w1
 jzh+HdaysXwAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0

Since the commit 5f1a6826ea49 ("staging: rtl8192e: remove set but
otherwise unused local variable iv32"), the local variable iv16 is set
but otherwise unused. So remove it.

Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408232049.UJef268y-lkp@intel.com/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index 31eff306e8aa..fb80ae6c3f2f 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -637,9 +637,6 @@ static int rtllib_tkip_get_key(void *key, int len, u8 *seq, void *priv)
 
 	if (seq) {
 		/* Return the sequence number of the last transmitted frame. */
-		u16 iv16 = tkey->tx_iv16;
-
-		iv16--;
 		seq[0] = tkey->tx_iv16;
 		seq[1] = tkey->tx_iv16 >> 8;
 		seq[2] = tkey->tx_iv32;

