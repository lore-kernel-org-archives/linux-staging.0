Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03372
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:25:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c14so15683762wrx.3
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iake2F5SCqL96uP7ue4UGSnXZRKlzS1m33y5dac9NCQ=;
        b=oDFTfAAAWe1ZccivV9vnUbldHQghKuaYh75rny/yV4nmtno8d05eavadzGyGqJbhg5
         bIhmDo5beDOYKUM0xCZKhT7cWw6XZOqpJ3LlkeUPmN/wx9w3rBns6zoxTXBsDeHxYrOA
         98vJwg4Ai42N7ZxorY4kQKVHcGRZcnw3bx0zLDoJF9g+i0BPszT0CQbhmdheSp56jz4h
         tdgyN4Rnuya/RsCTNrm9REX1XwC41GZHWIVikyXyS15iS2HcURA8jg/zd66XAKKaBEqz
         tcIcB4lnZyMw29FsdAc+9phu/LDJj4UuFlLT3C98crUHMfqD/aezKyqckbXT+X5K4HKr
         zmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iake2F5SCqL96uP7ue4UGSnXZRKlzS1m33y5dac9NCQ=;
        b=hZnn47hSB+zVQJS3tEtS6bHBwwE6ntRJE7qImmIyd3GQ1/KMbxu2836nweBoCSLudW
         qXb+vGjytyL2OrH9h7Cnn7yjosbKM6+cT/v8HvDRrTSnxzeX/6uV4e/ZnDQG+Ogx8z5R
         /qHxzOCawAOYO8g9HCXHUHP0LCU2WUPvJ6NSNYqmzZUfwKyYayL1Dz1tUANBr9Q4BWw1
         uhb7ELjyMosEgosTT0EvZyvhtWae8G/TbibcPfeo52ABXsS/gDDi8MKBiYtSMjEYGtGc
         sJ5uq2uccZiRd3mIWdZjRgT2XrcMNJqnJhuOISOSG5h6MMIqPwwEA/sXXGCObFJEy4ed
         4Vdg==
X-Gm-Message-State: AOAM532H6TThWxAamGrekrJVj+MpXvqTHRG4tERSGwdpjUc7kT1u0phh
	YRHsMJ4QwYmswxptcSKNoZLq9g==
X-Google-Smtp-Source: ABdhPJyw/pJKuyjGhmfBWQzQ095HIZL4gldZsVBTphZkrJrj9Hn0Sp0waI2jo1RWYamFVis+mj/7Mw==
X-Received: by 2002:a05:6000:180e:: with SMTP id m14mr4035783wrh.229.1621513550423;
        Thu, 20 May 2021 05:25:50 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i11sm3205643wrq.26.2021.05.20.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:25:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	"Spencer E. Olson" <olsonse@umich.edu>,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/6] comedi: drivers: ni_routes: Demote non-conforming kernel-doc headers
Date: Thu, 20 May 2021 13:25:36 +0100
Message-Id: <20210520122538.3470259-5-lee.jones@linaro.org>
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

 drivers/staging/comedi/drivers/ni_routes.c:249: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/staging/comedi/drivers/ni_routes.c:398: warning: Function parameter or member 'routes' not described in 'ni_route_set_has_source'
 drivers/staging/comedi/drivers/ni_routes.c:398: warning: Function parameter or member 'source' not described in 'ni_route_set_has_source'
 drivers/staging/comedi/drivers/ni_routes.c:524: warning: Function parameter or member 'src_sel_reg_value' not described in 'ni_find_route_source'
 drivers/staging/comedi/drivers/ni_routes.c:524: warning: Function parameter or member 'dest' not described in 'ni_find_route_source'
 drivers/staging/comedi/drivers/ni_routes.c:524: warning: Function parameter or member 'tables' not described in 'ni_find_route_source'

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: "Spencer E. Olson" <olsonse@umich.edu>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/comedi/drivers/ni_routes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/comedi/drivers/ni_routes.c b/drivers/comedi/drivers/ni_routes.c
index 1f2aa3b239a0d..f0f8cd424b309 100644
--- a/drivers/comedi/drivers/ni_routes.c
+++ b/drivers/comedi/drivers/ni_routes.c
@@ -245,7 +245,7 @@ unsigned int ni_get_valid_routes(const struct ni_route_tables *tables,
 }
 EXPORT_SYMBOL_GPL(ni_get_valid_routes);
 
-/**
+/*
  * List of NI global signal names that, as destinations, are only routeable
  * indirectly through the *_arg elements of the comedi_cmd structure.
  */
@@ -387,7 +387,7 @@ ni_find_route_set(const int destination,
 }
 EXPORT_SYMBOL_GPL(ni_find_route_set);
 
-/**
+/*
  * ni_route_set_has_source() - Determines whether the given source is in
  *			       included given route_set.
  *
@@ -506,7 +506,7 @@ s8 ni_route_to_register(const int src, const int dest,
 }
 EXPORT_SYMBOL_GPL(ni_route_to_register);
 
-/**
+/*
  * ni_find_route_source() - Finds the signal source corresponding to a signal
  *			    route (src-->dest) of the specified routing register
  *			    value and the specified route destination on the
-- 
2.31.1

