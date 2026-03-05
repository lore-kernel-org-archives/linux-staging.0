Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4D23FC5A
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674018; cv=none; b=TUPoatpqx2VSpIZh+xWSzOzWsRHiqYESWgE2DYPTi4JFt6Qndza3ub6aCGDLfTcfqC6YFuVXI2Pv/Z5xO3rI5OsntXucUkQ4R0/KKqquuHO9dIqhRwNSdKWpSiWkdiWwuoG5dfvf4vO6/7OjpWVLu6InUU0FihWe98nSJJLQLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674018; c=relaxed/simple;
	bh=1TqjbORC6Dklu7zL874Mp7JvmxhvcMGvI0XddLcTyxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ys3luKq3e219jqyQW+++3f7G8wMwe8EVQuYPjt+n2h7j1U3il9NkPxZNcGvWkiE/PWE8fli5YWi4n5oeayOhs5+PqmtQaxZklReJqml9PzF8/+BlEBYsJlgA2uHEb7Gr/76UoM4jSMZTMnhQapXtl5KIzHWwT5iem4hIrIHCHNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvrpzMcb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvrpzMcb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-356337f058aso3759624a91.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 17:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674016; x=1773278816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0wJi+8bmpcTQpXdP/x7saXAm3oiZNf896cQPPZ5gK0=;
        b=bvrpzMcbDOCoGZ9NDvsC48Sm40J/uL7AtfyuiUm+VRb5yn4wI3XXH48SO7uyY9rMdL
         2uh/KUcqwmQ48RYOJkJcrXfTNixQA3AajCiHmP60dyCqy+EcI1hp7uQKv2hayIIOTLPS
         rUiREAmSORI+h2sE9KeZo8E5QKUHmrtqJZyRnjdf+sS9VQqFUO70CSq8DRvVmT6FxQfa
         tjA0JI9zxl/c4rFNyce/RizYqHwb43QZBV8d2PC2crcTCFeZuDSsgssZDLKEMxdoAart
         G8uuT3XzoEK5ohL7tKfZb3cap5GXFoRDBEy19MllFpGSK2wEk26BBamJWyPa0kb7hnzy
         2e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674016; x=1773278816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0wJi+8bmpcTQpXdP/x7saXAm3oiZNf896cQPPZ5gK0=;
        b=eMyN9E3D7/6DGYmYs8S+x/1Bslmqj1IaUSyGPPtlwX24KgvEQdOqIVF6SeNR7wD+vf
         VtxQgWQJV0rHH0KjztvMc2IsQw9E9YxOQQctz/OvoYrMhrbM/CaFkmUjbR0zWD6fjxVo
         FVItm8LDXtFyr2686X7IciEWqNZtFyzsdQD17LUiyaddxHbWL/GZnk2LI+neOdgHEVTz
         A6TJzB2Ug70JYGWhtWN2Ks1NNmcSZMbwXhtwsAYORrcB4JbcvftnVQT3Ni1yPOXhx+8D
         7EIAARmParRSxZr2mdjj6TJnXhes0YKsYEOT2hW8q3Blm1XAvIeTAaZfwvAbXuNXcXRX
         cSIQ==
X-Gm-Message-State: AOJu0YwAFrU2MDCGp/QTxR5oicWC0AvqtLW1rKGcDTpYl6bWJQUp4YQb
	0ixBSKkp2SA5iXNVorIqpOBC1su13WCwONbeicZm5vsmkKMXWksJWJ8XVFGBdMmbFT0=
X-Gm-Gg: ATEYQzx0oIh2KkU5RrrzRTh0m6VgEhxppnC2D3yAWW1Vow2LTtUfGHQTK3zGFf8xdbg
	Hvkq6N3LCZVcQ4cnmviAan2dtTIeRNQlRvo5z0nbLCdv1I03yAqIO9mOjfYhjzL3e+/oG7vZHeF
	LYx7aJd+hAp1mb9zZ4dEAq4mW91wVOjtxqTpEfoeZVx5dddkuTGeF+5MhcFXHLfiWC/oeU+WFum
	MV2GCFVBOyb51Yu+kF+XKcBSZBUxFlpf2wF/iynO5aGM+izEGS085cuC8NFQ6ukb7pcFOTPL9wI
	BUxeVUFlpVz1BdXVjR8NQ6yGlYsRFS1SaggT6ovpqgdmfS+CBDIzQE6rujjY4dsXvf+Rx6LVayy
	gFOSupLAHlp2qk+4/8PnfQJbxdTeznPsVr552HoSKqAKas4/nJAzKQJdCZRHH3Z08dI76ct+WCt
	rlThJyEVugL5XHLnWPKBelHRcFsc5ypz8sw5tcNfBKCVFcLthyVIa4YU9Pdg2CjbqJLukoFo6sO
	kW+/CCINAPQ4b7k
X-Received: by 2002:a17:90b:3b8b:b0:354:56fc:b721 with SMTP id 98e67ed59e1d1-359a69c8d2bmr3265892a91.8.1772674016375;
        Wed, 04 Mar 2026 17:26:56 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d6ec1esm160681a91.13.2026.03.04.17.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:26:55 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	marvin24@gmx.de,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: nvec: fix multi-line comment
Date: Wed,  4 Mar 2026 17:26:26 -0800
Message-ID: <20260305012626.56403-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multi-line comment style flagged by checkpatch.pl.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..62013019a25b 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

