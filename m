Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D357E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:20:38 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id mf9so18082519ejb.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PCZv/Uz95M1+6hqmuzHaDR2ZyBz0Tq19f4wHlGSIGnI=;
        b=lm9xRjzd/xI2zC28SFIXFHNwsjb9oo6bLwYpKi4rVA9kfgHzZf7piE8NloO5C7gaJt
         +QkXKALaJ18nWtTKSN7oO82UinX0zDCZ/QJg3KUgNO9/1r/Yd9ETiE55vjQl1ZtYNS/z
         Vyl/rLL57gV6gcITiyF22SSb6C3RaJB9m36GYTR7sNzH6o2TCItJJcLQF7XPznEDaOl1
         HLsER6XYz6YNeRPi3uXWwd/NItdsSFgO0FnXJe6LmluWLYpEi+oc62swDNd13EZImrDt
         ZmHQObJs8Sxs53+JscMMeKT3x0DHY1DGM3maVcpsDxHUHZtHcx/9GdaCOj/rDrSIHCko
         ARog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PCZv/Uz95M1+6hqmuzHaDR2ZyBz0Tq19f4wHlGSIGnI=;
        b=YxcCR2WFey8ekpY6Fc8IkQ9dyCEuJiot1Akk61IItI5hRJsTieUq7K8LkRQpNfvJqP
         Lc6/kcplfqW5mUy1JPukEe2/mdpGxoS6z8NbCN45V5DOSKp8gOzBTmwUzrqjnUM12ZjW
         lwT5E7PDoOlK9GC3QdoV//Rs9/IBa+vj+0w94hKQasWwZDBm1cdxrZi100DxJAKIkiQz
         uJ5bT/4/jXus9spcF0nYy78TycpZMwF/c0R6rT/Fo1qHEZdyXPx32e1DTpzD2WXPRnlt
         HnxuPLVwfZSa6S1aTsbUiuTDpslgXJX3Oef5gwG/2apOOVl4qlt1TKhrxBMghGA0mG6v
         liLw==
X-Gm-Message-State: AJIora9g6wGKu02ACq91G1eBVTOujSFHceYg5nfWFJHt71Sct1V4EECo
	VySGA76A0pUWo9+uxJuw8Zg=
X-Google-Smtp-Source: AGRyM1vR5ZgP4WOaEMq0OOqsLpBzxz7sNYRDMgS7w5DXyXW/+9DVFDs1SOqYguaN1V+hwREwL9LxZg==
X-Received: by 2002:a17:907:c14:b0:726:9118:3326 with SMTP id ga20-20020a1709070c1400b0072691183326mr30271442ejc.68.1656958837153;
        Mon, 04 Jul 2022 11:20:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0043a2338ca10sm3751896eds.92.2022.07.04.11.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:20:36 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:20:35 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: vt6655: Rename MACvWriteBSSIDAddress
Message-ID: <1190d93181409679f9ae348a95ea269b48b1115c.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1656835310.git.philipp.g.hortmann@gmail.com>

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 204994692c90..6cf21883d1fe 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1405,7 +1405,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 
 		spin_lock_irqsave(&priv->lock, flags);
 
-		MACvWriteBSSIDAddress(priv->port_offset, conf->bssid);
+		vt6655_mac_write_bssid_addr(priv->port_offset, conf->bssid);
 
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 541c6ed6a62f..cfebd126e42f 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -565,7 +565,7 @@ do {									\
 	iowrite16(wData & ~(wBits), iobase + byRegOfs);			\
 } while (0)
 
-#define MACvWriteBSSIDAddress(iobase, mac_addr)		\
+#define vt6655_mac_write_bssid_addr(iobase, mac_addr)		\
 do {								\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
 	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);		\
-- 
2.36.1

