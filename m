Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689536C0C1
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340076; cv=none; b=BuI0FoRPTTnkP8YFM3CAE7zejm4SO4zI+ssLqvsdtxjJShEguJvB76sx0HBNWQluDrmap237Ay4FGKX9iSLQRpLnSlEIc9heeZk/M3RaA4ioqt0RK0Vg/D0aBHBd8qXk9saSmxL65zghgnXJJ6OssKJmDTtoOoXNan7Jy1pxxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340076; c=relaxed/simple;
	bh=3gtDIFbKFkESXCffQdn3XS66xK7v6vNdNhPwkWqQg8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ualmeoV3hlyPOKx3pdX3riY+sEIyFMmJ36k7QRiYVjJJ4E7oFh54k1B0E8Gzho7n1A/vPqBCtZdPEGfMhQedA3MOv15tUZexEfsMN3PJU2dJnJWj1PuRRk6NB3wGy71nB8saqWNLCEUyIra7gP4goxjQPq9EL7YjUYrcWJoShMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=D7F4xcht; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="D7F4xcht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771340065; x=1771599265;
	bh=D5GXHrFH56e4yW6jOfQAx4ghF6AkXbYn0O8cn4mV7GI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D7F4xcht5IlC4pIrTrOoMTv6t1T6rsUZgCrX/wJAxnwMPJnEJ9QEPF6zHd0L+C6uJ
	 jOa5Zo0/zhkRWTo/PG5PG0Sjus0oLgKoE39kgF5eFW5MWK4iM4IfOFtFWh6zKUXu/k
	 POtGhSdfEQ352TIb8O5aOw71mqUdevHIWYWHCtpjK0I0m63HcbiVqevfdh0i4Kz1dX
	 jdoTteI4RMm9zZLlX/CN0MwB+1uHgU4o5Ua+LVDCnl+OXIykFCPdPApLjudQHybb8q
	 juSaclUQZGCt4kFAdA3qZ5r1dWp9UwdpE6JcADUYtqEs/JAWvsXEtQkmJmFeUBFWmt
	 3Nt8Z0NC+br0w==
Date: Tue, 17 Feb 2026 14:54:19 +0000
To: gregkh@linuxfoundation.org
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH v4 1/2] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <20260217145352.2172407-2-bryant.boatright@proton.me>
In-Reply-To: <20260217145352.2172407-1-bryant.boatright@proton.me>
References: <20260217145352.2172407-1-bryant.boatright@proton.me>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: b715c514031bacff84632d2f3132c927cc57dcfa
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rename camel case enumeration to snake case and expand enumeration name
for clarity. Update indentation of function prototype/definition based
on new name length. Move enumeration definition from single line to
multi-line definition.

Reported by checkpatch:

CHECK: Avoid CamelCase: <ParseRes>
CHECK: Avoid CamelCase: <ParseFailed>
CHECK: Avoid CamelCase: <ParseUnknown>
CHECK: Avoid CamelCase: <ParseOK>

Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
---
Changes in v3:
- Change parse_result definition to multi-line definition.
- Change parse_res to parse_result for clearer enumeration purpose.
- Update indentation in function prototype/definitions due to name
  change for parse_result.

Changes in v2:
- Make enumeration constant names all upper case.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 12 ++++++++----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_ieee80211.c
index febc14de6bc0..3c3ab3694b4a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -845,9 +845,9 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos=
, uint elen,
  * @show_errors: Whether to show parsing errors in debug log
  * Returns: Parsing result
  */
-enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
-=09=09=09=09struct rtw_ieee802_11_elems *elems,
-=09=09=09=09int show_errors)
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+=09=09=09=09=09     struct rtw_ieee802_11_elems *elems,
+=09=09=09=09=09     int show_errors)
 {
 =09uint left =3D len;
 =09u8 *pos =3D start;
@@ -863,7 +863,7 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uin=
t len,
 =09=09left -=3D 2;
=20
 =09=09if (elen > left)
-=09=09=09return ParseFailed;
+=09=09=09return PARSE_FAILED;
=20
 =09=09switch (id) {
 =09=09case WLAN_EID_SSID:
@@ -966,9 +966,9 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uin=
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
index 78abc5f5191f..14753287f3bc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -990,7 +990,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union=
 recv_frame *precv_frame)
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
index 0f28c904a714..97fd5f75096b 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -723,11 +723,15 @@ struct rtw_ieee802_11_elems {
 =09u8 vht_op_mode_notify_len;
 };
=20
-enum ParseRes { ParseOK =3D 0, ParseUnknown =3D 1, ParseFailed =3D -1 };
+enum parse_result {
+=09PARSE_OK =3D 0,
+=09PARSE_UNKNOWN =3D 1,
+=09PARSE_FAILED =3D -1
+};
=20
-enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
-=09=09=09=09struct rtw_ieee802_11_elems *elems,
-=09=09=09=09int show_errors);
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+=09=09=09=09=09     struct rtw_ieee802_11_elems *elems,
+=09=09=09=09=09     int show_errors);
=20
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char =
*source, unsigned int *frlen);
 u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source, uint *frl=
en);
--=20
2.43.0


