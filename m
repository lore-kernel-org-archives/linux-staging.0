Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BB72
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:25:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z17so17452895wrq.7
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mua6zqqEbeIXX2nz/ZEk0bQCbTPk5hLMpzGg5u+Zehg=;
        b=rDAc9AZYFZjHR5iCu0vt5r5VVP0hoOfR16ZHQLQWH/W4+ndRfhBBe4IpqJ6KXESG+p
         xmjzsDFIFTapxDqwjkdGdgeqcRvX91Iq51StXWbFmp9D/H0znc81k3UgkIsXr7RuJB9g
         CsLcAZubJujPxE9l8N1DbtFeaneA3+kR20XJDBpRJqzGHfH+BOob96FPt8w/RoBnFHbN
         PZlBo3oUWZ8gcjoueXHzwTJXssyDYt7IE0qBRHzOK7P5pNnAFVhGKk0bOecN02mBVZKe
         l8OZfRqSGdgqbxTG/+PvBYWM+ZPcT0YkYXHif4Ds8+mwfuMlEoKMBTOjBMWBl6/U81b/
         ge/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mua6zqqEbeIXX2nz/ZEk0bQCbTPk5hLMpzGg5u+Zehg=;
        b=AeX0Yjq2l/OnsHtVMyrcl/dUKbI9iL0naCXv0kXiGmCXoKp7VyuQZ+pcxpyLzT3yL8
         CS5a8c9zHVhds/JGmFgCbMxC5YDUZ1pwh0q5lT4jDERhtlQoRfw/XSZyqa4TGbnmExaG
         XRf96N9moWvZlQK7oVfPHfS32JOshX6o73DXS0sRDEjk4fKm53UgILlafiZf4DEf7oLq
         88SqucrgbV193o/xpzCe0SKtSPYh4aXe8nLtY21Jg6BRTtwnCI7yfcNQypQTBwePlw4N
         phvXHiWG4BErcS2oDUHps55WMGQnAFbaQz+L/W8jim0Fgb2wmCkNQ4MaZvhr8T0fsedM
         WzLw==
X-Gm-Message-State: AOAM533fqZ+P9Y4tdgWxw4A+Z5dDrNCwLT9A7eJX/4mzk+fmhNXCC0bH
	2oJ1YCht+CmyoY76WcTzzVWC/g==
X-Google-Smtp-Source: ABdhPJxyV7+IyPDzSmNK+8Mf6Urpfz4V/jNMYPTFgsj8GZws71xFPGKpD/7eTRo1D3BCxcGZuUeStQ==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr3889697wrt.129.1621513552299;
        Thu, 20 May 2021 05:25:52 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i11sm3205643wrq.26.2021.05.20.05.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:25:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/6] comedi: drivers: comedi_isadma: Fix misspelling of 'dma_chan1'
Date: Thu, 20 May 2021 13:25:38 +0100
Message-Id: <20210520122538.3470259-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520122538.3470259-1-lee.jones@linaro.org>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/comedi_isadma.c:157: warning: Function parameter or member 'dma_chan1' not described in 'comedi_isadma_alloc'
 drivers/staging/comedi/drivers/comedi_isadma.c:157: warning: Excess function parameter 'dma_chan' description in 'comedi_isadma_alloc'

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/comedi/drivers/comedi_isadma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
index c729094298c2f..479b58e209ba6 100644
--- a/drivers/comedi/drivers/comedi_isadma.c
+++ b/drivers/comedi/drivers/comedi_isadma.c
@@ -143,7 +143,7 @@ EXPORT_SYMBOL_GPL(comedi_isadma_set_mode);
  * comedi_isadma_alloc - allocate and initialize the ISA DMA
  * @dev:	comedi_device struct
  * @n_desc:	the number of cookies to allocate
- * @dma_chan:	DMA channel for the first cookie
+ * @dma_chan1:	DMA channel for the first cookie
  * @dma_chan2:	DMA channel for the second cookie
  * @maxsize:	the size of the buffer to allocate for each cookie
  * @dma_dir:	the DMA direction
-- 
2.31.1

