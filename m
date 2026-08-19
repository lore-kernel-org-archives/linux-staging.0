Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F0734AB1D
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149372; cv=none; b=lXfhaxWGbnoKJVddyLub3dLsNAtF5Di7X0MLcS8Xjyc5/LcYvKGUZA1T/dVYCjhvkNRjj4ZomYR09x45XBvrO683NeHcnp8Sw76tfQZobecXh8pobwgL3fc3cvlChxWSRbaU9Q9ZPb42jHpB3GITFlDS5kqdAkzLrpRTEIhalAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149372; c=relaxed/simple;
	bh=2fBSYq1/7vyUmZLkekPRDn1TZ7t/XU9YO1J7dxGDvMg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=Wm4UesUcfVWTQ9yNvdvgHDsyp+bbzGJ5cobZQQDpu0hiu5Narm9raft0kqyJqvM+kdkmQrmrdaS4f0O52dRQILbxg6GEzENQVNyA2ZUAWD15WarjUVr0FrepEznMt9E9uJtIsW7GA3yamRM//Y7Z+Vbz/UwwPqtlUa/iUSw7JmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hEab06AP; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hEab06AP"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=2fBSYq1/7vyUmZLkekPRDn1TZ7t/XU9YO1J7dxGDvMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787149368; v=1; x=1787754168;
 b=hEab06APny5fyWiYy2W+TbSZuw5lAMlRn0/2bi5gwq4XFDPZV0MXjCf2+4Szf+pY0Aq6Otwt
 aMIEAY9b4dc/M07dMP63+Xe02Ia1tVxAFgTUg+gBQD3UQ78s2jyeLJu7cVP2UA87syhJ5pBZE/U
 P8cUX1I2Vw1wD2b8OaSyxHCc=
X-Envelope-To: linux-staging@lists.linux.dev
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 424ff81d549fbe7a;
	Wed, 19 Aug 2026 14:22:48 +0000
X-Mizu-Trace-ID: 424ff81d549fbe7a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 14:22:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>
TLS-Required: No
Subject: [PATCH] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
To: gregkh@linuxfoundation.org, hansg@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org

From: Tianchu Chen <flynnnchen@tencent.com>

The RX software decrypt path mishandles crafted protected frames from a
malicious AP in two ways:

1) decryptor() never checks that a protected frame is long enough to
hold the 802.11 header plus the per-cipher trailer(IV, ICV/MIC).

Implementations like rtw_wep_decrypt() and rtw_aes_decrypt() all compute
length =3D hdr.len - hdrlen - iv_len. and a shorter frame underflows the=
=20
unsigned=20subtraction, turning into OOB reads/writes.

Reject such frames in decryptor() before touching the IV.

2) validate_80211w_mgmt() uses the skb before checking whether
decryptor() returned NULL. On decrypt failure the skb has been freed
before being used.

Bail out immediately when decryptor() fails.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
index 7568fc514d7ce..4756e0fedd46f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct adapter *p=
adapter, union recv_frame *p
 	u32  res =3D _SUCCESS;
=20
=20	if (prxattrib->encrypt > 0) {
-		u8 *iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
+		u8 *iv;
+		u32 min_len =3D prxattrib->hdrlen + prxattrib->iv_len + prxattrib->icv=
_len;
=20
+=09	/* TKIP appends an 8-byte Michael MIC that icv_len doesn't account f=
or */
+		if (prxattrib->encrypt =3D=3D _TKIP_)
+			min_len +=3D 8;
+
+		/* a protected frame must be long enough to hold the IV and ICV/MIC */
+		if (precv_frame->u.hdr.len < min_len) {
+			rtw_free_recvframe(precv_frame,
+					   &padapter->recvpriv.free_recv_queue);
+			return NULL;
+		}
+
+		iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
 		prxattrib->key_index =3D (((iv[3]) >> 6) & 0x3);
=20
=20		if (prxattrib->key_index > WEP_KEYS) {
@@ -1395,6 +1408,10 @@ static signed int validate_80211w_mgmt(struct adap=
ter *adapter, union recv_frame
 			if (!mgmt_DATA)
 				goto validate_80211w_fail;
 			precv_frame =3D decryptor(adapter, precv_frame);
+			if (!precv_frame) {
+				kfree(mgmt_DATA);
+				goto validate_80211w_fail;
+			}
 			/* save actual management data frame body */
 			memcpy(mgmt_DATA, ptr + pattrib->hdrlen + pattrib->iv_len, data_len);
 			/* overwrite the iv field */
@@ -1402,8 +1419,6 @@ static signed int validate_80211w_mgmt(struct adapt=
er *adapter, union recv_frame
 			/* remove the iv and icv length */
 			pattrib->pkt_len =3D pattrib->pkt_len - pattrib->iv_len - pattrib->ic=
v_len;
 			kfree(mgmt_DATA);
-			if (!precv_frame)
-				goto validate_80211w_fail;
 		} else if (is_multicast_ether_addr(GetAddr1Ptr(ptr)) &&
 			(subtype =3D=3D WIFI_DEAUTH || subtype =3D=3D WIFI_DISASSOC)) {
 			signed int BIP_ret =3D _SUCCESS;
--=20
2.51.0
