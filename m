Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F0E555
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079972; cv=none; b=uMRqjInSz6W87L76UTL7tqKrkMEHF7LaAyRx1gfeGcP/fybejKZb+YyNRDspvYo3gOEK4GO5YoXuE+WiUH1LgvfowS/hoVBJzOS9gCSdeLtQ1uVjhhJjKbhwtZlFVHwA9nPEBvtg6VbFrgmi8uLZFNf1nLWGlKCZ/McPsEidlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079972; c=relaxed/simple;
	bh=D+Tlqh5KfPK/zd7VQgCajJsiv0zuw7UIpA3UyRHGsJQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DStM8jVyivQwRoga06j+FQ+8z20lcybnK/3vMm7ETXxjx+kECj6+ZxbAYapD7iyWiKeRHzYvFABsQ53G72ygsdCMkWo75tAw/DLq/51Pdf/RP8I/lkHqhHM4wZjcnwR0r9FdVk5KPhx7VXm2Vy3osHJrpyYTTAJb1lTDx8jVZp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=j7VCvYFc; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="j7VCvYFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1776079954; x=1776339154;
	bh=NM030547/K1Sx1eOBB6nSUw8EHBv2XY1nxsgcUiim6s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j7VCvYFcCNIcPdzZjch1RdpDJ8F3c4/Ze0xV2uNt/7PQW74W8HSW9uxPlYTNPS7VZ
	 s+Q4m6NovhxMgFczE7q7fcY91SjJAp6QywKXLW3Ihui78HY1YXj2ZA5/btkY0QDTvY
	 xtZdjqv7ufR4wqk8k3kNBYXtrD6eERxLwx3OnxElyBIc+TDH5VdpZaNw7xDM20TjAY
	 9hrGlScsPauwDF8sOJZRnachQw5czyKhxq5JhNvzzWv1BDMVNKqJ0qjlqJFYTqE4yD
	 ijtI9uJLhUUZ/TLZtb9OtUnDuVvR6wuQu6DuktNojEZshRm33yp8j6HUxljN8uHumE
	 WYhtKc3wLL6BA==
Date: Mon, 13 Apr 2026 11:32:30 +0000
To: linux-staging@lists.linux.dev
From: Feng Ning <feng@innora.ai>
Cc: gregkh@linuxfoundation.org, luka.perkov@sartura.hr, Feng Ning <feng@innora.ai>
Subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
Message-ID: <20260413113224.5201-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: af503400a3b0e9fd8643cf7a3cf929c2dcf09885
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
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/st=
aging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..4fba53c2d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -883,8 +883,11 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, s=
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


