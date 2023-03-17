Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDA65C
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 06:48:12 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id er8so4837064edb.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 23:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679035691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTh0F21TwbjU88Bbz1hq5ZE+hy838Tvfzn8yCnXFty4=;
        b=pSj+KwElbb+2jzq501JA/pCh4CkyH4uILIM30gt0mkNF1CHnLVHVUFh5KvHOQzUB44
         B2qE44/QUblHAppjMP1lXcbQFFAmvkDY+P5uPB2UvJuF408n7UYzV07JThP0FIEAGFB2
         EfyIE4vlmzuE4ywRBmBKI/ttNnnre9MulnxynTd6z/EfMPhMzCj2uz0W3sIPif/ewoT/
         svrrxDMsJyE6qU3oDKXPhgXtG8PhX729DBpRrJ0kHcNOrmJiDs7DgFnifynSXvMuhNe5
         I8miJcmowHWZHlVbAi00+t66Z7sNPLKhppI0jtOQvYkdqSHDNNdR4f7C3U+32VmxNCFi
         LzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679035691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTh0F21TwbjU88Bbz1hq5ZE+hy838Tvfzn8yCnXFty4=;
        b=Hj1qLCYMDs3YV1+HvLp4fKzq8VWf/jJUqu0MDQ4KpJYF5qxjw0mkt4Ozj2ARunYtWV
         1CFPHoBpYCf7Ina7E2xL4QIxylokxom90mjqW0M6KfNRExaU1vZM+9ZtX9L8kL398I8F
         hJ00jOwy0qKZVT2SyAmYNvZkC008TlIfc5fTT/xE2C3HT38Hy12JqTlKW2nkno1r+Uku
         TxFe/qw6UQiR4DCawrIv8KYhhSIR9iMXhV0X5f2aHIvumlGwCngNdGTgnG6XwX77uTwL
         CgFjVXH6jZC1wNw7dAEdhU6C+shZLJ9j8qUFDfmwKFcP9P3DlMi4tde0E6FlykDKihbY
         ku2g==
X-Gm-Message-State: AO0yUKU5RGYOZFBJ4jEG2sFsaiI0HyIIOjPwuhKcVFYZbSOwMmv8eJRR
	0rjvv9o+ENtCHTkaY1zeUfDghOWSZ1Y=
X-Google-Smtp-Source: AK7set/4N1GHVyF2fZkorcLa7fn9Z9JiQJjZIJuc6IJOPPpzB1sUKnTvLjiZaHYFRjeE+yD/X0IAKw==
X-Received: by 2002:aa7:cc15:0:b0:500:47ed:9784 with SMTP id q21-20020aa7cc15000000b0050047ed9784mr231767edt.14.1679035690850;
        Thu, 16 Mar 2023 23:48:10 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbef.dynamic.kabel-deutschland.de. [95.90.187.239])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b004f9ca99cf5csm601963ede.92.2023.03.16.23.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 23:48:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: vt6656: remove unused vnt_get_current_tsf() function
Date: Fri, 17 Mar 2023 07:48:00 +0100
Message-Id: <20230317064800.12276-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function vnt_get_current_tsf() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/vt6656/card.c | 21 ---------------------
 drivers/staging/vt6656/card.h |  1 -
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/vt6656/card.c b/drivers/staging/vt6656/card.c
index 7827e579ef3d..b9dc0d13c00c 100644
--- a/drivers/staging/vt6656/card.c
+++ b/drivers/staging/vt6656/card.c
@@ -11,7 +11,6 @@
  *      vnt_add_basic_rate - Add to BasicRateSet
  *      vnt_ofdm_min_rate - Check if any OFDM rate is in BasicRateSet
  *      vnt_get_tsf_offset - Calculate TSFOffset
- *      vnt_get_current_tsf - Read Current NIC TSF counter
  *      vnt_get_next_tbtt - Calculate Next Beacon TSF counter
  *      vnt_reset_next_tbtt - Set NIC Beacon time
  *      vnt_update_next_tbtt - Sync. NIC Beacon time
@@ -230,26 +229,6 @@ int vnt_adjust_tsf(struct vnt_private *priv, u8 rx_rate,
 			       MESSAGE_REQUEST_TSF, 0, 8, data);
 }
 
-/*
- * Description: Read NIC TSF counter
- *              Get local TSF counter
- *
- * Parameters:
- *  In:
- *	priv		- The adapter to be read
- *  Out:
- *	current_tsf	- Current TSF counter
- *
- * Return Value: true if success; otherwise false
- *
- */
-bool vnt_get_current_tsf(struct vnt_private *priv, u64 *current_tsf)
-{
-	*current_tsf = priv->current_tsf;
-
-	return true;
-}
-
 /*
  * Description: Clear NIC TSF counter
  *              Clear local TSF counter
diff --git a/drivers/staging/vt6656/card.h b/drivers/staging/vt6656/card.h
index be32c25c95de..eb01f7cc871f 100644
--- a/drivers/staging/vt6656/card.h
+++ b/drivers/staging/vt6656/card.h
@@ -30,7 +30,6 @@ void vnt_update_top_rates(struct vnt_private *priv);
 bool vnt_ofdm_min_rate(struct vnt_private *priv);
 int vnt_adjust_tsf(struct vnt_private *priv, u8 rx_rate,
 		   u64 time_stamp, u64 local_tsf);
-bool vnt_get_current_tsf(struct vnt_private *priv, u64 *current_tsf);
 bool vnt_clear_current_tsf(struct vnt_private *priv);
 int vnt_reset_next_tbtt(struct vnt_private *priv, u16 beacon_interval);
 int vnt_update_next_tbtt(struct vnt_private *priv, u64 tsf,
-- 
2.40.0

