Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDB6D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w23so9782609edx.7
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSqHGysbFGtJeoo67SKhp//nzHiiwWy4mkn3QI9McYI=;
        b=pGDYW7PYcfkcv/e1HkTCjjX12OJ7WlFt59kG3s/j9uzXcnt5vbDNG4rZCuGlwB2Jxq
         3Bm/9oOzsw4YOqMIYPKOrxsDnDrFdFK2vhQ2eSwD48vRFTLHpgxIhvi1Mtui33rxpKfU
         OM5Usjg3dOxoSEx2u+K3BpjR0/M4Zhrj0E1lfna/0tTd/u6LGe2KXADNDfrUOKoGuXYF
         vSiMpK7vLFafWQgCHzcz4ZC6l3EXUpwEc1gJpuimLGMW3SPlMYHV7O6IByiQTPAN/0qz
         YmG0y2S0SVuLbPM1yO9J2h5pRs0URvBYfPGLEPBJX/z4v/L08MFyYip8rSdVQRioSNJp
         ZwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSqHGysbFGtJeoo67SKhp//nzHiiwWy4mkn3QI9McYI=;
        b=awrnM7rrLk4X3pB+MvW0WQbDkS1HmoGnE6a1QUDjC/7EX5wUxYat1oCwnLL88YphRC
         xW4rszfUhAanTShwJBqgob/AYb19w0oRIcjnVJu8xtHFIhJ8vOlf+niPUjUuF0NP8mY9
         VB58k5o3WURGjiRXsqUU5aCYPUdaAwUhR7MfhE663PHb4siQhDPIKL8XQORjIyjUu0Tv
         YRhLv0U7UnSfUMI1TmHgWNpKs3GprHvogLWn3ZBLbdhOuu/TDByinx8IPoP7259STp03
         DRIsxaUZTRMt3q+KwXKbP6mnHT4sllc5YuQf1JrEY0RljTp/rFIfotheQnxGqD8quNP3
         wXEw==
X-Gm-Message-State: AOAM531wjvBdHAH8Osxrgv4uA7WaD4ZtYkptkTwKde3q9dE4n+Nskg9v
	qAXAHpdPdLuEM93VnNsf/rY5b6xt/tZ14g==
X-Google-Smtp-Source: ABdhPJwdorvH5lggUl7lkAYFgUCoKj7hFGNoZu7juTAtOYr1FG2ui24WmajCz8FfUMsi13o08BvxNw==
X-Received: by 2002:a05:6402:2208:: with SMTP id cq8mr21971576edb.122.1618064456602;
        Sat, 10 Apr 2021 07:20:56 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id l9sm148154ejz.96.2021.04.10.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/25] staging: rtl8723bs: remove code block guarded by undefined SDIO_DEBUG_IO
Date: Sat, 10 Apr 2021 16:20:23 +0200
Message-Id: <ee77c4b4e6fbba8e0182e9558f793c88cf398cb5.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove code block guarded by SDIO_DEBUG_IO symbol.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 4403ccdaf2ee..24e45f734bdd 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -176,15 +176,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 		(adapter_to_pwrctl(adapter)->bFwCurrentInPSMode)
 	) {
 		err = sd_cmd52_read(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
-#ifdef SDIO_DEBUG_IO
-		if (!err) {
-#endif
-			return le32_to_cpu(le_tmp);
-#ifdef SDIO_DEBUG_IO
-		}
-
-		return SDIO_ERR_VAL32;
-#endif
+		return le32_to_cpu(le_tmp);
 	}
 
 	/*  4 bytes alignment */
-- 
2.20.1

