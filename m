Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C33175A9A
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074762; cv=pass; b=sde4jNAXZaV897IP/jvCMlZ6awczgVpwqHscxjUUTLl4dBDc+63Fn67FDlhqk7z8hR1dM+usUCedcwjxk2QsNK7mre9BtQc3lsBJbQMgCWWgfP5CPuLUs9slUmQKgshtTXPanX0a7ou3SB2153/MuOOtaYYA58SNFZVUM+bK5Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074762; c=relaxed/simple;
	bh=qm6izKadeV9kSFa+bj5O7G5iaDZ+qVHrHd7aOeppdDI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=TwRQYB1mUPpQ2HCa5l/mt6hksaLOUIER/ascpAvSMGGYOwcAiQJCFDrXlRaM5TO6cojGOa5+XRADZQ5JCg0N14pc0mqGA7mGXtOQWdyjthUkoKjQibE28hctBmTM76jKO7Bz9QD4NbuzEqfLFpJf69Y7RNVjba63LvLWSfULty4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=R+ICuf8a; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="R+ICuf8a"
ARC-Seal: i=1; a=rsa-sha256; t=1778074742; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=cK/kDJcEUcOTda6LdupLDPokTfaeO06XsxM3LHwz6mj0DiG80/gczblU8Q63mVXPmQneakOZpaf/s3Ta03jaGkOcWUA0xv9In/FNjkj3b+AiYc6FvGtlCXFqRHhpU6gCF8oSPBS6EcF6MwIhde4zS5109WqIjRGja5N/n0qqOuE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778074742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+/KT2tIRe9WnG6FF5zp1c6bqyhwpWmskkDFOgWPCEvc=; 
	b=HOvJJpj0/m97EHrzhdYlSETVOaXPPm5MT13c1AbpfHZJdfYJsCN1vYWuavSh/Qd+x7aRYwSJlA3vUCJJG50+dX3rCsKDQGkgX+qDp/uPALK27Gr63J/EGKqCSUQ70DTX0Kue5jY6ZxPCC8InndOE6H+ZWtS4cePbVXiIFJw5j/E=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778074742;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+/KT2tIRe9WnG6FF5zp1c6bqyhwpWmskkDFOgWPCEvc=;
	b=R+ICuf8aXyOsKuKQySF0tBPVnKITa0lJDRa1SgvapNp3Te2pLTXisVqcidc+CNEV
	RrTk4VV9Kpnmw5JzBVZuIpOesDZIgBpLGVSCMEwYeUun8ArRGl+2AgrasyLwZvkvWsd
	rYqVbd6Nt/B5ZU08p7nLxWO4S9a8qGuJcaxWQeUo=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778074741874267.09198889582535; Wed, 6 May 2026 19:09:01 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Wed, 6 May 2026 19:09:01 +0530 (IST)
Date: Wed, 06 May 2026 19:09:01 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-staging" <linux-staging@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19dfd836c6b.17df539d18654.525093089149603654@zohomail.in>
In-Reply-To: 
Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary comparison to
 true
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

From 86e105cece56ebf48c8e9ac86d417d201ebf081d Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Sat, 2 May 2026 17:19:48 +0530
Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary comparison to true

Remove explicit comparison to true in check_fwstate() call and
add spacing around the bitwise OR operator to improve code style.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v4: Moved changelog below the --- separator. Ran checkpatch.pl - no errors
or warnings. Fixed whitespace per Greg KH's review.

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

