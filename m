Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3D280A5B
	for <linux-staging@lists.linux.dev>; Sat,  8 Nov 2025 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762577698; cv=none; b=X05FvAO72oasf47YnCR54sO0BLor2l52T83WrAP7gbyyjucATArNKwG6Orr+X8/64LCM4yKCiBxfhwVU/Zq9JDfIn+IyZSsvtW05eMGrl2YKU9GzOekvz7k8Mkhd+KIWhGPrE7+cIlmssfJkg1+e0IB0mwnrD8uqnGOKGzX20Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762577698; c=relaxed/simple;
	bh=RjDfC1GfHrFXo8Z9Nst0+yXZdQTr3BUQR7iMruTbwY4=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tp9CQWcFKNP76x8Q9iOTE3h2VG3waxM7cCZO5xkYFxlpetFvvAfGaLbl55SYlyYgkZja1AXc7fKp8QyN3WY/3sW5f0goEocT+a1tJ0iLAnhLIvPLw41zMnVU0BXhE+KxeC67tibqz9pFqOffWUrjm0vkYTov5C5k1platNnXsA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=U1YPe/pf; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="U1YPe/pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762577687; x=1762836887;
	bh=oNbk85rZDOoKi/efC4FVxSPxziL6Ie5kwAHS4u679mo=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U1YPe/pfMMQV7gv60vG7zVKkoEq5llNbyO3GO7PBGT6KaV01XgnmnQgZTC/yCngmU
	 iXF6C24BnJVS6MUiM5RV5rvrBH/df01i3F7OuEBQWJDtyTmlnjv9VrE3hIEPysOjaJ
	 zIZqK24YjWDC3rsWp13O0TpZ3c62HV2uwSjJWUhluxKp43zqzm6DN25sDSHDWPppHq
	 i5cuuHTE/JNjqFcUfMhPVx0mAeKEGMyforUHvaZamCJaSLxAbipqPCPl+QwJBBMVxC
	 2oDeXZdIJLa4vlzm+di9YCAKMZ35rdrVy98tpcm8L6Pw3oZnQyMQvAwhEEud5lVAvR
	 QO0maGe9PF/JA==
Date: Sat, 08 Nov 2025 04:54:41 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH 1/3] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <38533b30dbcb39f370fd778ee2a6838ca7b962a1.1762576396.git.bryant.boatright@proton.me>
In-Reply-To: <cover.1762576396.git.bryant.boatright@proton.me>
References: <cover.1762576396.git.bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 9ea735d56face0a52636ea4c44a819d244eb6b5c
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

CHECK: Avoid CamelCase: <ParseRes>
CHECK: Avoid CamelCase: <ParseFailed>
CHECK: Avoid CamelCase: <ParseUnknown>
CHECK: Avoid CamelCase: <ParseOK>

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index 027b2dd0a4b9..ed00cec80911 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -839,7 +839,7 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos=
, uint elen,
  * @show_errors: Whether to show parsing errors in debug log
  * Returns: Parsing result
  */
-enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 =09=09=09=09struct rtw_ieee802_11_elems *elems,
 =09=09=09=09int show_errors)
 {
@@ -857,7 +857,7 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uin=
t len,
 =09=09left -=3D 2;
=20
 =09=09if (elen > left)
-=09=09=09return ParseFailed;
+=09=09=09return parse_failed;
=20
 =09=09switch (id) {
 =09=09case WLAN_EID_SSID:
@@ -960,9 +960,9 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uin=
t len,
 =09}
=20
 =09if (left)
-=09=09return ParseFailed;
+=09=09return parse_failed;
=20
-=09return unknown ? ParseUnknown : ParseOK;
+=09return unknown ? parse_unknown : parse_ok;
 }
=20
 void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme_ext.c
index 8fe0555ab033..d79b29143fc5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1005,7 +1005,7 @@ unsigned int OnAssocReq(struct adapter *padapter, uni=
on recv_frame *precv_frame)
 =09pstat->capability =3D capab_info;
=20
 =09/* now parse all ieee802_11 ie to point to elems */
-=09if (rtw_ieee802_11_parse_elems(pos, left, &elems, 1) =3D=3D ParseFailed=
 ||
+=09if (rtw_ieee802_11_parse_elems(pos, left, &elems, 1) =3D=3D parse_faile=
d ||
 =09    !elems.ssid) {
 =09=09status =3D WLAN_STATUS_CHALLENGE_FAIL;
 =09=09goto OnAssocReqFail;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/stagin=
g/rtl8723bs/include/ieee80211.h
index 1098b0209200..e94efe8f964b 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -724,9 +724,9 @@ struct rtw_ieee802_11_elems {
 =09u8 vht_op_mode_notify_len;
 };
=20
-enum ParseRes { ParseOK =3D 0, ParseUnknown =3D 1, ParseFailed =3D -1 };
+enum parse_res { parse_ok =3D 0, parse_unknown =3D 1, parse_failed =3D -1 =
};
=20
-enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 =09=09=09=09struct rtw_ieee802_11_elems *elems,
 =09=09=09=09int show_errors);
=20
--=20
2.43.0


