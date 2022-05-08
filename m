Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C07E
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 19:30:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i20-20020a05600c355400b0039456976dcaso5303746wmq.1
        for <linux-staging@lists.linux.dev>; Sun, 08 May 2022 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DNNfm64Fzck7HZ+kpn5zl++XhRLhmj2A5Ac4BEuoyfs=;
        b=ZE0EGGr4/KNSvWhvZ1ZbwN0IFJmzqYiNKAguMnkGzX1LabvrpM8DZYkuuQdgFmb2GH
         v5emtNJZanTqvl/iQw4NSaeOwLwHqQWPSXMi73ouzZ8nS9FHQuaWvX07BTYQhp+EG3ls
         12XXfOe0UTl1e+lsGPHPkgrx4vCMMukCrm1OBuhbKHdskbyb9IKXI7d2qu6XYyGRpO2H
         G9rmtUMXCjB5rPj2Oju8C6ikTGU6yVb4Qe+dgmY3ZQEqdIdFRA38Jjlw1DXBq5M8FOY3
         HDCa5KVm9atX+WId8gc4kX/TPAYAPdSKvJBJw/G/7Fv/ZD6AZk87c8Gv9hk6s1S1Zsap
         vo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DNNfm64Fzck7HZ+kpn5zl++XhRLhmj2A5Ac4BEuoyfs=;
        b=4Askoz9eN9bd3lzNZwyGdKdM+EmcrAMrOoHz+wOCEx+2hvs7UnEWygTSKD/ppoqLbm
         U92QUnwB1FzjGiD7z9BiKtHyAJfZdu3q6KFduKwtD8WFmA1s68KrYkFZkiTADJ92V7lm
         u0so0blJ/zm35HN6ENFyIb8zTNOZHMkgwZa3VbvTBscMglcR6K3CizmAnCEF+LVxeNQp
         vjdG9INizUEEuERTTT2z/3TaJAXawfbWgEtPT5TYCUaz8NjW3IsBvLSmrwl319A0sWfb
         J8GIkkV8w68FGYvKK+tENUviIzSrNRAAQDF1DD/F2+Dr4V0ZuoxM36xKbEHyws6yYs3c
         JEPg==
X-Gm-Message-State: AOAM531UD3AirDKeCGJhXWwMGvRneD+HLdpHN1YIpLe11XRqbbjqsMU7
	8b7utZkcOC2ESYDsbuMHi/s=
X-Google-Smtp-Source: ABdhPJw81OhtuXuoKmMUWTfoMPYbMpZkHfdboo8+1XVbOeTdDB9P0ID9Oq8TTRY7tgRVpK0e6t/tgQ==
X-Received: by 2002:a7b:ce82:0:b0:394:2514:6f07 with SMTP id q2-20020a7bce82000000b0039425146f07mr12965709wmj.56.1652038200875;
        Sun, 08 May 2022 12:30:00 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f3ed42031f51b0dd5fb7060.dip0.t-ipconnect.de. [2003:c7:8f3e:d420:31f5:1b0d:d5fb:7060])
        by smtp.gmail.com with ESMTPSA id e10-20020adff34a000000b0020c7ec0fdf4sm10460160wrp.117.2022.05.08.12.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 12:30:00 -0700 (PDT)
Date: Sun, 8 May 2022 21:29:58 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: vt6655: Replace MACvTransmitBCN with
 VNSvOutPortB
Message-ID: <698ce973d92065846a9db4339f017cd9e094706e.1651957741.git.philipp.g.hortmann@gmail.com>
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

Replace macro MACvTransmitBCN with VNSvOutPortB and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h  | 3 ---
 drivers/staging/vt6655/rxtx.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 3a32a0146c85..89fad233bbc6 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -651,9 +651,6 @@ do {									\
 		VNSvOutPortD(iobase + MAC_REG_AC0DMACTL, DMACTL_RUN); \
 } while (0)
 
-#define MACvTransmitBCN(iobase)					\
-	VNSvOutPortB(iobase + MAC_REG_BCNDMACTL, BEACON_READY)
-
 #define MACvClearStckDS(iobase)					\
 do {									\
 	unsigned char byOrgValue;					\
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 53506e242a96..14feff4f2e70 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1426,7 +1426,7 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 	/* Set auto Transmit on */
 	MACvRegBitsOn(priv->port_offset, MAC_REG_TCR, TCR_AUTOBCNTX);
 	/* Poll Transmit the adapter */
-	MACvTransmitBCN(priv->port_offset);
+	VNSvOutPortB(priv->port_offset + MAC_REG_BCNDMACTL, BEACON_READY);
 
 	return 0;
 }
-- 
2.25.1

