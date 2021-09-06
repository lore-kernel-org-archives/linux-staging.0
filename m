Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8AF3FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:19 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ia27so14935405ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=bvMSPibRhbo3R/MKPkdA6DnQtWiICCn0WUrNtSzkFHF5ytLdSnewA90aBwKJGOlQ8Y
         SD/1WWtD+FZub4r1iDYVRRL+MCbBpM11KYYvorOEcUPf+WM/R+YW7J0aLkUpZfh4kluz
         1Kx6S7z0+UQIM4cnEtZ2hHWBDS4/31AKU7HC9E4KigbcZl9CkWWuUcBc4UVaFplSyZrV
         /hRoMhcZyjS9biKgGryJYcl38bEuG7qO4trBUegPpKwEdSJ0zynRpdvqxhlh3jXs/YLG
         7ldnOE6ftGxENua5wHn67gRpQg1XME5PMP3Upr1X874SKgQeSZCudpZo7yd6VogpSeV8
         k7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=MXwqBOwb1KKUeM/v23w8vfgkGQkz0AYjO1CdcHywoXH6SCjuewqJauSVho3JdhrUGn
         c3fbD0Eq632+wJCKhD6UNOu+voOrymb/dZVgQ1w6RUAqsoAht940PkPm42SJW9SYnSOS
         +P0JucmuiybGgylPBg2SBx7jMXVgyCvfyr62xkL07NZZbVs18WzByPyDZ7ClZLslQPxR
         qckFHBS+mJlnkyZ6MgfWk//TDAoUF5mXNMZXaV+7JEd4TlabN5SvYH2dI43ynfKDJIQp
         wCyXTq1Tszc2NisJhShVobHb6geyvZdO5MuRx4O6KcACid0svcRIztlmJfiiecqbTrjg
         IEGw==
X-Gm-Message-State: AOAM5318lj/BxVfwYbPGyCIDbOM6tGXV5Qw5d4hZbP7LMLJ6thRXke74
	IEAQHZN3CZfM8+JbgxxAyo0=
X-Google-Smtp-Source: ABdhPJxTIwHtIus3wW03vt/NmFrP19e5d5HiAzykbBazZxUmwEKDt+Dms0I2rIjaYiJZyTgNi2OXhQ==
X-Received: by 2002:a17:906:6b0c:: with SMTP id q12mr15226982ejr.0.1630952717530;
        Mon, 06 Sep 2021 11:25:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 22/40] staging: r8188eu: rename hal_EfusePowerSwitch_RTL8188E()
Date: Mon,  6 Sep 2021 20:24:20 +0200
Message-Id: <20210906182438.5417-23-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename hal_EfusePowerSwitch_RTL8188E() to get rid of a wrapper.

hal_EfusePowerSwitch_RTL8188E() -> rtl8188e_EfusePowerSwitch().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c7edb9ba4085..b5d0cd332165 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -707,11 +707,7 @@ hal_EfusePgPacketWriteData(
 		struct pgpkt *pTargetPkt,
 		bool bPseudoTest);
 
-static void
-hal_EfusePowerSwitch_RTL8188E(
-		struct adapter *pAdapter,
-		u8 bWrite,
-		u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 {
 	u8 tempval;
 	u16	tmpV16;
@@ -757,11 +753,6 @@ hal_EfusePowerSwitch_RTL8188E(
 	}
 }
 
-void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
-{
-	hal_EfusePowerSwitch_RTL8188E(pAdapter, bWrite, PwrState);
-}
-
 static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 	u16			_offset,
 	u16			_size_byte,
-- 
2.33.0

