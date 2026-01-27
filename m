Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20DE2FFDF9
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528305; cv=none; b=ItxRij5v0B5M14+UA1SwYYce/kcWvIRJW0Mp0ltWMM+JaU+UKIHr4jkowceaFjXo4lTyRnqWf7C/cIC5ksFItol05MmTpJPdspU/mJlPiAur9Q022rA+V1P7WRGA0fpDJ/8vJGi0ygn6r1lbVecRhuvdm0zvGwwsi73P411/D8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528305; c=relaxed/simple;
	bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItTve/pq7Q8GZI+qGuAlBSIuIQk8jWv96cm7e6BBY+r+RWAxRtKg3VoscJsWtGuJrTKXvNjhUBFIyRCRSOahexEO7OfHKRhr6ezpbPLWX9C2R031mMEfB1IFaWHGcV/6ki1xPyuAkf+CX+T9SpjHdWsgVsCJNs7ZKL4dtUtQ/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=D5RM5TRs; arc=none smtp.client-ip=114.111.35.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="D5RM5TRs"
Received: from mvsendbo16.nm ([10.179.40.209])
  by cvsmtppost24.nm.naver.com with ESMTP id 9bCXMpx6RUyH4hMgTIpJ9w
  for <linux-staging@lists.linux.dev>;
  Tue, 27 Jan 2026 15:38:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769528301; bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=D5RM5TRs5DgHBNoJNP/BM1N0KSWBmTqrojaDirItUexyyUih18otHk66/K+AKq4CV
	 aTNF1cjDiwMjXHkHZ6X6BHyxmYV1lk7OnkVSpf0ll1yCLi0U2toGg3OkJsryVztCup
	 HGowas2N+7E/2cI/HIGKEKDip6ww8IH+5EBrM1j7jgvjnIafqZRSB82gzsml9PTEjT
	 FJMYmUtdCtu/MYin+oCYKbx43RUMMHDMZEImqWEP5A51+EXNi0G26fugywXbVHlKrx
	 JkUrHM/TZf6pRo2iPwG6lNLIj/jGQT0F6ne9AR8XoEF9nK/oh6FvwQJSApItJ9ryic
	 +DrYCvfn3VMtQ==
X-Session-ID: i41qw2zcTDy1hKr+mN+vJw
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: uZnlFAvrFqJZ+HmmKAv9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp006.nm.naver.com with ESMTP id i41qw2zcTDy1hKr+mN+vJw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 27 Jan 2026 15:38:20 -0000
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
Subject: [PATCH v8 2/2] staging: rtl8723bs: clean up _rtw_pktfile_read()
Date: Wed, 28 Jan 2026 00:38:10 +0900
Message-ID: <20260127153811.1592900-3-s9430939@naver.com>
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

Clean up the function by changing 'uint' to 'unsigned int' to comply
with the kernel coding style, as suggested by Andy Shevchenko.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/include/xmit_osdep.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 13d86186904c..880344bffe2f 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -35,7 +35,7 @@ void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitb
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
 extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
-int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
 extern signed int rtw_endofpktfile(struct pkt_file *pfile);
 
 extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index d6c2ae0b7385..72cf8cd5f7c6 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -21,7 +21,7 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 	pfile->cur_buffer = pfile->buf_start;
 }
 
-int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
 {
 	int ret;
 
-- 
2.43.0

