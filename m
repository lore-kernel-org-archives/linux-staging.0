Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59618BB86
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113884; cv=none; b=u3+jfHkidphb51wX4igeuaC+bAuu9mzjnpZVW8krG3e3NypypyhnX6V5hGZSC96HXolrD0F6ODvWiE1OsheCy1jNo5oaC7Ut6qGAzjALDk6xjhrAsOKfbKkHB5YwOVYi3jz3XkF95kB/5AeH74ZwRhjpKerXlwB5UkncRWUs5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113884; c=relaxed/simple;
	bh=eVYB9XOWnNSbAdkz5YFJjpA5UMlyIMpazV/+I3O7IVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ow1KjnahgXf6GKowplhrEy2Vm47g4gucCzZenXTkjEzDzJwW/g98IVH4cJ7tsOYH08lExWlJdpawSoyf64LLSeK6nhjWmzh2JUVLagtjaQFy3zeiN6u+uzKQ7VwYXHmBqi0064cbqbz6QvgV/ApNImpiu7+71kC5NJ0lHxX5oVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbPwN2is; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbPwN2is"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7c691c8f8dcso374941a12.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113883; x=1726718683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVYB9XOWnNSbAdkz5YFJjpA5UMlyIMpazV/+I3O7IVs=;
        b=hbPwN2isdBZZc+w/giMOf09iNhS8qSpWVnpsfHcGDU9vEUWbNpSCUt0ua/qnaTeEb+
         4FEfdLv9HOrkTbWb8j7gMwhNz9+67Ftg3dOmNSeJxatodzUHC9Th5dFKChBld0D6XZ0+
         qTuZ3yHtwuHqrBUDCQxAXK5kf6550XrLuatkmFqmHHiqGyl3U3m+r/FOzHVsOqkltsZk
         x6O3NBP7LGQtPtUUribFmC4yJYvirTB/cwuz3X5G/0/F3LdQqvyIP6TNWKLljPE0+6PL
         BtdciRvvXRcjl/FjnJuE28LwrY7eIb9Cn3iD5FEqMRzsmZfDY5lcW7xBvo1BYeDpe8Sw
         sSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113883; x=1726718683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVYB9XOWnNSbAdkz5YFJjpA5UMlyIMpazV/+I3O7IVs=;
        b=LLvacQOXhGmDZU6PDsNhuoqkBJS2YM2qmzIOkbUcBJwmaQaO5RAv75/+2IjusC3i85
         W5au+e/YyCS+QCAjG9daijw3qBnysSQovipdx1wp6VOvBeDIhhd37vEh2bOMKypKEneT
         pVm0YFANGssFw41tkup6as957wsBvKOq1T6mn9eXNrHrBAxRxoeYhFgFsCumaruOGeA0
         4HgKFYjkJzCPsVcjuUBpcsKGgzsU1EfYtlqLqWizBFWqXjpH4ESFhllF/arqoguMould
         8nCoHRdWuL4T+0x+cTv15+g+m2tl9cdoN/0MiOrLuso2U9QnTf0SvLzQZj4Ss8vOV2I/
         E5Qg==
X-Gm-Message-State: AOJu0Yzh2ge2crupxmLO+DzAz5XPT7/jEKlsJxMSHGlZ/SzrIJjiaf3o
	WLKU4gx2H1RLhSdGFx/IY7Py+l5UpzQK/NpcaxOn2pTHOR/exKSWWhriUXCknbc=
X-Google-Smtp-Source: AGHT+IF/vNoo9iD5Ewq0ziB2Rfx6e5KqaWAS94HQZAeLYOblZT1QjfyIFhZ2VYUaXJP8jczaYEJpYg==
X-Received: by 2002:a05:6a21:164e:b0:1cf:4dc3:a89e with SMTP id adf61e73a8af0-1cf75c7e8a6mr1883766637.9.1726113882629;
        Wed, 11 Sep 2024 21:04:42 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:42 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 7/8] staging: rtl8723bs: include: Fix trailing */ position in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:08 +0530
Message-Id: <20240912040409.3315067-8-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change enhances readability and conforms to the standard commenting
style in the kernel.

Reported by `checkpatch.pl`:
WARNING: trailing `*/` should be on a separate line.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 6124f2ea2431..09ed298782a6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -240,7 +240,8 @@ struct mic_data {
 /* ===== start - public domain SHA256 implementation ===== */

 /* This is based on SHA256 implementation in LibTomCrypt that was released into
- * public domain by Tom St Denis. */
+ * public domain by Tom St Denis.
+ */

 int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac);
 void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key);
--
2.39.2

