Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D4A2C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:41 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id o20so33390482eds.10
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2glchpcv+1d/9FAJVmf1wbGz2GHlcABraoRmMcJeBDE=;
        b=ThYljT54KLw3VNere9tNFOHbhwbiqMGLUJ1Cghoq/4+n4ArDolUzG129vx3WOnVRye
         F2s5Zv1ynSF3xs/Gkk5ifWa8DhlBPr1J/vjeazJb7MpJ3WsQfd9zehqGZ116MT5THjka
         eU3wJuVluhFO9nFYqBYDRzuAGB+MSeTfRHXrVQKPdZXTqoDGxYNnC5KlSsQ62JFK1jqY
         jp7wxzfCCtCTMR78/0gxucj9r6Q9kBXaRtji1SuG80iMEwX59fUJRh5xO+y1+gTmdMzC
         Imqmp89vyf0GKENM8228mrehrPgPLIfLrOJRn5Cww4E9QCtAaGRp8ehEVZs/qAwjY8MY
         n7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2glchpcv+1d/9FAJVmf1wbGz2GHlcABraoRmMcJeBDE=;
        b=H3/9R8dUYHpMe58PI9IKobiq7c85879shOe/bWgIuBj/oxv0DDnROesLiy7emBNRD6
         O1DRHZaLvKRVuczllpxQcjyeaj1FwPor76+tEDAPUL2kzFKENjwEzgPJ8tILae+4eFid
         x6STbbwC6me8ILlvgjiswp2bUI1tIqh6IwU/L2TWqk0rvr9vbpcGS/3kPzwkEd7j/Tnc
         4Snix3noZ8wsZHtvsw4xql9w3IUkacwR5XlnlMMxPU4fpXNIldRg2VDAM6M4S1xy/7cd
         sPB7aZMFlguJMWoq3+ML84nJLazKEGL2MbN2JQSGHGguK7UAys/ByH18fjD08RD34tMX
         lWoA==
X-Gm-Message-State: AOAM5313RY/18eXndiQ+jgFOc4XX6id2sXQSy6AZCpPtt+LiDPl+mv/A
	deiG4fifoNjASUr2G/peXAE=
X-Google-Smtp-Source: ABdhPJw9Y2h/cjKEeFIrXABQtA9tN4szsCU5TyPSrqIYeNmC4EofUggbMakcoU0aUNPkedE9O/ZjXA==
X-Received: by 2002:a17:907:3e22:: with SMTP id hp34mr39616946ejc.491.1638724480370;
        Sun, 05 Dec 2021 09:14:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 10/10] staging: r8188eu: remove unused macro IS_FW_81xxC
Date: Sun,  5 Dec 2021 18:13:42 +0100
Message-Id: <20211205171342.20551-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205171342.20551-1-straube.linux@gmail.com>
References: <20211205171342.20551-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro IS_FW_81xxC is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5791172fa5c4..3fbaccbbe775 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -508,8 +508,6 @@ static s32 _FWFreeToGo(struct adapter *padapter)
 	return _FAIL;
 }
 
-#define IS_FW_81xxC(padapter)	(((GET_HAL_DATA(padapter))->FirmwareSignature & 0xFFF0) == 0x88C0)
-
 static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 {
 	s32	rtStatus = _SUCCESS;
-- 
2.34.1

