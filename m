Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEB70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:09:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j7so4916743wrd.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7HpwydgRPtNBzTTMixRFrkkDelxwB2t+/hImIES2Sr8=;
        b=QOH+dAgHT0I/hZdt7uFJLJNDcyTk8W5yVsx4GjbvvSFJYotmsxquNOhfKZ6pSnkGS1
         0MlVxydcGpX7P4GN72MhDkoBWW/RbQpqbJUGZYiz1bh7FKC3rUKkjvplII4R8FrSd5v4
         YGQHqzPsENZvu4H1WIQgnSDm4bOXEk6hF7YK3c0JqsVe7yeHuoTQTPVxbzIF/w8MLhK6
         ohXPu27QGnpDjo7dbx/RnLSJ9y0PI1aXtZsWOOUMONqS/paJiRv0i1m0w/ncFdQDWxl9
         Xa3/WY0OZEZ+ZiGP5cQBQMbVpNrWZxMf5zfnSSYjBrpQhZmULYkAEJPg18q9zCcNCzcg
         EuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7HpwydgRPtNBzTTMixRFrkkDelxwB2t+/hImIES2Sr8=;
        b=iJIl9nLZjhLui9899WATVFfIXuJts51lTL6EHOswN6gnpQXv5PYoxpq3qMRemfxYfK
         NhvJzliNLAgg0dAEY6Xt9Zhx/qK/3cJhtfhxSN206bhxoPNpPs2KNFb8MdCFdYRNK/h4
         desePL09rntE9CCwjxZjniIaYooUoJ+eX8+JyIY2u1DoJZSJbeP5UaxKc9rZou6S4dAI
         ntkfJb6662ETCZU2iDl4LzJVLr1nf+urQm6UyjCQ7NwBkPjLB+fdCPzyabIviPMLwneL
         a2ZM61vDy4HL3cmY+6sXJ0gs8r+MzwotZpvgKQu2Hf9sii9ulMokAUkPui6VfKHNKy9Z
         B63g==
X-Gm-Message-State: AOAM53381IXA5YubOu+poJP31/bpjdZW00/NA5UtMoPqyNryc0Vtkpgs
	e7CTDfDu2zr1t/ZrdXNZtQVmYpGRvl4XbA==
X-Google-Smtp-Source: ABdhPJxx8vTiOTIdeOFZ3FCzUu9QZuCzrsd6oT67Y5HFl/5BTleFKflhosC/0dOtzRz7Nprn2asPCg==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr13494565wrr.425.1616749784094;
        Fri, 26 Mar 2021 02:09:44 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id n8sm10018835wrm.70.2021.03.26.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 02/15] staging: rtl8723bs: put parentheses on macros with complex values in hal/HalBtcOutSrc.h
Date: Fri, 26 Mar 2021 10:09:09 +0100
Message-Id: <7c734b6d796b369f6a0d23c76daa344c241691b5.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
152: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:152:
+#define BTC_PRINT(dbgtype, dbgflag, printstr) \
no_printk printstr
--
ERROR: Macros with complex values should be enclosed in parentheses
153: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:153:
+#define BTC_PRINT_F(dbgtype, dbgflag, printstr) \
no_printk printstr
--
ERROR: Macros with complex values should be enclosed in parentheses
154: FILE: drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h:154:
+#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) \
no_printk printstr

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 10c021024b24..1926a1f7a7e5 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -149,9 +149,9 @@ extern u32 		GLBtcDbgType[];
 }
 
 #else
-#define BTC_PRINT(dbgtype, dbgflag, printstr)		 no_printk printstr
-#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
-#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) no_printk printstr
+#define BTC_PRINT(dbgtype, dbgflag, printstr)		 (no_printk printstr)
+#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 (no_printk printstr)
+#define BTC_PRINT_ADDR(dbgtype, dbgflag, printstr, _Ptr) (no_printk printstr)
 #define BTC_PRINT_DATA(dbgtype, dbgflag, _TitleString, _HexData, _HexDataLen) \
 			no_printk("%s %p %zu", _TitleString, _HexData, _HexDataLen)
 #endif
-- 
2.20.1

