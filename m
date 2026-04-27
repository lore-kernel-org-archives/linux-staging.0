Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50313EF64D
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316775; cv=none; b=o4FZWEjgoz8CM/1dhWMfdTy29MwjUVzJFQuOgl52ZWi1edBo5bxby41sOdrGwClzboJJ53drJjnrQKFKxdIPDDKJ/COB2B98XdbFNRiqef1kqHRwZHpBMzNrP53QwIIVEMALOVJF2q1MKJdikoNysvUzxvkoqKKg47e34vuH2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316775; c=relaxed/simple;
	bh=52z04B4jRKw5lGYRZvK8NoZ1AwMlIcdllKOuNC//bOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QulqepLQuAZFn1UZJB882Tj8DsQZZr7q5Mr32ov8xull7r/BZ6vI7W3ISe/yKX8E1pAL+FuPYsiAX3v5dk5hddu4EjqtRzZKM6MXbtzmr7iHNbrC/WJ4X3SHELb3/YiEI9i9aQ/vx7yVreKB0sBzkcvbNmbitBVu3FDN8UMRjN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=U1M6sA7J; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="U1M6sA7J"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E538084F28;
	Mon, 27 Apr 2026 22:06:11 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777316772; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qdqYCJUauEJxLPfgkYyvTA/rxV+KMs91NDsSgE9xbyk=;
	b=U1M6sA7JyftzUZSGpB3P12QRRRrHcimGGUe9YitxYbCliQbwlNk54zmpDlxBW05fKUYZad
	ygCCDJPC59YVVVd0Vr16XAxvyzF8n3MlDnWmc6kcGN9HiFyPhZMeMUvlE++LyMFqgitm8k
	AJMR2AB6SHi+3kxs+D/PCZeABbtPhADa+zwhiCDkxNjPalGn6Xvgnwk9x3nFZ7XiRL1/H2
	Tv54WcnDBz10XS/Sw254l2Pm8hB12cAokElwHLNZ3woESbjv/a9m/WmKXw4kGhuCEURtOU
	WYJd1Ji+qPbwFZUNbcKrZf+2NL2Ngq0WB7VFbhtmRWWVvAZWsx0xUIQB1H126XZ04A1D25
	7dFVCljYBjv+2LdAsRd6neF/nkRRD1EhaTdZ/K9TrKFCv9IICRaxo5h4xPx479KwQ+H1P4
	raY5OkALNZgwbXjhdZTY5M7UBKcSLg01YiQFKw+eeFFFaJm1MAvwRt7Os0wQRwJmTd9Fax
	/2QYNUdiVM0V6S0thY+n7YB5hkBGMd+gWY7dxTt7s10zAcjKJYVSw4nNupX2AHAujtKWL1
	qto0bUe+bFEhgwYYqFyW++4ukSVNz1h60uak06hH/tP+kYp2APT6lQEP9xLe/JaPB/js9q
	RsrNaWMJ6rFRVvo+8EP+9uq9EhvvJEocPPjwFmPtSafDezAMMdc7g=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Mon, 27 Apr 2026 22:05:35 +0300
Message-ID: <20260427190548.156499-8-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427190548.156499-1-me@cipherat.com>
References: <20260427190548.156499-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a blank line between the WIFI_UNDER_WPS block and the
wifi_spec block to improve readability.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7b40e24435e2..0ddc3383298f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -626,6 +626,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
-- 
2.54.0

