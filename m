Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F83FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 11:10:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q11so3228714wrr.9
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 04:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xIc1TJKHNDEJugEawqGLzpfqg8jZCQtvA5lcl+ms/bs=;
        b=aNjYYj74+RVXOjZ9dW1QZCH74cAHh2U51k76impL+mU/pwsuC8fe2WH6raDVC23pR2
         g+8esSPhgsTI5uSEsqPfz8hG8bsnuGQUss0KSlh5a27u7IIbYPDrmAL6eGU1EWx1/e/J
         toLIeryRlb5Am1/Mrqw716B24yCB0+Aecmxf6WlKf63fWTDbXbuXwxMU3apbk6Pv1LsQ
         w0gDpPnmpKm0woPsF/p+E9pry91sKpEabMMd75c7xnZPg0PrLfGwgoAl7JyoRB5YgLMt
         e3SkIyDB3yBOPCBf8GylebP+sui/gTDY+E7mc2IX/Tck3xlqH8AyMnAn7fGVxpjGv64s
         eWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xIc1TJKHNDEJugEawqGLzpfqg8jZCQtvA5lcl+ms/bs=;
        b=lXaHVPcPOdFwtOj6hUXYjLkWXZuUvziWWnynMkJ0rnBmTspfIlFoTBsVl+uJjfnKvT
         s4XpyhzhRImd6e2V9l3v6RaGhGGWod3UlSwwXam8BZ1qD2Vy5COtlx6rjVg4+VMojJoe
         BJD5m3XxgMymxTfm4V9weSX3oyWw8xkZ/TMYoAZupG86JWBE/ttA7uIppDJr/hnV0MLW
         bjiDbBf3okvC0ttwD1tJrHoyNdbYjRlgBXDEYkYOClps1TMR7WXjcXhDT1YeyOtrke3Q
         v++T5QBB9RTU5qnOXIvHdiIDg6EeKLk4bP26bBLjsK/Mc+wdaS+DHPIXlCl6CFM2X3V4
         +/pw==
X-Gm-Message-State: AOAM531IPWhqtQYI76JT+yZJg+2YmJ9OP3QTYW3zK3Ssn4/TYIsQ0OFR
	Mq8iXmpbhif1nZrRMaZ4I1M=
X-Google-Smtp-Source: ABdhPJxDjtNyLzCmH1TUvW34PN2loF452WiHb4Z4GMGhu8CATYErY0AG+BqWisUW7g+cT7v7a8Pcqw==
X-Received: by 2002:adf:e108:: with SMTP id t8mr4343594wrz.84.1631704214902;
        Wed, 15 Sep 2021 04:10:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id c23sm3955702wmb.37.2021.09.15.04.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 04:10:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused enum odm_bt_coexist
Date: Wed, 15 Sep 2021 13:09:58 +0200
Message-Id: <20210915110958.17743-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused enum odm_bt_coexist.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index c6e876f5d470..4fee0e9e0df3 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -514,13 +514,6 @@ enum odm_mac_phy_mode {
 	ODM_DMDP	= 2,
 };
 
-enum odm_bt_coexist {
-	ODM_BT_BUSY		= 1,
-	ODM_BT_ON		= 2,
-	ODM_BT_OFF		= 3,
-	ODM_BT_NONE		= 4,
-};
-
 /*  ODM_CMNINFO_OP_MODE */
 enum odm_operation_mode {
 	ODM_NO_LINK		= BIT(0),
-- 
2.33.0

