Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB23FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id t19so15070437ejr.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwtcbicrqVzcOBpKF8LIDrbovh6REX7OM2xtMOK5yVY=;
        b=AImbGSYKsaLtOmL8z5N81kKZ5eebW/IOgSRJcAu5W1/txu83E5L2yrJvgvux/D7nEV
         D4ePPv+pobdOPIRJy6Wv4JvDDv10v+wWaW21Mr3x+tBAh3BwhxQLDmDlEXYx3fzfwU9/
         qU3aGA3QxdKH/aDlghMTzcN4smx0MEHF9OP7PURIm+YhBTn6r7snERPtjV3zXgGf6chl
         I2vTXEjDL6QIFe6wJU269onjXg3tWXAUH45SShfGiveLN/40juy99eMG6mPs87RDmVDy
         kRZUr5irilc0dAx0bWnC/F2rYZE/2foB7YlCYKXCd5iegat68wf+ghppIQaWodLYT3p7
         g4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwtcbicrqVzcOBpKF8LIDrbovh6REX7OM2xtMOK5yVY=;
        b=SAPqKU2gkGJWidHULLc1aN3buV7n0L/KcfFBEDrfbiCBOA5tHRGEjvnnsxe//C8B9n
         msFjMdZEJWfOPbbE+x5xRm13hHAe7lGl53rleENd7g0z8Ijj+yW9b5eNXvOF7dHDdpuy
         MzeVy5CVdRoY0QMuyeVhStNEaTBUqbumF9kDvpyuI901og8NQ4hYrd7aRzsciKZAXJH9
         lUh6xSK3aPf034ttIjcDVVGid4Ro/Pdmg6rlT+tKjd7dv+DkHPzKP+RA4fq4BEG7IMDe
         QBzdN3JTUccuIMy9tvdhMlwm1GtTXYEfzVtX60lKpKXUuH9HY/ny+WDKMj9v2n6tDvOP
         Bc4Q==
X-Gm-Message-State: AOAM5324FtL4hx/0dx+OeE80X+D1CxlQsAmZptqfb6iI76yUajhiYPn4
	mluXL+ac6HUCD4HnltG+NHU5QyDLBDUDnw==
X-Google-Smtp-Source: ABdhPJwOaE8IXHPcNpnFC/c+qLlcy/a8NYr45InQL1O0Njp9cqKD/qsDiZ4tEcu0J8xUgk9h3cqQOg==
X-Received: by 2002:a17:906:d7ab:: with SMTP id pk11mr15116922ejb.563.1630954465396;
        Mon, 06 Sep 2021 11:54:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 31/40] staging: r8188eu: remove useless assignment
Date: Mon,  6 Sep 2021 20:53:18 +0200
Message-Id: <20210906185327.10326-32-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
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

