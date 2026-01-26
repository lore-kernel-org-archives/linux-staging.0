Received: from cvsmtppost12.nm.naver.com (cvsmtppost12.nm.naver.com [114.111.35.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12AF344DAF
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446500; cv=none; b=npeRJPQ4S5cikrU8IWAiJmFG3h7bqvL8Mu0qKG2DbVZlPFFzqboIrNpzM2v1CW9mx/tSSR/HarYHIb4vtZxBITWJHWb6bIbktqZm2zlhur2Gte+1QKBViSTvd8iQpKrb3Kf97tyESz/1NMMJgVHdRwnaPawFMY9C1z3Zp9RENcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446500; c=relaxed/simple;
	bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAPGH4DZjVE/tjepBF3s0X1EEKgg0lXyjWWqCJ7bBGQ3TlOrIMNwKiPMWYPylWRj9aa13CclCEm8UjWpftrsWTonn2uWC7AJw2g84vThdDkRnKg5h+eLGGmLC2Sxv4dclYEvXb3rNdHjcQSJFr25fmeyur+5OYtwTgNWEzG62tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Q4NGIkAj; arc=none smtp.client-ip=114.111.35.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Q4NGIkAj"
Received: from cvsendbo022.nm ([10.112.20.47])
  by cvsmtppost12.nm.naver.com with ESMTP id C53A+nuJQf2Jgh0lOJ56bw
  for <linux-staging@lists.linux.dev>;
  Mon, 26 Jan 2026 16:34:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769445282; bh=IhMBRhkbjTES2CAKhTOyV8cNpFmeZZg5OLA7JXnJQfE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Q4NGIkAjBakrAFQXqugRZNngg4Me8YNIb8nXlsUm2272sXCzWz8GGhiMe70sKQxdi
	 pKvowVB6JMBThEnLcoFfMTlPxQgGbiUqmj9hImiL4REbU85SZPRviCY1EEdSZpc2BQ
	 gsXzMVHdp6FeAkhFQC3hQ5xkPZDONcjdgztktOaMYBEtT00b71oD1oNc+K2pNj895W
	 evUP23HLyuQNdkJTJFEmzH9K+SZ6govk10TxNzitawXCjgMtSI7FvbxxIf2Yz8tIdN
	 i7OJdY6Tqg2ZSg3mTawHsnaiHb06zzaAlVBsRn/nDhaP7/bcaTsPj5t1klb/nDSk9+
	 Tdcvq+8n2Ff7g==
X-Session-ID: V0yGWTAdTr+6HlYlndUnTQ
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: YqYwFAvrFqJZ+HmwaA2Z+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp007.nm.naver.com with ESMTP id V0yGWTAdTr+6HlYlndUnTQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Mon, 26 Jan 2026 16:34:41 -0000
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
Subject: [PATCH v7 2/2] staging: rtl8723bs: clean up _rtw_pktfile_read()
Date: Tue, 27 Jan 2026 01:34:30 +0900
Message-ID: <20260126163430.3067008-3-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126163430.3067008-1-s9430939@naver.com>
References: <20260126163430.3067008-1-s9430939@naver.com>
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

