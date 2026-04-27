Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E53EE1DB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316758; cv=none; b=aYjS1KMy1CDp9B3PAVyxmt7XFWJFXjj1lDs4aQosHVHM/VbUd/n1bhhaE6b0AOTpIfAUOD1tNAQtojkKGARcWx7Hlm7dnhJ+tUoCZwftqyYFsdV0aioBJixn2n9jCVBjaqAeSo4T5SmpMpCELSGGE+OtC0JEtPiBTcpnSL5YAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316758; c=relaxed/simple;
	bh=AcaHi9a+Qj81vVeaaTNcg6JdjS6afWsJLOZl5pHvMN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjxwcReL4z8YyFO6yX0GuKcTJlXpS8/F+WcpJ2hxHr205+fi20dkytCKtnzj15M7/AU5LSQu8GU+7knrF0fOmwRxyHpjP90n6dD7s5B4eQ5fQbiP3927gjhHz7eK0L+3/LXsxd1dLypfWSHNJTANKIUZ9u7Qt/IpOG2PnAzi1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=YF8YPS1v; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="YF8YPS1v"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E54784F2F;
	Mon, 27 Apr 2026 22:05:54 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316755; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7xIU9Et+3pR/K74rPSy7UrqSbMYp9s3Nw6GytvZg08k=;
	b=YF8YPS1v1tYOuGHiTo9EktrMb1Dt/Yk9qzHdGFE4V2ehzNDYsMhmTC9Mq40GFPjFiBwVkC
	scUtua3DWqYFLPBKLThvz5bckkdebRZWCjmlrGabtP0SfgMTv1aY2INxscPe36JJci8Krv
	ILWA0l3u9wNxnelzL8BP/VLHQOREM2fedvXQgnkuhUhouAP9EdoFUXWZUEUTZ1VkWrX9oh
	xf4xJ7nscRTpbTdy4Ua5DsVJ5JpqAc8yux/7RxQEM9s107D5OEW2jXtu4gZfli8tC6QbPt
	Vt5219DVAZlj02+hCtJbroDfHoh5OOrn7iV1lHA6xI+zdJpxD2N7dbmGBjouAJvD/l4Vod
	30HvA7mQFvbkOgQDCYjAyGRx+uPyhINAV6+C61Ln2aMQ2+gU1FjFKDIgZ0vB+HLbu/T4L8
	ncFgfg49RrERXIa1oqfk3lULEUA7No0KuX7BMDRcvh1aNDI7Tc4MKB+0zKSEo+GCxzw8Yp
	ulQ5vjDyessl3FnIil522qFlpY/1Jd3LT9029TCxobSZufuyaj6yyrtofkqZ6rD9q4VkNf
	BY2kitXIZgMdXpvoI0nSkg900Ona7V99fAFvppvgrzPesQjBMeJvCL3pDzgce3rfyL2zkV
	vWPTbWSJl6mMHDy/nYf5LMx2i80pmA1VYfHsP82sqieo72kJMpk60=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] staging: rtl8723bs: rtw_mlme: fix long lines and related issues
Date: Mon, 27 Apr 2026 22:05:28 +0300
Message-ID: <20260427190548.156499-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series addresses review feedback on v3. Changes from v3:

- Split the line length patch into two: one for simple wrapping
  and one for variable extraction (per Dan Carpenter)
- Add a separate patch for ie_length bounds checks which were
  flagged as behavior changes
- Use umin() instead of min_t() for unsigned value capping
- Fix empty else block left after dead code removal

Salman Alghamdi (7):
  staging: rtl8723bs: fix buffer over-read in rtw_update_protection
  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length
    subtraction
  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: extract local variables for long
    expressions
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 280 +++++++++++++++-------
 1 file changed, 187 insertions(+), 93 deletions(-)

-- 
2.54.0

