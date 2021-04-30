Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128342F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:21 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id f24so5274079ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=qLuVph+PcXo+KZrNAROdoyGE2e5zsOk+PMtlgwGWITrVbTwIMh5HwZQmDoszPecVYF
         nvoo+0AKTnBTgGUDNUNEaY1tK7/ToXARsw93DFJ8Qh2+0yQqw7Eso5QOJnKMFWk229t1
         TLiTMOGcBGVCuPnanm8xkwmK1ieB8rLzPU1Ao9I8vU6o8r4ybq1RBQPLHfyhxXNvg5I0
         zd4EThU1ZCRJY9DJUT5DGy23DmGKHBb5OHplD06QfU6DoOEuY2MNWgpYX8LbkRMm99Bt
         Q1J1HWEaJntaRO8OL03sm92OqqOKO3daEqYHIX7iGhjTs38edo1QhZ55qFHBxl7+dCcY
         kMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=VT7Ie0RwNPlzU6b/hXJRRGsvGoi2fgWNx6Q2L6Nu5C9PSggBs2Ctze05j7hEl5MRyK
         JumLHxrEahyyFdPwwlvC+Rd9Gc6Zvr79rLCNiqP6ZuJwU59F7Ib2d3b8MwIngD5zKQY3
         O8xL+z+W4ii8/6RGRQ3FR3begtY1bO67U8Z9qRJLK1wRLO9luKA4tqfzWE/Dqoxoc9NZ
         qm+OQMfMoJ4qJ3ne3/2d9l6RNschlT50Tx+L4q24KHBMTA5hJ8KnO75StRgD43jnLkvV
         v/rixyZvr5z7bSllwN1dAfpnt+tYxBFVIFNHzEcgFOv92Qa/w6ZwPnjuH4OtP0fTqbqB
         89vg==
X-Gm-Message-State: AOAM533cZEf9NmVjK5x74+fmAho0QRNJO9+piL05uBqdJUF19uVe7VOB
	cxTY78QoNScTVbmvbyp3ohY=
X-Google-Smtp-Source: ABdhPJweM32GDcWIwAV1MVg4bHw7432Bm2PzfYb4i3k2yKt/1C3EuN7JN2Nd/pWCXxidBcvq0phB7Q==
X-Received: by 2002:a17:906:7209:: with SMTP id m9mr2842854ejk.223.1619768659735;
        Fri, 30 Apr 2021 00:44:19 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id b8sm663743edu.41.2021.04.30.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/43] staging: rtl8723bs: replace ODM_RT_ASSERT with netdev_dbg()
Date: Fri, 30 Apr 2021 09:43:27 +0200
Message-Id: <6439b25d986369de899c5770390cb3e9fdd9e2dd.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace ODM_RT_ASSERT with netdev dbg.

Marco ODM_RT_ASSERT wraps a raw prink and prints a message
everytime second argument is false. This occurrence prints
always, so replace it with netdev_dbg()

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 0027ce211619..fcd3f97e7df5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -552,7 +552,8 @@ bool ODM_RAStateCheck(
 		break;
 
 	default:
-		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
+		netdev_dbg(pDM_Odm->Adapter->pnetdev,
+			   "wrong rssi level setting %d !", *pRATRState);
 		break;
 	}
 
-- 
2.20.1

