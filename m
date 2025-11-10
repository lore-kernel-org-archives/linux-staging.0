Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21333EB13
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804164; cv=none; b=aM59nhe7ig3/wu5JJUVQYQsMSaNLw8FrAvELnpxGuU+XoEMhZTC6J1NX+r8V9BQrNZtJdsTDIMr0dWP8Ly7LdG13SuCiITwtxRYiC28kvBtBLa6a508BqQGX8uU9BcPhVPPzCDe9kSYTtXTOvCnDkgOirImVBKb0QW9IHGBvUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804164; c=relaxed/simple;
	bh=rWx9kF+qEfZ3TooHliCN4NcoF4q0rbnlltgRNuVBAcI=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/aZbVXCtkqoTwNVGEvFYHIblPpxZPfYtt1O9KSAKc6J4Wg4mSr6o1a8m3SF4395yZ03/PgfsxYzTZcBbNV+5hPwSIXUpXwRg/jxja2hj/nnVGaq593/nkralLrWu4d1+EFsWsZZSWQmeFQG8PhuCpph2Ugn9gaBYNrkauqp//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nPT+jJBQ; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nPT+jJBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1762804160; x=1763063360;
	bh=9YCRGMEEb+kb230xD6UyZ6auihYBOdPGRUqGq1h/s6I=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nPT+jJBQYshwoyu/RK2p8/xP2sgl5Q5jB+jirxWcdluT8oVkR0Hn6n2LJSwst4fn9
	 SUL29XYrcZyaSt9SMltEjVm3CwGRyHMA7oXfE+Rue4jUwr4jW/XAzoTyQQaap2iYD8
	 uSqUMyMaxs5+NLg/72KCy4ke8FjbXV99Wt2qn9ZiYNpCqpblHItGjZWu72aeiFIJnF
	 SueN4pyZXf1TA7EwfTE3HoxwOL/S+J2yf++vgwlWucGOlEtA5HEZZCCdqCQfwmHIDG
	 cm0wLs2LRJEUb54oYJLor487it0siXco3uI7nZodM7ZhmCovQ9iqiqmMcyX6FY1uzi
	 vSW1W7DUaxeQA==
Date: Mon, 10 Nov 2025 19:49:16 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
From: Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH v2 1/3] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <37abbb9fb3c082e587f1c22321f57287d0c7e660.1762803720.git.bryant.boatright@proton.me>
In-Reply-To: <cover.1762803720.git.bryant.boatright@proton.me>
References: <cover.1762803720.git.bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 8316a4ed013aa346288daccd71a6567f06879b05
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
Changes in v2:
- Make enumeration constant names all upper case.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 8 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index 027b2dd0a4b9..d25fd538305a 100644
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
+=09=09=09return PARSE_FAILED;
=20
 =09=09switch (id) {
 =09=09case WLAN_EID_SSID:
@@ -960,9 +960,9 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uin=
t len,
 =09}
=20
 =09if (left)
-=09=09return ParseFailed;
+=09=09return PARSE_FAILED;
=20
-=09return unknown ? ParseUnknown : ParseOK;
+=09return unknown ? PARSE_UNKNOWN : PARSE_OK;
 }
=20
 void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme_ext.c
index 8fe0555ab033..94036066c356 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1005,7 +1005,7 @@ unsigned int OnAssocReq(struct adapter *padapter, uni=
on recv_frame *precv_frame)
 =09pstat->capability =3D capab_info;
=20
 =09/* now parse all ieee802_11 ie to point to elems */
-=09if (rtw_ieee802_11_parse_elems(pos, left, &elems, 1) =3D=3D ParseFailed=
 ||
+=09if (rtw_ieee802_11_parse_elems(pos, left, &elems, 1) =3D=3D PARSE_FAILE=
D ||
 =09    !elems.ssid) {
 =09=09status =3D WLAN_STATUS_CHALLENGE_FAIL;
 =09=09goto OnAssocReqFail;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/stagin=
g/rtl8723bs/include/ieee80211.h
index 1098b0209200..f94db820d335 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -724,9 +724,9 @@ struct rtw_ieee802_11_elems {
 =09u8 vht_op_mode_notify_len;
 };
=20
-enum ParseRes { ParseOK =3D 0, ParseUnknown =3D 1, ParseFailed =3D -1 };
+enum parse_res { PARSE_OK =3D 0, PARSE_UNKNOWN =3D 1, PARSE_FAILED =3D -1 =
};
=20
-enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_res rtw_ieee802_11_parse_elems(u8 *start, uint len,
 =09=09=09=09struct rtw_ieee802_11_elems *elems,
 =09=09=09=09int show_errors);
=20
--=20
2.43.0


