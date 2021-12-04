Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978C2C9D
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 11:35:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r25so22108536edq.7
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2R0orPglkc/iYke1YrfwxBgDd6DiAIV0f2a8XXmni4=;
        b=Z6xyFcHRMe7fS0uKkQjJLvUlqdakl4vneZpTnP46Z8P9NziSx3xfA2jD2o9aQ5eqL4
         j/yAltV0+wSVjCXFg8qgza4l6X0i3+GQowTrE3uECYPrjbxcr0XCrOA4PAls37QdDI19
         CzX78x9Hkcxb3WUiWzDSiQMaNu4n3PKxW2luN/+ePE6fIZwy0UY+Im+cLxLVI5CZKrCr
         HYGPVhzIw+Pot+PF/joHi9yI3GPSgu1bVvzVymUrht7F1SB+XDXChk5RLSC/jDqVY61a
         XxknRJ1zsimNARAal4fvwLCz7WWDx0C6PkrRn2Oq87Ra/AJ10gIlLacA+aYXAoRXOdRH
         m1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2R0orPglkc/iYke1YrfwxBgDd6DiAIV0f2a8XXmni4=;
        b=xSIToXbo+AN7I7fMNSPoSMno0ftESQV2SCUxyKVHDdT8XVxHBoaTMunlAYDR1o46Pv
         vC2iZJHD0i3Zyrac8+Lqj3Sv/I+pZG36TeAMzUueTj54r1jjfofleNMDXVjgSBv0ptWc
         ybhRs8v2DOiHJ3Qt7qmIx4n655pSjfbXfodO1RopAUPuCB4Nn0qY5nkh2ZyQ5esfN8Ms
         nhc5EWzwR3U1ddO7ZjJMge+tlmmrXd1yTrobWaLu6JiQHH6hg9jQw82z8LJ9PpF9d6rU
         jyMIYr37XWmhlyAhoKW81DHKgWrq0yass4gAtf3WL8Yf64dzCXjRO9tjBuIuBGQ/utMn
         2mzw==
X-Gm-Message-State: AOAM532vsAVBwfmrJxOGmnisum0t+tgEOZqwgwyd6ayqQ5WuKv3z74/g
	uMQfBoQFeIU7t5d3te2HYtc=
X-Google-Smtp-Source: ABdhPJwHxWRE3xt6pWka7RVepmGrrBgBaSNEpnE7EqgwKTpqyxIW0+BEb2jA4w3DhX+fdgsQH34eyw==
X-Received: by 2002:aa7:d5d6:: with SMTP id d22mr34864522eds.364.1638617755845;
        Sat, 04 Dec 2021 03:35:55 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id he17sm3657577ejc.110.2021.12.04.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 03:35:55 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vt6655: remove unused variable byMinChannel
Date: Sat,  4 Dec 2021 12:34:04 +0100
Message-Id: <20211204113407.3941035-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but not used variable byMinChannel.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---

v1 -> v2
- Add Signed-off-by

 drivers/staging/vt6655/device.h      | 1 -
 drivers/staging/vt6655/device_main.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 9e5f060f3784..b2aee3b8bc8d 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -200,7 +200,6 @@ struct vnt_private {
 	unsigned char byTopOFDMBasicRate;
 	unsigned char byTopCCKBasicRate;
 
-	unsigned char byMinChannel;
 	unsigned char byMaxChannel;
 
 	unsigned char preamble_type;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6c5140e29f6b..d008b22cb98a 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -227,8 +227,6 @@ static void device_init_registers(struct vnt_private *priv)
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	/* Get Channel range */
-	priv->byMinChannel = 1;
 	priv->byMaxChannel = CB_MAX_CHANNEL;
 
 	/* Get Antena */
-- 
2.25.1

