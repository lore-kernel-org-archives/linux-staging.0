Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060A413239
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378714; cv=none; b=QKwyHnRBKELuz5JQVBi+mnedKb8MlSI9EpYf2EZ90p4v4KtCmA4KZoENu69pR8DAtDL5BcCXOilsLVIZRzpmqaTWJqq+iEaISseSeoX2E5Wcoh9RUuprDCUZovHhU9KJbVmyQnS/9ICWodhT59H8U2potcMZgqmK/mG269ugib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378714; c=relaxed/simple;
	bh=qonEnNNu1QaGkiun59KSqiPbBPYePnYsvm9Aogb9yRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SH/kDXRX/78iV2ARvC4vivH2QnYXSF409xwsvq5p/hV2E9M0Fo0/03dGTc6SxhYGgvtpYQOJ9DytQ1uvxyp6QoSHG3kytoRU0qvNZBxFs8h98hLCNcx95tbw9EnlsN7cJaz+ph4CrkeiyvyzbLjhuF0XJ6pdobeqyGDwtf1aLyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=lJakUXsl; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="lJakUXsl"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A306D84F2F;
	Tue, 28 Apr 2026 15:18:22 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7hB+RTMBofka2+haeKV5juDamjTYPeCnaIfouD/K2D4=;
	b=lJakUXslM4zTqfIkUAprJ/HvjUlB/IYFYqoeYo+YX2C8a0j6A3JWtLx1osbXUhjx4/EocB
	v9bIpXP1D2XdnhKENBzP4J20mWpGZ/fOmGqZVNsKCRaDwAA8FJYu8xf6kczSXtBLQnqOvX
	T0lpHgS2ll2KAe8mVfs91pmuuRT70I/BMee3afce4i1q8W/2bx7LiUWxSAtT7JnjEraz9N
	PaDiyjOAKWGjKj5fIO6XBVNJs7ks7l4o/t03kdnESWKJM5mGcIV74PkuPcrLY1MvCjua5j
	95/IArtXUSJ2tlYDxl+M0qjIOhcEnT+ObVix2m3jOICSkw7L1cJzy9ove80Qfxwf4TYzGK
	w72qNIQNZ23vwFexDWc20+ajkG95nZ8Gw3GJJqpQkCuzYc5kH8k7FVXk0YixxUAtC9NlSd
	9om/jMUkRrcNsI9RR7ijOe45jFspWcqgi2Whd06++NfUOHDjG8Dr3Ob38Foxhj1JSceuLX
	uSD8a/bCJMD86t4F+oO+o+6A6ckHOs93QupxRRj30z9hjCiYdtz6hwGUmhWLD869Kzczic
	ehZ0YFK8pX0/OJyZFCYr/ar2OnS5Gd3gcwUvNdvMDlkcUnleAwPeKcip+fwWQLwjjzlfVP
	PYXqWasGKVbB0xNBUQ3p1NpKfAaY0Pa3LW+cln8h0B43Zxow3XZlg=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] staging: rtl8723bs: rtw_mlme: fix long lines and related issues
Date: Tue, 28 Apr 2026 15:15:43 +0300
Message-ID: <20260428121737.435248-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series addresses review feedback on v4. Changes from v4:

- Add separate patch for rtw_sitesurvey_cmd condition simplification
  (per Dan Carpenter)
- Fix variable declaration ordering to reverse Christmas tree
- Remove roam_failed intermediate variable

Salman Alghamdi (8):
  staging: rtl8723bs: fix buffer over-read in rtw_update_protection
  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length
    subtraction
  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
  staging: rtl8723bs: rtw_mlme: extract local variables for long
    expressions
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 278 ++++++++++++++--------
 1 file changed, 184 insertions(+), 94 deletions(-)

-- 
2.54.0

