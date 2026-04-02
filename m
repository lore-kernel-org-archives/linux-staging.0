Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33E37AA72
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108570; cv=none; b=BVfCamYGPqsdV98J62yUuT1g4y3Djt6VEOzojTEYSsJa541tFxu8ClZfMVcG3Du/8QG9xdhqz985bLm/oDtakrDR/SHhTB8zgltLaq+FvswyIhXUop2WOgvedj0kMt0fpmb+kNVes5VLo/koeuvA6mchbEqm4S1T5yu+HrzQfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108570; c=relaxed/simple;
	bh=tH/8bSu0J9nyjvXQwIdtTStFQipmPYEkE9R/iRlRSKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5vfxIDAE0JJt6vFZkqNruc76zJECOHrFpahUNuOb6OIluztskdJq+JEKJAg6dkd8TKZOm40Au01pFobkxcW+BlarxCIbgfmSGztTEHVdzOaLwActll4mjoXn40ByYuPNFOi5d9AG3dDMZMM+lb4p+OoH75rAtyKaZQ7Lth8D7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKA1SbXA; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKA1SbXA"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38ad12fb595so15328251fa.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108567; x=1775713367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhs09oh8PMIkbUTuCCfFbFmNLwRYUaey8El1U4Y/zb0=;
        b=RKA1SbXAIy8Bvaum9+OZDzHdKjOH+g/6z8K/oSArVvYNcfjKtOiLPOq4k6EaOPmuKI
         8VWUvIOO86eSOhMa8TBj8LJmdrFYuxNnskn1CQYpSjW/TX45aR/y2jmwL3VVz0SzuMYJ
         Mv7cs3h9x74HrgwiHJuro+VCM+qDniAaraFqiBl8CRjcHCh/eA/y4X36Na9dfvUwwHHN
         QKQsSROcS2oszTRmXlqjzHq41jx/nS3nlfIrYS//AnIX5bNyPYq3b9D/nO8CLqiQ0z91
         3d0OQjaBLm22Mn5BfjHCqZ6RyLTrvvpmYTGrOna1eDKf4TUtRMXAbh2oKu9B85SKKesg
         Ap3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108567; x=1775713367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nhs09oh8PMIkbUTuCCfFbFmNLwRYUaey8El1U4Y/zb0=;
        b=jPJ6Rp46esB2RZk+lj4t9cYQA2l4MfmC2evItHbTv1ZPO1/hC4y4Uc5xS1A+p28Z9a
         hx0LG5p1MdhvBiYrOoAxUZk+/MMdWF77Vq/6gMTYMYmodPnRhadCFLs+WWY5Oe4DWxtM
         kIM/xsWmXb+O6ZHCahKbjKYSvMMQ3orIXQD0c6miHXlQxaYQN0w7zQg3l8IyAo1kltkJ
         ymmV7J2hF9QN15SKrPGg3gfSeh2LGYC/ycFiJqiI4RS28RvyQ2YtPF9erheHGQH3Fglv
         FYhDRq1MD4JGYmX2MYvTF49/AGkbzxdongX3SQby6LMpyX4UdLCJCFl8y3xf6tn4Vyzz
         QNQw==
X-Gm-Message-State: AOJu0YyD0fsBWv+aNyzg9CpVM8Mz+q6GQHGsNTiZ+i1sV39Aky9JF6zz
	5e2ihUceZ8nfgmSt1GKX3KLcyM1BON/t4V5f1xC7JoIJ+QfMPSu2V44g
X-Gm-Gg: ATEYQzw7/AAUMDUW8TDqeLf8ZjvbMPHMEguU2AeE9oSz3gbodBp7/qzwNuEgG/0rWoa
	6r5y7lMl9QgBEauli/HMlGsumm1Ch+AVdc/RG0BUPFikj5PcBbVRbN8e1nrzFLL7OTtndqIptvw
	329G7xg+dDh5q5xEe1TWKdvt+RKoUOjw1SPrgHG73I3zDmZ0APiKVpgGFMZgEL3IPuIIlPugnlz
	lpnM5C21ru8Mjd7LbNvBinFAqwCqVmvwGnm9fko653QpIbaTK7DnwyObhHUoZTYxOyL7e91cO0l
	+pMMsIO4EK8ocxlzLNeltpFovrojbCEAnbF3WWgo07fMntRDCX9qSLdXU6iIGRRS0CmEa+LV4xf
	x34LObqDimGLQzfACbug07OISZAgpc51U0+iNA13AJYNTfJyXl3+zfCEG03epQJtzoQzIvZqG2P
	HdmKcin8A2ujnmF6LGMgppY4lJeNbYPkFC9j6f+sY=
X-Received: by 2002:a05:6512:68d:b0:5a2:c0b8:270 with SMTP id 2adb3069b0e04-5a2c8d9c017mr387150e87.22.1775108566902;
        Wed, 01 Apr 2026 22:42:46 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc96fsm441165e87.59.2026.04.01.22.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:46 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 7/7] staging: rtl8723bs: remove space before tab
Date: Thu,  2 Apr 2026 07:42:15 +0200
Message-ID: <20260402054215.271981-8-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402054215.271981-1-linus.probert@gmail.com>
References: <20260402054215.271981-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a space before tab according to kernel code style.
Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v5: No change

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 4e8980d86965..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -31,7 +31,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
-- 
2.53.0

