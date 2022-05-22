Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC233E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:49:19 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i40so16698617eda.7
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X6jHoHps0q5WNAhJR5TeansVVs6HOJArSyVry609OmE=;
        b=anSEG6e8tIilMqbhKKmHRNGTK4djBcS/4Yye8KoEGF+scQ1DfG9hfJYdZ7iBi6mbUX
         Xu+kqpGEiXudJa6UsPqEBcen4K2ovB7I+J0Gb8NG6zW2KHo2W5/Mp2jLBesYdo/InXfi
         BSOCD4V3F/Qesxhe1RehyI/hzhAEBfTbvJ/33/tEqCBc9K69piz6Um0j5jfOZTD2dqpN
         jVdN8XmfEtS6rXsjzduTiBhKq/+zMSRNn/Zi/gcfRxHYIXCDqOxRs1RvrKpQtII10XoG
         orWP7ShLrdzlHf4ilmgnWrztlKpXpM8vmtKhgm4VDW+H53JHYbfvILbPMwRr7jqV6Atm
         az8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X6jHoHps0q5WNAhJR5TeansVVs6HOJArSyVry609OmE=;
        b=R7/1/bg8IM+Nf9RsZlD2LcH1zfWLkvqRWyLLzAhJXsEticWCWW7zfliySnyZb1pna9
         Ff5jMKnHGNlWAcXjopfZXu6VKc6T/dmT2TukPkf2A7aHoFwL+KnYopW6HXUGTv3Xp+nE
         FMn6/KzWKX5TYZSSvGVUZtg79Zqsjlz4r++lqIaAJFn11lUXebkz9Ky4kQBIvjb4PWi3
         X34BEwrgua7xdaAu3/G8IZMPTUFP1NmnvvZiR0IngcTa5OGmkxAFgB4PZ+VU/b8WoKkU
         IoumCp4lUVkRuPNiuaRG8OrgHhtvHCd4L447UOKuWo9pAuIkZhmZTbRaQliXag3zEJvR
         aFzw==
X-Gm-Message-State: AOAM532+LyS9fFjuFUA1FPdadpVLQZeRsj6XZ6JyB8WMhfVmG3qx2afR
	DSu0HsLp79KDrCp5gRKGDh4=
X-Google-Smtp-Source: ABdhPJzEEj6JiHv7UsJL0p9sxDBh4ctR7qH6KGaieu0hL9XlKxheAkc+y9AfcOFhKOj9f3z+vwLo8g==
X-Received: by 2002:a05:6402:1914:b0:42b:698a:608b with SMTP id e20-20020a056402191400b0042b698a608bmr2322920edz.5.1653248957449;
        Sun, 22 May 2022 12:49:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id f10-20020a056402160a00b0042617ba63a7sm7239964edv.49.2022.05.22.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:49:17 -0700 (PDT)
Date: Sun, 22 May 2022 21:49:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: vt6655: Replace MACvRx0PerPktMode with
 VNSvOutPortD
Message-ID: <3da471693a65adb75a637805ee6d564ddafccdda.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvRx0PerPktMode with VNSvOutPortD and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 drivers/staging/vt6655/mac.h  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 23804cd72477..e907dfd58d1f 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -452,7 +452,7 @@ void CARDvSafeResetRx(struct vnt_private *priv)
 	}
 
 	/* set perPkt mode */
-	MACvRx0PerPktMode(priv->port_offset);
+	VNSvOutPortD(priv->port_offset + MAC_REG_RXDMACTL0, RX_PERPKT);
 	MACvRx1PerPktMode(priv->port_offset);
 	/* set MAC RD pointer */
 	MACvSetCurrRx0DescAddr(priv, priv->rd0_pool_dma);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 89a3979aeb10..161130084936 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -589,9 +589,6 @@ do {								\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
 } while (0)
 
-#define MACvRx0PerPktMode(iobase)					\
-	VNSvOutPortD(iobase + MAC_REG_RXDMACTL0, RX_PERPKT)
-
 #define MACvRx1PerPktMode(iobase)					\
 	VNSvOutPortD(iobase + MAC_REG_RXDMACTL1, RX_PERPKT)
 
-- 
2.25.1

