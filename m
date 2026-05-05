Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E55441031
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976263; cv=pass; b=bwNg3mqn8GNrlEphSDgOS6FBthy5VmqbFPRwkVhD+hM3OIJvxRBJQGkqM1yS9Ws0kk1mDYBm1CJk+Y/Mi/tTGAj/riNfGhP4MTaOAVR0fwccahi7H1nSf4E3QhCq/GBOIyGj2yqD9Nb9hKkQrnN9NZwK0OjVG48vwqhMRz/+lLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976263; c=relaxed/simple;
	bh=YHs3KBgVGmbLPPtj8jzwzvHa+IVJiHcmkhLvjNsjMRI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=C6RCWUKjaw6ZtxJTWYxSzfgeLeYmfItrMvxoJZ+nh3JUfgU+dV7cN4kC8CIGlb1r8G4XCXryT9IwFtxY1roHW8rM6frKA/NSpwh6X88nBuDeR9aA+BnnuB9LS28tbbanI+QOfoyoGtPhOzcpUZMT46TOF7kNlAReEgwHyXTJ9vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=k8bjy02+; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="k8bjy02+"
ARC-Seal: i=1; a=rsa-sha256; t=1777976242; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=K7oOcGi7FFUh3K9rn3J+6iaC19yY9UOxNA8edU4NFOdY1pcW5gtoIKh6munbiMfKqjwk5z7FHlgSgYTPq5YRESTi7plbRI4iOrWa1+ncE7OOplIDnUiGR4RIXkOKWUvauKurTb4xiY3JmKoMYqrE03DrNpW84KuPTSMcp5+qfJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1777976242; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wlpDoWHkK+8NEWZEYYJFbx1kUCOTe2MyW5u2fZNMLmg=; 
	b=F42xliadcK3KhdFiigwokZXXIPQgU/q9+jeRUhc0Jm83BuMD9WBaGFrvw+NMLwgM1tmNHHmORuj3jYhZJJudw3286VSx0W07yNklxjEl9QuEuPZFEeSH1/7So+830Asj5XfPWZpXC9xGYVafbxF4XGA8YBcgmKqRh8nd7iKQ2uM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777976242;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wlpDoWHkK+8NEWZEYYJFbx1kUCOTe2MyW5u2fZNMLmg=;
	b=k8bjy02+PNh5rS96yTJcrFK9Bx4C8UfT2GCdJJ2jzyiKbBP5Qv20kok2TUzFmozh
	frdn3Wo/E2hOkqTbdzaT2sBIzmvk/bCAiUg4y8iQd5KLPIjjgnpsjEfI6jJiPFXAsEW
	tg5J2HTooEV/Bczz6oyYzkHU+WPECqD/Kgw6fE6E=
Received: by mx.zoho.in with SMTPS id 1777976241196120.77549720749039;
	Tue, 5 May 2026 15:47:21 +0530 (IST)
Message-ID: <794ad23a-ff17-451f-9d6e-144623d76a18@zohomail.in>
Date: Tue, 5 May 2026 15:47:11 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

 From 86e105cece56ebf48c8e9ac86d417d201ebf081d Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Sat, 2 May 2026 17:19:48 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true

Remove explicit comparison to true in check_fwstate() call and
add spacing around the bitwise OR operator to improve code style.

---

v2: Resent with corrected whitespace via Thunderbird plain text mode.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
  drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c 
b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..c100a0d70fe2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, 
struct ndis_802_11_ssid *ssid)
      else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
          goto release_mlme_lock;

-    if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == 
true) {
+    if (check_fwstate(pmlmepriv,
+        _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
          if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
              (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, 
ssid->ssid_length))) {
              if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {

base-commit: 26fd6bff2c050196005312d1d306889220952a99
-- 
2.43.0

