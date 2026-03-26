Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B493B7B8C
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513121; cv=none; b=Z2kRwMPPg5XvOIX8fjCP8sXG4jhaSuJHNgahQJMblJAVQu79BJQ6CdGyvkKNu/RfrvB1gvXbpd2DdMeOVpH54WFFPsPApJlY2ZJ7OJLg7/44AgzwfYLcUJj/qeVc8sRSEW/kYyHU7pwTHsXAsLA0YZp5uXgg+NRuEUKUGwMyPLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513121; c=relaxed/simple;
	bh=UoObvnnZRPgdvTgqoymjmAp+D17szqmEHwzVj+aDlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQedEJfadn4tJG61BwaN/pjOceJu5R6y1uCQyS+tcu0e3G5T20c0I8x2cbR2gnW9wEqC1QFwKry2HdUtUKIVm8mx2BgUs3SVT7mZKlq/6mIUDiUgC2QFglu3UIYJPe5mEOUEu/rS68f7Itu51fxB+HmJrJ+hw5hyy7SvsRx0Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfEI/kgD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfEI/kgD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so534027f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513118; x=1775117918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=pfEI/kgDqYe6Rn2sWujH1SOuiVSK/5JJdrez4g973qxVzGCwjIliI80i5yH5BeIL4s
         zYHTZ2HXfj78rzDu7KV/7Em1HU4dDzjnVvkEXDY8D2YVn3ysBHbqhc0KUxXfIJ7DOG/b
         yiEHr+Tlo6Qw3nGoJyXIiCxMQQ6dyqSqvzExvHh3+qJknJ0TxjvOeR2BEm3NjiggiAy2
         x46+IlbXaxnJsUAAJ2l5LFQgmgm/9hr6dLg2zwYeLXeICujB4XX8KPXTOs4tmpRv9wbn
         Sts34QA9x58vcOyTE3SYEfblYGbuwj6rmbfK2HCjfKGUSdOsB1kJ+TITkQfnE9m8Pd+5
         gIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513118; x=1775117918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=oPga8BBIrjwwARw3a8fj4t3UWz0yIi2Pag5Kk1TfLyNsRxgki61KlAgXZeiGIlMQkh
         pNAzuvNsd+pn5xi9FiVsF7r/sEnnVdE0jpDUWyfn0JznsRLvAgrn6qSIfVoYe86DrayU
         i7QqiJuCWNZaJ4XUkcNYpbxcDEfjyl5EZ8YNuhcjYenoZMDooh0VgpFkUm17BZ8P4uXX
         h5K2IPNkU6pCuqNiKNZizz/Nz+KlyU03LvJdeo+DN1XVmEJKPwdmDMruPUWd1tdTxCwu
         3Dz8V9W+rt/MnCOiKpkvQGkasi0Gcyh/2eFRYoA3AHqwiVqFq6M9EWkL7rI7Y15mzHuH
         5zDQ==
X-Gm-Message-State: AOJu0YzqjX6XTz92CeK9P2FTAe1E0bi1uhMIljtKwPLKZZ62Xn2Zm75J
	AGWoJklYgg+F2RsNeiRyVWe6x2C0yrfGJPPAWelGRl9s7uwLGqBelNxRm0b72ttu
X-Gm-Gg: ATEYQzzJncnhtpjryfU/Dn4LjEJjbUkmlmwz9EtjY4id+OTmFXhdPqvM0hJNoBKRRs4
	Hukwe5MthJSkAscLVIIcIu26GqawKMTncfnIc//Dt86CBt3Urln5uanhh5JqIa1GUBBkk+2krVm
	zCMisr1ApijXCtBP36rGjNeFQGjEJHLoSzDI+3KMI3wZySCeeIKHbi4Irgfa1XZN3KAGfrrhFzk
	4AbiHEVj34/Bxccjy47zqZBQwNMeRH6nhRP3yUoL5GHWEZd95S53EmdGXU9I9oL+HSlnYzBMKPf
	y/GzT42MxUUPaU7IgsVcuqNg26f2VB2sIRbd5IWgIYJEWE6J788kmjiZlo/4306V5+TQOen2f8v
	N5tBByKH+g2lDCLY2pbQEecQeatelESSURS1aLGLVBrvIim5N5UAux8MOY1UFGE8c/iiUM7olJd
	6GDooUIRKok+snOHeZv+oKGKA=
X-Received: by 2002:a05:6000:40c7:b0:43b:4e13:221f with SMTP id ffacd0b85a97d-43b88a0ce95mr9170200f8f.47.1774513118252;
        Thu, 26 Mar 2026 01:18:38 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm6130521f8f.17.2026.03.26.01.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:18:37 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 2/4] staging: rtl8723bs: cleanup return in sdio_init()
Date: Thu, 26 Mar 2026 09:18:26 +0100
Message-ID: <20260326081828.6314-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081828.6314-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081828.6314-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_init() return errno from sdio_enable_func or
sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
macros.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 358eac0837cf..01b5d8a70072 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 release:
 	sdio_release_host(func);
 
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
+	return err;
 }
 
 static void sdio_deinit(struct dvobj_priv *dvobj)
-- 
2.51.0

