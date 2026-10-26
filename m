Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989962;
	b=02INFaiE9+EZD2UE7v3arXOXiTnX/5b+FyBICx1BZMDnvlb9k/7TFUNwAPqamK4YhIZm
	 Y+xKPPBLUUuQdXvPTkGVBPg/po9MPb+vzdN9JZ6SoLJpBRx49yleUQ9P4ayUKEQA2BVnO
	 vH87KovdWIp1FWbexAVHJeGQmuMm/m0rD+HT58G1nInPiSKAi/wR96K41qRCoKpAQ27yK
	 YkuuNXGfyTb2i5ZBm1DkAb08ijFKDAhAZxhg03pXGWt8PuqI4ZdxJIqS0mobavkP4acIy
	 lu0LgI+xT4SzbHlsvN4u8gjcBjuaVMzuiR9U0p22R1SW1aTMTvJStMObblAciRU5tOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
	b=KgpqIINNZ4mXfGV9r6cibl9zBVdfLuwiDIwnn2g9ty11iA4XgG2P5SHDfqRAzuJOYwjI
	 7lUdfcOz8I0Qg5+M3nJoU0cp8pIU27SLSDQqTyLHLD2/4G/LBHbM7t0DeSNgk0OZWgf6v
	 eFZiLZyk1XI72VBS472jDjDMLxnit0C1Z5FLOTZbxWehog0k95vJLEf6FIGHHdslHoh0m
	 /fOuBFFplRqVC+9xCSEpXFZafMNRPst2aoUmlZgQNkJifaC+gz0e6voZMkisAaXme1J2e
	 JT9VpD+92+qD2oeW4Rtz/zvq60zaKy61BY4OmG/dBADgMRVKzi15UMY6orSoiN09QNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Guyj0P7i;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA9B606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 04:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Guyj0P7i
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso7725398eec.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 21:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792989961; x=1793594761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
        b=Guyj0P7i64BddrudHi9dJuUWXdgUK/x5ZBf60udJ8mDnEtBjJkwJib3BjMk3Co9Qrv
         Zef6vIYcdosM2N0qkPNPYucPyn56aLMMXQ71MNcUyXGjCr3ML2uKsaXsikz0IesVEuN7
         p2qcXQ/MYmPUnoWW97H5SdR62XTTeOMZShFUp12xX/OdSl8yHqkX5AYJ7k+ucJPpkxo6
         1HEc1iKBVvvidWwzgoIVcyb0A66wbInBDiexo2wJz4n2rLPpW2UPYSuRRI6hgIRO+nQ+
         cKUyT5gCoTd0P5yhbPCzPwXa8u3I+W0VdzNX0zJ4s4SckCchWg3nzbeYqJz1jh7Ahxc4
         MC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989961; x=1793594761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3DoOx+7KwqVIr6jxYa/DyB1bbCV4XdJJBW9Yy/mfpI=;
        b=BbyHZgA8u6FsAxDU6oNhcNc23NhmzcctAd3NP3DMxD7ROqFW4/bafpff63xcirRAss
         wlCDqN/yEVannTP15SFACpjW1Q8tarjWxSHcYRAhJmN4Rd52MrCPaBR/EbXni90Q7xzu
         QjRN3n7a9gapVru4lTlGA0gjEK9GDe5Z0BUbf7Xg/c86dwZ1UOwxhe1KLEgnVspTpiSE
         GRJxn9nzJhQb7/tMlZ5GujM6vDqJTtoniUh1QKJlLaaDo6h/NjJQHJPUpDqLvaHArYgZ
         7ATOZ4s9BPFfmuuMyL43W/kf6hvKv2FMqay76QxmBg0c80G2rDJkZwRRERQlyLVG3tHS
         5iZw==
X-Forwarded-Encrypted: i=1; AKwUvBw7/WVgBHyhBxxChYbgDK6o/Lq/Eo4hW9I9RjykKyqJTPqef9HKvtFGoL1WEXVMAKJht/4jLQgOUiKmvRj1@lists.linux.dev
X-Gm-Message-State: AFq9FYIfU4rfZFDm9HJALUXw6l1O/Ooy51XGWhUri+ltnwaEqekbymNt
	tNqOtcpnHYnoIf2F/ShqSegWI+PX8zpisOwNxZzsvat1MTNBa6uBtPLB
X-Gm-Gg: AYBFou3NWLW4Q2vh2ZZrdE/kjtP5A4aDTVViREhcKk4i2TfQ49KxgzwVTkAcjmW3WHN
	2L0inss4x3gHQZcqoqPNpI+2/t5D+R0Z8gej4zEwTusCM1g+azTX2W3bX+LlZZt0mZIvnS/1D0s
	d5XPUbYe6rxtl6g6lCQOcmC5pyPFkFT6JBf0PE3GMuzYKqneqAdl+TAPk+1SWIBe/C7NyLW5pEu
	aTmSSYXsDMsk56gmAT7uVfrdmLdkzg1aFuoYIuOnF4S6yPw2YQl16eOPshqciROEL6dCNkZeGgg
	oOn3WC6PASp8lc0FaxbJuOhstrqE0xnR9hNIyg+LhDtNsZIKyEoVsj2euipA5yb0ACxBou4TyCX
	09m3MDqAyM3Hf9GTMjakKH+9QM8PVBHeXwieOMUZqg1mib6DuawlkIa9UKMB9O9yyZv39LhWEuG
	AFXfo3tdHVDjSmyPoWYC92JYVdLx3q3RgTBmWYyYOeS9AErhIyXFbjOsnsuLq4J/ThSMSgRsszX
	UEioG9qmCUuNkCxN5PDmRtomG9/KxZamNQwgWb54GfVOZivbMbj6gBEwalKNpXT0fn74r7ooTs3
X-Received: by 2002:a05:693c:4195:10b0:360:905a:7c27 with SMTP id 5a478bee46e88-369e84e701dmr9620677eec.26.1792989960862;
        Sun, 25 Oct 2026 21:46:00 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm7281133eec.9.2026.10.25.21.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:46:00 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Fix line length warning
Date: Mon, 26 Oct 2026 10:15:23 +0530
Message-ID: <20261026044523.18516-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Split the line in fbtft_init_dbg macro to keep it within the limit of 100
columns and address the checkpatch warning. Also aligned backslashes (\)
for the macro. Added a temproray variable for platform data.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index fd7f8fc2afba..ceaa9a3906ef 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -421,12 +421,11 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
-	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
+#define fbtft_init_dbg(dev, format, arg...)						\
+do {											\
+	struct fbtft_platform_data *pdata = dev_get_platdata((dev));			\
+	if (unlikely(pdata && (pdata->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS)))	\
+		dev_info(dev, format, ##arg);						\
 } while (0)
 
 #define fbtft_par_dbg(level, par, format, arg...)            \
-- 
2.56.0

