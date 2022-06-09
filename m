Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B43210
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 22:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654814083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4JBJAbQAGlq6duKRB7SY6Yx4CLSxDIaBCygjW0wpUqc=;
	b=YA+gtBX9+u2nIRywjzGY5/yaDyXW2dfBChGZSDFg0yB8+1CI99KzjkRxeb7xe06zndtrZa
	E12qdff4OQE8vlpIAjrv7KU7qu+DSXHpfLtZuHwYvJvbP/Fe0wslYFHSIJGtdQbD3EZbBp
	3f7nreh+G4Pky4MoI3ptlLizOYS37n8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-6My9y_PpMr2U6TK3tadvjA-1; Thu, 09 Jun 2022 18:34:42 -0400
X-MC-Unique: 6My9y_PpMr2U6TK3tadvjA-1
Received: by mail-wm1-f71.google.com with SMTP id bg7-20020a05600c3c8700b0039468585269so8806662wmb.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 15:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4JBJAbQAGlq6duKRB7SY6Yx4CLSxDIaBCygjW0wpUqc=;
        b=vP9kqdfyUN8T73yLJnDdQHtzQ583DiL0MocIq0ItT97fthgPrdpRuEW1l8ACGd8onE
         3QKJPXp5+UviXB26GJjUYHJ94YQCIahh0Y4OVVIfiVH55tFxDrHezX1I75mJxbLKe0G1
         JYmNAjVXVm2vo37SdGP/9rzdgRDn06dOi1LijNXq40LHV4bm7RQkJCeR9kGZ7Ilch2cB
         MubYykilY0c5SRB7y7kWMuK3Z+uZNK4knx8uzh35akK0QWyls9jp3DSAk50quA7nzfHG
         60WYrWsfSXTm0+xn3/np658O+VeFZUfJvyRc3D9ZhVO1DzgrzbmlSiFOcMT7QfN8ODzX
         15gQ==
X-Gm-Message-State: AOAM532JNxBF8kGN4zAgt+R4eS0rVqXTpQOCC7WEtTzI5fAoajw5TIqz
	XuWWNhT54LHq6vAhmMokjBrvEdQGNJbNgQD8hO/1QEsPAgFXsOIWv4exUofRPmzRyIkuTp7ZwTs
	g3OhXKyh4+3qkd/6uH99eoIBE1g==
X-Received: by 2002:adf:d4c7:0:b0:213:ba6b:b017 with SMTP id w7-20020adfd4c7000000b00213ba6bb017mr37035302wrk.652.1654814081432;
        Thu, 09 Jun 2022 15:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBiSUPEKkjirE2HkOG+I6xW8jverC00Ir2fvZGqGugiHwBbX2BUOYVgy8sHotRHakXFdIqqw==
X-Received: by 2002:adf:d4c7:0:b0:213:ba6b:b017 with SMTP id w7-20020adfd4c7000000b00213ba6bb017mr37035279wrk.652.1654814081091;
        Thu, 09 Jun 2022 15:34:41 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b18-20020adfde12000000b0020d0f111241sm25706675wrm.24.2022.06.09.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 15:34:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Sam Ravnborg <sam@ravnborg.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jerry Lin <wahahab11@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: olpc_dcon: mark driver as broken
Date: Fri, 10 Jun 2022 00:34:24 +0200
Message-Id: <20220609223424.907174-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The commit eecb3e4e5d9d ("staging: olpc_dcon: add OLPC display controller
(DCON) support") added this driver in 2010, and has been in staging since
then. It was marked as broken at some point because it didn't even build
but that got removed once the build issues were addressed.

But it seems that the work to move this driver out of staging has stalled,
the last non-trivial change to fix one of the items mentioned in its todo
file was commit e40219d5e4b2 ("staging: olpc_dcon: allow simultaneous XO-1
and XO-1.5 support") in 2019.

And even if work to destage the driver is resumed, the fbdev subsystem has
been deprecated for a long time and instead it should be ported to DRM.

Now this driver is preventing to land a kernel wide change, that makes the
num_registered_fb symbol to be private to the fbmem.c file.

So let's just mark the driver as broken. Someone can then work on making
it not depend on the num_registered_fb symbol, allowing to drop the broken
dependency again.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/staging/olpc_dcon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
index d1a0dea09ef0..d0ba34cc32f7 100644
--- a/drivers/staging/olpc_dcon/Kconfig
+++ b/drivers/staging/olpc_dcon/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config FB_OLPC_DCON
 	tristate "One Laptop Per Child Display CONtroller support"
-	depends on OLPC && FB
+	depends on OLPC && FB && BROKEN
 	depends on I2C
 	depends on GPIO_CS5535 && ACPI
 	select BACKLIGHT_CLASS_DEVICE
-- 
2.36.1

