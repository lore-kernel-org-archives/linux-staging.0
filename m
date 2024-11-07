Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A40D1DBB0D
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731015538; cv=none; b=BxkjynwOy8PqF4pg47+rlNgvLilz9GI7eBuwYSwqUya1ZMLC5QcCyhb8SRxyRCUlf6Dd6iCREaLeoHBShYY/1aQ+FnotrapcYaqDguXUNvv/WWPs2rvAZt5eMzcXGiWSwq4ww1qXlHICYkmFA3/deF0RGjwV9V5DhHhqUnQioKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731015538; c=relaxed/simple;
	bh=nvfpowuQR9GkDF62EOjFvmkjqhi+8SRsaAUYIJIYPUI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=pf6BoE/FRPmaAavFz7D3V/zqlZVWQbqijKmWYNMYMLTJzObqz6EcI2LIJHS7akIz2AJsE7JbD2MByM8alNGeq9jUn6K/ZjalDZnTHc3ZKTZrW9R+u85NdjOHI/KcTkxAJegX8mvcel0F4Qy+v1V0YAfxJLtcFDN7Cj6hKoWumsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgPeCB/p; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgPeCB/p"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso4444215a12.0
        for <linux-staging@lists.linux.dev>; Thu, 07 Nov 2024 13:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731015535; x=1731620335; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/PXz3VkkWyN+2D2oow1fRGOsXfzv5vjwk8qUZgMvfo=;
        b=bgPeCB/pRIPwjbtGGIXsr43klnA1KPdUP8Y+niZMCoMNghQExoMbPnYy1crPO4hUP1
         7dardDDtFOiP103DjWiIirIZX19UNYvZqxZeoTHTEUSflpMTCO3XhpmgLPS4nkSIv2Dt
         BJ58po+96qM8ov/75h4of23z7FWQcVTWC/BtH7SrDlBrAXwdUfuirjQh05LqCAFc3z96
         A1sW4cdBMVlk/PTABNXabTllsjonwNK+RaaQIxtjJi0hQ+TfR4LWsmPqaIPGHtPKMu8T
         YtrqnGDHY7DPtJxTmzrGkogvfRsiko/GnGwFyCpJ+9+4ZchdMKacfcYHJftzNYwP7hme
         eVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015535; x=1731620335;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/PXz3VkkWyN+2D2oow1fRGOsXfzv5vjwk8qUZgMvfo=;
        b=a/X7gLcyrEMrz8at+knLOvXYKka+MYh/iXz/NWbVR7myxyoQIkq/PvKSS8jAX0brKd
         xLHKWFHXYicK6uSbxOBOGGLBiCcpB6FpVej/fJcfvVg2hb5DkurSLXMbkfFfTsv0KAm3
         10EOND4TvvYNUD8FTUBo4O9R8ph07/4arH/OjRUW8Aq0RzAe6qkH0V1l21Wk4OflcmHe
         UXCASLYhgiy/U+Q2YU2xsAuPpl+bp36/msHR+8q26n6vfcu3sFSe9X4tusHvWz8rWg0G
         tWZOtz86zjsu+5BXzIfOU5NGfWa0z/fyt+0vwnJQXiePJWAfmQkkkJ/9yynEiuQahvu6
         idVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqFTkEDYPj9n/ix5MMX8w0FKzhazIsKWoupwJrhNvekZ5SO9ELfNb7yO+XbQQK1fYtvzVIJW0P+7uLoor9@lists.linux.dev
X-Gm-Message-State: AOJu0YyR9DwlzsbgFK9XAvlDrEM8wdXG/4UCb6zKCJwTAps6xHj5TIPq
	b7LBgxYs2Vb7r8Dbnurwrf5A5cl+ecY5yfMTDx/wRz7fN4WLW5WI
X-Google-Smtp-Source: AGHT+IGrTcEMUOmBG45zZLNEkrmXgDUovpg3LtqbZ0hMpIXyz69P4bY+5b8Ffu15E8z2Ufn44L0JuQ==
X-Received: by 2002:a17:906:f598:b0:a9e:b174:9cf7 with SMTP id a640c23a62f3a-a9eefeb4df1mr31857966b.13.1731015534837;
        Thu, 07 Nov 2024 13:38:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:e0:9868:f700:985c:6c07:e7e5:186a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deebabsm144917366b.153.2024.11.07.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:38:54 -0800 (PST)
From: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
Subject: [PATCH v2] Staging: gpib: gpib_os.c - Remove unnecessary OOM message
Date: Fri,  8 Nov 2024 00:38:12 +0300
Message-Id: <20241107213813.19185-1-m.omerfarukbulut@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It duplicate the MM subsystem generic OOM message. This patch fixes
the following checkpatch warning.

     WARNING: Possible unnecessary 'out of memory' message

Signed-off-by: Omer Faruk BULUT <m.omerfarukbulut@gmail.com>
---
v2:
	Changelog text  wrapped at 72 character
        Unrelated changelog text removed
        Trailing spaces removed
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 27654b2180a5..7d5244113f1b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2093,7 +2093,7 @@ void gpib_register_driver(gpib_interface_t *interface, struct module *provider_m
 	struct gpib_interface_list_struct *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (!entry) 
+	if (!entry)
 		return;
 	
 	entry->interface = interface;
-- 
2.17.1

