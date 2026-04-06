Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0439E199
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775515875; cv=none; b=qu24euuMHmJelssdF2keKhgk3+m4xFmbeZWAVbbuelZL8isGQ4xjsuAZG7kPI5PvK8VNLPLjjcjlQA/JafJgOeMe8ZXdPg2Ylc9G0nXvthXy7yw2uq22kDBwuCHN20WDKu1sSXp2QdLmi43NY4MPCE6Juy/zclJzUj0Q90fHE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775515875; c=relaxed/simple;
	bh=kwereL4KBzov2lglzDs04woORbDyWzjog7SuYe8LT/Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FkxZmH+YmyNPKRdAyT6NMPAfLlapRvZ3flyXnl3F1q68Nhl0j6aU4HI//RVDzHDMNmjOKrh8kZXSBSOX6Uy+a//GFtTh2hlLx73k8ZiJcY0cXlGjQnd0J+ndXzg1KIfoao2f/1cfB5wULqwwwWHWpXjBxgpzJpCkVX0ipUgBFcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=dLcrAg0l; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="dLcrAg0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775515861; x=1775775061;
	bh=hBx7Y2MUDeIaxrCWWUqCEXPN56aB7e0d0AGp5CgURYs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dLcrAg0lSVy5xoKY7NgudS/6foMW1vzH/oxZ8puysUr2bY8zzOk/gEfmwxD2a0s6R
	 91WBqZ/PkfbSWcv0oGF3LVK7QrKUXwYrfpwppjcw8QEL1SeWXSX/vg535ifClaK1Wz
	 XuFgUL8gkti74wWboOK6BBABaiDtb11Mlw4G/YtxWc1USMUwxdLHkQ/viQedYEJW/L
	 n94ULwKYePb3i/02oZepwI22QQSyZtjJ6YhSulZK0HZY/OdCbfi788LLrntREeNrP2
	 Hv5biGxy9Q4IR6tjtMh772JID0JYe1I2hb00Iqy3wCbXOtBe2ir6tjzTzMyzr2gxZ7
	 8gDwWvnUmTTPw==
Date: Mon, 06 Apr 2026 22:50:56 +0000
To: gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Message-ID: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: ae892b3e931461d10cc8996985e8134ea998384e
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------66d04a69c0e8b921fd311c71878e042eed783daae3b65cb7c3f284a0df6917cc"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------66d04a69c0e8b921fd311c71878e042eed783daae3b65cb7c3f284a0df6917cc
Content-Type: multipart/mixed;
 boundary=e9b9abc99aa1423862f9698309ae6626e80f5da67eb42473e595a830dc7d
Date: Tue, 7 Apr 2026 06:50:49 +0800
From: Feng Ning <feng@innora.ai>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
Message-ID: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
MIME-Version: 1.0
Sender: feng@innora.ai

--e9b9abc99aa1423862f9698309ae6626e80f5da67eb42473e595a830dc7d
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

From: Feng Ning <feng@innora.ai>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key

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
 
 	param->u.crypt.idx = key_index;
 
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

--e9b9abc99aa1423862f9698309ae6626e80f5da67eb42473e595a830dc7d
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
--e9b9abc99aa1423862f9698309ae6626e80f5da67eb42473e595a830dc7d--

--------66d04a69c0e8b921fd311c71878e042eed783daae3b65cb7c3f284a0df6917cc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmnUOM8JEC5zMA9iiuieNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmePd/YIbW183RwleqrxGR8YFiEEfRooXvP+kHwV
lPopLnMwD2KK6J4AAD0YAP923XUzyPd+S9kvShFuDtNO7S7D5r2oN7e6daa9
+2+LpAD/ShiXCNdxUzCxeL5c8wgcGonFF9o0cFw2B+5E5Gtohg4=
=Q2nf
-----END PGP SIGNATURE-----


--------66d04a69c0e8b921fd311c71878e042eed783daae3b65cb7c3f284a0df6917cc--

