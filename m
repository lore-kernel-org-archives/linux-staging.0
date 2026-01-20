Received: from cvsmtppost04.nm.naver.com (cvsmtppost04.nm.naver.com [114.111.35.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D5248886
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924852; cv=none; b=IFiqSiu2AuG58uG4FvBDO03bLxDj4GgzdUlglLazCtiRaSZf5e0c/bTEZlRbZhThESAMEKiV1PNqdEj4U0qmp62BuWrw/Wy+89W1MwdK7yURd/Iu6uEq7883qGGB61HnVmRvx5zjYWr9SN2czLGbSj96pUj7LwtGo1iFr8u5hCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924852; c=relaxed/simple;
	bh=nFs/R0sED4zJ04h2i/zVthrMtfHY80TMUHBaI9QBhQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjopVX2m8AGzrjGbNpD6n+f4ePQaaAPkX2/+8gq7VEs+1rTrn2oEs8zfl1bYVZGbujWLwp5wxthDvT6N0LMWv421DZ6Lg1SG/DHRwkqxVSrZC5eKeme9+8ZHGmrb0i6MGJBiMjES+zZAw+4w/tjOtEf+szAJZB9gvbtvDoiNpVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=lNbBQBhi; arc=none smtp.client-ip=114.111.35.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="lNbBQBhi"
Received: from cvsendbo038.nm ([10.112.24.45])
  by cvsmtppost04.nm.naver.com with ESMTP id WeI39--aTVanDcWwaX0hdQ
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 15:50:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768924241; bh=nFs/R0sED4zJ04h2i/zVthrMtfHY80TMUHBaI9QBhQs=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=lNbBQBhiT2mVNS1IygJtau/WpI9cuAbR5e41/oqirkMhR9aZLMhyX7AuEglCiwZPx
	 0oeXTOZDK4laWS/sVpT3utzw0c3XMvvuPNbdz1hmljpctOAKFGAPrBOlPOeQbifHFB
	 VaH0AKlWEQIjSeH2DoEoa2KllDr+dCq5tiHp9j9PGedg12pIeIHKsc2iQPr830Nk/o
	 YWUODsy1iXKLT9xZl6pBS3CSgaEQSg9Mbj+s5uorb6x3g5snZKj61oDgPalhhRaN7G
	 dK7afso+UNsfVeGNJFdm8uYzxw2tyLwpvXZXq/ROfrh+WOYQB5TMQz+fitWw9PEgIL
	 Nqhu3BOJNsBhw==
X-Session-ID: 8C5AMqEhSYy97OJUeVy1vg
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: HZblaA2rFqJZ+HmmFA2w+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp005.nm.naver.com with ESMTP id 8C5AMqEhSYy97OJUeVy1vg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 15:50:40 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org,
	milospuric856@gmail.com,
	zxcv2569763104@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v3] staging: rtl8723bs: fix unchecked return value of skb_copy_bits
Date: Wed, 21 Jan 2026 00:50:34 +0900
Message-ID: <20260120155035.2939512-1-s9430939@naver.com>
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
Changes in v3:
	- Convert set_qos() from void to int to properly propagate error codes
	  (suggested by Greg KH, Dan Carpenter)

	- Use an intermediate 'ret' variable in set_qos() for cleaner error
	  handling (suggested by Dan Carpenter)

	- Remove 'extern' from function prototype in the header file
	  (suggested by Andy Shevchenko)

	- Apply reverse xmas tree ordering for local variables.
	  (suggested by Andy Shevchenko)

	- Remove unnecessary blank lines in declaration blocks
	  (suggested by Andy Shevchenko, Dan Carpenter)

	- Revert 'len' variable type to uint in _rtw_pktfile_read()
	  (suggested by Dan Carpenter)


 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 42 +++++++++++++++----
 .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 12 ++++--
 3 files changed, 42 insertions(+), 14 deletions(-)

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
index 944b9c724b32..553901a66c37 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,15 +21,19 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 {
-	uint	len = 0;
+	uint len = 0;
+	int ret;
 
 	len =  rtw_remainder_len(pfile);
 	len = (rlen > len) ? len : rlen;
 
-	if (rmem)
-		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
+	if (rmem) {
+		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
+		if (ret < 0)
+			return ret;
+	}
 
 	pfile->cur_addr += len;
 	pfile->pkt_len -= len;
-- 
2.43.0

