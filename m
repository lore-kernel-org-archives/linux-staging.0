Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3273BE629
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660458; cv=none; b=XY463Mbl0RPFVLuyw6a0AeRNlfON5ow6YwHSPTZy57VYVEh50Z5kD0YJXV0EX9GX9dHy6slsOC5nstvB1NZxCOWaqC9djO9629Bc7AI827Q3UC4ZIv7j8EfdhWYWDGP7p6sNau3yfSKGQUxYFCV44g00Q1yOW2KEwPgP1Ht9MGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660458; c=relaxed/simple;
	bh=UHNMw6DvSqgTcpvCnatseVd2OT1rMhN6Bx6PeYTeXqw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=me604Ax2zpHOegsFdw98ptho/go0YruuCQRBYI0Uva6UDrynDV++VaJdCh1IlH4AVBhKyFNrFizKDbOQENS5IcBSfCNbrhA/4CiHDKryYeXZ/oYH1ivUCmlJgW2eb6eaW9GW2AI6MTWf34vrdwNyHCfNFHHZBCGm33Ucb8Hdtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=bw3EwdHU; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="bw3EwdHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775660434; x=1775919634;
	bh=8nHB1nSjLIztiqiDLy4T0h3oIJoK7p12TwThKafY/b0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bw3EwdHUblHD4DkGJPWrUqTgk4hzLTNu9AOPXbyV8svFtn3dZZdcUdiO9x9tfBBow
	 OtyX1CdPQnuOM1C5IS655l4sLeMOQVjqJHEIJUwpTUP56b2opGrNLSJqzSDZJq+zGt
	 R3AFhV2pDjQx8HRnpfLCJQpFp+CtDkuDyk8qF6rOy4d6hNfLt3nV42N4FGwy2npuev
	 v5oIqMNomNZBX6NmQYEg4vFtQp/vqonjx0VxLQN+1J+X3t9DB2gDLkrYBo0iopznPN
	 1S1gj6MagB8EgkLWe31cJqhQPsRSa+egf75cwA3GZhxvYJ+v7ICP2KnA+XQDOJbWHb
	 qfPa7wK7xpPJg==
Date: Wed, 08 Apr 2026 15:00:25 +0000
To: gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, feng@innora.ai
Subject: [PATCH v3] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Message-ID: <20260408150019.16368-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 0509b0de8200b9e37eb08985e5308b9e2f4a6124
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------3734fff6dc06592cffec12c41d58b86fc6980663180f5f52a302d92fe0018206"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------3734fff6dc06592cffec12c41d58b86fc6980663180f5f52a302d92fe0018206
Content-Type: multipart/mixed;
 boundary=0547a7ddab1ef0b043b716ddfe9eccb1bfc49d7bfc776cf1b5155d350a19
From: Feng Ning <feng@innora.ai>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	feng@innora.ai
Subject: [PATCH v3] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Date: Wed,  8 Apr 2026 23:00:19 +0800
Message-ID: <20260408150019.16368-1-feng@innora.ai>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0

--0547a7ddab1ef0b043b716ddfe9eccb1bfc49d7bfc776cf1b5155d350a19
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
Changes v2 -> v3:
  - Added changelog below the cut line (per patch-bot feedback)
  - No code changes from v2

Changes v1 -> v2:
  - Initial public submission to linux-staging mailing list

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..4fba53c2d 100644
--- a/drivers/staging/rtl8723bs/
os_dep/ioctl_cfg80211.c
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

--0547a7ddab1ef0b043b716ddfe9eccb1bfc49d7bfc776cf1b5155d350a19
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
--0547a7ddab1ef0b043b716ddfe9eccb1bfc49d7bfc776cf1b5155d350a19--

--------3734fff6dc06592cffec12c41d58b86fc6980663180f5f52a302d92fe0018206
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmnWbYkJEC5zMA9iiuieNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdtWeMYHMiOFacXlACN3n4KFiEEfRooXvP+kHwV
lPopLnMwD2KK6J4AADlRAQCdjuQLzs/L5lqZAgmMU1ekxapEnWEWubNGTd4N
YQl0CAD+Nn5u341EOcFJiVRrFFaH6JN7hBsBqV0dDwrEbEJQtws=
=qhkA
-----END PGP SIGNATURE-----


--------3734fff6dc06592cffec12c41d58b86fc6980663180f5f52a302d92fe0018206--

