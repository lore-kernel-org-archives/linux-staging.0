Received: from cvsmtppost30.nm.naver.com (cvsmtppost30.nm.naver.com [114.111.35.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA78435CBAA
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528910; cv=none; b=fs3vPq5ZULIL1uTiIOZmp094PvcMq1MfUCVxfuWkhxKGpbFS6k5rfhHxI/XUY8tgqKKLWAtW9Kbk85auxl8QVfcnyBGNQLalHGsVD/IVR7RdCr2BxEa4KgCUWLiMw23hbkhEkA56GR0i2IHtZ1crlLLVPo/NikyARDbWI6f5nSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528910; c=relaxed/simple;
	bh=ovL3OBZ3Irjm1J//mYxY0Egk0oIizuEsA1t73CLy+AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lepWj0oouwiiLubLq3bl5NfhQYa0kyfXuvd5cT6zx4NcQIVzp+c73VKxfoDUR5GPW3nPeQaHgIwU5SkOYyPpDjPb8L/ooWBcbSIuczS35uYGiMhv+JVYbOlQs8xSmxsDHk2B1D7bETLnZoemYLRjhUigUfl0wl++ElpYMS4qNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=aKv1YhtZ; arc=none smtp.client-ip=114.111.35.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="aKv1YhtZ"
Received: from mvsendbo24.nm ([10.179.34.213])
  by cvsmtppost30.nm.naver.com with ESMTP id +2yl9P4dTiy9FBjVUxKjng
  for <linux-staging@lists.linux.dev>;
  Tue, 27 Jan 2026 15:38:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769528300; bh=ovL3OBZ3Irjm1J//mYxY0Egk0oIizuEsA1t73CLy+AE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=aKv1YhtZbeh8gMq5o6ZWgaYpIfozURCNSBSZfw1SnchFw3mCX9CH0lfxZmo4TwG+5
	 r6JC/PTGBuGkNS//4cU1P10opK2mpBi5Xt1ABZYGcrHxzkoJlVmoXhfYATOKSumVMM
	 ZR9Zwss74q0CMDCupQ2KBmyMSqmg2LyAyHJPgp6Vco2WY0EO1RRP4qdo90mPjYuqpG
	 MCboQv76vUNcLH7Cr6kz5dxPyZ9b0dkTyrrLpM/q/ytKutQrDOL1MqY8sxyASKCbBx
	 1x6dpsZNiJmsXEuN9HtlD3faEybwe2UmAe5dDAGr6YOPy0qYiOvrl5Fad45U+DNlCI
	 K/l4cFbWCEULw==
X-Session-ID: ++gtmVVlQNaU17gkLzuM9w
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: urYlFAvrFqJZ+Hmlax29+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp006.nm.naver.com with ESMTP id ++gtmVVlQNaU17gkLzuM9w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 27 Jan 2026 15:38:19 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	karanja99erick@gmail.com,
	weibu@redadmin.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v8 1/2] staging: rtl8723bs: update _rtw_pktfile_read() to return error codes
Date: Wed, 28 Jan 2026 00:38:09 +0900
Message-ID: <20260127153811.1592900-2-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127153811.1592900-1-s9430939@naver.com>
References: <20260127153811.1592900-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function _rtw_pktfile_read() currently returns a uint and clamps
the requested read length if it exceeds the remaining data. This
behavior makes it impossible to propagate error codes from internal
calls like skb_copy_bits() and leads to incomplete data processing.

This patch updates the function to:
    1. Return -EINVAL if the remaining data is less than the requested length,
       ensuring callers always get the full amount of data they expect.

    2. Propagate the negative error code from skb_copy_bits().

    3. Change the return type from uint to int to support these error codes.

To avoid breaking git bisect, this patch also updates all call sites
(set_qos, update_attrib, and rtw_xmitframe_coalesce) in the same commit.
By doing so, the error-producing function and its error-handling callers
remain in sync, preventing runtime failures at this commit point.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 44 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +--
 .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 21 +++++----
 4 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9cead1455bfa..64e8c0e6e38d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -600,23 +600,31 @@ u8 qos_acm(u8 acm_mask, u8 priority)
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
@@ -630,9 +638,12 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
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
 
@@ -659,7 +670,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 		u8 tmp[24];
 
-		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		ret = _rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		if (ret < 0)
+			return ret;
 
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
@@ -742,11 +755,16 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->priority = 0;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
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
@@ -1048,6 +1066,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 	s32 res = _SUCCESS;
+	int ret;
 
 	if (!pxmitframe->buf_addr)
 		return _FAIL;
@@ -1063,7 +1082,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	ret = _rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	if (ret < 0)
+		return ret;
 
 	frg_inx = 0;
 	frg_len = pxmitpriv->frag_len - 4;/* 2346-4 = 2342 */
@@ -1105,6 +1126,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
 		}
 
+		if (mem_sz < 0)
+			return mem_sz;
+
 		pframe += mem_sz;
 
 		if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1968,7 +1992,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 
 	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
 
-	if (res == _FAIL) {
+	if (res != _SUCCESS) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 33c23b80e11b..a1f2cbf2cf55 100644
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
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 8704dced593a..13d86186904c 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
-extern uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
 
 extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..d6c2ae0b7385 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,19 +21,22 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 {
-	uint	len = 0;
+	int ret;
 
-	len =  rtw_remainder_len(pfile);
-	len = (rlen > len) ? len : rlen;
+	if (rtw_remainder_len(pfile) < rlen)
+		return -EINVAL;
 
-	if (rmem)
-		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
+	if (rmem) {
+		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, rlen);
+		if (ret < 0)
+			return ret;
+	}
 
-	pfile->cur_addr += len;
-	pfile->pkt_len -= len;
-	return len;
+	pfile->cur_addr += rlen;
+	pfile->pkt_len -= rlen;
+	return rlen;
 }
 
 signed int rtw_endofpktfile(struct pkt_file *pfile)
-- 
2.43.0

