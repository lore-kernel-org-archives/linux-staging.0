Received: from cvsmtppost07.nm.naver.com (cvsmtppost07.nm.naver.com [114.111.35.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F7275844
	for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768964049; cv=none; b=prr3rdO5ieCmtKJOXAYFzJwapCjDSEC9t0xzBNVJkyigNd40Jxm0H1tkV6um9ZC47/I7Mx/f4yVxEfCgvTRYFXAtqDEX+BnV4v25kK0v+qVAx0yDxo/eZKPPLc6JM4P/YaNCmrkIrcJ2/G6AweGNLt2JwDTHXtCiaQhF/ck7mYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768964049; c=relaxed/simple;
	bh=oOZZpOD5BcFaxOMEEY5HK0eE2V2qq/9v3fGW9AvAWsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0+oRhl/4IPwjnH9QI4j7bdGx+IX1CZa94SpVC1NBzk1mjlmHA/G0uarDh4wZxCv1+BmN0bCjYKSboXclcP9HUBcgnahUjNG5+5oV86dtb8ks3j9464pHrOHSJ+NE4ctfRFuqlhlIqAOZxaZuqZulpMwcYUjD/o0u0UiIi1bkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=gjDpkPPy; arc=none smtp.client-ip=114.111.35.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="gjDpkPPy"
Received: from cvsendbo015.nm ([10.112.22.33])
  by cvsmtppost07.nm.naver.com with ESMTP id -Tgix+gyRAmGnxku44U88g
  for <linux-staging@lists.linux.dev>;
  Wed, 21 Jan 2026 02:33:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768962824; bh=oOZZpOD5BcFaxOMEEY5HK0eE2V2qq/9v3fGW9AvAWsA=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=gjDpkPPyPGZKvakjFvCrnYphpN7s388AyhfKrSdoJtPN5FQmoV3Zg17Il3w1c6Tc+
	 Ye6lLU57N3zhQoSvC9svk8m4ceEqceGv9ge0ViIbIRi/rwFuWGBua4YNf2QpLNPdj9
	 klGkjdCbnjAfBVVvcwzEngUXNpBTup/+1RS418a6qWCfqhn4bPQB8A/bXT/TX8RKh+
	 szFD3Of14apl8zL7ELKCP66WyboaOd0BtWwxsN10K/tKwbEfw8WobAMd/09MzTOCDG
	 er2zbuB/fTl73OTF1UrbJS8AQsI8TkFiMRcADdhy7UTh/fw4inY/k6+SHn1l5gvSWY
	 cE5N+A8G6tzNg==
X-Session-ID: 8yycSvyATTWzdnTvSNR7Ng
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: Vwnqax2rFqJZ+HmdKotm+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp003.nm.naver.com with ESMTP id 8yycSvyATTWzdnTvSNR7Ng
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 21 Jan 2026 02:33:44 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	milospuric856@gmail.com,
	zxcv2569763104@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v4] staging: rtl8723bs: fix unchecked return value of skb_copy_bits
Date: Wed, 21 Jan 2026 11:33:12 +0900
Message-ID: <20260121023312.2264431-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function _rtw_pktfile_read() incorrectly updated the file pointer
even when skb_copy_bits() failed.

This patch fixes the issue by:

    1. Propagating the negative error code from skb_copy_bits() if
       it fails, preventing internal pointer updates.

    2. Updating all callers (including set_qos) to check the return value
       and handle errors appropriately.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
Changes in v4:
    - Modify _rtw_pktfile_read() to return -EINVAL if the remaining data
      is less than the requested length (suggested by Greg KH).

    - Use standard 'unsigned int' instead of 'uint'
      (suggested by Andy Shevchenko)

    - Remove the local variable 'len' to simplify logic and avoid
      redundant assignment

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 42 +++++++++++++++----
 .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 21 ++++++----
 3 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..f24f89ab65ad 100644
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
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 8704dced593a..880344bffe2f 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
-extern uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
 
 extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..72cf8cd5f7c6 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,19 +21,22 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
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

