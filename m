Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7C22F16E
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804195; cv=none; b=S1274ATeJajprKo/mXaWSFQB/0HohjAS9t5OuJo8ZNuBTDf3E4zBNQv3v9BXYvG4TAxnJUUfCmKSTtw4klQZgxyDRR/LGd5Ruo0RNva/fzywAIQac7ipTx0xrm8RkL0t5gbIAe2ynVjfGqK5Hzf/fvJeWIC9feXm7SbUc3pd+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804195; c=relaxed/simple;
	bh=kwI1ysU7OoOAYwjztLjWKYg+hv4i/B2igL/e3SbTj6g=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDIsWrAcrIk0Yn9kOvIxC9wTclimhvA9U+PMo6wYHSql/uvHiF1q0oeZS/tH+ftfWFdGSqSdl7G7L0R5HC1NYZA2CzCvWxZ1fXVkyW3YwXBQ3xpFilcnIlS7UUnCZwOqX6WWdUdEkj9O1qZJUjNnAtMBYhfraLm1ov4iz8E+nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=cSj4BM4d; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="cSj4BM4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762804191; x=1763063391;
	bh=fwy2b9N1qenHnH40yBPHy9NN7Uvh+/7mX2jkCge5Mc0=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cSj4BM4drSdxPe0zmKypwCJBFDLdSlGV+v4NTrzaUO7EDktbKEL31MkuQ5sSeekfy
	 O1MiTgBkewt3NdAVLu13HG2JhkkGv5LOi5fdRzq7ppmS94BvJ/ioNWboLmu7tSY24X
	 b/bJNJg4cfAlTmeW1jWJYti9St1VRVA9mWQB+ywGVUbc97hMw1dCZpRrfVqCgkW48I
	 GvmHJuADgrpdSyt3Y1A9l75tMjqUkIWGj7jweG089DSLTWn9oV+GIMVXXp5QDw7nM+
	 TBOQygKTs7vO10BZ2Xm1JHGdGLQpYBwRN5R2bap3rlAMJ7RNGZVSdTef4FeNLwG8BD
	 SzVmemQBGBhzA==
Date: Mon, 10 Nov 2025 19:49:46 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH v2 2/3] staging: rtl8723bs: Rename camel case argument
Message-ID: <6fa67d3588ac82dadd715bcb9c16d4e79dac506e.1762803720.git.bryant.boatright@proton.me>
In-Reply-To: <cover.1762803720.git.bryant.boatright@proton.me>
References: <cover.1762803720.git.bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 2e0705a150208333325d65ea39b3b221e9b3674b
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux kernel style.

Reported by checkpatch:

CHECK: Avoid CamelCase: <bw_40MHz>

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 18 +++++++++---------
 drivers/staging/rtl8723bs/include/ieee80211.h  |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index d25fd538305a..f22f8a95f372 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1077,26 +1077,26 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork=
)
 }
=20
 /* show MCS rate, unit: 100Kbps */
-u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
+u16 rtw_mcs_rate(u8 bw_40_mhz, u8 short_GI, unsigned char *MCS_rate)
 {
 =09u16 max_rate =3D 0;
=20
 =09if (MCS_rate[0] & BIT(7))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650=
);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?1500:1350):((short_GI)?722:65=
0);
 =09else if (MCS_rate[0] & BIT(6))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?1350:1215):((short_GI)?650:585=
);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?1350:1215):((short_GI)?650:58=
5);
 =09else if (MCS_rate[0] & BIT(5))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?1200:1080):((short_GI)?578:520=
);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?1200:1080):((short_GI)?578:52=
0);
 =09else if (MCS_rate[0] & BIT(4))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?900:810):((short_GI)?433:390);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?900:810):((short_GI)?433:390)=
;
 =09else if (MCS_rate[0] & BIT(3))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?600:540):((short_GI)?289:260);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?600:540):((short_GI)?289:260)=
;
 =09else if (MCS_rate[0] & BIT(2))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?450:405):((short_GI)?217:195);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?450:405):((short_GI)?217:195)=
;
 =09else if (MCS_rate[0] & BIT(1))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?300:270):((short_GI)?144:130)=
;
 =09else if (MCS_rate[0] & BIT(0))
-=09=09max_rate =3D (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
+=09=09max_rate =3D (bw_40_mhz) ? ((short_GI)?150:135):((short_GI)?72:65);
=20
 =09return max_rate;
 }
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/stagin=
g/rtl8723bs/include/ieee80211.h
index f94db820d335..cf0bfe3e19ba 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -781,7 +781,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork);
=20
 void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr);
=20
-u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate);
+u16 rtw_mcs_rate(u8 bw_40_mhz, u8 short_GI, unsigned char *MCS_rate);
=20
 int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u=
8 *action);
 const char *action_public_str(u8 action);
--=20
2.43.0


