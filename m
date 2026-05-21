Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A341A6806
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346100; cv=pass; b=t2cbR4hjQ+zqDHThRiWFYHfzHoWWxuriHHajD4yTtirJ5noaRovxTR6Vg2VaX4cP12sM/oja3QKW/IIK05spc5MagviG3qRx2AOi9iGNFb5Mp+m9y9AhRWeIglyuor0jbfE5TqYItuIV+xSXIAWrfNVZ4Ats0dEWgmhrK57eFLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346100; c=relaxed/simple;
	bh=MJG9iXQSIGDAVNxn1KYHCM9QRZ1SbxK70cTzol3yk84=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=pBnlKTpg+q1f6h/GefTxTuiS5kBLN0gKr8zC/HA6zCdfZW0OwbL/SIf0stfmBvuOxceueGPv+z4jZXXZw0/ZAEIsNwhgllu2mC0MhkG6MUhDc88zEa4HmDibt+PqsPcQHX+SCrvnJMoJMVBl14AD8js4ODaziTdIm+w00wITekw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=rkqVpTGK; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="rkqVpTGK"
ARC-Seal: i=1; a=rsa-sha256; t=1779346085; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=f8MgYPI8ZBIwPi+/5spbAOd+vzL6qiOltbMvzzJUL4NjIcQ1igRh1t5y7PoStCWMvjdOLcskpES+VBI939pLjHUBzzoPauUZEAC7J1TJRSMOS0LJchHFhEZTwdLjSCM8fkec1k71L06AV7qw1m7pjZR5GVBjbn9nNLlxoJG8188=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779346085; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YqPJfE42GsmUhhqFfno2pSkVz6l+FgYGPmH8RJohuZM=; 
	b=MB7fZ9Df1V0s/5ReW/ZZkS7xMlCISJrzjqYXFFZu5ibCVHiJ4pfFOi2rqSjk5G9c77pzyyN+Eb3I2QCQcXxl2qLnN70ywUNEL5IAnKfFL/s/V2YQ3cPipSTah4ww6+4j4/h2210VuZzxAdAilH7/4/2t+VCiZwvwLVyYrVZtnDw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779346085;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YqPJfE42GsmUhhqFfno2pSkVz6l+FgYGPmH8RJohuZM=;
	b=rkqVpTGK6K/SItBKTp8bing0Mmdaem9w54uKSavZ7u07q7TRUykiYnKibiwd35ty
	5ulTS8m6C7oM3x2oejsm39ykJ1JMwQFmxju3rhAy/9T7E9v0XHMaXuo5LmYCskKS3r2
	6FVKzGM9x4KTqVrHhVbVljiJqIg5j3jqmu5b+Oqc=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779346084587225.8370083695238; Thu, 21 May 2026 12:18:04 +0530 (IST)
Received: from  [27.59.63.162] by mail.zoho.in
	with HTTP;Thu, 21 May 2026 12:18:04 +0530 (IST)
Date: Thu, 21 May 2026 12:18:04 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e494a92e3.67a0e83072082.6269846394596840299@zohomail.in>
In-Reply-To: 
Subject: [PATCH v11] staging: rtl8723bs: remove extra blank line in
 rtw_mlme.c
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


Remove an extra blank line between statements to maintain consistent
spacing of one blank line between blocks.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v11: Updated commit message to describe actual change (blank line removal).
     Removed git header from email body.
v10: Removed extra blank line. Single blank line between statements only.
v9: Removed git header from email body.
v8: Fixed double blank lines as requested by Dan Carpenter.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3d88a3a185d5..22776af126ca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -483,7 +483,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}

-
 		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
 
-- 
2.43.0
