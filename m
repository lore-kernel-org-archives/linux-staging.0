Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CAD7C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:25 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id k29so9515836pgm.12
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oyv6GRijgI6ZlQEYxlfZHmDpqpNucWtnXIaYxQpviek=;
        b=gpE6EbIka79YAOkWw/HkIZ4o/eLh5qUEEfeLWfx4F3l9r6mNubqOGbe4OHMTsYlUG5
         kwdGKktCdxXTwJBgn0kXcbkm9QZJVYHZnnJe7sLGfqVgEZKykmPwjgQZbjt4YwK+SS5E
         cjt1C9smys6T2aErJJyQG6C2uEBVvmuEzBJml88xWcFCYEru3agIiVxoj5p8lXmBceWv
         3mkbuiZ2Ou41Vu9McGHMOgI7Atrj6Yui8qxFsJcw8SogNA/hdSiiOvZyKY3NyIuIhDGb
         kmSyoNDq7jx1taFe58HH329FlIjILfM/lv3zjCT2V9spneUSlmFoBlmsc+TkBK+YBR9J
         C+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oyv6GRijgI6ZlQEYxlfZHmDpqpNucWtnXIaYxQpviek=;
        b=TCFcXXny/zPsSmGzi4WqUGuOisgQd/hqSv2J60gdUumm9sj2vxBoNzze5Iwpeu1Xxm
         8EcMqz9CdcrFgWlqceHhPZeSx6jMiOrbZtpsGpjFJqVdx4ZKZ2GueB/adTJ2AnQp+TgU
         AA4quHSHEZ69wJX8IiEo+EKMsdOWBGNln+EYzCuehRVYCLqS6LJ3Yzma3TXCOk0Z3mJT
         GP597C5hXMAEJGWNHsV+e5nDz8cYruuYjuRNsJRFtO3M8KZi0apQKmVet8PE4foRpX2f
         W1m7c7u+ay9TQpr0MNlFqkQzxhusMJDpIrtTAD3izEfJrKQhWvnphaf2qnvh/dmDU9pa
         GhiA==
X-Gm-Message-State: AOAM5305L/gMudIaJHM14ETNN89Bz1QeHho5XURT7ScwRU3krc2lH2vh
	+uLdZNNxb59BhMFJRJ++IO0=
X-Google-Smtp-Source: ABdhPJyFcHs6ZfXij+Hc0XU13+ZgJuibRmhSOeNb5WawPnZnK/GODXcAy7louFq1siZa+3VxSDonpQ==
X-Received: by 2002:a63:5648:0:b0:398:dfcf:c9c6 with SMTP id g8-20020a635648000000b00398dfcfc9c6mr7875249pgm.0.1650718944637;
        Sat, 23 Apr 2022 06:02:24 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:24 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 5/7] staging: rtl8192e: Remove unnecessary u16 argument cast
Date: Sat, 23 Apr 2022 21:01:48 +0800
Message-Id: <20220423130150.161903-6-wjsota@gmail.com>
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

Remove the explicit u16 casts for u16 argument in the function call. This
function has declared its parameter to be of type u16, so the argument
given to that parameter will be automatically coerced to u16. Therefore,
an explicit cast is unnecessary.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index b7bdbd895e7b..f92551094738 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -929,7 +929,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 				break;
 			case CmdID_WritePortUshort:
 				rtl92e_writew(dev, CurrentCmd->Para1,
-					      (u16)CurrentCmd->Para2);
+					      CurrentCmd->Para2);
 				break;
 			case CmdID_WritePortUchar:
 				rtl92e_writeb(dev, CurrentCmd->Para1,
-- 
2.36.0

