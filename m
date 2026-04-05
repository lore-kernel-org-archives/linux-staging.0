Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F32BEFFF
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775423989; cv=none; b=P44sdk+sia4xed4h/1qdiqP31ihe6fP4AaZu4CnxVXPY2I4lnZXGpQhTt03c01gQVKGpyOA9nCy51fXxe/pUlnVQf2dGz2HMY18wKUxHwObEqqviNVFsZYhoPfeULPLAWGa9mxSs1bLzt1qdyxvLR359+Z115nxsLhMCtzFKaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775423989; c=relaxed/simple;
	bh=xiQyI46Epttq8Va/xMcdoww6Wb9E8WYlDGCGrsczH3k=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=efBE6c3AjwboMuck+k8b7qHXrFItLzUtasMYERZJzCKHzq6mcZMfljfdq3Ifd3RktBUpbcp02fcYg3bECuH6S+7nTdProJR21VNw2dQ+f67QR1tByeyToLhD9V34g2H+83MWMPxOlyFP6M3E1RoRW1TIoybsRia+b083wwZr+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FeFDt94g; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FeFDt94g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1775423978; x=1775683178;
	bh=VXFl9bs6oiDs4zsruniJG9JmOuT4zy/YOckH9VLpiwc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FeFDt94gx8ngg+kG7KQGqQmOJapLo0VtRkkwoEN8yyldKiJLtOkfeEJlAhko+0R3u
	 tw6m2XR7W2Q9stKkum7Xpd5RNN+l+yHntZqD2FEOSQiOPzd5vuLY3KEyL881/l7kBM
	 qUJSj26Ya1My+8/pWNJWeUkF3QsUkRYaTs5oZ1JtIIEznXfwBy+6BFcIyU4sko6U9b
	 FDhXXnThg67FIP9UcZQWXQJhPwKIOQ1yFok2t+lxsfqWN3z9bvfVjnx5jwvry0ZEYe
	 v79DV2/sFxDG4BOj2M6Wxsf0cP42vfhxi8UPHss7157WEkRxcIsTktkXu6qNBs+nBS
	 t/nG8DsVGbWHw==
Date: Sun, 05 Apr 2026 21:19:34 +0000
To: gregkh@linuxfoundation.org
From: dhpatel1@proton.me
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dhaval Patel <dhpatel1@proton.me>
Subject: [PATCH] staging: rtl8723bs: remove redundant boolean comparisons
Message-ID: <20260405211758.45598-1-dhpatel1@proton.me>
Feedback-ID: 190974606:user:proton
X-Pm-Message-ID: 7d88c465bbaebaa8f239e1dd89e8009f8902fc49
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Dhaval Patel <dhpatel1@proton.me>

  Replace explicit comparisons to true/false with direct boolean
  evaluation to align with kernel coding style.

