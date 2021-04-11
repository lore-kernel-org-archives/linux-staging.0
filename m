Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC271
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 20:49:48 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5-20020a05600c0245b029011a8273f85eso5746739wmj.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=y8zmAuB0V1uZek5By6kezUe2gvROS9UhWxNto8Rl44U=;
        b=M4gznb84QcKSBB549xNmVxUrXXVflXsDoyhxXQNId/1d7wQU1E2DR0+iSsEhduWIUX
         Bmz04jOkQX/ViVBUtOnIUVFLhoW87y8dismExesc0+Yk8Z955x/t3naySYReAsa4a8eA
         bNfyuSD8kLrbi+9TGce7F8YeZ0knW1Bf6ustTvdUjw//DlrlK2INVFynblezbWTD6Fde
         kk30rty8ShSs3VzwQCKIBP75fQ8oN8F3yLeMGZUgIApzQZgvsWfeJD9NOxxufZGkYLsB
         6pe1w+wsvLzmXLQyRXnfxFPQ33GXmvcYh41UQAIOCfUUvgSipq2Dk9Yge952jUkgKFEZ
         ARuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=y8zmAuB0V1uZek5By6kezUe2gvROS9UhWxNto8Rl44U=;
        b=WeJAIIeHV5vPUbdjLLB/Ac6ubCUqWI5A2pYpJTVEPI8628aR3nkkwdUulZzSlxRxNt
         ynVg/SlIF9XSgcEDW8NJlV3WGjcwgfNZPj9qMdGr8lrDMmq/2ktxJSxd+nPtJp06UHJS
         WhtJQvSOCbJX1IKnRfKemso+g27hrR5/Nvqvymk8o3RtDUXiJJrOCwlDwKrb/JIfJCj0
         EXowgwfB3hUrsOPHvar6vNY211pPTuV7e2u+7mu1BIfvRSFVcljQCmr9F6L4WRPmbXrI
         mixhea64T9jjx0yh02y+4cE1V3RWIASvkvwCPmKkeuBC7rDy+skBF7F3+67ruVkfSHmu
         3REQ==
X-Gm-Message-State: AOAM531muoKLaK1Lr8L+hbMbdvdHr/YPCXb+pfAaU+zoyc7uNRWnpSNt
	bYO3cBJ1TVQ1tg6m+oc7JXk=
X-Google-Smtp-Source: ABdhPJxBS3Z/+lUzJp5cOGYT3zY1AwXP81gIiuaHg0aB/hMcvgCl3bl4hwHB+WYYJnP08NPP8cEkZw==
X-Received: by 2002:a1c:3:: with SMTP id 3mr22651982wma.32.1618174187234;
        Sun, 11 Apr 2021 13:49:47 -0700 (PDT)
Received: from peggy-Lenovo-V130-15IKB ([154.72.153.206])
        by smtp.gmail.com with ESMTPSA id o18sm6953940wmp.26.2021.04.11.13.49.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 13:49:46 -0700 (PDT)
Date: Sun, 11 Apr 2021 16:49:38 -0400
From: tawahpeggy <tawahpeggy98@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	tawahpeggy <tawahpeggy98@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: Remove line to fix checkpatch error
Message-ID: <20210411204933.GA3524@peggy-Lenovo-V130-15IKB>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

remove one empty line.CHECK: Please don't use multiple blank lines

Signed-off-by: tawahpeggy <tawahpeggy98@gmail.com>

---
 drivers/staging/comedi/comedi_pcmcia.mod.c | 1 -
 1 file changed, 0 insertion(+), 1 deletion(-)
 create mode 100644 drivers/staging/comedi/comedi_pcmcia.mod.c

diff --git a/drivers/staging/comedi/comedi_pcmcia.mod.c b/drivers/staging/comedi/comedi_pcmcia.mod.c
index 0904b8765afs96..3984db1a39c8
--- /dev/null
+++ b/drivers/staging/comedi/comedi_pcmcia.mod.c
@@ -0,0 +1,31 @@
#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

MODULE_INFO(staging, "Y");

MODULE_INFO(depends, "pcmcia,comedi");

-  
MODULE_INFO(srcversion, "ED971F2E01020DFA2B04486");
-- 
2.17.1
h-Hartman <gregkh@linuxfoundation.org>

