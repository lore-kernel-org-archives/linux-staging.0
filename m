Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E02594
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 08:29:00 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id p9so40497770ejd.6
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J4YfQybsK+XfBBKMof2I6wzbyQxle5AmeBoOukDBvsE=;
        b=PC9HeviVJ9bQZnx0cbe2TiMsc5Rrn4zqRnAIQngqMUsOaJ5r13jAxh6bmWwwk5/61T
         4qA9VlvySrUgbUttIEmpCJG3op/YHzagejyfu51VDgsZbEOq93q0gsu0M+NnYa0qvkaX
         53CnWroqu7cy9J6MyqgKkcrEHZdAL5KvXqE5QhP7hcJvshx+cMjfEa0FZt5nx8dScJ/Q
         2H5R0yLwL2abEMhsmyXMEgngaNtL3R2pUCy75Py6nksvUEQDcXedlHkXTd2sgv1/Tfsd
         RpWYmxpl1YXzYQZw+T7Fqm/p5lKyx1kbVgF65vos+xVZFv3Rr99aGYHTS7z3jc0iBQIT
         xqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J4YfQybsK+XfBBKMof2I6wzbyQxle5AmeBoOukDBvsE=;
        b=Cu8b55agKyv6bAIrwGM0BnzLwM37q8kNVaVrOFsJ3+443MG2fUwwTJFw21k3VyK8++
         zu8jje5yfB+f9YC4xNo4lgHJefGYE4JVxCukBGsoLXxFDHjQUHYW5D7eiDEyaKBjzouS
         P9WGbInZN8GTpc8/R3HFS5GPTrEFyoghuAL8B5shiIj3ASx45o3mpsedXhHcEfEdGC0i
         XZ+AnFKbhS8q9q7p6QUw0guiASZyNkRxTemSq3uDD+muJHQwI1DA6XumdnA4DU1JONeq
         eQ1j+vbaYVovf076a9Rd++0u/N4GFJfWvGRjDXrIeKg69XzNhONQFuiv/2XD97ln2lBI
         p2sA==
X-Gm-Message-State: AOAM530ndnt1YNctw2UabyFtVBKa09rDEE6H4gd9Jw0Cykw0caEvqdRv
	iN6hYG5oLkYLFFajLxi30rc=
X-Google-Smtp-Source: ABdhPJxoHl1uKaghZMUCYpBJ/nzr1+Srdcw1R2PqegQppU8mvJhAqbR24+PJ+ni/HgCKkTanG66ILQ==
X-Received: by 2002:a17:907:366:b0:6ba:fff6:4fc7 with SMTP id rs6-20020a170907036600b006bafff64fc7mr18310266ejb.756.1645518539303;
        Tue, 22 Feb 2022 00:28:59 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id v12sm9831926edr.8.2022.02.22.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 00:28:58 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/3] staging: r8188eu: clean up rtw_rf.c
Date: Tue, 22 Feb 2022 09:28:47 +0100
Message-Id: <20220222082847.6687-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222082847.6687-1-straube.linux@gmail.com>
References: <20220222082847.6687-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary includes and the unused define _RTW_RF_C_ from
rtw_rf.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
No changes.

 drivers/staging/r8188eu/core/rtw_rf.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index 68178699a0c6..2d2f0fc4c942 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -1,12 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#define _RTW_RF_C_
-
-#include "../include/osdep_service.h"
 #include "../include/drv_types.h"
-#include "../include/recv_osdep.h"
-#include "../include/xmit_osdep.h"
 
 static const u32 ch_freq_map[] = {
 	2412,
-- 
2.35.1

