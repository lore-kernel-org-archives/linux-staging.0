Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5B326951
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973976; cv=pass; b=cOp1M7IkQOOz5b3QDp04ZIN0TjUHt/XQgTVjMQENCx6ntWXmzQAmIit+kuBR53zxw/43FOmrNA4CqHoKt1L/vZgsD+g8jPi3hefz2fHlBHmQnbWhYBXqKlU6xdx3rj0okoHxixMKLG5C/AuD4BMFu+WflJV2Ynh/ov/GYgeZFXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973976; c=relaxed/simple;
	bh=2EodsLUmN/eQzq97aCsIk5cpPTEHyQB3z3yyulX37ck=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=nN9PXvzY50n7jAOKTrKuDec9JVejgyj2OemW1Z5PXsufLj/nAbdlDldDDnUd8Yw6oKYh7n4WnXoo+nlwh5uD1vctI+HziZfQmvXjfFlusiOzJhAuZyRtgposs5PQqsoh8S4Q5AttfBmGNS2Mp5H278spIVnPFlKwcjp/mjuWDN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=xZbHRGSU; arc=pass smtp.client-ip=103.117.158.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="xZbHRGSU"
ARC-Seal: i=1; a=rsa-sha256; t=1777973958; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=NKJyHNIXcWwKUdsAO5lxnnF22gwyPLRHbYiaQ0KZ3XbyM7Qs35lqi7M0smSbxxuQAeXk1IsNtjvC2DHdgC8a5Htq+JXxa5EkJsYSbRKrG3cJbb3pPPP9+T29+hZzXFdOyTOv8ark30uI/6NnFUulnev6gpLITmyjJxl/m0EhNVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1777973958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlPZDgNVTCvkX0E/dyM0EkkZtNq0pEVu0+GEWlow63Q=; 
	b=dY5jsTPnU77Q8ktYxG85MezcE+tCWYfIQjQ5l07L1HKfn7KMluibdHOe2/LlHLxANXVqDOxG6DilZ2fSLu6O1NFEg5+/vF6N6pydwtQTZHqi8pOS30PRwr10CjgQCQK6YgGngebc6HL63Lk/8ud6IxXU3e7ZToRVjDWOTnJ0dZk=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777973958;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PlPZDgNVTCvkX0E/dyM0EkkZtNq0pEVu0+GEWlow63Q=;
	b=xZbHRGSULYMp/DyLgqXxFpFVcQ8L21Po5zs/dlYcx9W3Z/MVRsOOnQX5v+vQFlF/
	/MD7E8oaqHsGEoNAcGWp2aQKkk4C11N4M4+hBAdbQMaqg1ptgOyRQmJ25JJd5HvSvUF
	uY0iHiFeQ8yysdWYEaMaU1PrVL/bqF2JWCJUjSfE=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1777973957369198.5458674438654; Tue, 5 May 2026 15:09:17 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Tue, 5 May 2026 15:09:17 +0530 (IST)
Date: Tue, 05 May 2026 15:09:17 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-staging" <linux-staging@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19df78192f1.8499078d18124.8136902784979453848@zohomail.in>
In-Reply-To: 
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


From 833733dda327c72d63bcfb18701fadabae03e4d2 Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Sat, 2 May 2026 17:19:48 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true

Remove explicit comparison to true in check_fwstate() call and
add spacing around the bitwise OR operator to improve code style.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..c100a0d70fe2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv,
+		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {

base-commit: 26fd6bff2c050196005312d1d306889220952a99
-- 
2.43.0

