Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C578277C9E
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888492; cv=none; b=NX8VW4rbjG1C5xqlw2AUbIOl4ikMX/zoCkn6jW7lGoLsdSgdcPzrkCxY9tIOCHM7ed4fW0T+3O74kLOW1Rvh9HndU1EFtI6busWgE6jSsej17BzJpNDA4QU2zL/MgSdn//zgCYsDgOcvhCZxxesi4MEbRCv5czeHPvqjc+s0x7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888492; c=relaxed/simple;
	bh=u56mr2uO+o7p9qIuIHVvepeH/C+ktbuh98OvDEEpTrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXIJwf543qrS3Y69Cf3S+szEkOBjJIpnG823Wqc7ar8UQUL4/rkLx9PFKuK+TZF+Ovx2UtRdN7qOdqvyWOznvvwKgMV5aFYgnyWojQh86u8znVdCi/GCFYJe6wxp7v9zw7SBZSF7llET6O1wTRkNr8rRJIRWHvBEvTRvZjohVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnC62abG; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnC62abG"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b4520f6b32so970831eec.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888490; x=1774493290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UDwIPiqc92xCUWKknqD4HZhk4Jt5x3Wm0RJX21l9jE=;
        b=PnC62abGbHEqTlMZqsoqM5K6xS53RaP8A6hI7UgZimJaTD8I5RtUIsd9sKUbdAtFiH
         b8QzWv1wfbXwbeb6to9xUQPiBZUvXOdBlKftvXAjfJq1MIXe8EOa3bIJUSd5uhj+lUoY
         psKHqmAwPBV8FOxfNTF6SL2olHh7+JRV4biJlOOVnSs1onoiJrfdIiEf6wsPGyevxDaw
         LD/GeBpx3hyeH9cMrIfgGVO182/nnFVXsb6DsDbSfKrG1N6pb1FNyZXoHx/Wvj+vPSG0
         geSPWTjrZ4DZ+3VelsCADOriFm58KSxn0UPEQrAREQW/HVE6TBePNUOTBkQpwNpvRhvb
         C3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888490; x=1774493290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UDwIPiqc92xCUWKknqD4HZhk4Jt5x3Wm0RJX21l9jE=;
        b=EYz0BIkjnu0KaeFAdqwtcKj/aPoxcVTkdQk01YxCKY50GuKWv3QEhSb+HSHl6Kn6wb
         k/ylmcymVydhvEiX2bwU6shTQXe65uNp9ep9D/Rffr3fBe6IqHdxPb9MxrYaZc3kBBHV
         KbbO8Ype6wX/itBfWlM6/5K9Qg6W9908KQ48j9hLGqp7qCGUHwqSBTSMPJOH/dlfBse/
         +kpJ8XJ/MUtdVwavrlWfkUIbtx3BtKkI6Ce2fR3eFd43AvEzCgyaXLre+9R05bMNjArv
         LqFM9rLZquc+twvQSQvA+khaf+vhftF+gKJF1yleb5hxtJbvOVXEWAEZ26dtWg2MEdEa
         Zw8A==
X-Gm-Message-State: AOJu0YzQRzV2LZQz5g6Z5thJaKPf1jyPqmhDURLY/m6Ew/fmN1I59w55
	44dgntzmQhQPE7xbnHAWFjNVsIn00jdSEvDHdLzymFiqAH8tIFlNoshv
X-Gm-Gg: ATEYQzwR5pIlUoQP4dBj1CQzXrAoQglR/3+ltnutvSmxVvGNuVEEUDug5dpolsK7gsq
	N+agmmPu89PrGPNEavW1BAXqG+RGcNDQx7Z7/QjJZP8eq+kdUaD2GL4Vvrb/iz/anum3+hyH0PV
	gX5T08L4Pob770VKntkgbfv4Tn5i+GZ7tZyskz1htXR+duv3KtzR42x+p+v+3oXWbvOW0bTsDrH
	i1yAxFN0iYRSCB/vTm+kxDE+hBJAfeW6GmtmlxfALGbHF365N/fc7FBxfR72ev7JhPC43d4e0Yy
	252o0J4WAZoY7DF4qx6XJowN3SghtfY3+8Z+hn1aPKeI8nZvv+eJqztVbMDKtxQjeNIyth/fv4K
	42l5pox40IJpp+PvZUgHTQuJ9Vkc0izWHNwE+cNpr+QKU0sxItnjOaseWxc+vgdwOAcHho1bN7o
	bv0p3zF6dsOJ15OrXJba3I7mC2dwy3P0XMeq9zjkz+XcNtYzff6PJrJX0Qv8Lnm9eeJc2QErU6x
	8QQ
X-Received: by 2002:a05:7300:dc91:b0:2be:2964:44c3 with SMTP id 5a478bee46e88-2c0e4fb800bmr2565155eec.10.1773888489577;
        Wed, 18 Mar 2026 19:48:09 -0700 (PDT)
Received: from Malavya.sfsu.edu ([130.212.92.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582bdasm6568258eec.19.2026.03.18.19.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:48:09 -0700 (PDT)
From: Malavya Raval <malavyaraval@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MalavyaRaval <malavyaraval@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Break long lines in rtw_sta_mgt.c
Date: Wed, 18 Mar 2026 19:48:07 -0700
Message-ID: <20260319024807.7755-1-malavyaraval@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: MalavyaRaval <malavyaraval@gmail.com>

Split long lines in rtw_sta_mgt.c to adhere to kernel coding style.

Signed-off-by: MalavyaRaval <malavyaraval@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 9d222ae87d79..40a1dc9658c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -54,7 +54,8 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	struct sta_info *psta;
 	s32 i;
 
-	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA + 4);
+	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(*pstapriv->pallocated_stainfo_buf) *
+						    NUM_STA + 4);
 
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
@@ -105,7 +106,8 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 
 inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 {
-	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) / sizeof(struct sta_info);
+	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) /
+		     sizeof(struct sta_info);
 
 	return offset;
 }
-- 
2.43.0

