Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13639C011
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279268; cv=none; b=EfC9uzL/iUD3abpy4V6rrXHYOqdU39wxhF8+nM6AWH6zWJdlGGyfZ/EfDyxk5ezzcDEULeSnP6R4XJJyaXeopr0AXCf8Ndu654y9Ryn1gLbYH5ux5Yc+nVgU1wHZOlieMD7gInlDfdi4MXVcxN+tMkQt8WeKlO03to7gh+/tckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279268; c=relaxed/simple;
	bh=3VjogJRvlVNg3t8adN5DZTXgCr4LrHLIkitkB/fmWkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5a2CDbs8wlKvyhGdC5gDQ1+gL/yQLgjzKTHWY5Kq/vYBKIvxGxP0/KQIwLw5Hx75guxMSpBlPgB7y8zgtawk18UIXTcAudz/3sNCnfE2kehZuefiuphsDvPqAtrypoqZ6zAukkLz5RsnapLWEAq6GUBq/X7oGalLqBpmQpWUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=oVPOsZkK; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="oVPOsZkK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8255084FCD;
	Sat,  9 May 2026 01:27:44 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279264; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9Ed+ndE0rLiuYa70jJCdm2waF2bxaiVchc8o7SFhK8=;
	b=oVPOsZkK3nEOkYhPNorJdjnF6qrY9RXqRjG8vqNWjxivcM7hbFbUfiCWYugZX4ViX91PnZ
	Uu/xZ/FjBcyJ5tz9il/Qfu043AV9jU5CTfAX1CR6zfes18WsmYN6yqXjmKd+9Q68QJSLd0
	j/8y0CfxQKYjrS8aYv85NPxBc3KlD3TvkCZWrx06CEx7ZHGshPqHSHqjjh7Zj/lMx3tb22
	u30RNGlY+EM3R/51G7dnWX2Q5eR5yhYm8UhCiUFF6AGT6ZMRHwEi/0HbfFEM9Pp4I1iOUk
	M+uc5a1H3hO6L3ZU50qk7RHwxBZtafDagkylJxH8o6EkIx0JYm08BPhYXgBhbPe03HdS7o
	GhdNh2PcADCoi87XaEpDtR0SrPhw2ctfZuViWJGFre6uWQjiLHZekNW4oP0Zr4Vp3Ztsdx
	jXtV6UyYxzLztKw5ACfHjcHnsUywOlxL51mRzCnVq1iimy8oJkcVb4Ni7+f+NPtOmU6C9L
	YK/CF13Vi3upTZmoshecUpnLGroiHGyoq1fqZYh6jHXgYJ26Oet/GgvaUMBxx6rGyP+ylP
	V7CsNec49h7kTsTJ3hiMLzhGwjwKAB6FkRmpSMCsiZX2F/vsAgZxVWaXGPiOLWrJiKD+NW
	9fnXiGSdR9+v0a0DPaaMBOg2KLiZs50XHEKpc5+Arp//nhnz6HgJQ=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Sat,  9 May 2026 01:27:03 +0300
Message-ID: <20260508222725.24075-8-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>
References: <20260508222725.24075-1-me@cipherat.com>
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
index be8b50e8a232..0104829ca50a 100644
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

