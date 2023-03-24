Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B22771E;
	Fri, 24 Mar 2023 22:23:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m2so3167783wrh.6;
        Fri, 24 Mar 2023 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679696591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=MNRkhKNj3sCbgwRJ2yk7v83fdoOZzPzi7W1TlyCg/FV/FgxtRzX5LdHt+55AOxxeoY
         RfsJIWeRfky8/gjKUWlrN3WDFf7YM7HRhKLf5KcJuiUkxSJw69ru4j2pSMN5liSJeRKA
         jJlsh92Qgw6IQvaitVCdaBGiDHm+j8v6j9MtK18ZeGwCtdPeLoxeVww99zEQ7lFj/deL
         hKh2etKpl1hn9mrJ6rE7uQ/rxUU7voDSMgvZlVac8vZ+Xnw4O7ky93HpGtP6UPpDy4sV
         0Jus34STl0t/RJDE6SWs4W2aEU6WecwKLpybGGZbWvqMVCWpX5ngE4NlskEKOBkQDd6E
         AKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679696591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=Hz6NyJEKtikeWrLBy8EYJs82AAN5QG6ExeFzdjGOjNglVS3G/J/5s8CjsLDUgixWmn
         /SNeTxKndPO6UilViVXq2p0I3b1B0iZHhtC+xvjC1gwyZVwX0QxnKVqCf7w/qU9lc/RK
         0Y4wywOqfYZznC279Gr29pTyTSCeSSzxUjylOkE9Y1XLAhfH9M+XVKHtiQUuu5RdYj/X
         9gy/HDZAcGmwezR9UVpWf+nOWNi/0pbN38FoliAUPGoYinFzQwzEOqehpg6ddRvim70T
         pvZY70gIWJRa7ZGPo5JCqAT2mKtF6BFoRg19r5VgL1/frCfiu/SMeh1OCawFoXSlwdhn
         w5jA==
X-Gm-Message-State: AAQBX9cp8HdCwxF4+aF7jyw0H1hGxEbRsAZ6LpsfkiH4riFiCMnFZVUG
	/7hPjFlqZeFwKzhnhG7vTS0StA+6AxAgaA==
X-Google-Smtp-Source: AKy350auIia6rlBSSZzQmAltG5DNbQIKt9Tm+UVIwJdWlFQXMIL7G7CMik6v1hRBMdmZIfuouNNvAA==
X-Received: by 2002:a5d:4535:0:b0:2ce:a7a7:b8b4 with SMTP id j21-20020a5d4535000000b002cea7a7b8b4mr3409538wra.35.1679696591084;
        Fri, 24 Mar 2023 15:23:11 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm19161446wrq.16.2023.03.24.15.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:23:10 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] staging: rtl8192e: add blank lines after declarations
Date: Sat, 25 Mar 2023 03:23:02 +0500
Message-Id: <d8a5e738046ffdc1b257e1935eacb8e16af34d5e.1679696291.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679696291.git.kamrankhadijadj@gmail.com>
References: <cover.1679696291.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines after declarations to adhere to the Linux kernel
coding-style guidelines. These issues are reported by checkpatch.pl

"CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c6114d99829b..7144a0630ea6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -231,10 +231,12 @@ rtllib_rx_frame_mgmt(struct rtllib_device *ieee, struct sk_buff *skb,
 static unsigned char rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
+
 /* Bridge-Tunnel header (for EtherTypes ETH_P_AARP and ETH_P_IPX) */
 static unsigned char bridge_tunnel_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0xf8
 };
+
 /* No encapsulation header if EtherType < 0x600 (=length) */
 
 /* Called by rtllib_rx_frame_decrypt */
-- 
2.34.1

