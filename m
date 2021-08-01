Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3719E3488
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso1286465wms.5
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTHDgszgVXhUCFQHz+1EdbXmzNspoceHr2u/r5lVlDE=;
        b=LnXapNdmyQpTNWfP1QumUkCemtwMJ1E4NaIuCsKKgxBULVuDG9UJQIO1fZuOFaSudm
         1RjMRl6X+77fDJ++q02NVGOVGOJ5KdzHFeM2FkL4jv4bCSzL7isycygfcbqcXLdJy+dS
         Cr8xvnUVfhIv+9aLgDAt1H9AOi/uUF24ZpxIb8kGGDOwHDZnIbh+rH6eg5vNW5vHWXI2
         6B4I8C8UJO/ZUErKz3g7sd3nQr8C+vhJSxNX1MqM9UJF9jWFeNCNwyHLpABCAZqIjZrw
         9PktDeril9/nW7nWgeA+mpm8OgW37Z6jxXBvmCH7utIJpWKNo3pjBIdLICkdnHNAzv5L
         s51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTHDgszgVXhUCFQHz+1EdbXmzNspoceHr2u/r5lVlDE=;
        b=YFajuVb5qH0ONcyLIgZqxfishhimgGUGF6Nq/Fs8Y8m5eUfM+ORHKqJinacS7mOXOX
         o9MnaY4NpYbdYZH/4tbfoRVeVYNjpONuxR+P+H/HwnLXGpJWiMpWXyb8rqw2yEk6x2f+
         JQX+O4MD2QKbYlXyeTW0dNVku9NZp+wesQJc/82REAOC8d+LhjnDwioA6F+DQbDfBjXO
         ovJt/wkwAw7VXVpbm+PWPhu/zC6KanSQ5oxtbxnq6CTH5sGDDwQyGkTfmkyeNGC2TiTz
         cgrNzWUx4ziO4/2jKAeux6MT33ZL00roBWpPNmx3NzDsPO6HjHFvDrNfZWkTJC9tJY6m
         GHyg==
X-Gm-Message-State: AOAM533d8Af4k5MIH/c05mscSXODy9Vbec3KLpmYNWOA5EuwNBZUu3KD
	+6ZfXHh9U3PzAoJrM9GYvfN+KA==
X-Google-Smtp-Source: ABdhPJwi+O6xFgy7/P4k6rRsBF/E552X5iPNJasRlHrTEXnidGz4AyWiDob2t/FagFqcUxjWjt1t6A==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr6343834wmj.126.1627844683610;
        Sun, 01 Aug 2021 12:04:43 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:43 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 05/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_io.c
Date: Sun,  1 Aug 2021 20:04:27 +0100
Message-Id: <20210801190437.82017-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_io.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_io.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 2c8e7707c9fa..5e3a190d319e 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -182,12 +182,8 @@ void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
 
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved) {
-	     RT_TRACE(_module_rtl871x_io_c_, _drv_info_,
-		      ("rtw_read_mem:bDriverStopped(%d) OR bSurpriseRemoved(%d)",
-		      adapter->bDriverStopped, adapter->bSurpriseRemoved));
+	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 	     return;
-	}
 	_read_mem = pintfhdl->io_ops._read_mem;
 	_read_mem(pintfhdl, addr, cnt, pmem);
 
@@ -216,12 +212,8 @@ void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 
 
 
-	if (adapter->bDriverStopped || adapter->bSurpriseRemoved) {
-	     RT_TRACE(_module_rtl871x_io_c_, _drv_info_,
-		      ("rtw_read_port:bDriverStopped(%d) OR bSurpriseRemoved(%d)",
-		      adapter->bDriverStopped, adapter->bSurpriseRemoved));
+	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 	     return;
-	}
 
 	_read_port = pintfhdl->io_ops._read_port;
 
-- 
2.31.1

