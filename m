Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0B2C9C
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 00:22:47 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g5so16455661plo.12
        for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=K8LELWEzyxef93MtcdvUmJL/NjY2Pd5i9bwCODfPWqQ=;
        b=Vd8hWoFgHHnK/pniROrX/CSrjsvXpHVsAu5uN8hD9YoPKQ63l2Q2nMEEbmvAnRNcVZ
         M6byGxPbkvttWLPTabAkFxa/4Ftj4U0h0ePq3VswTWD7JgYV5xY/3BuhyFpB2mAFvyDG
         y+kJXZ8ra9MgKxfRtnMQX3JFm6sC8abndv0umJQneiuB28Vz0UOpx8MRpNiusfz+ch0H
         1KpsmPmomUfyaM5YGy1hQ+J+a4Fj7vQ7d25MYvT2iJZx7CeCCyQ1s/WKFBB7D7PLPLMc
         6qHSdqd2eJTjLti5tPWYXtJ1o3aimg1ZcCXQrS9c1vOz3d567CONy5v6R0JjyCCkdo4K
         maWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=K8LELWEzyxef93MtcdvUmJL/NjY2Pd5i9bwCODfPWqQ=;
        b=z3JRxM2ET3WjB4f26v0HyFsS+IakTTnb40oc0YWUcqn05H1/92t/HZF5HTicLKH84j
         Nt/ncWdCVT7TwHDqThIBD23TZ9uFMlv51dJiUZz73Xf5dZAw2wSQYtw64+Fc3quPCiiI
         OZAGXUHJh4maH1neT1vFzf6JYhouezB/+tIn6l5g7sWKc1QcRH8MUrSeF6TBFjh2QEhM
         r/n0y2GaxcRfIhfgS7KkIyEyh0SKce/1nn69g0LgI1kY0dBGVQLO0QjttasTDt+otsPc
         05406ttymHTa1KmeSdVBbIAeMz74kP7Oi2mQuDw1/Aeq1nRhAupfdl6ofDVNo+bNOYdq
         SwqQ==
X-Gm-Message-State: AOAM532OgohPE/LsRnet343rQgAQ4I53TIlT+tTbfiFg/U91VS5dWxHw
	WpyNWvaRY4rehjkiKz8gwco=
X-Google-Smtp-Source: ABdhPJwiy/L3lBuZRaL8KEh8n1Z23x1ZqNTFAk8gHGEj0vW0RHDDTxXhOEvefPJoT4GN313V9accAw==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id lx12mr27211798pjb.209.1642292566962;
        Sat, 15 Jan 2022 16:22:46 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c11sm9583628pfl.134.2022.01.15.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 16:22:46 -0800 (PST)
Date: Sun, 16 Jan 2022 13:22:41 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: pi433: change order in which driver config the
 rf69 chip
Message-ID: <20220116002241.GA23202@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116001726.GA22699@mail.google.com>

There is an explicitly dependency between modulation and bit rate
configurations. To ensure proper validation of input value for the
set_bit_rate routine, we must ensure that modulation has been set
before.

This patch ensure that set_modulation is always called before
set_bit_rate for both RX and TX routines

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index f9f86e2c44a9..17ff51f6a9da 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -167,10 +167,10 @@ rf69_set_rx_cfg(struct pi433_device *dev, struct pi433_rx_cfg *rx_cfg)
 	ret = rf69_set_frequency(dev->spi, rx_cfg->frequency);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_bit_rate(dev->spi, rx_cfg->bit_rate);
+	ret = rf69_set_modulation(dev->spi, rx_cfg->modulation);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_modulation(dev->spi, rx_cfg->modulation);
+	ret = rf69_set_bit_rate(dev->spi, rx_cfg->bit_rate);
 	if (ret < 0)
 		return ret;
 	ret = rf69_set_antenna_impedance(dev->spi, rx_cfg->antenna_impedance);
@@ -290,10 +290,10 @@ rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
 	ret = rf69_set_frequency(dev->spi, tx_cfg->frequency);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_bit_rate(dev->spi, tx_cfg->bit_rate);
+	ret = rf69_set_modulation(dev->spi, tx_cfg->modulation);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_modulation(dev->spi, tx_cfg->modulation);
+	ret = rf69_set_bit_rate(dev->spi, tx_cfg->bit_rate);
 	if (ret < 0)
 		return ret;
 	ret = rf69_set_deviation(dev->spi, tx_cfg->dev_frequency);
-- 
2.25.4

