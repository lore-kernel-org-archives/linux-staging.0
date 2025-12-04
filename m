Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583FA2E9EB9
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848692; cv=none; b=rxLi/0sbtRgsnS32MwUaVbIECZvs5cmUe5AcB3885rPvg1NjcUlaJNckO8owUNJuRTTUicgeR26m7X1CHdQoKRPar98Jv1v8VKt5tzMiFhp39GBVZ5zfV1d4xVmZtbqA+LYL99SZabymriwspI3qH6i1Jpn5CN7O5q/xi4yULKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848692; c=relaxed/simple;
	bh=sx4n/F6VvB0k8XaMT12HgOS2XLTzu6/Ri4P8PeAp2Wc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O31l1/ZlV+qjHodWQDdZNRcqhngzGmWQrcGaynUSAaXMS90ViwEqDRNQDe7sDMat6YfhmNGRG2PqiJ7RsmVPaa/D81iTY/ImHOvPoAaWyCkecl1KckjvntAVnk4gBvn3htmYKL7cErZABIgIY+42n239FfNJAPLDPv+o0dF0deI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gZ6f3+xT; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gZ6f3+xT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764848681; x=1765107881;
	bh=paINnLOfceEQswC5S7mSH7VqfOx4c8Rcyz3ZUBIADqY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gZ6f3+xTOcy6qZ6A5/2VJbPi899In6+pXGGaWPTbj7pidTuzA3/q4OVM7MovuLvlv
	 PtM75LOHsDbGMHkDu6PD+ThNx0IcfS3xqxMeQqPttEyVNQEe6XhAdOjjZF0N7eJc4w
	 qB9YEEbnddfnn/4o7sqEhoxNetS6oHfe4o0ke2ejuPYlu9pTyMGbwPftWuikPLhmmd
	 7ySI4soXItyzPen2aKyNixiVMWMYMFzshye1EC3XByz3rZcwB94quSrQgPlaQNyDU8
	 j8FGwLt5hV+6Y08CwksWxh0O0+QXs748YsTXrONsuGIfHgkNjyTMJyy07hMefBt2qT
	 C3x7FJpOeCBAg==
Date: Thu, 04 Dec 2025 11:44:39 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: Rename camel case enumeration
Message-ID: <aTF0IzaeavEIwrsw@ubuntu-desk>
Feedback-ID: 74848953:user:proton
X-Pm-Message-ID: 36d9e660eecf83305ef08421ce917a99323564cb
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
index 8fdeeda88a6d..469388a4062c 100644
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
index ac49bfbaa5bb..19889610c0ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -993,7 +993,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union=
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
index 1098b0209200..1ea0817cd155 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -724,11 +724,15 @@ struct rtw_ieee802_11_elems {
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


