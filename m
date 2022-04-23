Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA67C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c12so16731010plr.6
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KrgVC3UPNzr2hlG0BxhLQFDCAl0tXFxgqHvP744zkDY=;
        b=hNsr/DD/bbhFB2+PqlTKJgoT+/OfTJgg+SQcqbSBWJsGPDvgnY67fsL83OXpsVJA6f
         MkJ0Z4bjqg8CV2hsyrcg1TM1xmGuMeMbKD18HVBNuNmbqxOWNjBXg4Cxcw8BFhUimiRV
         P9PB1dymobQnVePd7vIHBdcIVcj+4GiPQy4REzPH6tiO45Ckys+xLK3OCweuZ77YDAT8
         TqrXKqACg77aUSdytJPfbK8Q7I5ByTOU3vQQF0l5qU1GcZpjDT3RgRs7dv8/8yv++7Un
         m+Lgu+YybF0gBkiyN3OOM4okbxtUvWir0VuDD6QcZ1tVhaJ/8aBHKR9r6CZABo+Bze+S
         ORPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KrgVC3UPNzr2hlG0BxhLQFDCAl0tXFxgqHvP744zkDY=;
        b=Ab8nH4/TNlocs8752PpvAhxOjS9zWeGtl6uFvuP4fDUW/9Hvums5wAP8YkFSFV2Vzh
         lxLcGR25IfZlmdl8glT9+iwUEjz7MboGjUWGG45+TgrN5KboMBTnOJjm8MgY/UhBdMDg
         KJBfGkAUc9uSmS17oh4fGS/uMzQCrICrTK+edRe4B2WdRLpdi3cNOIyP9JXs7Am5gDh+
         sknkUPq5XPGP5TtQcxBFlL+dUbHNswvJhdo8CUUB04v/q6veoRN9bhV6DJ2hghKo3fak
         8EQ4CHVm09SIJAqpeRyTBhhvwvbtD6ktbBeqqdVB+5emm01ATxn1Lt2uYAx7OIgluLxx
         hhJw==
X-Gm-Message-State: AOAM533CtUcBVr/CMha6WLTVaXyW/SOLSzRl5qnl8kn5mP1pYh/2AWbW
	oheGc3WtFb+4Us1t5rmWc/k=
X-Google-Smtp-Source: ABdhPJyTbZVGl+TE0cMbfLiKFHFwn4cywT2egZi8doupH20ZPQrMCFEL4VGd59CUCEmD4DMGroZVLA==
X-Received: by 2002:a17:90b:4a0f:b0:1d2:fe13:841e with SMTP id kk15-20020a17090b4a0f00b001d2fe13841emr10789827pjb.97.1650718947490;
        Sat, 23 Apr 2022 06:02:27 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:27 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 6/7] staging: rtl8192e: Remove u16 cast for u32 parameter
Date: Sat, 23 Apr 2022 21:01:49 +0800
Message-Id: <20220423130150.161903-7-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423130150.161903-1-wjsota@gmail.com>
References: <20220423130150.161903-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The explicit u16 cast is not necessary because rtl92e_eeprom_read's
second parameter is defined to be u32.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index feddb15bccbe..4b9249195b5a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -320,7 +320,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		priv->eeprom_did = rtl92e_eeprom_read(dev, EEPROM_DID >> 1);
 
 		usValue = rtl92e_eeprom_read(dev,
-					     (u16)(EEPROM_Customer_ID>>1)) >> 8;
+					     (EEPROM_Customer_ID >> 1)) >> 8;
 		priv->eeprom_CustomerID = usValue & 0xff;
 		usValue = rtl92e_eeprom_read(dev,
 					     EEPROM_ICVersion_ChannelPlan>>1);
-- 
2.36.0

