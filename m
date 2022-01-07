Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE932CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v6so13467335wra.8
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+Jxam6E4Q5QnqvejI5GJgZU6fnINaepxI7ZTcYPB+Q=;
        b=f77GfOuz8rnN8Oty+x95W6xnQnMG6m8YG/w771iPkB14S3cAm0/pTuh0zllEPMhV/M
         19q5FLt0JCqkj/wBjo0LQSCPwqNGwTc0khk+Hw1tN99VVEzAl+XecJhCA6HikC68dRk0
         pLwvDbCeV4iBDDxaNd3EKiXEhaMCzphZkXhr+LuY+a1mRU4n7AvpeaDZMzgV/7myBJBE
         WhW4AbW4Mul9sZmKShklHLKTNc9NCrJ1GIFm/hvABB7w6M0f0nKZ7r47+qmSs3MQsW36
         Iif66/OAQ8vEyX0PWKtw0+ZaL/oIIVSYnK73jbiGyTUC+GF0G0uZYr0RwArb2QabbyM3
         /FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+Jxam6E4Q5QnqvejI5GJgZU6fnINaepxI7ZTcYPB+Q=;
        b=rHEZLpg/DexoSNbcVV4VTAYsZ+gHd2W8qnYKHq+GBJYjSW82aDjjD+00w/jhqaSpLe
         yRjjc7pZjpjjg7ET8iZ64MkePmPxYKPdcNf4xQvivEmXu130vqq1KGdPFqpbgqj1fLjV
         HdDALsreWHSquKmbdP7mxfkZbsRw8MbV7tIZv0z3ZIP7wNhAz7NRZYcNoPp9vVuL/rCI
         hH0+ksbV8+Jyxk3fieioXbE9h9iqsBY/E6SG8Wv6k2VyGWB9+cqNK/kvjLMTPx+WNeQ9
         AMS6BgxTEUbzFSladz3dfDjBGFfleWez4UNdl5dLsuv4+jKr7VnoMtVudpFdcPBZkL+t
         durA==
X-Gm-Message-State: AOAM530mEG4BUpYf68BTLe+F/Gm/CzAciX2q/9GhltISEPqMlGI7QgFO
	iCQN85nt9RhqdxugTiKHbLo=
X-Google-Smtp-Source: ABdhPJw+sAvX14hiDTJsak7x7k5L4NYXxLRPBrbUwR5IdEiHe3TDRZyVwmQktoPhYgDFLhYZnlvZDQ==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr1086311wro.151.1641592246342;
        Fri, 07 Jan 2022 13:50:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: remove HW_VAR_TXPAUSE
Date: Fri,  7 Jan 2022 22:50:29 +0100
Message-Id: <20220107215033.12257-3-straube.linux@gmail.com>
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

SetHwReg8188EU() and GetHwReg8188EU() are never called with
HW_VAR_TXPAUSE. Remove that case from both functions.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index b996580b30ba..72b008a78d75 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1138,9 +1138,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write8(Adapter, REG_INIRTS_RATE_SEL, RateIndex);
 		}
 		break;
-	case HW_VAR_TXPAUSE:
-		rtw_write8(Adapter, REG_TXPAUSE, *((u8 *)val));
-		break;
 	case HW_VAR_BCN_FUNC:
 		hw_var_set_bcn_func(Adapter, variable, val);
 		break;
@@ -1592,9 +1589,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
 
 	switch (variable) {
-	case HW_VAR_TXPAUSE:
-		val[0] = rtw_read8(Adapter, REG_TXPAUSE);
-		break;
 	case HW_VAR_BCN_VALID:
 		/* BCN_VALID, BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2 */
 		val[0] = (BIT(0) & rtw_read8(Adapter, REG_TDECTRL + 2)) ? true : false;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b4a7e0ce3116..77149eda7edf 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -16,7 +16,6 @@ enum hw_variables {
 	HW_VAR_BSSID,
 	HW_VAR_INIT_RTS_RATE,
 	HW_VAR_BASIC_RATE,
-	HW_VAR_TXPAUSE,
 	HW_VAR_BCN_FUNC,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_CHECK_BSSID,
-- 
2.34.1

