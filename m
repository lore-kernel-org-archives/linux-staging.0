Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2A7B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:42:54 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id cv13so5743835pjb.4
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5yhbMYbX4HtRbzfEZJFo8LMvIa5s7zM2myB/V/KkweM=;
        b=Yy/mGjXKRM7R5k3PY1YFCGE0du4sujyFxeyANLLNCMTtbH+D1CVDSswsskmtK+2a/p
         CSXJAYS+qcRgqAkaJJQzi5RhFrbmGgmJgyvpIKzpT0b3CyFId/bpE2aKxRY0kzoP60ht
         PVbiE9Uq17Q40A3LJOFPb+PlphuYJkVXMjfQUDwKxkOOjpzyaeP/jyJ2LnlkIc5OmAGW
         gqegbLrPTZxaGRf4mxCKcWv+14YVoLqkZDQhexsuX6UM6ayn9Y2i/QzRINuMhP24x0bH
         VjptmHic8Vin1k4LoyHZpDwYakw44xBlJuEFM+TsXXHBgtpV2gh+K+pN/HTNH0xDEJHa
         hbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5yhbMYbX4HtRbzfEZJFo8LMvIa5s7zM2myB/V/KkweM=;
        b=g2duTV5lyzhoXNL1mQsnhUVINhYa50sZbN3qPYMJYZVnboUZhUdM0X/96/2UBXs5Kp
         19J7EaTVWi1Db/rmQEBzGLxOOw/EfrGBtR7MauOOTi6hI9oFe3Y0T4lFonJTDla3BaRQ
         hEsSv1RgfPDUCMGdKaraAQ9Zou6zqleVJUBZi54fqUNkOcpTd2rrc5duEj/G0+crJbeh
         kwl8wp7pdBcaCEQXdG2aYjMk6WFFbi9RljmqEWOsnvYz40QloPnNdy503RqSNSnrMXwC
         0+i8jgfimeoDH+8yDk/VGhK3DljisqY44+aRRUk0X3izCparZhykBS3/uMUZAw8oj1FL
         um+w==
X-Gm-Message-State: AJIora8I0pH0HEISD9+7Sxe+GsMO8cF2nno9WurX7mP0sllwguemLR85
	gT4nF7k0o6Jbnqr98rhYnCwF0qYwxIxqpS7G
X-Google-Smtp-Source: AGRyM1vQ72ZXZU1v51U4BZ0gIX1RMl7fcXKPbeGXpZBkq5C5G/h3PY58XOL60Q4LLgg5AKHC6zEMAg==
X-Received: by 2002:a17:90b:4c07:b0:1e8:2961:e318 with SMTP id na7-20020a17090b4c0700b001e82961e318mr22787751pjb.151.1655667774538;
        Sun, 19 Jun 2022 12:42:54 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id p12-20020a637f4c000000b003fc4001fd5fsm7483584pgn.10.2022.06.19.12.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:54 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 2/5] Staging: r8188eu: core: rtw_xmit: Fixed two indentation coding style issues.
Date: Sun, 19 Jun 2022 12:42:28 -0700
Message-Id: <6b0e3efe83bf06ea60cdbe27f31f6f3aa1058f01.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655666628.git.marcus.yu.56@gmail.com>
References: <cover.1655666628.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed two indentation issues.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 1aa284453ab2..2bc059808a71 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -626,7 +626,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[24], 6);
 				else
-				rtw_secmicappend(&micdata, &pframe[10], 6);
+					rtw_secmicappend(&micdata, &pframe[10], 6);
 			} else {	/* ToDS == 0 */
 				rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
 				if (pframe[1] & 2)  /* From Ds == 1 */
@@ -1737,7 +1737,7 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
 	bool bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
-	    return ret;
+		return ret;
 
 	if (pattrib->psta)
 		psta = pattrib->psta;
-- 
2.36.1

