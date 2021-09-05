Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CCD3FC0
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 20:52:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p38so9446465lfa.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8dWkUEjNkAWUFS7smY/S53tLlwVSBp7wKC32dkhYG8Q=;
        b=ls+6vNBRkX8hng0+3ffuWcI7eC/K2BuXvKgh7c14rmgf8ZkyGka/cdzNL8MKg82I+a
         EuKclFfG0DL/90ANVrLDfK5jLFd52GAacfQaAF64QotFUdS/jUi/4AyK+ZLWwty7qzqO
         /+kcrk2xN2A9zeZvMF5lcQ107VdeFsC5C5pNL0oOVkPVvZCCwYQapGqHDtAE8YiBI96G
         v0KwCe2xT9O698Y7pKi08gPwL/uTPrVePifrzdPjjhYHKqIdZ9tuMLE+mOGQimJtgfFD
         qNgyRThHIHmUUj8Fk8zH4ZbDJOGjJM72cOKQ5nhJocTzeDxgT/upQ5q4tfUvymfOKlpp
         UmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8dWkUEjNkAWUFS7smY/S53tLlwVSBp7wKC32dkhYG8Q=;
        b=pqH9rHX9zq3s6DOUjqguUf7jhx8uo8gWiyOUElY3foWhjnGS+H2FHoM3vax0oKpv9o
         CQE62CGwr9XcTpkGf7L3+TjKaO7nNnbDKUAzL8EoctjKFU1nxhd+88fYRFatnVEqOw7F
         ELPB4cbfh0Tx9InQ+ovZC3ZXx/1+WGXGVgN9yvpqFSDdiZi8xNDb9QN7G6OFODVR6rJE
         UNYe3tNXbw+dtVVzb7GzJxk588qym+3JJTJSBLYTgi2riZeBfrp45+7bivy6dNF9ltjK
         UG0URihhi8c/JYoSsaqEYbxem3uMBrPRP0thWQ8fygN0wCQecHokhfILHsqlE9HN5Ifq
         5E6g==
X-Gm-Message-State: AOAM533ADq/rt1aIpGGVyPCGKNprLnIkQ0tYpK/nGmn1dXnn8b2T74kE
	bb/ZoMaZMx0iN8ttWJUpsos=
X-Google-Smtp-Source: ABdhPJx/CscenNT1ExkPo7OuH35JOivO8iq9aisapt+v7XWY9tfzA1FcSYNfekhrI6nxkmY8aHw7RQ==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr7173902lfu.194.1630875138503;
        Sun, 05 Sep 2021 13:52:18 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id o10sm558817lfb.173.2021.09.05.13.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 13:52:18 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] staging: r8188eu: fix type mismacth
Date: Sun,  5 Sep 2021 23:52:16 +0300
Message-Id: <20210905205216.24831-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smatch says:
rtw_cmd.c:1165 rtw_setassocsta_cmd() warn: struct type mismatch 'set_stakey_rsp vs set_assocsta_rsp'

Since psetassocsta_rsp has struct set_stakey_rsp * type, it looks like
copy-paste failure. This error didn't cause any bugs, because
sizeof(struct set_assocsta_parm) > sizeof(struct set_stakey_rsp), but
there is no reason for allocation extra unused memory

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index fee4208dacba..afe6c7fa594d 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1162,7 +1162,7 @@ u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
 		goto exit;
 	}
 
-	psetassocsta_rsp = kzalloc(sizeof(struct set_assocsta_rsp), GFP_ATOMIC);
+	psetassocsta_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_ATOMIC);
 	if (!psetassocsta_rsp) {
 		kfree(ph2c);
 		kfree(psetassocsta_para);
-- 
2.33.0

