Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618417C0
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 05:03:34 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id bp17-20020a17090b0c1100b0023f187954acso339413pjb.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680930213; x=1683522213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+R/ILs7X2QW/RaV99o/bwUC9Aw8QyPL3GQ9e2y+a4WE=;
        b=BXp84ojiPYIkwMoCq9DKxH2191XSUOvi0Kc3tkQch0SRdrRK0mBZFzV5vTnIzMa6DU
         Ip46rTGa8l19fZBb1+0HvjDoaXozr5L8VvUK7+wu3pJ1lpBB+Taz5tZKmUDRBulb9zNv
         6nCIiWVIdrfnhMIZfDzSrIG1Ygvcg4vm9hZ1ZJ0hngNwBWgN2JlK617WrOrCnE5gY8Og
         CmvBMhteEyYKr5rPNrLn4Ep8qADOVAZhXZR0jSz8kcOw3MUAfQuUWJZ1LX3KlzjhRHYm
         V5gQCyJjZJdbyUPV2fk9ftr0oQiGpN3iZwTbz40JIS3kV+B/8iZnw4NN5+UAf56qpLUv
         cqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680930213; x=1683522213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+R/ILs7X2QW/RaV99o/bwUC9Aw8QyPL3GQ9e2y+a4WE=;
        b=hXk2d3wNwJPcas7xUJ/eHO3YYypH0524fbb4zO8iHy5E8k2LOiEWQzSJfHyQ9tKxCe
         cDAxHLQABlpgzo0fBNLxNiQMQLWde0QMy7eYhRGGit5r+p8Gzh2omcgZp+htuoHSJPIl
         DI/JSMhhs/xR1+0BseXs0tWN66WHOEBMs9uNdIPfOfUTobA1ijSaIzJ5fQGgsdKO8/iJ
         Ramemaffj8AA4jq8QVER0J/UtgEiyoE6PFA1kTBvLx8oZCsgV8dbgANGqcsZdIt28ocy
         ch7fJPGt2tHSLCI1inppBRlMI9YE1yXRb69/zCJpR6D3ujJKtk6sldOLD0D2hkrvNaUe
         l6+g==
X-Gm-Message-State: AAQBX9deL9v72rwAoF0HLcq4BOy8szEPFuvebxZPUnGQgQ68rDRumAmy
	FCNqtLTeujmaXV07fmTNQ2I=
X-Google-Smtp-Source: AKy350biBnNtbUmjCCSsUo7ZnBDg5Xa0/r5u2lvsRMWOhCtDRJ0yncGgf3luzUAboVxyz4lKPpmVFA==
X-Received: by 2002:a05:6a20:b29d:b0:d9:a5e9:4b4a with SMTP id ei29-20020a056a20b29d00b000d9a5e94b4amr4033801pzb.62.1680930213590;
        Fri, 07 Apr 2023 22:03:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8475:d375:707b:4600])
        by smtp.gmail.com with ESMTPSA id v22-20020aa78516000000b0062d19179ec6sm3831278pfn.87.2023.04.07.22.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 22:03:33 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and parenthesis issue
Date: Sat,  8 Apr 2023 10:33:23 +0530
Message-Id: <20230408050323.70919-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding styling issue

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02a16671f2a1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1

