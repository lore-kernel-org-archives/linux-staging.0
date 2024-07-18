Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E4746E
	for <linux-staging@lists.linux.dev>; Thu, 18 Jul 2024 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721309297; cv=none; b=N+yhmgyc/6TZA9P30Tiw+tPvTVfRghGHlWGMGZugVmrt45w+Ia5K/Cukyf0BssgiyypBaEmxDfTWEykN/MS2e8tD9854yOe7VhWv9B7LMzyewAFuQlnVpZIWwQggJAs+QtsaTU+ORy0PwdwbE8H1BFhg4O0EJ5OLQiRwgpx3+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721309297; c=relaxed/simple;
	bh=5aucrI2gpt9vqlmLA2A0OE6HiRWxeBqoxfF2vqri46U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjcYrUq22RqWMuWw3GiY6jIL2ILpksih4U0ZwxUUElMy9Z6tSX+Tb0y6/yPsUyBzjNX9C/RqBo4nQxiIE64Ahc8w1OVq0GVpV9PtoVfvpTAoLE2/pP2LxRTf421C46bAO/KhjCi10tByt3P+s9zzhjePl49jEUnzOcS1JCCCVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4cTRcxZ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4cTRcxZ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b0013cf33so558361b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Jul 2024 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721309295; x=1721914095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZKjwOorWgq38XmjoGT3ScWW3Bxix9ilNbBQnzAJcG8=;
        b=l4cTRcxZK41Bw58P9/PmsAdZhwnaw3OiUUQAcaY295T8owpbCqEy1bJs27QEvxiqXf
         sFQoYLeeEimY8bYfDIT5b1hjasWQQjEhIU6cZWDGyQtWtaqQCFmUr/Cs63qI8KQY+l3T
         ZSHuLzuKh/UHIEJi1PeA5gUbD+PTvPi+NLLq2kxxgX0ntyvGGbIl6qNXEK46YTgjx8y6
         ljIELipszN8aVID4b7KrF00RC59BDR5nLLfJXKwh2PXNutF7UF6crFwWGic1DldJgBvF
         nKkIn7j9t74+rBznFK5A8Z4xLYzPSR3PloRgEYaHm2BdQrK9mZO9sibXPatxG4CcWIuk
         /vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721309295; x=1721914095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZKjwOorWgq38XmjoGT3ScWW3Bxix9ilNbBQnzAJcG8=;
        b=q3W1bheXFaTucVxxfvoVvh6JXU/70kmNBwWH/e4lX/TW1I3POzApO0inaz0neQNRkK
         9whuk504kC2gFuRR+AiZw3nPIwA9OU6vK+rHMibL7d6uyvWZnnAwPR3BzPy57KaSYi48
         E8QbWt2sxLzPGhea/R8YNQPF0sM2sgdbUTZ6KDpD2kZ/NX2oi66TouB+RAB57FMKoeOh
         1iG/bZdwJb/ROWGV6neBkveKk8M/RcUGFcOvajIDendHAN7RBG1LjYBX/JozR1iWwqZr
         5NhMB/F4teoMGOMPu8BMrTP/j+vzShnq62ush/v7USV+qdIWpHKkckegJZopy4y8SlVF
         xm0g==
X-Forwarded-Encrypted: i=1; AJvYcCUr7/+tV+7fPGR509hnBEWkGMemr7HltGYaOLRmIki3sVhe7Tw2QoxKAkls/Om0AZXFaQ04lxM/tb0BZW+zzHsQE9Yq6fq1PTkGkgFu+w==
X-Gm-Message-State: AOJu0Yzt7RypBkR5RXfUAb9EIertZAdasmJUvCb8laQLY0IpuprfMaT5
	GXZsiNnG140WhC9PtbdF02XLqYCspyOv7AQIWv64VV90yvfSsIzF
X-Google-Smtp-Source: AGHT+IG0CYzhI14tCdBdlkn7FhEKsfVLJTPx2yQs0AsktGWN3IMQiNhvkSUynrl3Xw21RuufEn9t9w==
X-Received: by 2002:a05:6a00:1d9e:b0:70a:f65e:b143 with SMTP id d2e1a72fcca58-70ce50b5467mr4038389b3a.31.1721309295190;
        Thu, 18 Jul 2024 06:28:15 -0700 (PDT)
Received: from localhost.localdomain (7f.84.a880.ip4.static.sl-reverse.com. [128.168.132.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecb8935sm9992292b3a.183.2024.07.18.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:28:13 -0700 (PDT)
From: Moon Yeounsu <yyyynoom@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Moon Yeounsu <yyyynoom@gmail.com>
Subject: [PATCH v2] staging: rtl8712: style fix multiple line dereference
Date: Thu, 18 Jul 2024 09:26:07 -0400
Message-ID: <20240718132607.13634-1-yyyynoom@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <3a7af5ee-faec-43b0-9617-71fe37f22936@suswa.mountain>
References: <3a7af5ee-faec-43b0-9617-71fe37f22936@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It fix the following checkpatch.pl warning:
Avoid multiple line dereference - prefer %s

Signed-off-by: Moon Yeounsu <yyyynoom@gmail.com>
---
v2: Fix email address and checkpatch.pl warning
---
 drivers/staging/rtl8712/rtl871x_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index c8a220e04776..ffeb91dd28c4 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -528,7 +528,9 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);
+		memcpy(&psetstakey_para->key,
+		       &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey,
+		       16);
 	r8712_enqueue_cmd(pcmdpriv, ph2c);
 }
 
-- 
2.43.5

