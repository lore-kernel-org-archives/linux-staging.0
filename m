Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB02CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r9so11732160wrg.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skpfr+woNwBWq/UkaJ/OM4D8M7RBtrPdTCE1iH30Ya4=;
        b=I0tGo7QPDX1aHrxZWygj92ftpF+2hKsffErIQg9BPPly2LNCJo+UYePeRLT/Jltcd2
         8R7l5FEU3l8tYlKj0WuXpBvr67azuHOo5rNtdktyjX/eAlmTZoh4MSx+TGL+PGOgs5mq
         HfVUIVIXT0BdwUpNOl376MLpYsvbwkk+U0PWIhMlGIVNCXLB0PfCQSewxR3mMlNyJDzn
         L2g11mmInqOMkLAvAAyHvWT0wxI1hj3oIZX+Av20IsR6Bj6+HZ8Cm8Nbqrx7aQoX9iUz
         6vKSyAJoaiiJtTophsNBMj6zvElu1148BqSh2H09nUNDXCQADPiSwUss9NpJqoNjUYDz
         k17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skpfr+woNwBWq/UkaJ/OM4D8M7RBtrPdTCE1iH30Ya4=;
        b=6yzfiXD32HjVnVBUnZUtPMjG4eNzGE6sm0dYo6edJ21pQ6GxORBhxNxwIpmENcSemE
         DrOqbKc+X2l1DtbBimmaiWkQnEUQCjSpORoVdd005VNPGMWOVYDvOaPaslqZYGkk+4L7
         tMeys86VoaSn3K/rVdyJIHtvcgM4ylQSqyELBQoLvR8pd2SXk31aQiGPm9FmYCedMUPb
         IqJBE/wNAFCMU7k/468PbQQvAi6lqB0ahPnxFPVJQT1AQueUFJnfGrlG5CrbkhlYVBkD
         5zLPC6iD82gpTYC+vCFvcqPII6yP3QnxBg7924uSRgDH72HjDTSB+JSsbTPFGNIp0d6V
         pJ0Q==
X-Gm-Message-State: AOAM532e7JA/Xkg62fX0QVDAnYaxj8mCbnZKroHbINgbKXUwWyHrFxgt
	RyP1By+72rjODwqaNZHszPk=
X-Google-Smtp-Source: ABdhPJwny7FT6SeNz720JLxmXrX6dzb12UysNF3RqlDgx8UKnfMXmuTOnsp1/ZAz2xwekdMiYXpUfw==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr56861714wrp.714.1641592245392;
        Fri, 07 Jan 2022 13:50:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: remove HW_VAR_BASIC_RATE from GetHwReg8188EU()
Date: Fri,  7 Jan 2022 22:50:28 +0100
Message-Id: <20220107215033.12257-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107215033.12257-1-straube.linux@gmail.com>
References: <20220107215033.12257-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GetHwReg8188EU() is never called with HW_VAR_BASIC_RATE. Remove that
case from the function.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 96db9a8e7667..b996580b30ba 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1592,9 +1592,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
 
 	switch (variable) {
-	case HW_VAR_BASIC_RATE:
-		*((u16 *)(val)) = haldata->BasicRateSet;
-		fallthrough;
 	case HW_VAR_TXPAUSE:
 		val[0] = rtw_read8(Adapter, REG_TXPAUSE);
 		break;
-- 
2.34.1

