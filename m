Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F37C
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 03:50:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id mf7so20472164ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 03 Feb 2023 19:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCWkM6WQTItTheVs3lg/M+RkOdpCXGfWQTV10D4Rk+k=;
        b=UApwxAZ+cuT4pN/IKFYYh5OC4XNNytOB4QQxcPzrDa75oM/D31Tc8mxi9C18A2I9pZ
         9GnndYNfldX+EMdsInch8WFdULuVxBz6v/d/KaCvPrtmuz/VyjR661X3oJkNhNdkU8c2
         sz0YYlyn1GOQPAZItr3ZJv/y0WPigNk1K0FFa4Efu+S94lOpNrY8rZzJZggA5x3h9VxT
         qA3a/g/8znsBneJlskOx3XUnixXuGLnKoI6Ch49zesJXxeDloOreWNkU9ZJwD8EN1Qm1
         jCPfuF+0UhosEdr2Tkx3ACqrqadzhcKGrCt7NVJoroovgFsO7EeDjyqHYC9TwsUZ/l5g
         BBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCWkM6WQTItTheVs3lg/M+RkOdpCXGfWQTV10D4Rk+k=;
        b=h6RdKVWQyGLkAvhCDHtdJgheyRyfiisaxvGnGbl3VS4Pq8WXkdqpezXpMntrPNdb9X
         Pq19GFxdjf5b1mfQyfv0LDYBVfOjmcA5uxf2HOveQOndbZmkfsRYFfDMymIewdXrO9sV
         Pwy2av9q8idYEBNQP0wog14Jcxq8kvdD3rLhbmDoGUtwk6Obo9IUhy6YbHkRxAHrL9ZV
         z0yQzmLKvryOe+THA3aFzHrlpO1b60tmmVr8EHh/Fs9jSZAlQLPp8nvpD6kmsr5pmw20
         XYUsf6bYs9aE+w4DO/756IP2Hd+stiXo1cJwd8IcqUtgYtsUHvYBJjU/tthvXgEpV6w1
         iAsQ==
X-Gm-Message-State: AO0yUKXDsb5JYA1XoYZpNukkyAU9pKbuKzai3dUiu1h1bp9kPH/rKn67
	YC/zsdz6Veo+VsgSLCjyOCU=
X-Google-Smtp-Source: AK7set+hnkWy8CQB1d0V+34c61bcsuBElVL636DqNUNI6ozBHF2Fxu0b5XfvUPBK68u70HEvE3c5+A==
X-Received: by 2002:a17:907:9724:b0:88d:d76d:8527 with SMTP id jg36-20020a170907972400b0088dd76d8527mr16254813ejc.47.1675482643334;
        Fri, 03 Feb 2023 19:50:43 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906688a00b00889db195470sm2237241ejr.82.2023.02.03.19.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 19:50:42 -0800 (PST)
Date: Sat, 4 Feb 2023 04:50:41 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: Add braces to macro parameter 'iobase'
Message-ID: <Y93WEZGlT5Vmeb50@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
 drivers/staging/vt6655/mac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index acf931c3f5fd..a33af2852227 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,9 +537,9 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
+#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
 
-#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, iobase + MAC_REG_PAGE1SEL)
+#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
 
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
-- 
2.34.1


-- 
Thanks & Regards,
Guru
