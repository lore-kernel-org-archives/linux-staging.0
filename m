Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A11E2C80
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 12:00:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id j21so134861398edt.9
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JOsgRWzbW7i9cHPER6RC1xxIi1+F1LeKK9MgTtvOIbc=;
        b=QtSn3B2MDIOEpYvgNQiyW8retvUbyxi/RO1QbX3BgmBxH8HN3TlJ951662JqAk7qI+
         sVE1qdCN6CLH1rijdX1cVN3IseGdZxWnhPsYjA2SxR2QNuG3ZFw4E3PF6VyuMnbs4+5J
         oUHdaaBPWEFy2M+BnZ3DciyqZnT+AFcySKHIatc2fmelOX9Xbnc+GuMYdPMS/i5Fjhd6
         vHKzQtCsIzijEAHWTb8hhbDdntjm0yItEJW2/hDPfiGdVt3Gn1yXNOcWpch72BzgI2l2
         W9q0QonjruMrUG6S6Jtc9KUY0KoPAXuxywuLZQdZWvWLkm7yfLKUCERw07JDPer6MlAF
         iIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JOsgRWzbW7i9cHPER6RC1xxIi1+F1LeKK9MgTtvOIbc=;
        b=lxveAzcHvL8vuvMzGXOPZ4eiTYPg5GikH1nhL4Yq0A+elvqQ6IAVgwoNbTLnD1ZvD4
         5c7SIU/HngZ+RZsrgsi+mKsg+5lXK4vy5t31ZSp/5aGJR+Q2ZPFmN74aBqUIs4O5CmJP
         0asmTrWTSQ+KgnHUquqPDHaFmxCRcRBPKmUIDaKqiuvkHB6J9VJLw4iMzBmhFvh9lkuX
         q+OBzTxejEXM21EUdb0nrf8uYf6t/e8NKGiibHN0MfetpTTpPQcW2eqJWEXK8ativZiV
         VzSlHlTUgAjBxFAhcGkid1resdkB9iIPvNGLwLHkkLHTSiBFlj2yFxut8Pq99EwXSOgo
         Yukw==
X-Gm-Message-State: AOAM531zdfP+hagUH8Zhmbgm8g9ebuQgdnqd7wvLsvKRx+XzRmRHCoh3
	swJov8urlrQJv3MpQJQUCRs=
X-Google-Smtp-Source: ABdhPJzm2PeqpbDCSS5NKSPL01iO1HxjyW7TgF2/0B4HSTHr3d6qL2jen1XIAI5mXEukP0Hd3DJwvQ==
X-Received: by 2002:a17:907:961c:: with SMTP id gb28mr35344729ejc.385.1641211215689;
        Mon, 03 Jan 2022 04:00:15 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id lg17sm10525191ejb.194.2022.01.03.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 04:00:15 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: add spaces around P2P_AP_P2P_CH_SWITCH_PROCESS_WK
Date: Mon,  3 Jan 2022 12:56:25 +0100
Message-Id: <20220103115633.221853-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove checkpatch.pl error by adding spaces
around P2P_AP_P2P_CH_SWITCH_PROCESS_WK.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 7cbc7015e90f..0b0bd39a257f 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -893,7 +893,7 @@ enum P2P_PROTO_WK_ID {
 	P2P_PRE_TX_PROVDISC_PROCESS_WK = 2,
 	P2P_PRE_TX_NEGOREQ_PROCESS_WK = 3,
 	P2P_PRE_TX_INVITEREQ_PROCESS_WK = 4,
-	P2P_AP_P2P_CH_SWITCH_PROCESS_WK =5,
+	P2P_AP_P2P_CH_SWITCH_PROCESS_WK = 5,
 	P2P_RO_CH_WK = 6,
 };
 
-- 
2.25.1

