Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387453C02
	for <linux-staging@lists.linux.dev>; Sun,  4 Sep 2022 19:25:15 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 78so6352812pgb.13
        for <linux-staging@lists.linux.dev>; Sun, 04 Sep 2022 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=emZNPPVwOPEYtlX5oujYRHUo2IH2LiQXBoAVIF8q5zg=;
        b=kaepJ0W4BxacL0kZ6uRT6GN1grtPahza2D3S0Y9nDBIblRX7LqqRKaCFYX6aX11AjS
         mby8Jh2LEvOln9FNbW7XdBXzqRoUmKVgt9S8l8/32OUuun+mtR/U1mEyqtzIQXZG30pR
         1+2PtRx92nGRi8R7r7RL+hBbMt9auoqtROEAgbe0tuEI0goapEop+zYjM3aejMsrIp07
         msiXjxMVSlgqijzAOQqgLZRb+3omjaI7mMb6qXhzQVWLMGapoqumEJ6d9OgtTQpRhNr1
         dpDtIQqLCB8bgfr5u7jNLH2ULQMMdDnsxF65inL8NX4UgrBBfNSZIOIScTkJbsmkjICz
         yZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=emZNPPVwOPEYtlX5oujYRHUo2IH2LiQXBoAVIF8q5zg=;
        b=WKPaJt5WaZ54p3vrLZSTKPQ6Mtd2m22vCTapZvmQlG1k81LOiqep8EqBbnQvYfm3Nd
         Fy7h4+X3MvtAnrGbfxQQfkEyYrS5NZPHADbT485n+LYndFj68XPJPaplTqARWBIH0JAF
         HmZL0zLOVjO6tv7DI5ygTecNXnfMPbYOikLjU1cG8rE7V+1xC+1lLfUs4jhOvGEMwkmm
         7H7mI4Kl1v+jPoTbWY3wG22hX5scBexv5YCsk+42BBWD9Iq/Tmh1gTmLqLtoE74q+LJp
         R/ZUBPJjbQjiWiL4+7sIA6BlZsrXYfOm/1ObMdEmdaxtBqWJ3e1Rt5ujjlB/TyfVa5yG
         TLng==
X-Gm-Message-State: ACgBeo1Ht3WTbBjxcqP+rtzzY7QtCGCDgdTCLmIcRgoEsatauCiMjSEk
	EeV40dncQ2IYXH/eFABC8S4=
X-Google-Smtp-Source: AA6agR53RUWZD7DU1GRWOn3CBvjcndSAHXe4f89dMVrmtkg2TgC1L7Qo9IicFkuzmTI8p0Cckgih9g==
X-Received: by 2002:aa7:8149:0:b0:536:84bf:69a0 with SMTP id d9-20020aa78149000000b0053684bf69a0mr47231471pfn.85.1662319514634;
        Sun, 04 Sep 2022 12:25:14 -0700 (PDT)
Received: from asif-desktop.domain.name ([122.177.222.82])
        by smtp.gmail.com with ESMTPSA id j23-20020a632317000000b0042bd73400b6sm4968449pgj.87.2022.09.04.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 12:25:14 -0700 (PDT)
From: Asif Khan <asif.kgauri@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: Asif Khan <asif.kgauri@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: fix camelcase in UserPriority
Date: Mon,  5 Sep 2022 00:54:00 +0530
Message-Id: <20220904192400.8309-1-asif.kgauri@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace camelcase variable UserPriority with snake case
variable user_priority.

Signed-off-by: Asif Khan <asif.kgauri@gmail.com>
---
 drivers/staging/rtl8712/xmit_linux.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 4a93839bf947..aaabd1189ab0 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -66,16 +66,16 @@ void r8712_set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 {
 	struct ethhdr etherhdr;
 	struct iphdr ip_hdr;
-	u16 UserPriority = 0;
+	u16 user_priority = 0;
 
 	_r8712_open_pktfile(ppktfile->pkt, ppktfile);
 	_r8712_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
 
-	/* get UserPriority from IP hdr*/
+	/* get user_priority from IP hdr*/
 	if (pattrib->ether_type == 0x0800) {
 		_r8712_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
-		/*UserPriority = (ntohs(ip_hdr.tos) >> 5) & 0x3 ;*/
-		UserPriority = ip_hdr.tos >> 5;
+		/*user_priority = (ntohs(ip_hdr.tos) >> 5) & 0x3 ;*/
+		user_priority = ip_hdr.tos >> 5;
 	} else {
 		/* "When priority processing of data frames is supported,
 		 * a STA's SME should send EAPOL-Key frames at the highest
@@ -83,9 +83,9 @@ void r8712_set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 		 */
 
 		if (pattrib->ether_type == 0x888e)
-			UserPriority = 7;
+			user_priority = 7;
 	}
-	pattrib->priority = UserPriority;
+	pattrib->priority = user_priority;
 	pattrib->hdrlen = WLAN_HDR_A3_QOS_LEN;
 	pattrib->subtype = WIFI_QOS_DATA_TYPE;
 }
-- 
2.17.1

