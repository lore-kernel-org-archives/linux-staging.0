Received: from cvsmtppost15.nm.naver.com (cvsmtppost15.nm.naver.com [114.111.35.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AE037C105
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769056520; cv=none; b=hut8mfhaEVJC/iXMf/VajccWgF0/o+KTs7LNubziXqU2AYqgtGCT8MG0r/F9Xgpkj88ZCBsxyrB3WD1A70pRVYHbGEirs87IkSQAAYHY33X1xbCep8joQz0Gxaw9jXS/9/vXS441S/omJl+0BJLTpTOEyhHDJAw6mDsg3BzYVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769056520; c=relaxed/simple;
	bh=bRNsrv0xQH3OBNg+NeeilOHwmMfyNc0O7Gly4FJ/9AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2jmIEzqnEyvbMIVyCMd5PL1fiIMKt79/C3IsAL5k7XKnluuIEDEooUViPVjqr0ePI/cZF30Q0Tp+ABhvoFwAMn1PHGn9PM0jFvxwd7ZEn9ScFqGCYlME8g0hutvf9JVJAGcoH2RrYdfM0PM/6pQOMkthk0PGKRpjofp0bqP2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=r/Tcse6o; arc=none smtp.client-ip=114.111.35.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="r/Tcse6o"
Received: from cvsendbo036.nm ([10.112.24.44])
  by cvsmtppost15.nm.naver.com with ESMTP id 4U9wSrw6TdiPVnCW46tsmw
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 04:15:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769055301; bh=bRNsrv0xQH3OBNg+NeeilOHwmMfyNc0O7Gly4FJ/9AE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=r/Tcse6onKXsvV0Gte7oY+7wQNEOazg336IyLfHtsNOSX2YvXOTw1wrr/vBzClHSw
	 5nWdfyWkfpY0Z3fo5tTBepacSvxVV9+yahby76BieEj6M4P6PhpXNKop6ZaY9P1JNJ
	 NWAYai0IilPVgXZWX6EhlSJ1IaTPdwSL86bD3AMPcdWAkHR4mwKbKMorfUEIygN6fV
	 gY30YwZq+NO9qMT8jsVAZb808PXjc/JiRORwyvYdaB+KwoH2LXGJWjrVW16Sv/bGL9
	 6BuKH8+kTdmAofrMusabe23pEPMYUVQz6dOqiEy3IOg9563pyWwgGYM/296sGyMCQy
	 360BPO7I5o/zw==
X-Session-ID: 8YxrCQB6QYu4N+rEKha2cA
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: lwYZKAvrFqJZ+HmmKAvZ+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp02.nm.naver.com with ESMTP id 8YxrCQB6QYu4N+rEKha2cA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 04:15:00 -0000
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
Subject: [PATCH v5 1/3] staging: rtl8723bs: change return type of _rtw_pktfile_read to int
Date: Thu, 22 Jan 2026 13:14:48 +0900
Message-ID: <20260122041450.2325560-2-s9430939@naver.com>
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

The current return type of _rtw_pktfile_read() is uint,
which makes it impossible to propagate negative error codes
from internal calls (skb_copy_bits()).

In preparation for returning proper error codes
(eg, skb_copy_bits return -EFAULT when error occurs)
when data is insufficient or copying fails, change the function's
return type to int.

Additionally, update the type of the 'rlen' parameter, 'len' variable
from 'uint' to 'unsigned int' to comply with the kernel coding style
as suggested by Andy Shevchenko.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

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
index 944b9c724b32..ea54a573e025 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,15 +21,19 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
 {
-	uint	len = 0;
+	unsigned int len;
+	int ret;
 
 	len =  rtw_remainder_len(pfile);
-	len = (rlen > len) ? len : rlen;
+	len = (rlen > len) ? len : rlen;
 
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

