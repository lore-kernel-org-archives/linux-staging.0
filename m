Received: from cvsmtppost03.nm.naver.com (cvsmtppost03.nm.naver.com [114.111.35.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044A3D5231
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769055312; cv=none; b=bKhWBGAvJx9Lo2VX7iWjsplF0baqAV6vPbF3bp4kkkjKCp48vMLdY5gVjoV+OonYDFQOwSQQXoQ9nVDYWHhJfkuTwvvDouqncw2se0bU8qmNcTY9KdDn7K+WCX4cHr/lvjxkCRdMU8TU0mxRQ0tjqQRrskAHpxMv0ACPfhO+gEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769055312; c=relaxed/simple;
	bh=kkI5UapEQb3QPANt6D1BU4YNEvmEAUysX82KHCmUzc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0rhB70I8xJ9qPX8F9/A/VwTrdfhelCSXTftVX6AQDgVgGDM5pUKOSk6y3AHXzkuwM4MVgIRRiDfWROYHK0qdB92FptYnjPydbEOBmPOaXtXlFMqVpQRVxc9Ts1/tCpAJ6NuQQqDAHIQKEQJ9aNeyNd7V+hpJAfTkVR/07L35vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=MVf+FSWH; arc=none smtp.client-ip=114.111.35.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="MVf+FSWH"
Received: from cvsendbo002.nm ([10.112.20.42])
  by cvsmtppost03.nm.naver.com with ESMTP id ZlkyjlzZQCe8ZrePzuQugw
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 04:15:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769055306; bh=kkI5UapEQb3QPANt6D1BU4YNEvmEAUysX82KHCmUzc0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=MVf+FSWH9/kXABlYopj4XpxK/e+5j8coTo2IeUumslAszxcoUp9LzwejzT1Dk+F8A
	 SKdQ1S6ImFR8nUlowjouLhlc6vH5B9g9YjhcEdRSCnvrs3SXe0t0d71TPhVPI6yoTz
	 9JudXaSb5gEUD7DzTK39HN/DW3dyALWWHEYTfSXuzG06w/7Dw7jb+YzsDF0eMWFjDT
	 N7m0zzjh3hxLZctt20wQYmIxkbLzLT58QtfsH1HWB2pLw/mbtU4OfNDqKlr7f4zV4E
	 xzu+cNJGyK3/FAFxx46C2T03dUmXPYiYp2Vt1jVkstfIyjVHfmE3cAV+sNQRsD1IhE
	 7Kv+wIdbXsMpA==
X-Session-ID: iCm-m4TbRtSL0qn0icotzA
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: lqKZKAvrFqJZ+Hm9KAvZ+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp02.nm.naver.com with ESMTP id iCm-m4TbRtSL0qn0icotzA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 04:15:05 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	karanja99erick@gmail.com,
	weibu@redadmin.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 2/3] staging: rtl8723bs: update callers to handle negative error codes
Date: Thu, 22 Jan 2026 13:14:49 +0900
Message-ID: <20260122041450.2325560-3-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122041450.2325560-1-s9430939@naver.com>
References: <20260122041450.2325560-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, several callers of _rtw_pktfile_read() ignore its return
value. As _rtw_pktfile_read() is updated to return negative error codes
on failure, these return values must be checked to prevent silent failures.

To address this,
this patch implements a proper error propagation mechanism:

1. Add missing error checks: Insert 'if (ret < 0)' checks immediately
   after _rtw_pktfile_read() calls in set_qos(), update_attrib(), and
   rtw_xmitframe_coalesce(). This ensures that any negative error
   code is caught and returned.

2. Enable error propagation: Update set_qos() return type from void to
   int to pass these error codes up the stack instead of swallowing them.

3. Update upper-layer handling: Modify callers like rtw_xmit() and
   xmit_xmitframes() to check for '!= _SUCCESS' instead of '== _FAIL'.
   This allows them to catch both generic failures (0) and the newly
   propagated negative error codes from their respective callees
   (update_attrib and rtw_xmitframe_coalesce).

Specific changes include:
- set_qos():
	Change return type to int and add check for negative returns.

- update_attrib(), rtw_xmitframe_coalesce():
	Add check for negative returns.

- rtw_xmit(), xmit_xmitframes(): Update
	error check logic to '!= _SUCCESS'.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 44 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +--
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..13eb0e3eae62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -596,23 +596,31 @@ u8 qos_acm(u8 acm_mask, u8 priority)
 	return priority;
 }
 
-static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
+static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 {
 	struct ethhdr etherhdr;
 	struct iphdr ip_hdr;
 	s32 UserPriority = 0;
+	int ret;
 
 	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
-	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
+	ret = _rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
+	if (ret < 0)
+		return ret;
 
 	/*  get UserPriority from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
-		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
+		ret = _rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
+		if (ret < 0)
+			return ret;
+
 		UserPriority = ip_hdr.tos >> 5;
 	}
 	pattrib->priority = UserPriority;
 	pattrib->hdrlen = WLAN_HDR_A3_QOS_LEN;
 	pattrib->subtype = WIFI_QOS_DATA_TYPE;
+
+	return 0;
 }
 
 static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
@@ -626,9 +634,12 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
 	signed int res = _SUCCESS;
+	int ret;
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	ret = _rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	if (ret < 0)
+		return ret;
 
 	pattrib->ether_type = ntohs(etherhdr.h_proto);
 
@@ -655,7 +666,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 		u8 tmp[24];
 
-		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		ret = _rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		if (ret < 0)
+			return ret;
 
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
@@ -737,11 +750,16 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->priority = 0;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE)) {
-		if (pattrib->qos_en)
-			set_qos(&pktfile, pattrib);
+		if (pattrib->qos_en) {
+			ret = set_qos(&pktfile, pattrib);
+			if (ret < 0)
+				return ret;
+		}
 	} else {
 		if (pqospriv->qos_option) {
-			set_qos(&pktfile, pattrib);
+			ret = set_qos(&pktfile, pattrib);
+			if (ret < 0)
+				return ret;
 
 			if (pmlmepriv->acm_mask != 0)
 				pattrib->priority = qos_acm(pmlmepriv->acm_mask, pattrib->priority);
@@ -1039,6 +1057,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 	s32 res = _SUCCESS;
+	int ret;
 
 	if (!pxmitframe->buf_addr)
 		return _FAIL;
@@ -1054,7 +1073,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	ret = _rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	if (ret < 0)
+		return ret;
 
 	frg_inx = 0;
 	frg_len = pxmitpriv->frag_len - 4;/* 2346-4 = 2342 */
@@ -1096,6 +1117,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
 		}
 
+		if (mem_sz < 0)
+			return mem_sz;
+
 		pframe += mem_sz;
 
 		if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1958,7 +1982,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 
 	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
 
-	if (res == _FAIL) {
+	if (res != _SUCCESS) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..55df66ec5f4c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -289,10 +289,10 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				pxmitframe->buf_addr = pxmitbuf->ptail;
 
 				ret = rtw_xmitframe_coalesce(padapter, pxmitframe->pkt, pxmitframe);
-				if (ret == _FAIL) {
+				if (ret != _SUCCESS) {
 					netdev_err(padapter->pnetdev,
-						   "%s: coalesce FAIL!",
-						   __func__);
+						   "%s: coalesce failed with error %d\n",
+						   __func__, ret);
 					/*  Todo: error handler */
 				} else {
 					k++;
-- 
2.43.0

