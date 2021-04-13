Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573029CA
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so10886450wmk.4
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=ZXQIvdG4cueOAiKgR1dkY2FHoGmDdDx9BW+DKkyuZ97q1zI0c+v6z451JaD2NnXLDT
         K6IAfC+jZwBYasLfkjvTxMsPUwHF9n3hhrcactyKDYaFmE9mpXvq6KqBVwZx/3cVWW1m
         Qd+0dhJitY5FTgFFh9jSpNU9F7pBSACp/WR152Zka1svmO/f28rUCa2v2wNpPk+Nx0by
         L996uBwmF1x6jNNcRtHB31pCiAo3HU5w092S08sBgSYJUz8OXjNhbo6p5sN0KAM4bkC8
         Yx+yAXNYRzhIRNfr2ORz6e2lOqCuKVtKKLwzDgEf1U0c33UA1/xN3c64UxknwOoNvarM
         WsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzC9o1o0ixYi6KaDWY1ROlCOIjizjCzFaIisDwi93jA=;
        b=hvBjXSUDm1K4Nv9FfpIY32Kg94K/cjr5guWp5FD1VaMM9tBraSgm8m18vM/dBwJyux
         402zwOpwxd78f5OSY0QlQLuXD0CMYpmCYQ51A4dvTw5CEovhk0+Z1fiMda3Wq/6MoRDF
         e+68vphDB/QMRT/XrT8L4l9+TNv7pViF45ZuydZEUWTnTXrIeIlmFEAJ7vOJWHRYkfPb
         AFVpA05aynnip+1DXNPXuLUssDIByRIHidh9nAR1CwNlxq3mEYt5p5yS+PYicwsPplfO
         FBz1npYeCXErg/DS5/3XuqmPa9tuccNQ2S1AlhKIERqJzkWNzo1ubLP7UsoD8Def9/u5
         zqYw==
X-Gm-Message-State: AOAM530Y7g1Jak++i50QGmFMVuGkW0t7PI9MAGrvZpPqq2dP9x7c7row
	KxwWr4DcvyoUVIaPg6+z+hZ5qUzvo5HcHw==
X-Google-Smtp-Source: ABdhPJz6wFcoch/aPfJrl+C6loZNKPNi5iIF+QptdhqBzlN9Rf41iqpn/4gd/SzHExuJWHPQS/awYw==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr406263wmj.152.1618325805971;
        Tue, 13 Apr 2021 07:56:45 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id b12sm1355799wmj.1.2021.04.13.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] staging: rtl8723bs: remove DBG_871X_SEL_NL macro declaration
Date: Tue, 13 Apr 2021 16:56:34 +0200
Message-Id: <ff741a820e15ccf1c56a2106af69928ef4e5c197.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618325614.git.fabioaiuto83@gmail.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DBG_871X_SEL_NL obsolete macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index f1b37d511f27..12873c3d801d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -181,15 +181,6 @@
 			seq_printf(sel, fmt, ##arg);			\
 	} while (0)
 
-/* dump message to selected 'stream' with driver-defined prefix */
-#define DBG_871X_SEL_NL(sel, fmt, arg...)				\
-	do {								\
-		if (sel == RTW_DBGDUMP)					\
-			DBG_871X_LEVEL(_drv_always_, fmt, ##arg);	\
-		else							\
-			seq_printf(sel, fmt, ##arg);			\
-	} while (0)
-
 #endif /* defined(_dbgdump) */
 
 void sd_f0_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

