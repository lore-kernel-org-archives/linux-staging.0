Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B601571
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:04:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id p6so44012532wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ck3YsdNSVP0rZ1FtHCUQWW2VZt87Mqq7djATO4TUkHY=;
        b=HkF9xIaCcJXTwTE676PshFJce2H+E5YLOZk5Se6EptvcO9HuBZTrOSwhHLFPXOR+SI
         So/BVexFRF0eUmkRzZ0edJRoDGoJxJs0Jj0s66alCoUMwP4hPQR3YmwFMsGWK+IQMx+4
         rxW+PvicMwqsyLBJCdo3qc2mNAeOz3kGqhxHefODoKP87KFETlOFFmtnexDP2/fLHcmw
         wzh0Q91/2mnuzHvtTrGetIqIVnwP0Lp9fF0CSi1cRjbFjQUSnOG0LpxxYnx/0EI3Q182
         O+NNflsl/u6kXwuQnRFHmGx0ESzPTIKLPimYmbJYkIdJddg5/XeujHLMb/E3siZCzdur
         kGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ck3YsdNSVP0rZ1FtHCUQWW2VZt87Mqq7djATO4TUkHY=;
        b=SxAHglJ4U9NnT++z+axusBL5xaA5eTevg3AhcdryFxO6RJRQfGssxExBTawRlhbuJP
         eah3H1lVwIeIRLci1JxXdpbQGbbVz9ZirC5G5bYjKksggBj55GxvdBSbqkAj6x3U/cbF
         n8BhXxS+HiEWjgizuHQlLuvAnlJ5y2iaJNY+pEZq/j4eL+Plso63+8JAlEmerJ7qul4C
         2CknHqwjOsWoxDJseuNt5h2Y1kuD1yJ6Ka4mMdoL4+db5aXpP6riZDYe3MH8BMKddfU2
         NGe90FewEMt3W1TwZZ3ruts24TWQ2Yy82JjyoCNQSo9WYP57HvTJHr79/CKppTi20QWK
         VtJA==
X-Gm-Message-State: AOAM530VpQXsZJM9NNUqDWQMSHQRfdawn4oThaQg7w3TInZruDrxvCQC
	jZRFSwZcch5xi0kKZEM7RKo=
X-Google-Smtp-Source: ABdhPJwye49sqjYh3F1rAtuwk/EJTLSPCSamHCBjMkk0VD5Dw1yBWU2jSxRMnOdOoTcfWS9ZQd5how==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr9504311wro.180.1619255039453;
        Sat, 24 Apr 2021 02:03:59 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id m14sm389517wmi.39.2021.04.24.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 50/50] staging: rtl8723bs: macro DRIVER_PREFIX expands to lowercase driver name
Date: Sat, 24 Apr 2021 11:02:33 +0200
Message-Id: <c986e9a3c9b2f73cb784bd5dc7c877eb9a669c89.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

macro DRIVER_PREFIX expands to lowercase driver name.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 189f02a8300a..3a5b083e95a1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,7 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define DRIVER_PREFIX "RTL8723BS: "
+#define DRIVER_PREFIX "rtl8723bs: "
 
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
-- 
2.20.1

