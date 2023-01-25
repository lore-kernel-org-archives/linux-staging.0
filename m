Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDF6FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:09:09 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bk16so18209045wrb.11
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RPkDVI+kwbAJ93P/3HO1c8dYxoMR9aHUJQ6dLWT3TnA=;
        b=nFNa9GQFJ8A+X4cryDepHdIoycHcC97q53wLw55WoPYQQILEGPqNqavlMFUx8NYeSQ
         3rQA78vczlT3E67SuKvBhVztNJXiWtAX5u9LvK3WUbN/w0roPt6td5QfWsFLTDY78tYI
         r+XmPa8ztUM6fMeYtgvkPOlO5EvUO/Duoyy4cc132pBbAgw6O+wmvcK0iVIDtr+gOcog
         ida/56erXAFgSQmpBzxep8eQ4j5bul1F4EV70iBTZWWinG/CO2tEdHPMeHnehWCNq0t4
         Ra2wLE/yjWdHfXaMlERJ0hX/NUugFMYMKAnZRBErnq7a3xa4bK2WGCdQ50yX9+OfNA4e
         O0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPkDVI+kwbAJ93P/3HO1c8dYxoMR9aHUJQ6dLWT3TnA=;
        b=tYt7shsCEdzyiOR0qoBoVHA+4re3+VdcOoD+SFT0HmlptMWQ+6GojM1LWXaQsoYMgk
         pgr0l2LctJr7aLIfKrBKBXBA5+OGLjHaL8e3DvpPcB3laF3tOHf90cbWvmAoe+spAPr5
         RD9uWAbp6j9rLJ8jpUulcFVYNCqhAE2d0Q4YCI7DWePOsm4uy0klH3f/z0bdOY9pg8NA
         5RxALpeZGISPDIejmQ5C08w/B9nNRNzervGXGT0+P/j/78L3co8pAa3B5qPHzKA1kIE+
         Yf3em0K86DqF1fLDEw73egYc7qvybfk/PRGCGmp3v65RbOz3bo6L547ovmYIsQbMgk4H
         Wlug==
X-Gm-Message-State: AFqh2kpi8yK9Mf87cWTYVGous1JvALIImE9Epux6aKH0wJr6gOy1WqHG
	eeh+Z7L59JHBrCY1WiVIbGE=
X-Google-Smtp-Source: AMrXdXuuDPM7/KXGtoSE1pkM7BeCpSWKMaxKX46SFnwLrs1/YM/M7poDu8pTStktfCpl4ld0LgG4sQ==
X-Received: by 2002:a05:6000:69d:b0:2be:184:8af6 with SMTP id bo29-20020a056000069d00b002be01848af6mr6524766wrb.0.1674677348695;
        Wed, 25 Jan 2023 12:09:08 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d430e000000b002366e3f1497sm5248458wrq.6.2023.01.25.12.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:08 -0800 (PST)
Date: Wed, 25 Jan 2023 21:09:06 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] staging: rtl8192e: Remove unused variables rxint,
 ints and shints
Message-ID: <ee6ee009d139a3da3d2c171d7ac6454271b4da9b.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

rxint, ints and shints are initialized and increased but never read.
Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 +------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c5fe8e0aa83f..ff9dc06642f6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2123,7 +2123,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
 
 	priv->ops->interrupt_recognized(dev, &inta, &intb);
-	priv->stats.shints++;
 
 	if (!inta) {
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
@@ -2135,8 +2134,6 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 		goto done;
 	}
 
-	priv->stats.ints++;
-
 	if (!netif_running(dev)) {
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 		goto done;
@@ -2169,10 +2166,8 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 	if (inta & IMR_HIGHDOK)
 		_rtl92e_tx_isr(dev, HIGH_QUEUE);
 
-	if (inta & IMR_ROK) {
-		priv->stats.rxint++;
+	if (inta & IMR_ROK)
 		tasklet_schedule(&priv->irq_rx_tasklet);
-	}
 
 	if (inta & IMR_BcnInt)
 		tasklet_schedule(&priv->irq_prepare_beacon_tasklet);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index bb942283bc7a..2d1561a202d0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -184,9 +184,6 @@ enum reset_type {
 
 struct rt_stats {
 	unsigned long received_rate_histogram[4][32];
-	unsigned long rxint;
-	unsigned long ints;
-	unsigned long shints;
 	unsigned long txoverflow;
 	unsigned long txbeokint;
 	unsigned long txbkokint;
-- 
2.39.1

