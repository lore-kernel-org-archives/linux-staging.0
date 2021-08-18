Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903A2FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 18:08:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id u1so2196543wmm.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ofSH0U+01JxHiJg/B1PA1+0gz0bsRWqHkTdAg4y4t1w=;
        b=02c35UnuRzrOC/nJOIr2PRI0vNvQcVTCma/IBHv6yFDo3uC6hUIMFHv3BQP0xuK+BY
         nxwv7qbtJthCwuLh7Ume/o1L6J2TjqZWLjAHQdyTwooQZs6skZPCO2PdSqcJY1l8qbZ5
         9PkOo8TWdvNA1/2ruhsclHQoHjesPLqWD1PiPYc9xvSmmrNpvYRI2JFwwjndgl+Gb6VV
         3eGIuojh2/2fXLUo21sWdilipuk4mnWRmpZO6AsOxmWZmvIdQsSijgRaf8NUMFsER+EH
         ZsQOYhGEMGEX07z2OURU7FLqiFfHMkUQ/IdnvNhFTOfuUINoiwZZ4xBZFxYLv+p7MW4e
         g+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ofSH0U+01JxHiJg/B1PA1+0gz0bsRWqHkTdAg4y4t1w=;
        b=LDHhyfirFeTYIVvK0pLqVV0F1uTFnG44+XVV0Lr4Eecqc7y/lejyJ5D0EfYtP0aPvB
         6ruGDOblGFCciuZt+XcWZjeArBBjKPYCuK5rzLtWICp6npf0SGWqMFr/m4Qm5rPDJlkb
         /CGRn6LPsVF1hNcicGcxq+cpB/LlNuW6vOmm6zbUy/rFievCb8bWhUlnILvHEWKpWaMf
         LC7tAAtyNFvP9O9+NAK7H8Kiw5sWIOeo5eKTZvY6WghhoiLV4BPY0X3EIaK57i5fC6Q0
         Bu+Ul0ppCnUbYvaq3KXLz2kb6+iZlhTYllWrlmVaM0vq7aRUU/AT3fAYjC01HtzYjF2Y
         JpzQ==
X-Gm-Message-State: AOAM531l6nA37HQM7aDRXt4kuRPceisKHC4q64zYcXEJOFSaDCFkAVpd
	5mMSB71S4tl04zyHHrx+nU/DWw==
X-Google-Smtp-Source: ABdhPJyhx81TRhuUufUr/GNEg/qE9ZgoMe503XX8SKHVl8i95HGSe3HvFgEfa8rcL8SDTSTJ0EMd/g==
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr9411983wmy.70.1629310112995;
        Wed, 18 Aug 2021 11:08:32 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z126sm516337wmc.11.2021.08.18.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 11:08:32 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: r8188eu: rename variable within rtl8188e_Add_RateATid
Date: Wed, 18 Aug 2021 19:08:31 +0100
Message-Id: <20210818180831.67581-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename 'shortGIrate' within the rtl8188e_Add_RateATid function to
'short_gi_rate', to comply with kernel camel case style rules.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---

V1: Was part of another patch which was too large.
V2: Attempted to correct operator spacing issues which were fixed by
    another patch from Michael Straube.
V3: Just corrects camel case issue for 'shortGIrate', and renames
    subject to be more specific.

---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index cc06ee07974f..3e1a45030bc8 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -155,7 +155,7 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(pAdapter);
 
-	u8 macid, raid, shortGIrate = false;
+	u8 macid, raid, short_gi_rate = false;
 
 	macid = arg & 0x1f;
 
@@ -167,13 +167,13 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 
 	bitmap |= ((raid << 28) & 0xf0000000);
 
-	shortGIrate = (arg & BIT(5)) ? true : false;
+	short_gi_rate = (arg & BIT(5)) ? true : false;
 
 	raid = (bitmap >> 28) & 0x0f;
 
 	bitmap &= 0x0fffffff;
 
-	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
+	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, short_gi_rate);
 }
 
 void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
-- 
2.31.1

