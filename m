Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8E479885
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773328; cv=none; b=hfY7p5EIRiXYw4ui+A7qg8PG6hXmyD4Cfk/ZlNAXpzAB4ubap0YzzhHG9NDXKjTfq3kUANEYbqQViW/B5Bw+4NzbEWdCUnNtO3SiArohYcgw6XgpI9WXSFxZcKr4aBiDe0xKCdnoy1E16G2kiCeLT8c5mp3CvT+JdLJVf6SDe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773328; c=relaxed/simple;
	bh=5ifspmU//CZaPykTB72aBGdZa3rdoKjIo28aQg2Ad08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJLx6Kq1feGo6X9jppsJkp1/qMiTa/ElF8bMDKYASzmf1w9eqP74kmRtN3we5kaTm+Merf3ur8jXxcSFqixjyJlgN+ZyWyfZDlPhRYgP/O0kaFD24AhADfqwf+G+D39kBotGBpgKaPOy/SYUZjpz0qRHYc9xkXJHiYdbKkMZ8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg8z8691; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg8z8691"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso8509315e9.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787773320; x=1788378120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY56UfeK4JcroakIsNp2coHrCTQ1sU7LKWvzN2n4hqY=;
        b=Mg8z86910HXq4vGM8cNZjzhiXSADab/pf6u5HeIRUE9RXpi5C/ibmiYG08KGRldPxf
         Rs5UjCGj3nbSsILvhmjJpUL8rCng0yODW/OFbw39i9SIelkSlaTKeiLeC9RSq7/CSinV
         4D6peFimS2mO0Euj3H5yq4EVCqyjVmeYr7erUvw4Ji56Sbkyr57ZirxGHBh0FJnSadvP
         1DtAhP/VzOzHOEFQTA7lsVrmjewgZQ0+STKY/ywjwErylZo5pBqxX2l0VH2guWfRvpm2
         pdmYv9Z89jTc5YwMRVdlz+7ElIdw+wyukpk0GT2gJraQwqf5SLAIvvbnFwOO3FuRNGJX
         I8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787773320; x=1788378120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY56UfeK4JcroakIsNp2coHrCTQ1sU7LKWvzN2n4hqY=;
        b=B/3HNTXIJeHMDbzl/ZWD6CshTM+oL8b529J4l2meJU5PCjFNdQVthgiiAo/zBNMXdA
         4pP5L4IPeEoKiG58kbpO9bBQsM/x9NJVSblt7Nm0ZVw2NhaKbKmovXge8ZJgnRVn8siK
         Hq3343Ka8ZZxmEy4TC3c2Xa0p18Rwk9RS4Y2Q2QOmdC2xaB+93F741hbxtXYOZ+lZghV
         3Zm46G4ZW1aSqwAYMWpA7mi/5vMu8Z5NNbSN3by3/IEdt9gWU8/QxNrzosN4a3UrL4FQ
         h/noGE1wOZmJgqraMwvid9GSYrq39kXAjF+9BH6UWocHS4HV+NyFlclXTFECeW7wrcbl
         UsWQ==
X-Gm-Message-State: AFuF++m878PKsOocwfja4VSHEUJrUyGOcuShGVHuWCvMFORuCXQVnN9l
	WX38pzEoBsceM5yc8PkjO4IUvlYUcfx5tZwG56cfxiDTu/kMTobiMv5s
X-Gm-Gg: AR+sD11ybfMTrkUfCK0iMLoM2SCNFjHYMicWD6I4q41frTXiylL+IZAwn2DcRm9z6dk
	vjqsD/HGUX0r7Kc1fKcG66QYw3j+MFtk9bv2gxxZw3baRMLedYPBLkXZXvx2syluf78no0MfsCr
	FcUvq4rVcZevRx4MMKet4x/VQfqB8jbZGTDnn0XVby524iF3foEJLw33Sw7LA0YXXvZ5hbruNBf
	8fibP/NtXWEh0qhlL3/5Zsjsg2/ezbfEqb/ZMt12wN0WpWM0Tt1r21cTAoRSbMR4drMq3wET2Sj
	MGM4cmy3aMjlA/cKN5QzgnhNK8/7bWzrCKHs/Vkbku4oaiFNPFwjl+W98qqDiYnQVYOenH39i/S
	bWuvSX1TSMLtt1ajCXqCm9/Lfq9S8QaTS2SnXBXY1rDXyCp7DablbEltpccqle7jf/qZcif54ve
	13sXcbCLkZrppfIV99hDiScNRLb3+n2tH3qL9b4OvrQBELOpdx5d+HRX2wup8hN+5elKD031wAQ
	Yg1dgv83KzpuIivOPYJrXJHuQkLTJlJT/ArcsCzloc=
X-Received: by 2002:a05:600c:4e55:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-499dc723fadmr97608285e9.9.1787773319759;
        Wed, 26 Aug 2026 12:41:59 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.209.111.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b2015da49sm638295e9.1.2026.08.26.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:41:59 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in xmit_linux.c
Date: Wed, 26 Aug 2026 22:40:59 +0300
Message-ID: <20260826194059.12003-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a handful of coding style issues in xmit_linux.c:

- Remove a stray extra blank line after the include.
- Split two chained assignments in _rtw_open_pktfile() into
  separate statements, one variable per line.
- Wrap the long rtw_os_xmit_resource_free() prototype so it fits
  within the column limit, aligned to the open parenthesis.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..4a3c3df5a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
@@ -15,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pfile->buf_start;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pfile->buf_len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
@@ -48,7 +49,8 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.53.0