Signed-off-by: Dhaval Patel <dhpatel1@proton.me>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 38 ++++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rt=
l8723bs/core/rtw_xmit.c
index 7b18be8912e6..ba39fd25ba45 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -384,7 +384,8 @@ static void update_attrib_vcs_info(struct adapter *pada=
pter, struct xmit_frame *
 =09} else {
 =09=09while (true) {
 =09=09=09/* IOT action */
-=09=09=09if ((pmlmeinfo->assoc_AP_vendor =3D=3D HT_IOT_PEER_ATHEROS) && (p=
attrib->ampdu_en =3D=3D true) &&
+=09=09=09if ((pmlmeinfo->assoc_AP_vendor =3D=3D HT_IOT_PEER_ATHEROS) &&
+=09=09=09    (pattrib->ampdu_en) &&
 =09=09=09    (padapter->securitypriv.dot11PrivacyAlgrthm =3D=3D _AES_)) {
 =09=09=09=09pattrib->vcs_mode =3D CTS_TO_SELF;
 =09=09=09=09break;
@@ -420,7 +421,7 @@ static void update_attrib_vcs_info(struct adapter *pada=
pter, struct xmit_frame *
 =09=09=09/* to do list: check MIMO power save condition. */
=20
 =09=09=09/* check AMPDU aggregation for TXOP */
-=09=09=09if (pattrib->ampdu_en =3D=3D true) {
+=09=09=09if (pattrib->ampdu_en) {
 =09=09=09=09pattrib->vcs_mode =3D RTS_CTS;
 =09=09=09=09break;
 =09=09=09}
@@ -482,10 +483,10 @@ static s32 update_attrib_sec_info(struct adapter *pad=
apter, struct pkt_attrib *p
 =09memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 =09pattrib->mac_id =3D psta->mac_id;
=20
-=09if (psta->ieee8021x_blocked =3D=3D true) {
+=09if (psta->ieee8021x_blocked) {
 =09=09pattrib->encrypt =3D 0;
=20
-=09=09if ((pattrib->ether_type !=3D 0x888e) && (check_fwstate(pmlmepriv, W=
IFI_MP_STATE) =3D=3D false)) {
+=09=09if ((pattrib->ether_type !=3D 0x888e) && !check_fwstate(pmlmepriv, W=
IFI_MP_STATE)) {
 =09=09=09res =3D _FAIL;
 =09=09=09goto exit;
 =09=09}
@@ -650,8 +651,8 @@ static s32 update_attrib(struct adapter *padapter, stru=
ct sk_buff *pkt, struct p
 =09memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 =09memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
=20
-=09if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) ||
-=09=09(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true)) {
+=09if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+=09    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 =09=09memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 =09=09memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 =09} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -717,7 +718,8 @@ static s32 update_attrib(struct adapter *padapter, stru=
ct sk_buff *pkt, struct p
 =09=09if (!psta)=09{ /*  if we cannot get psta =3D> drop the pkt */
 =09=09=09res =3D _FAIL;
 =09=09=09goto exit;
-=09=09} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) && =
(!(psta->state & _FW_LINKED))) {
+=09=09} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
+=09=09=09  !(psta->state & _FW_LINKED)) {
 =09=09=09res =3D _FAIL;
 =09=09=09goto exit;
 =09=09}
@@ -899,7 +901,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr,=
 struct pkt_attrib *pattr
 =09SetFrameSubType(fctrl, pattrib->subtype);
=20
 =09if (pattrib->subtype & WIFI_DATA_TYPE) {
-=09=09if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) =3D=3D true) {
+=09=09if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 =09=09=09/* to_ds =3D 1, fr_ds =3D 0; */
=20
 =09=09=09{
@@ -913,7 +915,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr,=
 struct pkt_attrib *pattr
=20
 =09=09=09if (pqospriv->qos_option)
 =09=09=09=09qos_option =3D true;
-=09=09} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) =3D=3D true) {
+=09=09} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 =09=09=09/* to_ds =3D 0, fr_ds =3D 1; */
 =09=09=09SetFrDs(fctrl);
 =09=09=09memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -922,8 +924,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr,=
 struct pkt_attrib *pattr
=20
 =09=09=09if (pattrib->qos_en)
 =09=09=09=09qos_option =3D true;
-=09=09} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) =
||
-=09=09(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true)) {
+=09=09} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+=09=09check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 =09=09=09memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 =09=09=09memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 =09=09=09memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -981,7 +983,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr,=
 struct pkt_attrib *pattr
 =09=09=09=09=09=09pattrib->ampdu_en =3D true;
=20
 =09=09=09=09/* re-check if enable ampdu by BA_starting_seqctrl */
-=09=09=09=09if (pattrib->ampdu_en =3D=3D true) {
+=09=09=09=09if (pattrib->ampdu_en) {
 =09=09=09=09=09u16 tx_seq;
=20
 =09=09=09=09=09tx_seq =3D psta->BA_starting_seqctrl[pattrib->priority & 0x=
0f];
@@ -1138,7 +1140,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, =
struct sk_buff *pkt, struct
=20
 =09=09frg_inx++;
=20
-=09=09if (bmcst || (rtw_endofpktfile(&pktfile) =3D=3D true)) {
+=09=09if (bmcst || rtw_endofpktfile(&pktfile)) {
 =09=09=09pattrib->nr_frags =3D frg_inx;
=20
 =09=09=09pattrib->last_txcmdsz =3D pattrib->hdrlen + pattrib->iv_len +
@@ -1164,7 +1166,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, =
struct sk_buff *pkt, struct
=20
 =09xmitframe_swencrypt(padapter, pxmitframe);
=20
-=09if (bmcst =3D=3D false)
+=09if (!bmcst)
 =09=09update_attrib_vcs_info(padapter, pxmitframe);
 =09else
 =09=09pattrib->vcs_mode =3D NONE_VCS;
@@ -2000,14 +2002,14 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_bu=
ff **ppkt)
 =09do_queue_select(padapter, &pxmitframe->attrib);
=20
 =09spin_lock_bh(&pxmitpriv->lock);
-=09if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) =3D=3D tru=
e) {
+=09if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
 =09=09spin_unlock_bh(&pxmitpriv->lock);
 =09=09return 1;
 =09}
 =09spin_unlock_bh(&pxmitpriv->lock);
=20
 =09/* pre_xmitframe */
-=09if (rtw_hal_xmit(padapter, pxmitframe) =3D=3D false)
+=09if (!rtw_hal_xmit(padapter, pxmitframe))
 =09=09return 1;
=20
 =09return 0;
@@ -2051,7 +2053,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct =
adapter *padapter, struct x
 =09signed int bmcst =3D is_multicast_ether_addr(pattrib->ra);
 =09bool update_tim =3D false;
=20
-=09if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D false)
+=09if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
 =09=09return ret;
 =09psta =3D rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 =09if (pattrib->psta !=3D psta)
@@ -2176,7 +2178,7 @@ static void dequeue_xmitframes_to_sleeping_queue(stru=
ct adapter *padapter, struc
=20
 =09=09ret =3D xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
=20
-=09=09if (true =3D=3D ret) {
+=09=09if (ret) {
 =09=09=09ptxservq =3D rtw_get_sta_pending(padapter, psta, pattrib->priorit=
y, (u8 *)(&ac_index));
=20
 =09=09=09ptxservq->qcnt--;
--=20
2.53.0


