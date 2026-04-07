Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01F3A4F3F
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557304; cv=none; b=HurABQsjO2MKWwOHarKv0JJWCkvaMGHwwgF9D+X0UfqmuKvfaW+iZEtmaP9OYS4BoJMA7L/XxA02FTpP9JvGtQDehrlS3pBrEIK5nRBQMWWtpf1i45+FCFqTSF5kCgqJU2JcaB7lub6e0ftpcD/HUkDGhKrtanN/yaxw1A6PZrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557304; c=relaxed/simple;
	bh=TY3BV4MwD74m8Hew5ihXJQecOHrG6AJj+RUADscYsgg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qU9vpikgK1GEU6Qnh0/SRQo/fQATDqFnJghdtaFnbeLXQ4wIfELTSQPkT4QWYmi9wotM5rQSJ+9H6Ir3tV1yzCjlnw0IeRVQeU/d+Q46O80grOLjOIEcxTTSs14aUoKAfo0TKRQrbKMq1FdqY1Jk+538wdh0d+2flmKhicY9lME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=fail smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=YNNnRjQ5; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="YNNnRjQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775557284; x=1775816484;
	bh=fuaaPpj994+EoHagfwrvNSTC3096ovWMfojWtaPfHvc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YNNnRjQ5fgI8jvdZCVtxf3nambWbQi3OEAZDZwmh466PS7E9xqI9Zj6kMkfS6bYs2
	 dAN6oZZ6ZQIHp/E7KxHVmaNB6ssELmBEauG3Rgla+DeCdmE61R3syFU9Pr6Ksy6NUp
	 8f2kMg+cLOxAm3VP98hnYOnRyPvresSWa/VuDP1TxBq5sMYHrGCH6V7NuRp7F9YGLg
	 /RHtwZTXWqhAD9fFy5Vfalja/SaEBmyDVQHb15vaifQyOMPTXrioB93PFv+0PLD3G1
	 kAQcDCRn/EggGmMlXcYVE72JM7ftVICrHJLfzmZmlTKh/z0vAzfc/zO+YsfzBqzis5
	 eXwvVl0OHiXDA==
Date: Tue, 07 Apr 2026 10:21:18 +0000
To: gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Message-ID: <20260407102112.94414-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 2b5b33d94327eceeacb7fb8e1a6724b43fd95cca
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------21f587712fd74cb818ee255d58872fa58e04f2a94b3894e79c711be92ecb7bc3"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------21f587712fd74cb818ee255d58872fa58e04f2a94b3894e79c711be92ecb7bc3
Content-Type: multipart/mixed;
 boundary=dcce700e5e44f357c2df529e07aac662ec8ee34f389c9d594d98c2b526ad
From: Feng Ning <feng@innora.ai>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Date: Tue,  7 Apr 2026 18:21:12 +0800
Message-ID: <20260407102112.94414-1-feng@innora.ai>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0

--dcce700e5e44f357c2df529e07aac662ec8ee34f389c9d594d98c2b526ad
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
without checking seq_len, a heap buffer overflow of up to 8 bytes
occurs, overwriting adjacent fields key_len and key[].

Cap the copy length at the buffer size using min_t().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Feng Ning <feng@innora.ai>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..4fba53c2d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -883,8 +883,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 
 	param->u.c
rypt.idx = key_index;
 
-	if (params->seq_len && params->seq)
-		memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
+	if (params->seq_len && params->seq) {
+		size_t seq_copy = min_t(size_t, params->seq_len,
+				       sizeof(param->u.crypt.seq));
+		memcpy(param->u.crypt.seq, (u8 *)params->seq, seq_copy);
+	}
 
 	if (params->key_len && params->key) {
 		param->u.crypt.key_len = params->key_len;
-- 
2.43.0

--dcce700e5e44f357c2df529e07aac662ec8ee34f389c9d594d98c2b526ad
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - Jiqiang Feng -
 0x7D1A285E.asc"; name="publickey - Jiqiang Feng - 0x7D1A285E.asc"
Content-Type: application/pgp-keys; filename="publickey - Jiqiang Feng -
 0x7D1A285E.asc"; name="publickey - Jiqiang Feng - 0x7D1A285E.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuOS4wCgp4ak1FYWFSbHJoWUpLd1lCQkFIYVJ3
OEJBUWRBd0tYblA1L3dHcFc0b0plTTVmVEo5bVRiTXdmaGpzSzNheldTClNDaGg4cnJOSFVwcGNX
bGhibWNnUm1WdVp5QThabVZ1WjBCcGJtNXZjbUV1WVdrK3dwTUVFeFlLQURzV0lRUjkKR2loZTgv
NlFmQldVK2lrdWN6QVBZb3JvbmdVQ2FhUmxyZ0liQXdVTENRZ0hBZ0lpQWdZVkNna0lDd0lFRmdJ
RApBUUllQndJWGdBQUtDUkF1Y3pBUFlvcm9ucnpyQVFDNHVMcGgxbThyaHh1dUFCazhPbE03QW8w
cU5tUWdoN3Q3CkZIa1orWmxGOHdEOUgzWDdrZjR5MDl0TnkzZWpRdXNKVko2VjFWekpMY2RnU3oz
WnZJSnMvZ3pPT0FScHBHVzIKRWdvckJnRUVBWmRWQVFVQkFRZEFsOUVsUGwxU2dkQ1JiMmMzNTh1
VmN2UE1oRFBTRlc3Rnd5TjhORjg4QUNjRApBUWdId25nRUdCWUtBQ0FXSVFSOUdpaGU4LzZRZkJX
VStpa3VjekFQWW9yb25nVUNhYVJsdGdJYkRBQUtDUkF1CmN6QVBZb3Jvbm8wWkFRRG12c3VQa0hn
Q1VHd2daaFhtS3FKZFpocTlYK3JQYm12blNjbXllOWlBa2dFQWorSWgKN0dVUklYR2tHN3NlRFFt
WCtCWXBBa0FSK1JUNmJSYmluVHQwaHdNPQo9M2VuQwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBC
TE9DSy0tLS0t
--dcce700e5e44f357c2df529e07aac662ec8ee34f389c9d594d98c2b526ad--

--------21f587712fd74cb818ee255d58872fa58e04f2a94b3894e79c711be92ecb7bc3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmnU2p0JEC5zMA9iiuieNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfA6TRgwQrZZAs+waL7a2SiFiEEfRooXvP+kHwV
lPopLnMwD2KK6J4AANJjAQCyqn0x0l+dqQbiARXDTvLXs9vQvWrJXET5wFad
J0WT8gEAo5Egk8nVdX7hr90NodNJEiNcACDfqS1yXdCmRLf3jgo=
=b2iA
-----END PGP SIGNATURE-----


--------21f587712fd74cb818ee255d58872fa58e04f2a94b3894e79c711be92ecb7bc3--

