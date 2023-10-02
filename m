Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CA1DA38
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9b2d64c9307so133398466b.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269203; x=1696874003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VI395aHYezAAbuS4rsTYZYM/myZs8mb+8AgHT/E9XGc=;
        b=S2U+KF0FDPGy0IbNo6PZFktTNNVxiBYgJLN1fWSXz3v+mugsighZyVWyihUgQ1+6Es
         djPy6DEZv8NEXWfYvVG3ph+bnfFE75TZBaNH9S9Y6g0SieOgGL9N5v2r99gY8wqp1QnS
         Mo/L6q/xNJWoQQPcwhooJwdlVLXBa+6cUSC0+vsm8OlMJQ6MrqG+ELfPcb3w2N19k5np
         scO6kuJNlvPJvJ0oVoeUttlzmp9VvzJtXP1X7ignrDzjyeAo6DlJsJLGhW9XD45Khb/e
         8cwdXbhtv21HkCTKrGTvoMF347ROFuc0AhCjp+cXIeMe7qRE7B/aqQp6b+Tqahtf0vgs
         EhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269203; x=1696874003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI395aHYezAAbuS4rsTYZYM/myZs8mb+8AgHT/E9XGc=;
        b=UN9ST1CKOQHL0gp1zoS7NQOrESCbKmbnpVV1eWIwsXXJ9i+RfWc03DB0PsTnjoPq1Q
         WlhiWfmrrgTA8f1dr3hEYX9H6/GJTqEZ3ETDOEqr7rMN7194dQhNkNTyx+Gw5/+eehtN
         8i84urs9DPjSpKqA1sExAOBgtMtygF1nD+wbxtTJC7KwgMdEQra0e5FBobxa0Dg2khwF
         oBQqopQVX2DVxE4AMr49tlRo4NcZczcAgzDPhx+i/9G3Y5Jv6XRvhrJwgWYCsNvpdh41
         Ug2hcCQaFISA2NFr/249O7Ldk4GGzKnIC1AJaPVijpwwjINsT9ERIDCllv+kytCOr5bu
         +4mQ==
X-Gm-Message-State: AOJu0YwGJ7e3agqzHI6Cpo2B17kbnM17jY3lj/qnU0k4uihQ/giGDAQO
	zaWp0nRlXjjyl8ByG9Vil7U=
X-Google-Smtp-Source: AGHT+IEl/lVkCLAPFxOzKUeloban6aKu5e6isDsY2DdbnoFz+c28BYtHiO0zeXm1LstVsjSB03+6Pg==
X-Received: by 2002:a17:906:104e:b0:9b2:bf2d:6b66 with SMTP id j14-20020a170906104e00b009b2bf2d6b66mr9954680ejj.7.1696269202530;
        Mon, 02 Oct 2023 10:53:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id dt18-20020a170906b79200b0099bcf9c2ec6sm17247780ejb.75.2023.10.02.10.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:22 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:20 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8192e: Remove unused function
 rtl92e_cam_restore()
Message-ID: <4375f7909fe717555adca1338506fb6d4dad142e.1696266964.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

rtl92e_cam_restore() is unused. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 63 ---------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h |  1 -
 2 files changed, 64 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 14b48cacfbbd..9b280cee0ac1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -121,66 +121,3 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		}
 	}
 }
-
-void rtl92e_cam_restore(struct net_device *dev)
-{
-	u8 EntryId = 0;
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u8 *MacAddr = priv->rtllib->current_network.bssid;
-
-	static u8	CAM_CONST_ADDR[4][6] = {
-		{0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
-		{0x00, 0x00, 0x00, 0x00, 0x00, 0x01},
-		{0x00, 0x00, 0x00, 0x00, 0x00, 0x02},
-		{0x00, 0x00, 0x00, 0x00, 0x00, 0x03}
-	};
-	static u8	CAM_CONST_BROAD[] = {
-		0xff, 0xff, 0xff, 0xff, 0xff, 0xff
-	};
-
-	if ((priv->rtllib->pairwise_key_type == KEY_TYPE_WEP40) ||
-	    (priv->rtllib->pairwise_key_type == KEY_TYPE_WEP104)) {
-		for (EntryId = 0; EntryId < 4; EntryId++) {
-			MacAddr = CAM_CONST_ADDR[EntryId];
-			if (priv->rtllib->swcamtable[EntryId].bused) {
-				rtl92e_set_key(dev, EntryId, EntryId,
-					       priv->rtllib->pairwise_key_type,
-					       MacAddr, 0,
-					       (u32 *)(&priv->rtllib->swcamtable
-						       [EntryId].key_buf[0]));
-			}
-		}
-
-	} else if (priv->rtllib->pairwise_key_type == KEY_TYPE_TKIP) {
-		rtl92e_set_key(dev, 4, 0,
-			       priv->rtllib->pairwise_key_type,
-			       MacAddr, 0,
-			       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-	} else if (priv->rtllib->pairwise_key_type == KEY_TYPE_CCMP) {
-		rtl92e_set_key(dev, 4, 0,
-			       priv->rtllib->pairwise_key_type, MacAddr,
-			       0, (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-	}
-
-	if (priv->rtllib->group_key_type == KEY_TYPE_TKIP) {
-		MacAddr = CAM_CONST_BROAD;
-		for (EntryId = 1; EntryId < 4; EntryId++) {
-			if (priv->rtllib->swcamtable[EntryId].bused) {
-				rtl92e_set_key(dev, EntryId, EntryId,
-					       priv->rtllib->group_key_type,
-					       MacAddr, 0,
-					       (u32 *)(&priv->rtllib->swcamtable[EntryId].key_buf[0]));
-			}
-		}
-	} else if (priv->rtllib->group_key_type == KEY_TYPE_CCMP) {
-		MacAddr = CAM_CONST_BROAD;
-		for (EntryId = 1; EntryId < 4; EntryId++) {
-			if (priv->rtllib->swcamtable[EntryId].bused) {
-				rtl92e_set_key(dev, EntryId, EntryId,
-					       priv->rtllib->group_key_type,
-					       MacAddr, 0,
-					       (u32 *)(&priv->rtllib->swcamtable[EntryId].key_buf[0]));
-			}
-		}
-	}
-}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index bd33ef105107..615b84bca9b8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -20,6 +20,5 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		    u32 *KeyContent);
 void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		      u16 KeyType, const u8 *MacAddr, u32 *KeyContent);
-void rtl92e_cam_restore(struct net_device *dev);
 
 #endif
-- 
2.42.0

