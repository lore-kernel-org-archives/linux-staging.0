Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8E5F
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 22:48:01 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv19-20020a17090b11d3b029014c516f4eb5so2340678pjb.0
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eQbPmNKd6q5cxqNb392vci+n3O0DxCpP0TsR6lsd/sk=;
        b=OYpvcSH1s7ZZJJ9eOhyf9KT6eNy2WRAjx3+1TjP3yrZ2B09h5QWtkPg/25Nt9dhCyY
         D5U7Ei74aAkuThc5n4u3gIcIhOylM0Li13LtDF2SlKjgMkyuiPThHlYwV5DXFpUgpUDO
         sdSZyYwPb6Y7wJa0mCnR4uPiAXZ5xHM5pioOTqSpCgh3+AGPPsUN0GPSMCisi5KKPqGO
         SJ0eZJeHFiKLYny2x8kqisvmibAns9ki4C8Lu/yZUOgiWk/avpeUDZyx33kQlTo+7wIX
         KxJKBH8BM+ILHQUMtfi5GCUYGSkv3gzl+/JAag/c1bpvnK//MuCTq1G9nc6A5F4wwtrP
         HbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eQbPmNKd6q5cxqNb392vci+n3O0DxCpP0TsR6lsd/sk=;
        b=Jja1MB7Mu1cq7aublWpK0NvAj1hJahV09iMQJA1cOHK3momiS4Jvz62Es33Mk0vOgm
         /tk1y7tA3emvrTro/i41EqJnqmSrJ9RK4Ov9nqBc9eVFRV0z9XJt1ZK64s9FScKIWCu2
         Uhyxn92LalKLAirA09PFCW2xqLlR7xQgnNTQZwW03BzHwtksBVmk8oK8HUPNoZIwAIMv
         2BogRwswgBDjuhm30PePVI6/zmgu0/3HsyK5LuKWgMuzAmM+wnXxzZOYGW81Rq8Bv/dz
         +swtRUkMIsoba8J8nZ+CZ/dzq27nkAJo9MhuHvSjcdGkN5BoIwW29F53VelZsprfO45Z
         V8Aw==
X-Gm-Message-State: AOAM530iAqccyC3wodeV0G/bl7cNfzkY9QV4UybA0vywVTGGr2P/1b54
	q1PJGJY3WVV9VGLPectkpEo=
X-Google-Smtp-Source: ABdhPJy529vGLncdfl+vY4IzTj+IXFhtqKX0Vo9u+NiZYVySjTb+c0modWlY1BS6IL7oDi/Ld7Gyeg==
X-Received: by 2002:a17:903:2284:b029:e7:1490:9c60 with SMTP id b4-20020a1709032284b02900e714909c60mr18300487plh.62.1617490081197;
        Sat, 03 Apr 2021 15:48:01 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id mr5sm11703665pjb.53.2021.04.03.15.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 15:48:00 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	insafonov@gmail.com,
	rahul.blr97@gmail.com,
	anant.thazhemadam@gmail.com,
	suryashankardas.2002@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] staging: rtl8188eu: core: replace spaces with a tab
Date: Sat,  3 Apr 2021 15:47:38 -0700
Message-Id: <20210403224738.28957-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

To conform to Linux kernel coding style, a tab replaces the two spaces
that were previously used to indent brackets.  Identified by the
checkpatch warning: WARNING: please, no spaces at the start of a line.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_security.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index da26a3c705f8..617f89842c81 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -425,9 +425,9 @@ static const unsigned short Sbox1[2][256] = {  /* Sbox for hash (can be in ROM)
 	0x2DB6, 0x3C22, 0x1592, 0xC920, 0x8749, 0xAAFF, 0x5078, 0xA57A,
 	0x038F, 0x59F8, 0x0980, 0x1A17, 0x65DA, 0xD731, 0x84C6, 0xD0B8,
 	0x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
-  },
+	},
 
-  {  /* second half of table is unsigned char-reversed version of first! */
+	{  /* second half of table is unsigned char-reversed version of first! */
 	0xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
 	0x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
 	0x458F, 0x9D1F, 0x4089, 0x87FA, 0x15EF, 0xEBB2, 0xC98E, 0x0BFB,
@@ -460,7 +460,7 @@ static const unsigned short Sbox1[2][256] = {  /* Sbox for hash (can be in ROM)
 	0xB62D, 0x223C, 0x9215, 0x20C9, 0x4987, 0xFFAA, 0x7850, 0x7AA5,
 	0x8F03, 0xF859, 0x8009, 0x171A, 0xDA65, 0x31D7, 0xC684, 0xB8D0,
 	0xC382, 0xB029, 0x775A, 0x111E, 0xCB7B, 0xFCA8, 0xD66D, 0x3A2C,
-  }
+	}
 };
 
 /**
-- 
2.17.1

