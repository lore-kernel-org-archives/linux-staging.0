Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C63C73F3
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389906; cv=none; b=RUeRU+4V9nIipung8lt5PImTNaRvGC7wkDY+pNSbu4bt6PK+Uj/TbA6puAEKtSp0kLXkEnLddwr1kyGolGbXAJE5CoM+GoHKqjHkBrWIVrmGABVjTW3klFv6oX/5uaSWGSnXqPqQjf8NWuolyZK/Tj34Ig4H2raPXNbNck/McK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389906; c=relaxed/simple;
	bh=UoObvnnZRPgdvTgqoymjmAp+D17szqmEHwzVj+aDlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le2V4OMPzjiB0oPcslPmG10bLf8pT5144Wc4G265aFLmMGweQdg6MBVmZ12NDewLSP+mggAEObO1jSRe9EpPrLZcUYl7R8zbZ9vSZ/0vNhfbP3rrXuW41qqwYPLD4AqbywGYjOhFVtFQP9ipZWNKi6dcpRec27WWYMMBA5VFR8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ3gMU1A; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ3gMU1A"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfc1aced74so675449685a.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389905; x=1774994705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=kJ3gMU1AmgwW4lpvccHXAhfYG6BzRDC+Zg4ON7WkUj17/tr6XPVYzyRVgdV7gQyzm2
         9oP8/tnDZmHHdo+qkQqhbLHGV+a1kjuchRChoi5IqeD+PqDkND3JZBtRKWm0TU0rWlT2
         uzPW/blMGvoDLIpJFsAffnyUaWtz4wyxmxfT4KsKyTc3Y47AQpXnklRRhAKjU9rY/w6n
         wGRjjRu+E0SUkXWjjuG+xBUmE/1fBG+pVtv/HzVrWuMaArOcHqjOY4qnvkb5hkjjvC3I
         g7y5frHjnu5HvhFTyZqvx8/GEgcLshoHe5Y4tp1RCxjKWEx+GwSrUrR9V/dxc7aWYh/m
         75bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389905; x=1774994705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=evg76R7wg98WmAInleX6XBsnt/Jls9hGDr19RE/LF1zgTFM/4yX6Rux1iifYgf4PYh
         9QcwlyNgZcmEdj4KApKULUAzJ22mMnyZ+aRHgMOpr4NFCUKBsAwss0l5+2Bj9O3agc4n
         86SPUi4gqgGVR4QX17CTHAMOnLKX3NO2smFBCFWg7UkcI6a/Za2MPPx1s79KO/EOcVsl
         ufyr+sOdz1LaoRUSEPSJa/myEeZKPsPCIwvqQHN1qJdYjw8RjbwmjadLOvj50oYDqB90
         MKmZLaOMxwmCx6J8SHi77HOMd2ruL7mMfI0amrgnrg8PftwWycVeydcc8cxOuAd3B2jn
         DWzg==
X-Gm-Message-State: AOJu0YywRrs0OWTAKSR6enlhzMtYh6eYFESqrhhx+WgOevPEpCjbd1wt
	VKTuqSHnGYyAqYmQyZbjJPE4SKFlvaNO+fow6vr+N75uuyqrkrFX7MiD
X-Gm-Gg: ATEYQzyAC59lmsM4tIw2X4Zwdpr9LRfmfa1yK8N4KFqm1AWZuGJZPjWjRQbY8/EbyHF
	JUA+9drR1xkPNccUMIc4dH5aqXMC2/zgcDvWC0Ko/FdDV4OTH9rUVxKX+Jem9n/KCLctx8z+YU9
	9AbH73Jt0rDVN89WRQgAsyHY1tFBhzgz2m1SB/uhzuM9pDxdT5frJHM3JGsNNnrvmdIY7xcVOVz
	1oRZgYtXZn6LohLUT7mPL7rY/z2hLJNi87VDbpfRV8jdIr8VIJE4KruGNE3Wxrw4cLFHpJDyn3j
	CHvKx4hH6YynRCnitWxYKMyoM0vF/3DhSdGGtgH0CG1OzLl/JPIZReDDAsVXKnRfKc6P4qJfPO8
	ZCUhW3XThCCOsYseoPdt9+oNnblGcziubsKQike9mgVde1aMZShubEOUQxbOklQyKHPQBy6gsCo
	20kwhdv+Zhbp+0g6j0TWPmOqA=
X-Received: by 2002:a05:6214:dc5:b0:89a:1536:2528 with SMTP id 6a1803df08f44-89cc4a421dbmr23417256d6.26.1774389904494;
        Tue, 24 Mar 2026 15:05:04 -0700 (PDT)
Received: from potato ([31.176.161.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm127590976d6.39.2026.03.24.15.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:05:04 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: cleanup return in sdio_init()
Date: Tue, 24 Mar 2026 23:04:53 +0100
Message-ID: <20260324220453.47406-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
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

