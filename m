Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBA2C85
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 12:51:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id f8so26370708edy.4
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AqcWsB4FWsDe7NHoJQPl1nKY3ysaIWoyuuUKqbGAI8g=;
        b=CGTzDM9jGaDPHLfAnk9OIMgJvsYI08RYQRlKSxhkK+hUHiq4bD5eI6XTMEuihoNyBu
         ozm0BjTSpSoOT0ayGav+MvR28cmd02/cO9mNte5LpnFlJMa14KJTRZqnveH2wNWhPthZ
         WgLWHPocrPEFIejK1WcCsmMQXp7NXhSjnbZrrU9A8BtoAgvORtrvODUkx3U4A7CP5xez
         77qiO6Fnv7MsBhMyOjsU5PPIaK0QheQSOGRCjRcc90BKGsp2JtRiGxeok8/5Uzjp82uU
         hgNV/oajUJq5ML0Zeun6HvF+8hXDCjCW0N3pvAdpreCiYz5/G/wW/iCTSu9pUcIxAaoG
         BOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AqcWsB4FWsDe7NHoJQPl1nKY3ysaIWoyuuUKqbGAI8g=;
        b=wSPBm62B1vbWlPd4ADor2Am5mWPdnBZmGLT88vZ7hviapphlmbWeI6JcX5pywFSlaH
         LBXH9Wo0B6KCaSRuNjKzP08H3kt6XnNkrtLLEEM1qt0vtSIfY0KeL8s0mifiH1upBPVE
         RFzIDKrgg2ynyM3EojAk8Z+n5jK7x5nJDyQlNIl7wo9iob+nAR6kg9bzS9bcaV+Rx0VQ
         Ncqhm8FgZjD/ni29c+92vEfFF7kuqiQxqLglcOlg8NoBDKz0kX4nIwDC0+qujcVHW6KC
         J2b+7vB26fZRooWoUmrdTj81uyA2OoxWZi2jtYyMbaxBTZybuen1TP2+TDY2yVxWpEEP
         dtuw==
X-Gm-Message-State: AOAM532pstLIL/pRCOQwKDBfp42WhcrTnQaEPpXYmDfUEiY0vTmcH5IC
	ynX9eZ/v23olXEX6/EGYTQps4kBjZGc6kyWB
X-Google-Smtp-Source: ABdhPJzLihhoOFX+jA21xDRaW1ENtZi2ONgmvcvVZ9XbNHcnXxUFyKWux6LA1mm3qWXFnzzdPfD8DQ==
X-Received: by 2002:a05:6402:22d6:: with SMTP id dm22mr22785536edb.67.1635598314137;
        Sat, 30 Oct 2021 05:51:54 -0700 (PDT)
Received: from desktop (mob-5-90-201-67.net.vodafone.it. [5.90.201.67])
        by smtp.gmail.com with ESMTPSA id nb17sm4397335ejc.18.2021.10.30.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 05:51:53 -0700 (PDT)
Date: Sat, 30 Oct 2021 14:51:52 +0200
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Removed unused comments
Message-ID: <YX0/6GzhvIwJlx6n@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed commented-out code pieces that are unnecessary.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/prism2mib.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index 24ba10d6bd0b..fcf8313870af 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -679,16 +679,8 @@ static int prism2mib_priv(struct mibrec *mib,
 					       HFA384x_RID_CNFWPADATA,
 					       (u8 *)&wpa,
 					       sizeof(wpa));
-			/*
-			pstr->len = le16_to_cpu(wpa.datalen);
-			memcpy(pstr->data, wpa.data, pstr->len);
-			*/
 			pstr->len = 0;
 		} else {
-			/*
-			wpa.datalen = cpu_to_le16(pstr->len);
-			memcpy(wpa.data, pstr->data, pstr->len);
-			*/
 			wpa.datalen = 0;
 
 			hfa384x_drvr_setconfig(hw,
-- 
2.30.2

