Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319272
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id t19so15107893ejr.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwtcbicrqVzcOBpKF8LIDrbovh6REX7OM2xtMOK5yVY=;
        b=OyLQzHK3JgBRyB9+COmigSykd2tQ8sKimgm7NaGKG2Sijc+slNXGdj2ZK5/KzGf2TS
         Mo2RHg1HbD9QP96oCWMQJ9G/YjPb8H/NfT1Qax+yEoCZOosu8BWEnPul3xiPJ0IxlWY4
         zz4HgtFK3+1UUbYkmXOKM/dAEJ0GbHRQU2Ae35jC4V4wSRSLeUXxq21y/tG3HKXaZcp0
         bmhqsgIXVYuGgRLPiX70xhQA/IaxKuRDhIhy2Q4/FvQkYWc0dkcJRwUHiWTmtPCQjBNt
         b45AtLQEqAdxvbs2AtIrAcwISjTvw8G3oDgWbKnalPmwaArO0Z34ASQFexDS8AgjHdFh
         9+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwtcbicrqVzcOBpKF8LIDrbovh6REX7OM2xtMOK5yVY=;
        b=DmyWwUcllbxjPrl/lPsXbyTdDIFKCzag+q6w6WWzZaPbBWiz5qlEw4bVb/y3NEIx+l
         xVaZ1WzBmRrT0K8qxtfCrVulUlG81Cjm9dsnDxB4no6ZTpiROCqdhqJtWBJOeYkYnftr
         zABMjO66zky8FyygRnwfrQ+SpZKV2O0UVYoIz/WrEzXi9Qt8laEnu0s8zQG+xHTCOYbx
         S0d3YYW3YRWQ/tTrZeqSO55zpjFvAcbRYrcQrsdBWClMbYgOtDHTshF9RK/tAY6TR4Ez
         tgb5KJp3sdhu7dwKJpJIsBPmz5Eo9xYTUY1zk2RWBgjEiGaUMwo8+knG+Di8ODPeMVnh
         9P0g==
X-Gm-Message-State: AOAM530NGCOrapkYhConzMsUcMxPhOm7NAglcR84rNq05dC+IrexYrUP
	Pon/8gvDX1FSLnfCMmLRRJc=
X-Google-Smtp-Source: ABdhPJxnCGGYTxLXKxgRw/ESB1IVe0JNCooQAQ5II1cSJ0dXub0qnuov20nZ7eEvN42r5ggy9D3WFw==
X-Received: by 2002:a17:906:2642:: with SMTP id i2mr14900238ejc.323.1630954988245;
        Mon, 06 Sep 2021 12:03:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 31/40] staging: r8188eu: remove useless assignment
Date: Mon,  6 Sep 2021 21:02:14 +0200
Message-Id: <20210906190223.11396-32-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable badworden is set to a new value immediately after
an assignment. Remove the useless assignment and initialization.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index eb30a6fcd8d0..33d4e534f05e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1438,10 +1438,9 @@ static bool hal_EfusePgPacketWrite1ByteHeader(struct adapter *pAdapter, u8 efuse
 static bool hal_EfusePgPacketWriteData(struct adapter *pAdapter, u8 efuseType, u16 *pAddr, struct pgpkt *pTargetPkt, bool bPseudoTest)
 {
 	u16	efuse_addr = *pAddr;
-	u8 badworden = 0;
+	u8 badworden;
 	u32	PgWriteSuccess = 0;
 
-	badworden = 0x0f;
 	badworden = rtl8188e_Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pTargetPkt->word_en, pTargetPkt->data, bPseudoTest);
 	if (badworden == 0x0F) {
 		/*  write ok */
-- 
2.33.0

