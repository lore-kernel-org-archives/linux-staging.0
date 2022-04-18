Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726DA29;
	Mon, 18 Apr 2022 17:25:49 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 203so997731pgb.3;
        Mon, 18 Apr 2022 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKuq0wU3+JeGnDXBmVteCxHEwvafVW2Ji4siv6RJc6g=;
        b=Xhxa5K+utu+20ev8QXD3/Lag35QKJGaCMWBrtXNdffFxd4KBEDHQdfHNXN2MAU2oNe
         47KiHyvukhJBBbUl45qknLCBmfya/36mwjvNNiTsO1I9igy2qNvLEHgfodUUULeJvp/Q
         xRAIP/9qMTqxk4VHxG9yuN4UKq66u+zS1rxsFeYnKmsacrVfwjQ2qr7ynbAoobvMDm6n
         rAquBQyNzQByJy4weYuIB1ex+xEf/r4IufPrMauOHxTByzfsfB1nlztfPjFoj115xEcJ
         D+JfZjMAn9S82aMibIZsjpZ+b0lDuBd2fODhr9T8gtEuKlc2i4MyGySi0TkaXIhiWQqU
         I11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKuq0wU3+JeGnDXBmVteCxHEwvafVW2Ji4siv6RJc6g=;
        b=nkj07zeysRfxBhyRrHMDgplEEzTenxZXFWoXF5meY5XoitNKZPIoJ8GYFRgl3EkgMQ
         bBujd8hQxrmRkQKBIB2nTKjYt3kMI9Nu1ESO99xdzqzMxRIatVesWPB4THWFhA8XdSGv
         GxDTghP5eB7uWayVo6mJVF92fWEc+afLO0dv4dQFG9rCyEcGvKtUVAwvR+tcHeD5XeVX
         ysDvFWTGrTvrDoSaoPvtLsy/VPBdweniMFL4yEpqA96EhX9CaiaMKNgG8y+Yhmq70G3r
         6eoKWJW73wn/GM6H760veo3WiyhD228CFAJQvEOp407y3/DdE/As6OngYw7KkZMZBJhG
         bAjw==
X-Gm-Message-State: AOAM533sbE6cUVuiuqXwD4f40+c/PVTh6sNG3x9IoXbFA737oZfeqKc/
	/1GMoF7jbxiyED0NysVESho=
X-Google-Smtp-Source: ABdhPJy3JJAfOVN7tfyfI2+4b+4P83md/k20gxaF/4DLe0/MfcqlQs9FIeOyxP5Nqj4Fe1hS3IYReg==
X-Received: by 2002:a63:7d49:0:b0:378:907d:1fc7 with SMTP id m9-20020a637d49000000b00378907d1fc7mr11130115pgn.252.1650302749267;
        Mon, 18 Apr 2022 10:25:49 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78f29000000b005098201d2f5sm13041394pfr.205.2022.04.18.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:25:49 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3 3/3] staging: media: zoran: add parentheses on macro parameter
Date: Mon, 18 Apr 2022 22:44:56 +0530
Message-Id: <20220418171453.16971-4-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418171453.16971-1-aliyarahmani786@gmail.com>
References: <20220418171453.16971-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes checkpatch warnings of precedence issues. Add parentheses
around macro argument 'num'.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
changes since v2: Rework commit description and subject
---
 drivers/staging/media/zoran/videocodec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 19732a47c8bd..925f90fd5885 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -22,7 +22,7 @@ MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (videocodec_debug >= num) \
+		if (videocodec_debug >= (num)) \
 			printk(format, ##args); \
 	} while (0)
 
-- 
2.25.1

