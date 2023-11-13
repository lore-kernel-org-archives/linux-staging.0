Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AC23770
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="b/EAlQwL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc316ccc38so36433775ad.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905169; x=1700509969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvj1Hf+89Ipd0B+JPWYx1UIQKsIrGquSXWrNNU7zN0c=;
        b=b/EAlQwLbA6faPYyCFGz+nr0aFZ5hz9fFpHM7E2HFEyDT8JRVoeIROtbH6TnzIguaw
         HQW1EIoGnzSrnBWHjC3L0k1HT8Z5oEV3Uj2vCwusA+h606j+hTNRIVmCMleopKF+lZsZ
         UFpqVu5oDkvliVZoXf4FwATrIp/ir5bz0+YJ5SA4hQYGNQkILKu8T2nctqI8Yo7lKN66
         rEn2QWQrjUKAFN80+OHFM/cnD6sjYKazLrNRzS+zZnAmpj2m7cz8nKTwKO19F8CGgyEM
         MBcQS1ID+xeHVymoWcwradnwLg8juV22rmypstx4l9ENMzKwGCxzxttmW5bf6d0+gw1Z
         9xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905169; x=1700509969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvj1Hf+89Ipd0B+JPWYx1UIQKsIrGquSXWrNNU7zN0c=;
        b=Ruc7Ft+1IpjVMWPxEUBB+myBuX3kKNjGiYcmPa0L1DYARF/3dKI8TXUo/RvNMqWObk
         z5N183QzlKDa4LlMXnYD0nmFtCRY9X7vYroj/snpyCnJSHr3f290YUYcLGgZn9d1+EX8
         u2tRV388z/1wkw6sDOh2w7HWytayxTROWWgvS+k/qZRRZydqLsBNQkfBRt8Wps/sMrNF
         IzlLmlusTn2fsTKAh8GiEcS+RhvYdp6UDyS1qrErvg0tiRGxounwXvnDUH7dxv/LfoRg
         wJdmaJ/lWkSp9SKqeDV9sec+JulG61lDqbjEI+zLX8xTJgJXhqNen0OKh9Sjm43jIocf
         jRbQ==
X-Gm-Message-State: AOJu0YygoDffwGYCRAHu1Auw5DgQZtqhq4QkIQVGzL8JZFX7M3Oaw7sh
	POXn0nAVFZ9KDNoIJUVeXIyN7Q==
X-Google-Smtp-Source: AGHT+IHwyZx1HcevurmBWNFO/eV7PqrhMrIEPukPhKQVUlur/AgKI0X0WUVPHxZajPSnCoGPBjOmdQ==
X-Received: by 2002:a17:902:ac8f:b0:1cc:b460:e6cc with SMTP id h15-20020a170902ac8f00b001ccb460e6ccmr271139plr.12.1699905169316;
        Mon, 13 Nov 2023 11:52:49 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:48 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/7] Staging: rtl8192e: Rename variable bSendDELBA
Date: Mon, 13 Nov 2023 11:59:04 -0800
Message-ID: <20231113195910.8423-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bSendDELBA to send_del_ba to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 4af8055d2489..c0058d2be6d1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -27,31 +27,31 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
 {
 	struct ba_record *admitted_ba = &pTxTs->TxAdmittedBARecord;
 	struct ba_record *pending_ba = &pTxTs->TxPendingBARecord;
-	u8 bSendDELBA = false;
+	u8 send_del_ba = false;
 
 	if (pending_ba->b_valid) {
 		deactivate_ba_entry(ieee, pending_ba);
-		bSendDELBA = true;
+		send_del_ba = true;
 	}
 
 	if (admitted_ba->b_valid) {
 		deactivate_ba_entry(ieee, admitted_ba);
-		bSendDELBA = true;
+		send_del_ba = true;
 	}
-	return bSendDELBA;
+	return send_del_ba;
 }
 
 static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *ts)
 {
 	struct ba_record *ba = &ts->rx_admitted_ba_record;
-	u8			bSendDELBA = false;
+	u8			send_del_ba = false;
 
 	if (ba->b_valid) {
 		deactivate_ba_entry(ieee, ba);
-		bSendDELBA = true;
+		send_del_ba = true;
 	}
 
-	return bSendDELBA;
+	return send_del_ba;
 }
 
 void rtllib_reset_ba_entry(struct ba_record *ba)
-- 
2.39.2

