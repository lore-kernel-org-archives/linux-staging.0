Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65E3A640C
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857710; cv=none; b=LS4G8kme6hv5ElO+e6g9QorudhxWSuR8KjGdbMqVzRX6RhwVv7HcWsavaY12IfqN3/ABpNVSYlvUaqkSpBfnbLdUXi1T+huES/TGJ8W+vRkeKv6aNZUGSjrYu7Yx4m5LE6Pp9Phc7XZ/BnSSvKD+MuJyqjcm4eUCBA7Ah5B5V80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857710; c=relaxed/simple;
	bh=DTEGmz4BX/wALdmLpF+G1NKVsyV8dXEGvJGfJPbVix4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIU1BI85CYr7pzgJ4TJfieZl/h2h1qy+bl9jg2qUS81+oWjXCxeop8uGxjGmy28fDPSt/TK5yuGWdFtkTkZnktAdeHKIm7t8FLjVVVIlfQDrlrNOclZqE/szj9oT04AAz7RjYPd6WtFYLKHsxrDP8KhjU5PYUgV/BjKkhVPu9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB1nL+8y; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB1nL+8y"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9cbf0719so16459811fa.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857707; x=1784462507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTT35MmNa0dy11O7UDCHIeYzW/F4/jUWHxbyQtcgeSE=;
        b=UB1nL+8yvEu5d+jvlNpZtaiK8tOsPSCknb9F1RLSZVwbaHv6kGjgh6zemIL6TWbzH/
         Io+o2xOfxXq7IUu5rcR8O0rN/C88XAPKDHzJ2b+mpsVxIeVRShNO779/oIxF31QZ43Mx
         yUwTReMl24Aod1od+5fufDI82JprYv+D1krYfxo4syRjWCbDn8hZDtRCJAzKSO8Efc2u
         /Vri4ymriLpOFdTwA+oOazxp6jSNJcHy2MqCZWZb9UnASeRjnMf21tMASVq14xqE9pew
         RB0Ppd0m7AU+FQJ1wJvomZbFaPTWR5Ff3xPtGm6N9bZazjTNj2YCbVQbCB1oAhUCop6C
         ITpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857707; x=1784462507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTT35MmNa0dy11O7UDCHIeYzW/F4/jUWHxbyQtcgeSE=;
        b=jL9/qD1QxubEBFtlFh5W4KoJG7VMxTIqqZn9jdQ68AiM0+e7HpItqBUSyXOZ7xqv1K
         KwDrDM2JkQ+NLSgmhBtOF2hICQ722LlzUN6yruRO2qlYKqRgmAC/A2CQEtnNYxxEpv0j
         nZb1QR8+Jvfue146Z4erYy2v0nDXlgozNKsGxJQ5ZzQaRp7Y5BEIJBV+pxQ7VhTcn6RS
         y7kkMHoJ9KSWsC6NaW6msdXEGY9sUg+2Df/D/fbwGTQ/FcLS3NHofQIxUuh8YBd1MvCd
         avl4NAVt8MtpkkLtYERwdWzOt7ky2oas8wiDidwzM56dnDRuoJecW8IISLAVnDkTM1b8
         0a2w==
X-Forwarded-Encrypted: i=1; AHgh+RqVlPv+Tytf9q0XgIacib1AuzewvSzxnQwebWSc1z0Q3bpypywrpaMGj045as9hv6IkyDKVrHA1v/MPjfE3@lists.linux.dev
X-Gm-Message-State: AOJu0YxhJeK2ZHor8Sz3fktu+sfH8zsKQ6q2u00hMA4X38T25giuC4u9
	vHtehBllHDBdKIp9tERltcDKhAWvcBytlI3LLqX4V9NRjQz6HF034HvU
X-Gm-Gg: AfdE7cl/8LG+7AxeXMTPxctZ+0gUajCfvj9Z5S4PeexG1lEhxTEceOdZbAw1X8yegcK
	jAg3WYL0w0ovUyLOM/9P01LUhF4wPqsjJdZQ2ov1CcRk21UKNL+Bff/iSavcgEVgJOGii1cusS/
	nx9pdtOLN4ur/fZCtnLcB4LVP2nFiQGBGYZNkzZSzGGJxjYaYLrNpulIrdkVp8fJ1f6wPLj9/ox
	lezGkC1YA3vG7R17uBtZtcU0Ami6T6lIcQUjHNEbSQ8Gnqma0IDV/bpd5VPtNa0IyscBkvvQOLn
	I40y0WvHYUIKecHUTtiKyNq/D6p0s/g52o9JAjKB4IMypwsIWdvDgwE4+hYT2UD/z90Vj7HSBEg
	Kzk1mg5Umo4J12DP5RAfB/v85d8XDABISL5wJHoORvKHRWc2RWq716YgOmvZzZwIPEWkKG3DB
X-Received: by 2002:a2e:ad92:0:b0:39c:a06f:12ba with SMTP id 38308e7fff4ca-39caa8b50dbmr11042011fa.40.1783857706696;
        Sun, 12 Jul 2026 05:01:46 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:45 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v3 1/2] staging: media: atomisp: remove unnecessary return statement
Date: Sun, 12 Jul 2026 15:59:24 +0400
Message-ID: <20260712115925.79047-2-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712115925.79047-1-erqeon@gmail.com>
References: <20260712115925.79047-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary return statement at the end of the void function.
This cleans up the code and aligns it with the kernel coding style.

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..81d0afae8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.53.0

