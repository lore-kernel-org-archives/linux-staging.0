Received: from mvsmtppost06.nm.naver.com (mvsmtppost06.nm.naver.com [61.247.196.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBE3002B9
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878066; cv=none; b=jLuZ+A5VBDC9ER0huh5ugzqcOuQ53UcDHqh0Oh8R1hsN3BJr01qTWIVJnAFo0phcSx/7qM8ic7HmtfhUmKWFxXpwwK/Iu3IgBiracEQXg2nISmg3F+W1pN7/gXzF18XOjQblamEYQJr8WMpahZnKZMdMo/a+vmBX7gNKsGLhxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878066; c=relaxed/simple;
	bh=Hs1zxEuoCVkg3pUHXZmwqlLuGuZ61ia+4eqUjxx5/q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXqaYFQXrzGrGwQw4PdpamfPOPk9IEzHVy78lqYfYljMXy88LusEOfxB47GXbPttBLcPx2Iaq/PuT8TXH64FL3XlwxRXD2iLal0GZNag7FWvUPPjL80UzEzOMI1Ua7nIr4VUf1QWKbFNvHHgzjV1ZOUMsYtkdPoDjZg/UfNwaso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=rDQ+cl3p; arc=none smtp.client-ip=61.247.196.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="rDQ+cl3p"
Received: from cvsendbo034.nm ([10.112.20.50])
  by mvsmtppost06.nm.naver.com with ESMTP id e73BXvLURnamyt82w40ggA
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 02:50:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768877456; bh=Hs1zxEuoCVkg3pUHXZmwqlLuGuZ61ia+4eqUjxx5/q0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=rDQ+cl3pk38U8XqIdHm0X44sMzq8e228EXe2hv8+oknGKJUjIfQ/Ds1GseWG9wOSk
	 Bb2Nc/b15ZngJ/VrJDd1Ac0KoCUnO8DkEWDNMuaS5dofiPTV5caCJ8FKfHQN3fFLkw
	 H5ttJT5no+O2U+sxzuCihJ0zRIVylU+CUInG/aqmodWB+LP0xDK+z68g7FxaDQMEQr
	 gCsj+4uAzXRQHiCIx18Ym8+gX1LIBO29UxhqfAwlFbvSAkLLNQ0YjLLEvLcFNqPMQ+
	 iyG6qx0UEHQeiRmuCWV83AOuoNiSjAXWfE9xbDHLd0fgFlVr4CwoEfb0/87hSK6E77
	 V6RGLAoraeh0Q==
X-Session-ID: VGbFlvgaRDSGWTvgJgfakQ
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: VZYdaA2rFqJZ+Hm9Fxg9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id VGbFlvgaRDSGWTvgJgfakQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 02:50:55 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH] staging: rtl8723bs: fix unchecked return value of skb_copy_bits
Date: Tue, 20 Jan 2026 11:50:51 +0900
Message-ID: <20260120025051.2843461-1-s9430939@naver.com>
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

    1. Returning 0 from _rtw_pktfile_read() if skb_copy_bits() fails,
    preventing internal pointer updates.

    2. Updating all callers to check the return value and handle errors
    appropriately.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 20 ++++++++++++++-----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  6 ++++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..cdc7ef1474be 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -603,11 +603,13 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	s32 UserPriority = 0;
 
 	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
-	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
+	if (_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN) == 0)
+		return;
 
 	/*  get UserPriority from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
-		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
+		if (_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr)) == 0)
+			return;
 		UserPriority = ip_hdr.tos >> 5;
 	}
 	pattrib->priority = UserPriority;
@@ -628,7 +630,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	signed int res = _SUCCESS;
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	if (_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN) == 0)
+		return _FAIL;
 
 	pattrib->ether_type = ntohs(etherhdr.h_proto);
 
@@ -655,7 +658,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 		u8 tmp[24];
 
-		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		if (_rtw_pktfile_read(&pktfile, &tmp[0], 24) == 0)
+			return _FAIL;
 
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
@@ -1054,7 +1058,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	_rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	if (_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen) == 0)
+		return _FAIL;
 
 	frg_inx = 0;
 	frg_len = pxmitpriv->frag_len - 4;/* 2346-4 = 2342 */
@@ -1096,6 +1101,11 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
 		}
 
+		if (mem_sz == 0) {
+			res = _FAIL;
+			goto exit;
+		}
+
 		pframe += mem_sz;
 
 		if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 944b9c724b32..0720aa7cad62 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -28,8 +28,10 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 	len =  rtw_remainder_len(pfile);
 	len = (rlen > len) ? len : rlen;
 
-	if (rmem)
-		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
+	if (rmem) {
+		if (skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len) != 0)
+			return 0;
+	}
 
 	pfile->cur_addr += len;
 	pfile->pkt_len -= len;
-- 
2.43.0

