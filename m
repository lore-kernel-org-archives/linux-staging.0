Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC126D09
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 22:16:31 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l76so2448743pga.6
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 15:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=y67WIBj6mBIl1Wp751rFrF2l12F5d/MqUqEWEaYV53g=;
        b=fx4VPA8okP1oGSngsHs6mosUQnkJAtCA714LP1AnHVisvlJU8j9EPH/uLeUyyUf6nm
         IDednCvGELB9CILV3BLreT7bkDSWjFVQDLDwOMooydNk4buy+7SHNFDu82K+8gdWCjeK
         deKseZF5AEhl+6K/LBB9TWtQ4VaPneXHqxTaEQiwig8pohu3jQ6rqeztqd99rLDEVHKv
         vDmwn22KLVtcg40L/ufqBGNDF/0InCi+IVWlbbt+Y2mE0IBj/iWZ0JyZZFx6E4osSjWf
         7n69PGzjlHtVcSRjR8LXFGJYNm5Dsw7YQDb2g+TGAyNqwBNc/S9XGaUDsAK1qZwnT/TI
         bItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=y67WIBj6mBIl1Wp751rFrF2l12F5d/MqUqEWEaYV53g=;
        b=XmwgpsFQDcQaD+z6fKsSWUQGQ4LpQ5SzKdh365ggBQ3ZB8g11i9gQuQ13xC+JiVsnj
         vpCBvnFOUgi1Jtfdimzg9FYmtJnsdhXJa8WKLzQF1VvzqXfs7PRYNklwt9VNeNqJCczg
         sKhqkvutOpBv836A9wPPJIeqCsDe3syyUeSgKDLv7bdcGBP8TjunAF2NlYbExlDrz8kY
         2BRjsPLmnWE5N5120rzIyau4En7G3IERwd9Oh/IjW++Gvc8DtVvth/VicrrMe9PaZQ95
         D5Ut7WIoWZQ9qurs5n6gmmjTqJixZWJKpsSI4GS5PqwMNiZlw3qydFy3psxZ6pmDkcZI
         H1tg==
X-Gm-Message-State: AOAM531tX71JvAr8CDL5mLm5+zVJVFR/D3xd30Qpg1Z2aVcY50Ljxr3X
	FHk+wy9Bvug/an3dlhv34C1ejDNg8Kc3ng==
X-Google-Smtp-Source: ABdhPJy/K6Tbq0lKal/Vqh26SB57XMZpH865zhinWyBVMsuQ7m0t+aQTweKMi6fL4v2ny+wakjb7yw==
X-Received: by 2002:a62:cd4d:0:b029:216:8c86:bf5c with SMTP id o74-20020a62cd4d0000b02902168c86bf5cmr9173867pfg.27.1617315391559;
        Thu, 01 Apr 2021 15:16:31 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d13sm6671494pgb.6.2021.04.01.15.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:16:31 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 3/3] staging: rtl8723bs: core: remove empty comment
Date: Thu,  1 Apr 2021 15:15:42 -0700
Message-Id: <afe3c8846c555e1852ae1a760b73a19daaf1dc82.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove empty comment because it provides no information.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 428c71ce0334..7b4c0f22cd90 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -876,8 +876,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 					*(payload+curfragnum), *(payload+curfragnum+1), *(payload+curfragnum+2), *(payload+curfragnum+3),
 					*(payload+curfragnum+4), *(payload+curfragnum+5), *(payload+curfragnum+6), *(payload+curfragnum+7)));
 			}
-/*
-*/
 	}
 	return _SUCCESS;
 }
-- 
2.17.1

