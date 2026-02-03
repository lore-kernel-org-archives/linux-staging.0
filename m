Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CC2BE05B
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770083049; cv=none; b=CRkz1CvrD53N3qUDSaVRFbbhVj5XIVBx2du4qgzMeU3xrb3+WUUwlsHQywnlL8mdffMumvQNlP521Z+WiOUmx+HF3PWvBLCM3JOjL6yVn2qJINzcy8q9MoA200PcEYKcPEucSZUf7PmjHWUfsmWgcQiQs086YaHftTUMEkZb5Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770083049; c=relaxed/simple;
	bh=yVP9mNRu0wCloQ9zEIu8RgYfaNgkydPxq3wWlagei2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BYj0PjwtCNCTl5zmDWaRLPCEtVX19//BUwZx9dmRcl9CvxY4uxYZD88WZAcE1I3rcpwMhIpeE4DbkuMyFdVrMeUL2P9Tdfp/g0kPXqR+TA8xmmvmbSQPB1M1+6YCJ6amRXbN5hSlJRNY2zbSU9SKIGzl8lgNX78K7HqUjWQBkvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8h5B9Jm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8h5B9Jm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a07fac8aa1so37980495ad.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 17:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770083048; x=1770687848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZAOIiCBztMjfMtUS6URIQdd3PAkbR8rs9mIdddByUA=;
        b=C8h5B9JmiVf+DiBouDKSHuo9TTDGoAmhuA6lUj5BbQURXEosImhGR6rUuKx/HG5Apc
         dLHbU6BjkfzsUzLgzcgWjzVhdYTq3xYU7FkoWSxxhI/xJoA2/zTt9NEwnQY3Twx8V5+T
         DulX1jVVAWmRLekX+a/udFUjUVIgJ+F2CTI/YWRWMcJt3fpSkm82OvPGWtti+WG4Lv3G
         DCMJ5sgWQ3eFOYe7zBBfP9J6kIWvW+f/vkhhhtqk90Dvh4wO9G7l4Vv/xcl4FNHwQkWX
         7aw5/atoSVCBQGAKqUNWxdMdcGF9gH94tGWSAhw1vSdnIeC7WL94ml+GMSiRiDGNRLTp
         ALEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770083048; x=1770687848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZAOIiCBztMjfMtUS6URIQdd3PAkbR8rs9mIdddByUA=;
        b=QNrRAS/nKZViaOJhnylmGYUrSRpCBpjA+MyQuSUS5gga+osw/rwGbvn7KpcRR4YZrX
         QIgbNXOpP0hOrmR7nVDzCY6kmoTj4HyiyXuXYFTWhDGVp+YDITNn/G+6ZJEzh0oKlhP8
         OuFD2NycduFzgEV3DhteGk2Cokim2UnpEF1aboBg1GMme2AOJg7YEvCbpscUEHuvE3hd
         e+03aMMblQUVwQ8D2SSkDFQSre+VWb6gQFfpnxIZUebbeuNLudo73yJYCFls3WgIw2po
         ybwBlTRF9qALUfbUCyaaKxH7sMSHcT1bnUyN9rPZTfuVz7ibOfOPDTZlc8gfBMv57zFJ
         +dOw==
X-Forwarded-Encrypted: i=1; AJvYcCVluwIu7+rPLwBSn8+uVGE91qSL6WQ4mSpi8/PW2RiikY4ydNObOi8MZXPAX0AlP2PbnLd8RKc1ZcmSP08d@lists.linux.dev
X-Gm-Message-State: AOJu0YxDtEYUFQC4e13TZOvj8DShj7hO6Dxjam9FDv1Ipf6PT26xoLh9
	t1cvnRiOIFXxpii7o4JU5FnTW4NdlDyMXjA81wgXOkz08rOv5Lj8iLdH
X-Gm-Gg: AZuq6aLcb3NaOKXQuCbQNmoSIz6UkmV8ogDFIX1BbKCergjyaMguGp4aEzIUoij+fgP
	c2LWtzZyM8esSEgl8oXJTgYqcXY4ZXgdqEoiKDrA0z1ESTWLSzdCh4o4U3Ba9sjekdE/1JPG789
	I+eQhNqBR1Uz1+15zKLHvDbhaLt2+sIfWkSkLlJY9e0skFZKxEG72tPClP/DNxGY5OHv3GbEzi6
	tJ8oo+2BvNKO1cQwV2diwZXoVjjeq2NGPsvnZwywadblayEIEuBqZYcSUmKdbVbmp4NevvlIayE
	gsM+/JTce8+G5bT7yZIUr75HxDzENm1MNn/kjtmi6tb5J4lTiwCy02OO8EcZH1YUI+KooWvoYPE
	R1mT1ipPc5YTcbhUrAjZqFy7QGQew4C2Nz5CrQMNzwyyxxQVdeaqAkXOK27oOwEJQIZqKjd7M5+
	rNEznqC+Hdc0xyN37YS7jmUTAHxmyzo/RU5A==
X-Received: by 2002:a17:902:e78c:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2a8d8150c18mr123733595ad.39.1770083047563;
        Mon, 02 Feb 2026 17:44:07 -0800 (PST)
Received: from localhost.localdomain ([157.51.79.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5dc872sm153342925ad.72.2026.02.02.17.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 17:44:07 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: trohan2000@gmail.com,
	bqn9090@gmail.com,
	straube.linux@gmail.com,
	hansg@kernel.org,
	abrahamadekunle50@gmail.com,
	davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix inconsistent indenting warning in rtw_ap.c
Date: Tue,  3 Feb 2026 01:43:16 +0000
Message-ID: <20260203014315.23897-2-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix smatch/checkpatch reported inconsistent indenting warning
in rtw_ap.c.
drivers/staging/rtl8723bs/core/rtw_ap.c: fix inconsistent
indentation.
No functional changes were introduced.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..919bf8db6002 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -178,7 +178,6 @@ void expire_timeout_chk(struct adapter *padapter)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
-	int i;
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 
@@ -278,7 +277,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		}
 
 		/* issue null data to check sta alive*/
-		for (i = 0; i < chk_alive_num; i++) {
+		for (int i = 0; i < chk_alive_num; i++) {
 			int ret = _FAIL;
 
 			psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
-- 
2.43.0

