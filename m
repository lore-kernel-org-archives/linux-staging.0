Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADE18DB37
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775688391; cv=none; b=JdiULKyPB6UCwkvhLbJtSRqI5UoPohVaA3J9cFT7czNxcde5k7K3srh9qrWKN/+P+54E5bx9VeBih/l+uKff4PkjHY3ePD4sQv6yQX7LFwq4aI16voFJ+spnB982gxWEdeU3rJmy/fxk32YpsFvXDMSpN4Dv+LLyT7pLuzUgYL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775688391; c=relaxed/simple;
	bh=Rc8Qy3Wd6DJqCVCowO3gN9FTgFLY8h3mCIcMyCmPveQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VTGmGe2H1H9dL8hn4apHfVpPHtvqHNBmwjSh+rbZ87RxMeWUu120IeiUqMPN1h300ux8H0/YM0pndTr9JU6DINRGZIp/gSgx18ULkHjB99wn0+7jqwSz4lPDW/XgwA58KRjhMOa6Roz72wAcuhgoU2YSjRUPfO3Om1bJpGqlbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=qgHdG0pY; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="qgHdG0pY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775688380; x=1775947580;
	bh=QLAlcT/V0CJjuVYHyFFApY48VSYgNdCx5027M0iQ3dA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qgHdG0pYUpUuFuH8b53tzSggq+xMwvcVVG19f8P6ArSxL7l3k7mph0BsWcYJrSeKb
	 nCaDOGiTwzsqAdeQFyYEbfXpQCoEcnZujZvfe2TtQejvVs00mewBgP+JJ8Dy+vBbB3
	 EBzOEdJ/qDOzDQ1ArG77RVCP51OTr2yn/ikcxLfTjx52aAzQrh+pG1Fui5LxXz8fga
	 fd85PYBEzYK6eXkhAdUE6YWM+zPR7ABl3wlQi3kclqPMsHLusH+PCf1uz/rQ12s/9N
	 WMhkYdJ0MeDobq/++j7aD7LhtG7VKWKVhSRArQbMAxcCHqKQdO3O8swzylXHd75yT0
	 m8R3CtNE5YtzQ==
Date: Wed, 08 Apr 2026 22:46:13 +0000
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
From: Feng Ning <feng@innora.ai>
Cc: luka.gejak@linux.dev, feng@innora.ai
Subject: [PATCH v4] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key()
Message-ID: <20260408224608.81874-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 90a0078b5df0a120d1258f8b31410a063e456f9f
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
without checking seq_len, a heap buffer overflow of up to 8 bytes
occurs, overwriting adjacent fields key_len and key[].

Cap the copy length at the buffer size using min_t().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Feng Ning <feng@innora.ai>
---
Changes v3 -> v4:
  - Re-send as plain text without PGP signature and public key
    attachment (per Luka Gejak feedback)
  - No code changes from v3

Changes v2 -> v3:
  - Added changelog below the cut line (per gregkh patch-bot)
  - No code changes from v2

Changes v1 -> v2:
  - Initial public submission to linux-staging mailing list

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/st=
aging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1ff763c10..4a984c071 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -893,8 +893,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, s=
truct net_device *ndev,
=20
 =09param->u.crypt.idx =3D key_index;
=20
-=09if (params->seq_len && params->seq)
-=09=09memcpy(param->u.crypt.seq, (u8 *)params->seq, params->seq_len);
+=09if (params->seq_len && params->seq) {
+=09=09size_t seq_copy =3D min_t(size_t, params->seq_len,
+=09=09=09=09       sizeof(param->u.crypt.seq));
+=09=09memcpy(param->u.crypt.seq, (u8 *)params->seq, seq_copy);
+=09}
=20
 =09if (params->key_len && params->key) {
 =09=09param->u.crypt.key_len =3D params->key_len;
--=20
2.43.0


