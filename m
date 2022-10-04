Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48DE3D8A
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 15:35:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j7so16558659wrr.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Fnxz/FgbBcFq4rNqZeP0eKgDgySuZn3DQygIlWco2j8=;
        b=CtaHLELVve9x0A7M4dLcyD7n2V8rEhtcfmFiZAoD5is91S2xCNveQdtEASbT+c9ry2
         qejCWansKCrnDqDxPkMgY4Bkdc0AGKYgESdnjY9Nzrxp487vmshc55O2tTbrFJu4WzV6
         TRYyNSw6D64uqca2iKAhTM4cLCsyPdrw8Vy1kpDnsOaQ88hjpDs02okrYgdKTV4V4J33
         FR32o2ur803faw6h7OhUFJw7oXFgmBH4OUQqzK4G4vk6oKCIveTrgDxyeim9hSQESRov
         END+zdoFiPh4nVGrkp+U/27Lha5FwAYr6pSrs7JShJwSfQ6vidbq0/7NPdW/b7mxTpgn
         00+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Fnxz/FgbBcFq4rNqZeP0eKgDgySuZn3DQygIlWco2j8=;
        b=osri9iR9zc8lqhOySJzqxsz2Lf7aItuNoL45CAHf3DhI6o43c34FNEsrqZDpoUKo86
         7LK/UaC7+TEyjISgHIqxOl8eIoaSY8cXm+NmAW3ofZZv2gUlaIxY25DULPRLZPA8k1lD
         MrhAihzCGrDdqMi8Yg0HPifdLcg+tvNMKVRJbRanFeppnAvcJunmvaCCKyva/l4GnIBr
         mGSRICFJjXuaN/E6ymRa8hPb9etwWjt1iOlN/NfUlun6QdJH0YsJS/JFWcWZB6CDyFzx
         +dxlZL2r10a9Yos1UpgtILa9haAW90Zn+a7PqCEIkYKwHOwcCoHC/yJKl8WH5w6jAsiG
         l9cg==
X-Gm-Message-State: ACrzQf2tq5qY/52B6zpcYSqAuYB3ZmIUpVGm4Er672KvKI58TsITJ5zn
	ZJCxI9aDNNNxHkJc/5Q1oZY=
X-Google-Smtp-Source: AMsMyM4u+Eg/UjClIph3yU19zrsXuO9gz7e0Xl6gewESqCAluwQoVYTRmyh0IU8sHkfGI8LNK4OBsg==
X-Received: by 2002:a5d:59af:0:b0:22e:32be:60f1 with SMTP id p15-20020a5d59af000000b0022e32be60f1mr8897460wrr.81.1664897740920;
        Tue, 04 Oct 2022 08:35:40 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b003b31c560a0csm16200200wmb.12.2022.10.04.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:35:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove redundant initialization of variable efuseValue
Date: Tue,  4 Oct 2022 16:35:39 +0100
Message-Id: <20221004153539.150867-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable efuseValue is being initialized with a value that is never
read. The variable is being re-assigned later on. The initialization is
redundant and can be removed.

Cleans up warning:
drivers/staging/rtl8723bs/core/rtw_efuse.c:285:6: warning: variable
'efuseValue' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 06e727ce9cc2..eb848f9bbf2c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -282,7 +282,7 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 {
 	u8 tmpidx = 0;
 	u8 bResult = false;
-	u32 efuseValue = 0;
+	u32 efuseValue;
 
 	if (bPseudoTest)
 		return Efuse_Write1ByteToFakeContent(addr, data);
-- 
2.37.1

