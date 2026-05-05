Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722F40243E
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977866; cv=pass; b=VzK8hlpQLtpYYbammmDzdfNSnhf4aczFQtnU7vPDcxJ6VmsMMN7xN2CQnvGP1v8OGdPM8xsQ6fQ6L+b5oBqZ7CGclkgC4BjhUe5cbmVT27k6RyitTdYoKmqeEeC8S1gNoceaeo9mfyQoRRhCJXOibVS24KhqpL8RF0WqI9Ya1Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977866; c=relaxed/simple;
	bh=o+e7ieN7j1KzKMdKBeAQEWDZO1fgUWd5XexCP8ZhlIo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Q1ZVpYovYv/aYsfwDoso5pj/EssprFliR4l91b0Z01r0y3qjMh/Huf3Aa13vBDuZsKdGOhvOlgjV1ohdVgvzik+L/uqNwmmbzsdsP87Zq2wrWxpqBCA8P331axKQ+bkqItKH0jhQFr5l032LJ6fOvKkWWHY26gWoj8W/tz4yBoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=MoETOZdV; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="MoETOZdV"
ARC-Seal: i=1; a=rsa-sha256; t=1777977846; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=YzpTJIyvNtHzrelIvE/OvK7DmAeRL4TPX050ebrvSopdgn6uIEf9vls3sKctm0iXfr7mPLrLBZYRBUVGP3+ijfrfZmx8au+rqkprnEyw1NQBqXPwTV+c5O+zwgYXjGaKBmWj7sTOoDisQynuEEif64+EzK8JlqJpL0qgkZpooss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1777977846; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y9WX/rDmWztHJ9ekAt+vzdsOsFg0/wH8/JzuyxVqyHY=; 
	b=FnsOvA0zV47NmhJCdydotpIBFbqcI13yiwvxmY0W/CAgJCH1ol/cb7jHTgruH62VCL77kUlY04lj1ysrJm5NN8zWDITM9u3UXWmI3Hin85W4+icKq5Av+i8gVFfPr46/18eTd12E61vvAtn/3VkZRa4MJ+6ySh+w68KQCAJ64SU=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777977846;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=y9WX/rDmWztHJ9ekAt+vzdsOsFg0/wH8/JzuyxVqyHY=;
	b=MoETOZdVVq2Twrz3+3q7wzGXzLB6s9rFwuBl1/vzzPliIGs7bG4cwESiWS9AfH8c
	EOz2ae8Ib7FkBy/467AUnT8aYrTVunAVMr2kWVEcgchwiK1uO0XVXMkWypyqIzs9AAk
	8IaclErJDJWXdEGpKhJ/JliIXdJwU2J53+4+c2oE=
Received: by mx.zoho.in with SMTPS id 1777977846058605.1256011103803;
	Tue, 5 May 2026 16:14:06 +0530 (IST)
Message-ID: <f14818bb-0d1a-45c3-93c3-17505571b071@zohomail.in>
Date: Tue, 5 May 2026 16:13:54 +0530
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
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary comparison to true
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

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

