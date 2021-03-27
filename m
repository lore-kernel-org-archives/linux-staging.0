Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778670
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e18so8382709wrt.6
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByK1DDWOjUpsfElsdflbL+PD9t10A+tmGzJVFXAUHaI=;
        b=OfHe15yhUIenZybF99TmN/6y3i3G1hTzgRfS7MkqZEm/p8/tZUnCstQ0Bm1SqneQAt
         baSl9EJoo5OWc0sVl6KJsdwDlrQi4MZ/Fm1wFZU6hLOvcu8yNLov4nkx01w8H0uyJpFt
         8ddsHGIVrfiwOoXSl5X3K/AQ+jNsp2ya2kC/hehqCU4Wxia7ST8p67wAcOFz2oIiNMdw
         yftOhKCmp3RtDwBsLHyRc9TCbWrdVJY3CY10ckKvONCm9McEA/jd+5jr4/0t9/ZZ9MUx
         zIVYhvd1Qtnt0nT0kRZb8hZHxiRz4XNioTHeCfywsNUgEkfaIOX6SokgZU3jskjZ5G04
         tP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByK1DDWOjUpsfElsdflbL+PD9t10A+tmGzJVFXAUHaI=;
        b=G9qF2vrylJmu4vJj5V1eJxq8ppmbAolWQqXnVzdmu6mQjmQYL0G5FzZjxjddDIoCJK
         GFT8mruhFuOQ8rf9TYuFoWdzk7G4U0pih4lv5zFis9dk5MOVoRZ4swIEMCU5H2hagFKf
         x3f7rxUg6Fdq0zMkJL5CPBsfNf1ocjuswiXRI3q04vcwS/q/EPE1cn84zaY+miT8+nmA
         ey2H+DIorqYUDeYip9oHKiREII4LBomD6H6r4v/QqnlPKOV5NO/I4kr2vEGipMrUFCkI
         jIvkD15jpaYVa32d39ZsPnbwu//jaGN7mZtdEZ7WMnoVHpfS53NZZQqMf7du6HssUIoK
         P6dw==
X-Gm-Message-State: AOAM532mxZ5dcjo6d5HJTx/Am6//vdclq3YbNXxCY/jsawoXLldMzPQ3
	T13JBnC8gAfDgCICAx47MY4=
X-Google-Smtp-Source: ABdhPJy3Tzz84P8Xb+QCT4eMVCZ8eilAi9o/73a57QAl8uBz/A5ZzAU0anra/AM3Gfj+J4rdXixFSQ==
X-Received: by 2002:a05:6000:10c3:: with SMTP id b3mr19448506wrx.96.1616855125814;
        Sat, 27 Mar 2021 07:25:25 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id u23sm16707567wmn.26.2021.03.27.07.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 20/20] staging: rtl8723bs: remove unused macros in include/drv_types.c
Date: Sat, 27 Mar 2021 15:24:19 +0100
Message-Id: <b405202e5bace2098dd7c787297f700cc1c030e0.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7eb59a16d00e..a454a6390537 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -266,11 +266,6 @@ struct cam_entry_cache {
 	u8 key[16];
 };
 
-#define KEY_FMT "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"
-#define KEY_ARG(x) ((u8 *)(x))[0], ((u8 *)(x))[1], ((u8 *)(x))[2], ((u8 *)(x))[3], ((u8 *)(x))[4], ((u8 *)(x))[5], \
-	((u8 *)(x))[6], ((u8 *)(x))[7], ((u8 *)(x))[8], ((u8 *)(x))[9], ((u8 *)(x))[10], ((u8 *)(x))[11], \
-	((u8 *)(x))[12], ((u8 *)(x))[13], ((u8 *)(x))[14], ((u8 *)(x))[15]
-
 struct dvobj_priv {
 	/*-------- below is common data --------*/
 	struct adapter *if1; /* PRIMARY_ADAPTER */
-- 
2.20.1

