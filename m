Received: from cvsmtppost05.nm.naver.com (cvsmtppost05.nm.naver.com [114.111.35.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849B364E9E
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 17:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104321; cv=none; b=KlFMmp1hM+KGP8pRXonzjmXwpG9f6ODhQEyF5b0KRExp0JEg3c8Tgk7i2PbyreJBCEpOphpQBCfrTAhTL5aQQbEMigt+qYY67/o0L/6zvkX2CWC1wyjQRoyuDY9DCLMyeReLV5Tsn4NgdSErg0C4+BmzjyqfiTojdpggWJDEQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104321; c=relaxed/simple;
	bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCatwWg6W4VoIbxEQNfyzsjLE9YJUl7eZz086JjH8/QLoGqlraN8zp7DU6+4LG3IKDCK+cuWW82XtN1ktInerQILkDsPvnHLxjtLKB0NrhwfTJtmC7o1eOY7+7CDP8MfO5Q1NhMoM4eOqp4XEe1WaCtMX+NxrDH7HwMUsfRI560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=KmYN5VrM; arc=none smtp.client-ip=114.111.35.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="KmYN5VrM"
Received: from cvsendbo029.nm ([10.112.18.60])
  by cvsmtppost05.nm.naver.com with ESMTP id TeNnOz-WRAGiNa9a9ZIjbQ
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 17:41:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769103694; bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=KmYN5VrMA7Fdd0pZRTFZ6njrQZvq72xapzIEbr1Ha80lTc7Iky418jnEnPAq8900U
	 QGIa+xznXLpNeKajN6WLOygiyaAqpNwod0D7vp5/NpxYY7N5xLWvlO1bCXvCmT2t/l
	 XrpZDPjkUdYUzjg2SpByaiI997Hn2HYPXquwZnd70kQHv+gkDDRJUTbrpwxVVCizD+
	 Fhtcd4NALsw+CMDaj18qmUvi0G7a80K/YCjW5T4piXc1NUjlDXqs+7wTQEItBPXcTN
	 P+D/WRMflVaU9ezw6yMr5SwcKRgxV2SfNjIA3EZGRZcfZOJnTH3DdnlKmnsdbxJy+9
	 2xUyPvanPYwCQ==
X-Session-ID: xK3+Dfh8RaKJiVUh3zjmVQ
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: QqKXKAvrFqJZ+HmdaxUw+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp012.nm.naver.com with ESMTP id xK3+Dfh8RaKJiVUh3zjmVQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 17:41:34 -0000
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
Subject: [PATCH v6 2/2] staging: rtl8723bs: clean up _rtw_pktfile_read()
Date: Fri, 23 Jan 2026 02:41:25 +0900
Message-ID: <20260122174125.2567008-3-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122174125.2567008-1-s9430939@naver.com>
References: <20260122174125.2567008-1-s9430939@naver.com>
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

