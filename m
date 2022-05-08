Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC867E
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 19:29:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u3so16774840wrg.3
        for <linux-staging@lists.linux.dev>; Sun, 08 May 2022 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9QFfIJ0zp70wh1r3yoFEFoWLM1BFKqSY/ZHhqFBuEHU=;
        b=K0B2dbK50dmNsQRADIawwixlc0oGeFyei7luQ72eUhwixypxD7XDnpB+5MCas5ERSL
         MagCpv6cGyCJmsdb2VOFklkryezDNP0miWtTEoAE9ATIagrv4AK4+0ytgQqUC0p8hzM/
         05RDoGQovT+ApFN48lVRi7RdQKXViVbRG6CsJMpN8ahlqcx6GPAm3kxWs+cD6fMGnZZj
         j8kXANGYE3rueiecDUId4qE2McsElMuuflrYK7LU5DtjfrB9A0Xuvyl6cUPfl9RHAXOc
         w/GD8b/rhNH1tptwNTRTdbgmRr016UR/jvkv8twd9AKR0uXTBu7ypGc6wfjhfDrS52Xl
         gduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QFfIJ0zp70wh1r3yoFEFoWLM1BFKqSY/ZHhqFBuEHU=;
        b=L+KPgV2tkW+HsEX3xQ/gQoiSa+mfYBIbSvlnbfa69MsSsDFs3tSB9aKjw8hIh/8CZs
         VXh8VPMFOy+k+EFIgT3CFeyt65hNYmDNYsJuJN6PWFXn7fD2ilL2pWGTGWCeVz/g0ITV
         PPgRMH0gVYadArnhG7B64JRsvnP/IAEjpQRi0e8noKF1PlalF/OSiLzregOX63JlwIad
         m+xppPF9+0alB1+7x1/zHdUwTWon69N64kkWTXDbv+t5ZIk7lZ74TjGButLyAKklUqn3
         HSwYzRuZ67k/JMh5BepJ12BJ8QcHg7Hikw0qSxKPQMWeXXOxhP1aNxSAtmhVdOysU7zV
         Xt/Q==
X-Gm-Message-State: AOAM532vZtWiMGEjS/bzJvccDGnyGrvCQJ0WUk6z5SY66zhySInu9Ra4
	TzHQVL0xYcp3ECD9wffjhhE=
X-Google-Smtp-Source: ABdhPJzBhvpRzlaZ+zFniePfD11YbZVWuBlYVqhc6u53QLgiVzaD5tnNP1PQe2Ry12pW+OgxzDE/yw==
X-Received: by 2002:a5d:414a:0:b0:20a:d5f9:8b62 with SMTP id c10-20020a5d414a000000b0020ad5f98b62mr11303133wrq.492.1652038195747;
        Sun, 08 May 2022 12:29:55 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f3ed42031f51b0dd5fb7060.dip0.t-ipconnect.de. [2003:c7:8f3e:d420:31f5:1b0d:d5fb:7060])
        by smtp.gmail.com with ESMTPSA id bv7-20020a0560001f0700b0020c5253d8d7sm8840402wrb.35.2022.05.08.12.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 12:29:55 -0700 (PDT)
Date: Sun, 8 May 2022 21:29:53 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: vt6655: Replace MACvStart with VNSvOutPortB
Message-ID: <d998305b4dec2827b0e13e49938e68a32517c487.1651957741.git.philipp.g.hortmann@gmail.com>
References: <cover.1651957741.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651957741.git.philipp.g.hortmann@gmail.com>

Replace macro MACvStart with VNSvOutPortB and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 3 ++-
 drivers/staging/vt6655/mac.h         | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 4f26f5c7e84f..1ab7c1c3644d 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -406,7 +406,8 @@ static void device_init_registers(struct vnt_private *priv)
 	MACvReceive1(priv->port_offset);
 
 	/* start the adapter */
-	MACvStart(priv->port_offset);
+	VNSvOutPortB(priv->port_offset + MAC_REG_HOSTCR,
+		     (HOSTCR_MACEN | HOSTCR_RXON | HOSTCR_TXON));
 }
 
 static void device_print_info(struct vnt_private *priv)
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 5b684194745c..3a32a0146c85 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -605,10 +605,6 @@ do {								\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 0);		\
 } while (0)
 
-#define MACvStart(iobase)						\
-	VNSvOutPortB(iobase + MAC_REG_HOSTCR,				\
-		     (HOSTCR_MACEN | HOSTCR_RXON | HOSTCR_TXON))
-
 #define MACvRx0PerPktMode(iobase)					\
 	VNSvOutPortD(iobase + MAC_REG_RXDMACTL0, RX_PERPKT)
 
-- 
2.25.1

