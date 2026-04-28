Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677EF32ED27
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394732; cv=none; b=lAjUrIbBJpppSESUL6fRlvb41AdMNvpiIbZZ0oEBwsNJnPFYkh/FdFHjplKc3PCj0BjEtV/A3QZAWBCr4zY8aaC4Ad4CgJY3f423HrO30sot/0aBtp4DimNtVyjs00EArq8HI72Mj2bu9Kj/0rSMuNBofAwrhZzv8ZaL5o+RDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394732; c=relaxed/simple;
	bh=9HdIemgfR4VrPqTNiZHWFj+ptqaf+4Vv3NXR+2U51Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hu3V5YTWrGww8PxpKAruNj/5WD0qhth3yT16VvjMLDwRiW6CMVdkwJdf8iirj54v52PuswrZ6JwDjB2lOqG44UptFQpLoSfrOCr5OTXrmQyW0D+FMCt2HkMvTDZPQW3HVAqSmx6Mi7rFANOjdO9bwYDiy7zlU3VVrVjAHP1AzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=F23s9SxG; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="F23s9SxG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BD4084F98;
	Tue, 28 Apr 2026 19:45:29 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394729; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3j1c5EDJo/k0wJE4iA56/aLTF1LlfKvBBoU57CDpPI0=;
	b=F23s9SxGTWiLspqsDuzI6F74IPt7Auu/k+SMODoM9uwn6llO4TUiaDl6ZXADusa5KdjXMj
	iND6mdsFdYxcOyRYAtEwY/1diWeoWkb1ciVrJEJQOQ6xG7lrWkyGCGKRhgN/FCHZxpgWwx
	pTDSuz59hgoeiHoZz5lWN4H7srjaMyhgTWLzuNfebigw1UutSlvcyvmXXRr/+QMMqHTFqs
	fJU3w2erYw7JxXDduPBm5iIsEjymv4kq4ahNROEwEPrKaKNeDNmoLIGaRml5c5LM7ZwwUO
	uZ0OrteNtFOizJkSlz3ARtA0bi/rOr5H0IvCRM82jgF31w2o7B5nz94C60DDBpdoLLm+X6
	h73acdlQZdIm6Pd1FixH9rDMgijz0l9bGfnhgRoljhh1zqkV4AMs6tNiCgLY3mZnlOdjBZ
	nql7xxjlhho183vCd76Can0ttRPl+2VTt7ablJs+u8VCXM+zmaf6Tn5nzB4NciDSLSC7c4
	nZKcPAhcCP1jVu26ifEPfgSNsag0bPa2Nzb1tdwhQOH4VJ52jr/owDoMe4KUvZaNJybsM9
	a8gSbZqdEiC6MgYHa4Zq+BLRuBoDI3DbpN5qMhrs881JkZwb0Vu52dDSYqxAqZ27FkgSKt
	Z8W3MXLO1SW4vUB5P8/QsM8ghBzEfRkoLRyhIVmXBlTZeK5EENncY=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/8] staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
Date: Tue, 28 Apr 2026 19:44:34 +0300
Message-ID: <20260428164513.763471-5-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Inline rtw_sitesurvey_cmd() directly in the if condition to reduce
line length.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a35d726b803c..caaad38dd790 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -772,9 +772,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
-					if (rtw_dec_to_roam(adapter) == 0
-						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					if (rtw_dec_to_roam(adapter) == 0 ||
+					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
-- 
2.54.0

