Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA19638
	for <linux-staging@lists.linux.dev>; Sat, 16 Jul 2022 12:16:47 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g4so6662912pgc.1
        for <linux-staging@lists.linux.dev>; Sat, 16 Jul 2022 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=K1y/UJPxPUwfW6UWjIkb1qyn/R/LCx7VwgOQ6WaAtz8=;
        b=SsowFVwyjPiyY8IH8cHbEZBRAdu8lw6QXB246nYL8DDsaXNd5/olyU7Ju+XjgX5Sfj
         oAG2ILt//jwOlWKbOwCy2RIvH+GZtSZ4+v1vjkv5lpaAFU2yZd6aSASFOYlOEOckjaZy
         m3WcbGffJ8cQVqi6Uav1BHdm+zfeeioPdaG1u01uYYDAAc1KgutZU0fR1nB5d2/S9jOv
         4M8ns3bOroOZNamFYVIyC1Uqw3Q+/06vM1ZuSvhk5I00OPNvZmpNkvw+egaTfB5A5L5w
         re5Def65PcY/x3BGHQmLfg8pI2HWA92h4wChd0dpp3R0v95IM9Lg00oFLvSXD7rE4kfa
         /9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=K1y/UJPxPUwfW6UWjIkb1qyn/R/LCx7VwgOQ6WaAtz8=;
        b=0gd3ERoLpn2bjb5PDNCVn9thTaY5ES+qNl1Yo9S34LJ2ffOZaMsQpdCgB0K2MbUc8/
         5RGcVB1JQPP05HAGpuqJBMS1gJyAgDPfqIoS597X/jGG0bEJYXpS62MgLQ4euSqsA5ry
         cg8ACgNA/7aDjERCXg9YoIA4a+jhA+4Z5rRIUjlj0pGJPO/0Lt8v4cEjJwFQFW9ngv9+
         Kz7U/XkGpM18371zFlpO3AObftXqSPyd8Vo4Sn0MabUd117Giwz0d8Mrf3QqtwY7jQnT
         9TwD9ClyStg8u7yDF5Ep2dU8EgUk0KDQtBnFU0eHYeetdZuzZC0ZSu4B+xzwum+pWPc1
         2a9Q==
X-Gm-Message-State: AJIora8CAEslH/AzEHv8CLdDXOeMlbiXwC37mMd2LuarDhLBp+AgBsqw
	E01nQQqr+JmNDD7tLc9M1dIJU61Itycy2lZw/g==
X-Google-Smtp-Source: AGRyM1trfsrkcG8fM6vlzvMUEWURpvlRXlh3f+awZEa2FQhtn2DlxrU8N4iO7v/i4lg2szwlWAUmcBlOLB8qEj/mCco=
X-Received: by 2002:a05:6a02:113:b0:412:a7c0:da8e with SMTP id
 bg19-20020a056a02011300b00412a7c0da8emr17005590pgb.113.1657973806781; Sat, 16
 Jul 2022 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sat, 16 Jul 2022 20:16:35 +0800
Message-ID: <CAMhUBjmX0BDh-35GQxf3-fXFa8_EKfh2fwYKZDgH4NzGGQHiSg@mail.gmail.com>
Subject: [BUG] staging: rtl8192u: Found a bug when removing the module
To: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Tong Zhang <ztong0001@gmail.com>
Cc: linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I found a bug in the rtl8192u module.

When removing the module, I got the following warning:

[   20.407360] remove_proc_entry: removing non-empty directory
'net/rtl819xU', leaking at least 'wlan0'
[   20.408609] WARNING: CPU: 4 PID: 451 at fs/proc/generic.c:718
remove_proc_entry+0x2e1/0x3e0
[   20.412316] RIP: 0010:remove_proc_entry+0x2e1/0x3e0
[   20.420050] Call Trace:
[   20.421178]  rtl8192_usb_module_exit+0x4a/0x63 [r8192u_usb]

I think the problem is the misuse of the proc entry, but I'm not
familiar with the driver, so I'm reporting the bug to you.

regards,

Zheyu Ma
