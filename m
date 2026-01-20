Received: from cvsmtppost22.nm.naver.com (cvsmtppost22.nm.naver.com [114.111.35.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2050425CD9
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915378; cv=none; b=qMmq/g+dxt1CBtPFBcVl2W/2K6CDHPDCy+Y+3CnAkKBpT1SIZN5vNUovFYgMhL/ILpWx8A2icPta5nT5zI3YbytxSVZ42HLApS/y3oI5FuOWwEJHQXq+0ujxWptp8mYsAG4dsSvzFyaggGm8b07GPjWA0Qdxj/LAmLDvcJaXQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915378; c=relaxed/simple;
	bh=X/ydUHbpKBCkVvcTSvF9OTD149Wif4LzunZVWqnYtGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RbmaE3IYPTWpmK8LmFySNnYLSDy3tCPhkiYzqOeXmJMi2rIyWGf+8br7ha6IIfJxI/MD8egilwEceK7kpXVAGVnnDGV7zsPYyqxk2yJanuorMBKoCNqH/IMy6W5ShdnA74En1glnK6mnDDKrtgYD0APxEmHGty3YK0WJ9zclVhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=gPif7Tb6; arc=none smtp.client-ip=114.111.35.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="gPif7Tb6"
Received: from cvsendbo023.nm ([10.112.22.35])
  by cvsmtppost22.nm.naver.com with ESMTP id OhlYC+prTbmK3bBN9f9R2Q
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 13:22:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768915367; bh=X/ydUHbpKBCkVvcTSvF9OTD149Wif4LzunZVWqnYtGI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=gPif7Tb6S2ARUAQPPMl5KlrgNnfklDBjTTX9W87sMGnOtGohCfzMEFKzrPRGr8bUs
	 /oHukhxoS3N3WzlnExADsjTtdQ3dytpwT0smjo90hhMb+VbthCMf5HMaQTHwGdMv8r
	 DOOSIJ5gnHyITAIw80brsbdSgzcVA9p+7qO6vqBGleGWy+thTEHJXgVahRgP6fHE3p
	 fmts0tVMgJuO/HBofMAgpYb6g9dH+E4J8u15RMHeBtW52DvDFZT868eCRqx95mbC89
	 EXpTSnUrjhUAzrLWyJPn+QPOyx9Qg0L41zky8K+2OF9vpYfNKzUH+LkDXATCjBOdbC
	 q++ZFaWAH7zBg==
X-Session-ID: RAxcxranTBCuEILmzeu-IQ
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: zdY/aA2rFqJZ+HmrFovZ+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp002.nm.naver.com with ESMTP id RAxcxranTBCuEILmzeu-IQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 13:22:46 -0000
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
Subject: [PATCH v2] staging: rtl8723bs: fix unchecked return value of skb_copy_bits
Date: Tue, 20 Jan 2026 22:22:41 +0900
Message-ID: <20260120132241.2119454-1-s9430939@naver.com>
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

    1. Propagating the negative error code from skb_copy_bits() if it fails,
       preventing internal pointer updates.

    2. Updating all callers to check the return value and handle errors
       appropriately.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 25 +++++++++++++++----
 .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 12 ++++++---
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..135bc5432be6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -603,11 +603,13 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	s32 UserPriority = 0;
 
 	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
-	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
+	if (_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN) < 0)
+		return;
 
 	/*  get UserPriority from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
-		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
+		if (_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr)) < 0)
+			return;
 		UserPriority = ip_hdr.tos >> 5;
 	}
 	pattrib->priority = UserPriority;
@@ -627,8 +629,12 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
 	signed int res = _SUCCESS;
 
+	signed int ret;
+
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	ret = _rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	if (ret < 0)
+		return ret;
 
 	pattrib->ether_type = ntohs(etherhdr.h_proto);
 
@@ -655,7 +661,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 		u8 tmp[24];
 
-		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		ret = _rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		if (ret < 0)
+			return ret;
 
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
@@ -1040,6 +1048,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 	s32 res = _SUCCESS;
 
+	signed int ret;
+
 	if (!pxmitframe->buf_addr)
 		return _FAIL;
 
@@ -1054,7 +1064,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	ret = _rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	if (ret < 0)
+		return ret;
 
 	frg_inx = 0;
 	frg_len = pxmitpriv->frag_len - 4;/* 2346-4 = 2342 */
@@ -1096,6 +1108,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
 		}
 
+		if (mem_sz < 0)
+			return mem_sz;
+
 		pframe += mem_sz;
 
 		if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 8704dced593a..b68277f3759b 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
-extern uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
+extern int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
 
 extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..5b9b959e23ca 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,15 +21,19 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 {
-	uint	len = 0;
+	int ret;
+	int len = 0;
 
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

