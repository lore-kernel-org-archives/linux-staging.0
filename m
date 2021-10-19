Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB242C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 10:29:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o24so3998413wms.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q4BQwnakirc9W0Aj2C9ToESoORO99Cacuij7TLf/+IU=;
        b=Udy9fpTdndssgO8T0B4TMgUAVtwPcelbUE6NFCY3LnMihptQdlIjtGmh2TPajzXyIF
         ekYMNCW4Gfx+8xHu7z1SmPF6tiBagPg79PLTcALtezCWrdQ8/Bdaw2hLrNdBqnj3nuvi
         v1Y4PBzQybA0nkdzTPQp3mwpBPwEaOT0bjsH+AYa0W19a4FT6b80QgWhpxQgxYe6bAFl
         MFO1fgweD23BivI2HM10b7GAmcZWhV92Hzd7dxBJNex+8mRStiApDDqoba07bXeaF8PH
         HtZcpBYI684pjvJu7LZ66G3qeKquTrKGpzWf2RzkzOBQ/3NlY6N53vNMsvawarwe6kJx
         2ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q4BQwnakirc9W0Aj2C9ToESoORO99Cacuij7TLf/+IU=;
        b=N3YkxglgWUTsWuX3oYjnp0YxI94KqSKIh98AbXbrhA8aMHd1GSRloEfQQbyqS7HLqA
         ICdi1xnI8T2bvGSUT+HorqBWuGhXNQv36vDZAdxHBACygrTYr2ZpZn9mw4YSK9BUN4Od
         w5WI76e14/+BzQEjdvR4B+4jWT7NfeGGLCvgzJYsnJ1+MCLxGVYyfvvyK1WkfnJYqm+Y
         JmBP+fvEExRYx7OlbQYaEe/NNqmf9Y5U/aR/Bogk+OYlMaSxcQgrE/Daw/R2iCOtbIVx
         yjbDeU+MRZ+A9xKJgzNmGJOI2vMGP01rjYuni18//IOeP/AXM7Ps5bKgzAFfvzZ5R5oh
         aC9w==
X-Gm-Message-State: AOAM5300nPnif1LM4HfFTpr0ikWJYD8A+GDdb+afXIe9oNCHORbiouLZ
	m87HLpSYrde5BUl8Fm4AsBCsCH54CcM=
X-Google-Smtp-Source: ABdhPJyTOGfRBosWdoMn1u4u7ZGb9m5YkEJlJlOq8NeUYhA6vy6JJi+volKNLFP4MSx21uUCGhTTsw==
X-Received: by 2002:a05:600c:3b11:: with SMTP id m17mr5224135wms.157.1634639368637;
        Tue, 19 Oct 2021 03:29:28 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id i8sm11365026wrv.47.2021.10.19.03.29.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 03:29:27 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 2/2] staging: mt7621-dts: make use of 'IRQ_TYPE_LEVEL_HIGH' instead of magic numbers
Date: Tue, 19 Oct 2021 12:29:15 +0200
Message-Id: <20211019102915.15409-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019102915.15409-1-sergio.paracuellos@gmail.com>
References: <20211019102915.15409-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes 'gdma' and 'hsdma' are using magic number '4' in interrupts property.
Use 'IRQ_TYPE_LEVEL_HIGH' instead to align with the rest of the nodes in
the file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index ea9cbc6b92cf..82b64d4aab2e 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -149,7 +149,7 @@ gdma: gdma@2800 {
 			reset-names = "dma";
 
 			interrupt-parent = <&gic>;
-			interrupts = <0 13 4>;
+			interrupts = <0 13 IRQ_TYPE_LEVEL_HIGH>;
 
 			#dma-cells = <1>;
 			#dma-channels = <16>;
@@ -168,7 +168,7 @@ hsdma: hsdma@7000 {
 			reset-names = "hsdma";
 
 			interrupt-parent = <&gic>;
-			interrupts = <0 11 4>;
+			interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
 
 			#dma-cells = <1>;
 			#dma-channels = <1>;
-- 
2.33.0

