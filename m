Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3380363092
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975747; cv=pass; b=hvIsSYlfPvDv9Ly34jATWiQlkUNpwS2M3futKzLVZpSst6Ny2xoVGnRlTH+yTrBtA8QvfMN3OoiJkUNoVLH5pWn0Bq4VI95F3CI6DadupEJ0gejhjtkes35y4bW+EYW23WHd7JVtGm79/wjn0ty6dsCZwVhfTjHUs1N1c2SW1AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975747; c=relaxed/simple;
	bh=Sl1TQa8WeMZ4EuLWhlqAJXgF9hosucPpfOCt4Tz5lto=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=b5zNDVA1NR4Bg1c/UbuMIhjHZGAN9ZfCUw8Bkey+dV7ryVuu6p+GTOJkJo8knT2NezneciBnDQ0nCrl/jZY4pwfkcM2GT0dZXjt52s8a5yDNk/+Sj1qy1527LTW4i7KVBkaZjchb5oZ0Z61c3DoQietU9nxjcQC+jnN2LhvKJdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=JO5qFGGt; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="JO5qFGGt"
ARC-Seal: i=1; a=rsa-sha256; t=1777975729; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=T0b6e4nP3TcWP9Gbz4ofMdgcLo1CEdjXAcTgi2akCEJvWGA2BDHQpYhqD5RqBCrug6jKDUU77T/HTbyL+jTSCZSXtB/g21S9ye8nY+cMA9+xbA8yt1tuvJeBqKLTi/NokwhuQzXbu+PoguK1kcaX1WylJFqvGpANcvqg0L+Yivg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1777975729; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7WBjnqEyMc8TLCU2Vdko79mPVTllFaEDx1C+goelZ4s=; 
	b=MyyRY7luMD5gPz6OAbns+rC8Ek77Nzsis5TW5JUBVJrYxSyZA1y7XUlsX0S1789ZtsxC65GcpOs7bA0eW6HLz9/2Zp6kq8hHEVQD+kaws9CUSLU5G6PyhZbHyzK9wy6waHrJrevxTuPHsBh51oBFYthCwTSIu/Q2tVq4U67Nt7o=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777975729;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7WBjnqEyMc8TLCU2Vdko79mPVTllFaEDx1C+goelZ4s=;
	b=JO5qFGGtOIkTqxn7BQkR3th370TeSczc4xMd6R7c9ix3LXIgU1hOwUMvGF8ghu09
	CdsJbDRLqbDT/xrCt8nWzTTHruLRuL4eYsH7PgjbYHXYmhIj3s/lK7D3nJ792HzS7Lb
	1zQXQFLnp9FJFhxfdMF0xOWOhFtonRXYzzeK2R7I=
Received: by mx.zoho.in with SMTPS id 1777975728899202.3550388756977;
	Tue, 5 May 2026 15:38:48 +0530 (IST)
Message-ID: <c4d5b70f-dcc7-47cd-a026-2864e0d76e46@zohomail.in>
Date: Tue, 5 May 2026 15:38:39 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary comparison to true
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

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


