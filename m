Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBE6ABC
	for <linux-staging@lists.linux.dev>; Thu, 24 Feb 2022 23:07:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id i19so694582wmq.5
        for <linux-staging@lists.linux.dev>; Thu, 24 Feb 2022 15:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbra4FEQu0N4mKrIa+OeGATLAQAZRowiOgXpL7J/xdw=;
        b=LsHQmedqI0UuvSsT/Sa28pwoSgDdgSdH3VFHn5qorZTLNoeeyCK4We76nwt9cag6J0
         SxXuQ4jfmAzcVD8dl9JkwpGCsjp6IVOz0rj1zGzcXRjuJAsGYm4xQRTi94dsKIKT9SkE
         P5dcflfhbRgfIg1D991mL/pDK++aP/95GT8gweqXqTByr5ZcWL9cN4dZRFj32d98t8TY
         5hAfnK+kztK19VM1nvYQiBZ9jLzrkRHmLArDHQHx3cuZ98n5Ak+C+KH1klJdIeG9BUA0
         oBODIgyzlf0aL8GjfgX+LuERKe5l6VeAr62qhgMAT1xIYm5xdpV3OYWrfn3pAfELos7Y
         pAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbra4FEQu0N4mKrIa+OeGATLAQAZRowiOgXpL7J/xdw=;
        b=OPftBhTOyUWkFfFD8hWxV+SdvzqhOO2fzUBbx3B+GLHkYJ95D/eGLhRM9XYkVHMQwk
         JkOnmC5ai9pfQ0alg5zUfeNiJy8Tpt4LE8HNv0sR+GpLUtCdaDlJ1rr9WJDQfn33VDPe
         wzm69hslXCI5EOA2AsVawKP8bQ8Wv7adaeXpuaDLl+iCEOq9CQOgXgxXbYZx2JXlb4kz
         isxHlZlawY/uzAIo2IHPxyUQl3ygkJjWJni2098RKt3M9WhKkTXy/uKD39et/bytYO6U
         3aXlWMwvROgj478hGIquX0dOWvKCklQh8kPyXPn0JiKtOGnNduMQiOqmQ1n0b9HIRqEZ
         cZAg==
X-Gm-Message-State: AOAM531/uDo9WPAryui87x6rkaQj47g0TNbVu3kom/iyUAkXbQeEfuqb
	VqKAU3abca5J3aG/YXIA/EM=
X-Google-Smtp-Source: ABdhPJxZaMBZe4P0qOe+ykgYjJYjNIWkvfk4T8H5ECaKz8j0I8xOAgTO42Ecmlg6mvTcu9izMXSlSg==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id v5-20020a1cf705000000b0037df2e5d8ecmr268682wmh.21.1645744019245;
        Thu, 24 Feb 2022 15:06:59 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id q11-20020adfcd8b000000b001e320028660sm521461wrj.92.2022.02.24.15.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 15:06:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: r8188eu: remove redundant variable reg_0x143
Date: Thu, 24 Feb 2022 23:06:58 +0000
Message-Id: <20220224230658.151338-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable reg_0x143 is being assigned a value, however is not being
read. The variable is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index cf58dfc3ff4d..53ebea311723 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -189,7 +189,6 @@ static void efuse_read_phymap_from_txpktbuf(
 {
 	u16 dbg_addr = 0;
 	u32 start  = 0, passing_time = 0;
-	u8 reg_0x143 = 0;
 	__le32 lo32 = 0, hi32 = 0;
 	u16 len = 0, count = 0;
 	int i = 0;
@@ -209,7 +208,7 @@ static void efuse_read_phymap_from_txpktbuf(
 
 		rtw_write8(adapter, REG_TXPKTBUF_DBG, 0);
 		start = jiffies;
-		while (!(reg_0x143 = rtw_read8(adapter, REG_TXPKTBUF_DBG)) &&
+		while (!rtw_read8(adapter, REG_TXPKTBUF_DBG) &&
 		       (passing_time = rtw_get_passing_time_ms(start)) < 1000)
 			rtw_usleep_os(100);
 
-- 
2.34.1

