Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F02BEFFF
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778039815; cv=none; b=jUyGT2UCMsOTjxmn5Ti9yE8hRDCdlNBpkCV/CUhYESNaLMZhd6H8Rp7rzl3XHOiC6YlvDORhjQfTNRMm2mPC/ea95a9khwsJWPji3YElXuVqtFOGLT/vVtDgakQzsFmkOt1sAjk1YXR47aYBrGcxN9ICz06pySgUrsaeO6OzjAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778039815; c=relaxed/simple;
	bh=6ko7eVhNJ/bCYiS5Qrb2pV2MACE7rarZZC/4lEmFKL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7Ymid2QRqhf5A3jYfqBzyRVV1E/BJXNcEVDZHxfmYhsZxDMzOdtko9nfOH+sFgmL9/QrV5+Vk4HsN1877x6zro3YrDVFTz1kubAloOD6VJsDB4lBbZoLX3KUGCIOYXzSZm6oDYRfVq+rCR9ETWrmOED+lgIUupCj3POHrxDKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmKJUL4n; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmKJUL4n"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso1160463a12.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 20:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778039814; x=1778644614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htI6+XoNqJlwt1fmMa555xnswcXaknwDFHq/WqS1Sf0=;
        b=XmKJUL4naAcg+q8+wV9FqfhKOyQ/Hi2FrqhmgLZVO841LaoahDmZR0edMvp8cpAXxE
         /YZ6/wpqq4/vECl9hCd+Ors1x3nXryLQ61v8DDHIhWS7U6pHgO+npgqUa4V/PuJZhkgJ
         +QoMr3fP4XtWlpzvUCDUJWBnoxoXYjvP8tcIRwqkLuhhEYymT8p1PH/ArfY4r2bkGNKD
         ypRBJHtA+UbNddH8Pgq1gwFO2NN/TRN1YX5HLwDIJlAi6Ba5vfLZzrxFYAqzW9yDqcAJ
         1zq+Z7ETLggl1dRVGI21CGTbK9QNf2HbMAJ0WPyLni7LeZSCjcsyxUcmbBFpZ50SUAQk
         cDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778039814; x=1778644614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htI6+XoNqJlwt1fmMa555xnswcXaknwDFHq/WqS1Sf0=;
        b=g9Q3Kp4GX7jWqhC+eTNa4lzADd6cFT8G5TnI4tB7UfsOK1lqqXA8n30pFIO5nP2Vk2
         /XYscD0o02GvgaIla0yJ9Ahgk1ZqzR5Yjogs9D8kNPHTQDXci0v0lzh6aCkOVQSAvbtv
         YMWQq2h6KvTkJ+7lkyZsAC+DeBeno5Z3nJUR38rB2OhvP+HEWh/7MwP0wM2Kg7W8CO8s
         zSUtwvw0ClhNvkpQqXVRcnPIny2rhS+HnE3U4i9gN7HQvymVAe0y8+Uclk1amFZgZFai
         CMAoSSL7gFZ8GXFga15nDQod7Y5Mv1JFsCqS8iMrAXpMm+LUujnlhUo+GrOgRbx4yTzP
         pO5g==
X-Forwarded-Encrypted: i=1; AFNElJ8PL0vWkeb4cEe89wGuO3X25kHPpqeftPjXb9lG+d3esHXL8Lj44w9QgypQAIJ0qvzP2s2XHCrdYPlWXgFn@lists.linux.dev
X-Gm-Message-State: AOJu0YxDYRdgstdBb4ua8AsAHOcPGrPjj9DZf8ge+cPxZ6dW8PSkrIhi
	Y7NEcG03vrjpTVsBALh0FfaUcB7S0Lreguux+go+fvQrG9NkgHABetWl
X-Gm-Gg: AeBDiesYsYsD8BKJ5cgfFARSHZiX11joCGbO4igCs4GRmB0YKNro+j5Z3m96DAWBSMV
	WCOqmGiDdNFl8V41wC2ZEy83t0n7dPf88zGLGO9d35DmvPrFOItD9RgUZ7vtK4mRmkCsLDJwfru
	YkfvPQv8RK/T3sQ4yNXay0MLfgAy5fiNT5PNwujUs3T8uuHa/cmqxa9Bzrc7ITNYefkCcoaby7L
	GtIvMWGUa13A3Viod9b0vpXVF0O5i7KlSrvcHH2un1/OEOJfutBj6GHY5IkOYB2WC8PBOF26/jw
	FJlSeNHl8DAdOdyCaUOqm5wYTFiLuh4JRrdRIHJID8d4inCnR422ab1teei1imr1LmgxjRDq6AZ
	MQnDZhGueQyz1vug62PoXEtomevRD+TEbxOOZrlMedWKrwYSA7TOsS4JI3rwKPnL0AlPz041GDG
	4ojwY5nLLztSBeOylkJJfOI6ZgMJscNQyhhjl5DCvVrtjjUyirgq26RDrav9gJ74RyLrRL0FRih
	kolwpUU2Is=
X-Received: by 2002:a05:6a21:6d88:b0:39b:e710:e2e2 with SMTP id adf61e73a8af0-3aa5ac1ae28mr1619760637.46.1778039813617;
        Tue, 05 May 2026 20:56:53 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ab50bdsm698939a12.7.2026.05.05.20.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:56:53 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH] staging: sm750fb: add const to g_fbmode array
Date: Wed,  6 May 2026 09:26:41 +0530
Message-ID: <20260506035641.5060-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch warning by changing the `g_fbmode` array of
pointers to be `static const char * const`. This ensures that both
the strings and the array of pointers are placed in read-only memory,
preventing unintended modifications and improving security.

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dec1f6b88a7d..08d4979c6755 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.43.0

