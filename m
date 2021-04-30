Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D482F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:25 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id t4so20533483ejo.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=gR8QCiv4DsNCkhpvliRh2repO+rv/67cRocKOSqQvp7PByEaOkkkiakifFoXYtvrSy
         KisK/LLhWh7HRsS4evkf/DBYfs4k9A5oQeaRxXpcykl57tkyVpBtz0OCvDKQyiOXmif7
         Fi2nqsWyhghVM/q440OyNUjo888IA1kOXoNiLZD2AHrF6vynj4/utspkUPX3DG60TxhM
         Uf7mwq/d6pOLvPxr0BSjGpQm08aMdnmRXTCY57HH+pEsn/oBbON/1p8ZQeRylyOi27N5
         YRkNzVIaRV4APXb+lJ8wjoit9ib7VnTo4W/ggmO4dGggi5Y5YuzxVdyCli9/WUYaYHiq
         6XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBMRL9okd6exFYzTetsEZ3MsVPUnPB4cIvHOO2Zf8iE=;
        b=p6KQ7Jio0lHke7J9SXNhZcakTBakTlgfRPAdKbPWyypNkip1Euy54UpLWKo/VGGRtM
         jCJZFCLcjyic08dzKKzYuqR3QAKjSs3/4/EqJuFKdUiBrbWMuRa2P833ivIFWDs42TU0
         CZuGhd/hhgBywQ7kTaZd3xHHnZBwFAaG//06HdPvtX6wOIMJLaePD3Jr5fSd4JaTPmDb
         BCwR6u3B8jN010cwvtbhGsZlXLt2tqshIIFtrYop8hLk/MAUCGWF+wG/Ljkx0CDSubFZ
         +NLXsnJLYu+y9KQPvoGDdaxACJPgxa7rw5lk6KuWlgveD2cQL1hX73X9xHXtl0S6vfhi
         /R5w==
X-Gm-Message-State: AOAM532vmt+RfDqfQMDJIqluHSG92AjRImNYqrTlHPmIUrKACrON/PIl
	C2CueBm8IPi00DtStxx1nU4=
X-Google-Smtp-Source: ABdhPJzKo7X5KfG+V7g1JhtrVbUmWWo3xAnineM3BRSuH/4cbReedk9VqWXDy7p4ETXRczVszXjM8Q==
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr2852043ejs.522.1619768664606;
        Fri, 30 Apr 2021 00:44:24 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id bh14sm1437662ejb.104.2021.04.30.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/43] staging: rtl8723bs: remove unused ODM_dbg_trace macro
Date: Fri, 30 Apr 2021 09:43:30 +0200
Message-Id: <7ea9367680c709edeec463111ddb2f7284cc11c2.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_trace macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 58de4d16335e..cd68c583699a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,11 +96,9 @@
 #endif
 
 #if DBG
-#define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 #else
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
-#define ODM_dbg_trace(str)				no_printk("%s", str)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

