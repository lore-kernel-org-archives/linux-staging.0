Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510B2C030E
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 05:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043797; cv=pass; b=JMtogg84PDKvMwhHDj99QAO8gvr5+CvNEbQzD/ADyZ95tTFlyfT+yOOHb1RNXIwWFXp1tThWmF46BPCnpqNSxxyTtaCH0IVIf6xwLb71EbbOOwQ0zmV9xa8qQuL3Te5VEc8eHDid8Vfk/JlMklyxwaFECWDoPHdo+ne8gW2m5tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043797; c=relaxed/simple;
	bh=BYOS9Go+p/nQYQxStnmmar5h0hQmvgy0q1/7fOe5pJk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Wd+mEqbZPsI09NL/rptsVFgSWTAnF+W/HKZuHjAjZm5xNSTXRIIbiraQA+QATYo56YW2ziSuSYwuRedLCqm7VscAXYEbzVjbKiOuQigA21YVQGLCKw8hwtdGYBWkkK/lnLOSsoU96MAQQT5np4hkW4M5UkFZemKoPPnwEeb+sI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=EmTov3Cm; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="EmTov3Cm"
ARC-Seal: i=1; a=rsa-sha256; t=1778043783; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=aI/m442mcQoy9mP41A1giFtsymhjvuLMX7aRKDWo4Hn35AIfXbdtTBnUlzUdm7vjEaZR2W4ScYoib43nnIMfW8iJ+BcTtd2Lztid0MUy9Jm7r4ApoB7d1yDKkT9IR1zCstiggLux5qTFHpdbbuf4uuZXNChbgCDmVQcOHF9Fk/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778043783; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Te2SCEZSTl8T7Kh9A4P/VviZJTJ4Muv4QbD7Mw+pWAw=; 
	b=FAShfhXz9gyY20X/JXcR9BN4Dow+et4SsNpZBBYhSanuptICAe/JMfFBghG+RH2d26HpE8iqphPXQzubXKPuDNMEEf7f/s5UkgzarEO/1WE1EkeYjeMpCdzMyjPWwW+pUXWDva2GSgtVwR1yp4ZK1QYy9C3ADK9sRIogLAXZl90=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778043783;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Te2SCEZSTl8T7Kh9A4P/VviZJTJ4Muv4QbD7Mw+pWAw=;
	b=EmTov3CmGO5RntVX98fw6aMd8OydYmVm8ci1bBg/KkdTA1G3vcPhERGFQFCSb94R
	4S4mLS4PxdVLhmsRAaVvDrxNl6/YRj1Dw8zfgNe5Duv+9mAGgW6VMiYBfB7RM9K4zVc
	FWyARW0gMcgwqmjUAZ2ocuHy6eh5IlX0DmSu9uPI=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778043782578577.6840341628133; Wed, 6 May 2026 10:33:02 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Wed, 6 May 2026 10:33:02 +0530 (IST)
Date: Wed, 06 May 2026 10:33:02 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19dfbab05a8.2d751ade4111.3028810368318669188@zohomail.in>
In-Reply-To: 
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary comparison to
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

Remove explicit comparison to true in check_fwstate() call and
add spacing around the bitwise OR operator to improve code style.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v3: Fixed double --- line and corrected whitespace formatting as
requested by Greg KH.

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
