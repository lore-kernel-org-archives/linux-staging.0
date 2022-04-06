Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A547E
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 06:19:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x20so1323986edi.12
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnqi2X3VqKcJXFMBrImVZdG4X888h8cJCwQ8yMk/hyQ=;
        b=EJMyMYzIZC1Io2eWJ1YOIP3IOiSYClaGwyinQHYVALb3GKd21ey4O3XwMx8UATe0zC
         uZEH4Uvxhh5tQFk1B3db2jaD9FxYVSvlMOuVICWR7fkXm1wxcAZJck9tiEyDnR89drM9
         vAn4cK/rDfxeYMiOMLo+jzy4quD3/r56fXmSsjUwHN6iyqOU6xeZUaws6qxeDnk7aSAe
         vU4supMeCkcH/s7uuvDPAILaxv4M1vYRsatV6jM9wm4EOmyLFGqVGAGRlBkX9Qy8N2Pw
         fBAjNPMng5rAMs7OEwaPhxIjwHEo7FhHpoh8ak7crnkuD6/b8dt6iT/lCnsfeVVuiYYH
         cUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnqi2X3VqKcJXFMBrImVZdG4X888h8cJCwQ8yMk/hyQ=;
        b=lXfvvj/gQjrDig41D8JQQE9vDBANWMTGfS6vXLLaX+J+pI9gZV/gJRdscoRvaYMV7D
         gHoldg5NLuKgDe72aJWzJBYwpRoqYYvCBrDtW9uJAnJr72zrVK+/wGdFL8ACiePMX0YS
         KgoL00BgETB1NxOSkweEdmNWqkC3GMVrXFS/Uh/gktJAvreNJd32Z0BbgH0RL3Bzq1F3
         c5/3hgAz0qZPxs2xqdHt6PhfPsWpKhM9GtNebGxktLrSFr87MQ0YZcIIt2AeUJlgS9Yr
         jLFbfabno9q6OKic2jKJt3kmhnU4AP/JstlgHkC0LQUUKI36F8MCxJU8SjD/lI5qB0OU
         cdow==
X-Gm-Message-State: AOAM532CIzmnYm7AtII80mE4yara5VEyJ211x7HBCfuh+3XvjLVxhhYU
	VqTeqmx/KUcaMawTyWJ+YDg=
X-Google-Smtp-Source: ABdhPJyqAXpogB2imN4UMPk+9i4abNKV4LekV/pZO+b6CjE5Firicrj3bqXI4+6oKiZF8Yt44obGOA==
X-Received: by 2002:a05:6402:1d55:b0:419:992b:9286 with SMTP id dz21-20020a0564021d5500b00419992b9286mr7158021edb.235.1649225955363;
        Tue, 05 Apr 2022 23:19:15 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm2475251edj.27.2022.04.05.23.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 23:19:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: use round_up() instead of _RND128()
Date: Wed,  6 Apr 2022 08:18:58 +0200
Message-Id: <20220406061859.9011-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406061859.9011-1-straube.linux@gmail.com>
References: <20220406061859.9011-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND128().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6a65dcf57112..d5e674542a78 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -287,7 +287,7 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 
 		recvframe_put(precvframe, skb_len);
 
-		pkt_offset = (u16)_RND128(pkt_offset);
+		pkt_offset = (u16)round_up(pkt_offset, 128);
 
 		if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
 			if (pattrib->physt)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index ff44c4a37b9d..f6c55f6c9e1a 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND128(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 7) + ((sz & 127) ? 1: 0)) << 7;
-	return val;
-}
-
 static inline u32 _RND256(u32 sz)
 {
 	u32	val;
-- 
2.35.1

