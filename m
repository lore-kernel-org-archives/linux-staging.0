Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E306D24
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 23:45:06 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso599239wmb.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bebW2wJt6mt6w3PSG8+ccPQtEo3nALcUnU39AVC5HmY=;
        b=i8zDzRxfnTvXX61j1Fbzj8lG4CELrmKSVKK8Zg0Wt65nHZVGbNZMhd0qEWjpri8e5t
         laWF/HeH4SZcY+APb7fhhZ8sQti2Im1v+uBer8Yz1+Pu6jAPkflGNL32mRYwlH/jP4G3
         qfIFuzRQ+g2toXHDsRisiOP7pmgIpbZGiJlAYv2ZDow0Jf6QJf+SvcKpmXODA31iN6Ui
         m/R24AICTx4IpAIOzNoYqJc/IpWtmkyVEdspAqF1TCh842uJ8duvXLCN9cQje12Vy8Dz
         SdLITl98ImGwqUpYT0LYTZDunSWQgi8rkXqyuqRgkivjvIFI/9C9/jR/MKwVV5nSH8YZ
         k2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bebW2wJt6mt6w3PSG8+ccPQtEo3nALcUnU39AVC5HmY=;
        b=IE0O+sQEZAZEBljlQlL/gJSos8iOszUF4bUNYaDGLrG9Qkp+8EcIVdjgnMSBx1gTr3
         nuxsMsWEcWE/t5pOeqh5skcQ9Ro6vN8t2qK/32LcwgN9gM47ZH7bse8jrJAkWI5GnRO+
         cWbQFOVjAhSEFXVt3Kt/F8KX2tkf443UqHCiScSyxyGhch7HKs6CkJcnh4ZGLHyRQPQH
         xy2/ZxN58Ao4rX3dUDonn3seoKBqZzed6+j3Hp9+F0yqKyP3Os5oXoSFgaAO7N4E6XGn
         F/Az8DCojrjL7TY7gvSTVG4oL3UgqaYpBa3J4zaI5G5mBXupphsl9U5UKHaxEjbUz52n
         4unA==
X-Gm-Message-State: AOAM532cZkF2l/CDKZGjBOimRI25BYibpYvNfBU2eNMPIZKsFhq9pA1x
	FVPhMnlIS38otuuGcdMce+1SJg==
X-Google-Smtp-Source: ABdhPJxyjUGFg+6+grJl114BfDqEY/SrzJQd1NNqJFEG8g9nOtiULHSH0yGhIJG3My8iWtJ5ii6M9A==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr486719wmi.85.1629157505284;
        Mon, 16 Aug 2021 16:45:05 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id w11sm291521wrr.48.2021.08.16.16.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:45:04 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: r8188eu: perform cleanup in rtl8188e_Add_RateATid
Date: Tue, 17 Aug 2021 00:44:59 +0100
Message-Id: <20210816234459.132239-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816234459.132239-1-phil@philpotter.co.uk>
References: <20210816234459.132239-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Perform some cleanup items in the rtl8188e_Add_RateATid function:
(1) Rename variable shortGIrate to short_gi_rate to comply with kernel
    camel case rules.
(2) Introduce additional whitespace around certain operators in the
    function, to make it clearer what is happening.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 77c057e276a5..8d03b24dc5af 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -155,25 +155,25 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(pAdapter);
 
-	u8 macid, raid, shortGIrate = false;
+	u8 macid, raid, short_gi_rate = false;
 
-	macid = arg&0x1f;
+	macid = arg & 0x1f;
 
-	raid = (bitmap>>28) & 0x0f;
+	raid = (bitmap >> 28) & 0x0f;
 	bitmap &= 0x0fffffff;
 
 	if (rssi_level != DM_RATR_STA_INIT)
 		bitmap = ODM_Get_Rate_Bitmap(&haldata->odmpriv, macid, bitmap, rssi_level);
 
-	bitmap |= ((raid<<28)&0xf0000000);
+	bitmap |= ((raid << 28) & 0xf0000000);
 
-	shortGIrate = (arg&BIT(5)) ? true : false;
+	short_gi_rate = (arg & BIT(5)) ? true : false;
 
-	raid = (bitmap>>28) & 0x0f;
+	raid = (bitmap >> 28) & 0x0f;
 
 	bitmap &= 0x0fffffff;
 
-	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, shortGIrate);
+	ODM_RA_UpdateRateInfo_8188E(&haldata->odmpriv, macid, raid, bitmap, short_gi_rate);
 }
 
 void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
-- 
2.31.1

