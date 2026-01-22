Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1181C37F11C
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769056527; cv=none; b=tvoWtfebqANPDL4uxBCkNlvfW9BkwpapZ5yPvonZuzrJwu/hunmUkhKkbZRdn1DZfTPZ15yqXA3qSKiP2YGEd7836utJUBrOB/2Wxtxlhazx4NEELzAKiComsE9/kUHiFP1IVfZ/lgJe/bBtw9BAhJ2q+lVNG/d1ajcGebiPBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769056527; c=relaxed/simple;
	bh=V2Diqzi2+EDgpT2KcklB0W83fHi5UkYHzlY2bCzM41Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMOzXYHExMDuIWRx2zqyul2kOxhkQpK0k9Xh9lBNe+E+nbnGiBfl2VsSguQwgwrIx1IGnU6E7nBjUBDTRtJnWlTKxMLsgDSeMoDe+TjyHJJiHvUEnLIDm4e8rX+dNCG7bFFHSybR/Ag0dWvGY0fdY/uWIeVUZj3YJmz2tpXAmoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=MTKrNb6J; arc=none smtp.client-ip=114.111.35.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="MTKrNb6J"
Received: from cvsendbo023.nm ([10.112.22.35])
  by cvsmtppost24.nm.naver.com with ESMTP id lmmoRmC1Qr+HgBAGxI2JyQ
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 04:15:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769055309; bh=V2Diqzi2+EDgpT2KcklB0W83fHi5UkYHzlY2bCzM41Q=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=MTKrNb6Ji8DRV4kakT/L3A7mroCjO1HQL3rRPcSdYfeVpsZEnwTarKC42SCpxtQ9G
	 OllgpsDrtRgMMLKwn1h06ycjxO6//nCh0pWkdlrj5WedgwmQx5/a3ft6nX3aieFCON
	 zNgc3cvVUJd+/pZTsHnZZVXKmXyPKcnmYU/RYTcAnavXPacaqCm9ZH5YyalM8E96ST
	 ZMgZm+h15CTswwEk90DMzQYZdDj7VI+4VmynmJ6d8zSblqwgMjIJCnNDyO8E4cUoBb
	 g0ePEz3iM+djVUTEsrHrl8aUAuD/+eUMqhgh7ziuMr2R/SKwEr1AzfvndPKRZ11f0n
	 rwBlnX06wadHw==
X-Session-ID: p3byboejQS+L0i3t5xQTJA
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: lqYZKAvrFqJZ+Hm/KAvZ+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp02.nm.naver.com with ESMTP id p3byboejQS+L0i3t5xQTJA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 04:15:08 -0000
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
Subject: [PATCH v5 3/3] staging: rtl8723bs: prevent partial reads in _rtw_pktfile_read
Date: Thu, 22 Jan 2026 13:14:50 +0900
Message-ID: <20260122041450.2325560-4-s9430939@naver.com>
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

The current implementation of _rtw_pktfile_read() allows reading less
data than requested if there isn't enough data remaining.

This is problematic because callers usually request a fixed size (like
a header size) and expect that full amount. Reading only part of the
data means the caller gets incomplete information, which can lead to
errors in packet processing.

To fix this, update the function to:
1. Return -EINVAL if the remaining data is smaller than the requested
   length.
2. Check the return value of skb_copy_bits() and propagate errors.
3. Only update the internal pointers (cur_addr, pkt_len) if the read
   is fully successful.

Callers have already been updated in previous patches to handle these
negative error codes.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index ea54a573e025..72cf8cd5f7c6 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -23,21 +23,20 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
 {
-	unsigned int len;
 	int ret;
 
-	len =  rtw_remainder_len(pfile);
- 	len = (rlen > len) ? len : rlen;
+	if (rtw_remainder_len(pfile) < rlen)
+		return -EINVAL;
 
 	if (rmem) {
-		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
+		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, rlen);
 		if (ret < 0)
 			return ret;
 	}
 
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

