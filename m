Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF9320C
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u15so5566977ejt.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=s0gG/Y/1ndpD2o1oxGib08M1iLWS4DAsSTix2vBGTk8=;
        b=M2RXBrxGosxefZjApl+IioG6a4nCIvHduh8TOb3I3CAhWA5L5dzlxxunsIHupAKtlK
         xSHNHS1FSH0OBvucqIvx0os9WtHmyVC9osOAPgHQ6xH4NWXs6KEZ+UoAwxJ1+BmmW4Iq
         wMNqqHD9978+9kVhDtrgEzfRT5TJfuMCiSaGixY2YGVawAI7z/PG+9JTWdsINeeizgCf
         5bOnmpBG5qqJf4MuqNLDePGwvwgFj8qUj/4NSM1TLyMaz6CGBP9C11Ht8KbgK4ESQkAX
         thKa944IIf0bxhCIRQKhDogeV1JTCApDBHHDUP3GLTl5DRVYnGmfPyJNVkPb3qjOb3M7
         muAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=s0gG/Y/1ndpD2o1oxGib08M1iLWS4DAsSTix2vBGTk8=;
        b=0misuWbBoyE6v0pZIpRXruGalm8PzY++U641a36RUOytbb6lujptlxyv/0hFlOTwyO
         PmXgdY4v7VA9oPxH9v6oivNnzbPUBlHzD4UU1Im+lXDsn5Q52cb8PzFFHwn4GmPOWbhM
         EhlLyxVwg8ElIMpyxXui2OVv+gEJrzb5/do8l12bBm7MgakOZ6vIlLbSsmPT/5YyRdh5
         1p6eQ9Vn5qTUIYpNiHVTbONetxen/BVnvnf2I0dRhAnaC0Zn9TAwnF4+auJHxccpS0Re
         CqJqny9KKxcQr+2BFJVMd+NwOjfY4r+ShzpCGyPOlzSn+R/qPMONO8dZUJDXB9+y+/nR
         sGIw==
X-Gm-Message-State: ACgBeo2b9dQvTsYy1OJXDbok78/6yqj0AAhfWVJaQ+ucGD1lD6OqCAGy
	qz7O7xVxnGBXUoXCR850/1evTH2ru0Q=
X-Google-Smtp-Source: AA6agR4bSIwh1Gf2i4Zy7jyo/bQXpTCoLOr3MSn19rbIti5YB1LQUFIxTIflcmokDYeJqqz0lZIg4g==
X-Received: by 2002:a17:906:7955:b0:73c:20e7:86cb with SMTP id l21-20020a170906795500b0073c20e786cbmr7545875ejo.527.1661019402457;
        Sat, 20 Aug 2022 11:16:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/19] staging: r8188eu: rename _rtw_open_pktfile()
Date: Sat, 20 Aug 2022 20:16:13 +0200
Message-Id: <20220820181623.12497-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to prefix the function name of _rtw_open_pktfile()
with an underscore. Rename it to rtw_open_pktfile().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6cf583fd9890..caacf35485dd 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -402,7 +402,7 @@ u8	qos_acm(u8 acm_mask, u8 priority)
 	return change_priority;
 }
 
-static void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
+static void rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	if (!pktptr) {
 		pr_err("8188eu: pktptr is NULL\n");
@@ -427,7 +427,7 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	struct iphdr ip_hdr;
 	s32 user_prio = 0;
 
-	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
+	rtw_open_pktfile(ppktfile->pkt, ppktfile);
 	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
 
 	/*  get user_prio from IP hdr */
@@ -461,7 +461,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 
 
-	_rtw_open_pktfile(pkt, &pktfile);
+	rtw_open_pktfile(pkt, &pktfile);
 	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
 
 	pattrib->ether_type = ntohs(etherhdr.h_proto);
@@ -940,7 +940,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		goto exit;
 	}
 
-	_rtw_open_pktfile(pkt, &pktfile);
+	rtw_open_pktfile(pkt, &pktfile);
 	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
 
 	frg_inx = 0;
-- 
2.37.2

