Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47FD511
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewCbH4K5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc5b6d6228so10224625ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730501; x=1699335301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl870JnZ4hTIQ++KxGAzU1faBppIdJahzCd4lGE08z0=;
        b=ewCbH4K5NtB3FgkZ1FmRVvGAVWTkDD4fvwtlvwT1ink8j3DaXEdGXAEt68/s20Y3NJ
         yZKtRBO8iqwsANdAMssfbkz+k4U53soTxL8x+cGaHI87qOj/+70c/VONXVOsBUHkPF4r
         SbC/MBFTpz1j9s5e5y2bvsGfspcZsyi9/f5wSDLv2F4drq8kZdVVqtRDPbsSI+TzEon3
         d/tpebOIltFrJdVQ9QodXq0Mi46h6AVIXvsS8+Kp5jWIA0//lY5xlrS6gyJAxkLmCSEO
         tezqwJ0+p4HqOsTz8ucYBLBPhdwJFcV4x2z33CXJPyN4NjXSf5HYj19oe8HOx0NgNm3w
         Zhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730501; x=1699335301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl870JnZ4hTIQ++KxGAzU1faBppIdJahzCd4lGE08z0=;
        b=kxBvKinaarFcKWajipohQMsTb1hFfkiVu/ikHA7nd7+wxp6i9kQCV6RaL82ZD6DgGF
         ubxV24F1aW2XgFj1ZWBRq7PGW6UEiZ0H79vOAYm6rsalYrI/DdP3Gz0pypXyJBQMqC2f
         SVdvvzgjKeeJE4jQbEuWVxvso5OiS6YnL1pUPjW+2Y42xhJwaHu//WaIXQ6OC35MHYFj
         Ktb70xNq+w5EW0IqFrsnT3FzztCt++GiVYqBXW4NCJ86xu7kV4wYzSTfUD6yHRIKIX3n
         2CIQFWHfPwfc3b9gshXS4xROFAmYgpGcGC34PAT3x6TYuD7u3xaO13z2oenrZ1Vuc4WQ
         J14Q==
X-Gm-Message-State: AOJu0Yx8WU0djzmC4MSjhAI/pUSZ4hFLhw61SNRhlzcKfwbpZQjuySEH
	w8siNSJP6/JG9Jkg//xToKA=
X-Google-Smtp-Source: AGHT+IFwj8WKebJrOXAshRQFxkCACrIGsFphLy02voEXYOEigu4AoA50dyzKuuS9gmqJ565lGbrxPA==
X-Received: by 2002:a17:902:d491:b0:1cc:50f6:7fcc with SMTP id c17-20020a170902d49100b001cc50f67fccmr4334968plg.55.1698730500952;
        Mon, 30 Oct 2023 22:35:00 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:35:00 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 10/11] staging: vt6655: Type encoding info dropped from variable name "pCurrTD"
Date: Tue, 31 Oct 2023 11:04:33 +0530
Message-Id: <06dc61ae807dcaa1dd8fdbf18686f0f4c20be634.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "pCurrTD" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index b249f22246b0..d20afbc1072f 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -385,7 +385,7 @@ void card_radio_power_off(struct vnt_private *priv)
 void card_safe_reset_tx(struct vnt_private *priv)
 {
 	unsigned int uu;
-	struct vnt_tx_desc *pCurrTD;
+	struct vnt_tx_desc *curr_td;
 
 	/* initialize TD index */
 	priv->apTailTD[0] = &priv->apTD0Rings[0];
@@ -398,13 +398,13 @@ void card_safe_reset_tx(struct vnt_private *priv)
 		priv->iTDUsed[uu] = 0;
 
 	for (uu = 0; uu < priv->opts.tx_descs[0]; uu++) {
-		pCurrTD = &priv->apTD0Rings[uu];
-		pCurrTD->td0.owner = OWNED_BY_HOST;
+		curr_td = &priv->apTD0Rings[uu];
+		curr_td->td0.owner = OWNED_BY_HOST;
 		/* init all Tx Packet pointer to NULL */
 	}
 	for (uu = 0; uu < priv->opts.tx_descs[1]; uu++) {
-		pCurrTD = &priv->apTD1Rings[uu];
-		pCurrTD->td0.owner = OWNED_BY_HOST;
+		curr_td = &priv->apTD1Rings[uu];
+		curr_td->td0.owner = OWNED_BY_HOST;
 		/* init all Tx Packet pointer to NULL */
 	}
 
-- 
2.34.1

