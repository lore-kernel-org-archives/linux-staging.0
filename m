Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7E42A7A8
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829759; cv=none; b=br0jF/HX1Elh877Bcy43yRw/jLVucAN6WvDyaai+bXheb6TwV09OYYRbWzGGUHQpa5L6ruJdDPHa4G5E3QUcKMo/1q+LQ6b+wvEHrtLUBEJHcuoZ6Zdbu6tUQJvRz9/cpUoMUb6irULx9vaYG6Xg5h59ZIc1a2poN2HvgSqHHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829759; c=relaxed/simple;
	bh=wPqWf1aj9wTfmXX4eA9uO1LzHw9GK/2aK4JYp62sYOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrTnD9mQRmAB4Uio9Wu51OswOiTnoOmTrW40ZI7hGR8rYH4HtuaQc+t4tWq2JEzzf650eOm9nVjuvJ3suiRrrxdyGiJsQRFWwtra58q6cThoC8SpiFXI4FcwTFq7Co573ivrXSoaHbV/wfcwFOkbsOQb883rEUNQLiwjNLIk/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuM8fAjJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuM8fAjJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caed617615so58373235ad.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829757; x=1786434557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dF4SscBL1t8bROKzFKZwVrp85xUxA/1tXeAFq5iOCHU=;
        b=CuM8fAjJeLTEZTZ7VGivubkLNXdUzVhNxk4DTCR94uKO1c7keTBHJJ9QmOIp3VPTc3
         sfAsXZnOcASrkgOey+x+PYASSryFSA41x9M13mCqoeauAJ9XyvgxAQwTUFCdv2KCz1wd
         06RD7xpa2uv8zvcKuVBhfa+lC7s3gXRM3t/xTEAz7xPm/Vc63Er2scukmG0ycokjyo7o
         SMx1rKusIJETnd9Y2Y0Rq75kUv5wN6VvlNW0A/fE6XIs+Ahi/qOaIdm0vQaGZCqE4X/N
         mvePnnl4ZNadFEr8C8S5zMYw4KlBFTCmo/QIS75QB7XJuplCyeA/wtafOk3dAl6eqehD
         H++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829757; x=1786434557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dF4SscBL1t8bROKzFKZwVrp85xUxA/1tXeAFq5iOCHU=;
        b=iLQ3pdF6UEgROBqhwfSv8tR+cvniS1cYAG6Wxpi7rOx/iqdAOiL5w+JuQt5Kn6hr/D
         Ii1EFTRG3wV6A/43L1ITtocTDtkV/X4c6fivv+olt9nQ8dGMBh918Nnsxg2PCXSgXUQF
         +wesgANm7bfZj84K7ShpxH/SMCDfT7IlxZ2FDGNRCGj+SF1TZRaq1sW5KQ158HHldzkZ
         /+WAnTf2Ezp2xywLn6XNFshAle5Sl5KsrJJbPANgNjeUHI6llGDmWynw1jqwtxRzC6xz
         eB1opyShgxqpobCTuRP+FmiEqYG0J0JKdZYpJqDdYpGEJRps1E6J9y8FmviSY4YEilDU
         4p5A==
X-Gm-Message-State: AOJu0YzDCGfiFtNARkCIiGc6+Jb12TfKe8VAxhGNCJztC3PruPRgVVuU
	RywTJH/XH2OnuLsgGMxt53ViDPTLS0xOvR7wQzW5VUHBuNzcOnXQR2t6
X-Gm-Gg: AR+sD11heCkVgqmL/uUWfd4hSdy6TR0Jy8BXKknPtzAZOq9lzrTDyW2JUOA314dnJyx
	YK7jhD8TszdA55jHXKgdCNAn9NWu5X2cvy1moQGd7Hjq26m4GHhJTPabHbq+t1L9sAZ6gXhgSix
	76ZKzoNgblpWp740Rp7NerVGYkQSBC+DvAU2yQzW+fnDyM4mxNraNyTTs6g8/DPjpnPPlisryM/
	GmgegqGexcJVwMYIgHRfnHWarDwSsIG8fwOjQvJChgxOIS802nGa6wYUEbazGDwYM08R46P3RdC
	nGHELRDvkg3OvC0+e1ywsA7fh358cQklTfRCI2xZsAn3LX92vRwALUexZLcJ+DkXLXX/Ty4zi2K
	qSgQIqaXFUbfAtuTSpMSDA92yYrU61eITf4OU3mAvqPV1j+6n0zeN1Dx+2KqymyMbMbJUhZikuZ
	GllHGGNXcK1LXp1OsY89qMpfhgw6MTkunFtDJrXmF1eHA6v5Pb3Wvz2VKP6PCLyqZpkNvCktuRl
	2s8ilUI9jYcK7j5RA==
X-Received: by 2002:a17:902:d544:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2d0521bc383mr133243545ad.10.1785829757002;
        Tue, 04 Aug 2026 00:49:17 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fd2b3sm1764058eec.7.2026.08.04.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:49:16 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove redundant ternary operators from return
Date: Tue,  4 Aug 2026 07:49:00 +0000
Message-ID: <20260804074900.14423-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that boolean expressions
do not need a redundant `? true : false` ternary operator.
Additionally, return is not a function and therefore parentheses
are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4cfdf7c6234..214c1fd9b3e 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -130,7 +130,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
  */
 inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read - 1) ? true : false;
+	return cbuf->write == cbuf->read - 1;
 }
 
 /**
@@ -141,7 +141,7 @@ inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
  */
 inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read) ? true : false;
+	return cbuf->write == cbuf->read;
 }
 
 /**
-- 
2.51.0.windows.1

