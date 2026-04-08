Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92334DB46
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670093; cv=none; b=mxMT60lyAgenlqzV/xlccDmS8cscgUqfuWv6kdKQ0Avxl5PpCV1ix1P3sZMPnmOee8m0BC55lmKMeNE+mn3U4zVUnxhT5aoFTMxU4a5XLYg6MKZUE72eqTZGR/IdWFbzHcEulN06O2dd7X8A7P+e6CpbcJu4yf//dpR8xJi9DYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670093; c=relaxed/simple;
	bh=fLFNB2+nMPeLGrLDKwBweW2Z//nbvg54Q786O0rEV3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lapna9aUl0O4CbTCSV7syDlEutRmQZVS18IVbBtpOPJYYBMP5WGx63XyRhYh3aP3J83UnLzlhCUUPpbReksWEmIa2/K48oSUcuhBQYm4ha6JKe6k725dS3MOiXT3ztkUFEIfd6krCO7GOsIc4aiO5xOY+I28evahXEf12GxRgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkMMOOQi; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkMMOOQi"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d4f78fc9f6so3124085a.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670090; x=1776274890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cF5yVk0JFsexKhu+2/crDs/lBNIMULwgQzNk0SQknU=;
        b=AkMMOOQi/zByvIo6ojKGITtr+rLQi2ktgqUaek5potE4lhb679x5S4jGTJtyhb2dln
         nuKM7411CI5m0uMStAZUHJZkfUGJOD00PIMYWXLE9aexICQwcCARu1AT9HgLHdG1I1AQ
         1gi30k+gp+vElxznCA6BphBk8Rs8Nh8ipufe4ZPMHK1HsAshfRlp6pU6/1dWlHbtaTlg
         SrwlXTv48Jbp28l1imW0N9l2EaJJfKq6SypuQkts6UO8Gvpwu2cyc/F637kKCDg7bamS
         h9fXsGznlQKTmQKvOBSfNt39NMrhndqsAnbctaWJibLnYg7iuN3F5eUuL/1A5Htylx52
         ZdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670090; x=1776274890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cF5yVk0JFsexKhu+2/crDs/lBNIMULwgQzNk0SQknU=;
        b=tZooLnPAWt39+xc+pUO+e6C8QFsgcbqEuHzs/bGGmzMiDVj7DLch7uDV3rxGtA6+1H
         rsQEtzMQP+CcdmdLrhvLe8zd7F+YLFAn2klKok9gCkGZkkNfvJ4nnZNmmQXcRsjBSTI1
         a7JVkj3eP70fgl1Ou7OihBFHzBW+1xjiH8r7jN7Qd5xZFTpsXjtKPx4R8a8nVNheBbvA
         ED65Pk5im1Gg682lHhpe4n67Ic4aOOmhLXZQfuZ5nOI1znB1gsf6v669wtsAwCH01WRY
         A9OjmVqEttUjfFzYFOOlj4NpT/cxDBntwrsZFtbfSY7WQcUaXlJGWj1Y5Y/2sKbmqn3w
         Cj2w==
X-Gm-Message-State: AOJu0Yx9IXe8cSvRu8P/+fGZ34LWv+6LABNOTmTygzOTcnD6gmUUQBn8
	A5kfJ1cmFaS+eRCVcws2++msJLg3qjlBKfUQ1/CgRkMD0TP/ysk1673e
X-Gm-Gg: AeBDievkUivyed0NE3W26AZnPCNSF95Z8wFpj+ZCJ9XaEJqqXAImBZA1BAxxMkNWvot
	ySRUAWyVqLkTG37C4hc5ySvNvTlWsz+PM77qwq11Fq22duxF6LRxTaPohzZE3vuv6KSfm9dCcj+
	ekQ2UscYyNGylkdOHzNMmBcEP6++2l2TmKmGklWi0JyMLUU1xnbRaVbfHaJUrZ43GlPuJ/EA5dl
	LpJRp5RQX673xF0e7gs3N3GLlDNhDfxRqqm+O0n91viuJtWG3X2OL1RVmhTUE5evSI7msRIEs80
	+g5sMRGJ5pwQCUwPZVJpNlE+C0aXBFq1uHaizb8VHeL0x3wbGlPdrEG1vNVvnQbeDcjuKjgsK2f
	pD00OyQjd5j+ujCd36mww5aLtZ+8F6Ym9/adu6j3868aKuifeVJkYKasi158elaURdkjqGlEZHo
	ii6mVeKk4W+E3bsmMHKQiDVGPcS5IZpp+X7pYGxWH+E/GrqgpGYnoi7J3Ye9u4SqxNV2WNDA==
X-Received: by 2002:a05:620a:4145:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8dc3df1d82dmr80250185a.49.1775670089971;
        Wed, 08 Apr 2026 10:41:29 -0700 (PDT)
Received: from Akhil (mobile-130-126-255-6.near.illinois.edu. [130.126.255.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8da77e51e87sm351045285a.17.2026.04.08.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:41:29 -0700 (PDT)
From: Akhil Boyapati <boyakhil978@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil Boyapati <boyakhil978@gmail.com>
Subject: [PATCH RESEND] staging: rtl8723bs: fix comparison to false
Date: Wed,  8 Apr 2026 12:38:52 -0500
Message-ID: <20260408174011.115915-2-boyakhil978@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '== false' with '!' operator for boolean test
to adhere to Linux kernel coding style.

Reported by checkpatch:
CHECK: Using comparison to false is error prone

RESEND adding cc to linux-staging@lists.linux.dev

Signed-off-by: Akhil Boyapati <boyakhil978@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d1f1..8f18175175ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
-- 
2.53.0

