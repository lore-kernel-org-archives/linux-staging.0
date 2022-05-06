Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD4620
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 03:13:48 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a11so5216919pff.1
        for <linux-staging@lists.linux.dev>; Thu, 05 May 2022 20:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=t9ZKsEQo1Den80Ampwi5bEjEZNCMM58cKnc5jFoHVAE=;
        b=ATTy5exSBCfn1gQd9m59fPG3gpTAvdg53X1O5VaKxE098hN9mFiGSSy8T+b6lgjUis
         ATr5rZoxkBf+fJjvDGfT+KQEKj9xj+KW0gznlmCiuR/WihhrrJS/FSIEbzPGo/GY76WM
         3fg1opJIb9ct9nviPqZTYvtKsv5Nivq0Vqs5Y25V7SVsGA7guVtfVHVT1SMstrCrS5zq
         A+LdOPnNUR9q9/lFHeOdBjLs8evj+Z9uHheC+OE3RG7sYb33FoADJnYRFeXW3tGnzLaQ
         zg8UgDnOvdZGR9wLdZ/DUIRa/tHHvCUOyqlWk/VSv39TGhwNoYI34G+RBHpsGQgGD+TK
         TNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=t9ZKsEQo1Den80Ampwi5bEjEZNCMM58cKnc5jFoHVAE=;
        b=SPAol5hStzLLZWfJ96iDhQUaCf5w8DcBIofjR73I3xu+dYsgzMVddMG9+6s+XM1Lyk
         oyazzBF538aPbd3autkLprC9XpQdP3v1v8067QO6+oB9FuMK6dl/yIH87oiciCzeLLI+
         exTeQFqc+H+a2bTbW75YIgNePMGbkcQufqYJTNhxoCBi4izFLrr9FH6mJBM54g815aFi
         M97WE/2CR1W7kvpUXW4aPiCbXaHOOIiKRi+EobJDE44YqX/S/N3ClQucugXar7zIwgER
         UO3yolshxQsDQqeWSyuuvRvuOZE3FIZunHweJfPxHssLTLlPNYyeqpGQUtY8WOq7IApX
         Gt2w==
X-Gm-Message-State: AOAM533rwroNIm9MeAHKFpa33LHDRF6k1549XyWWxNnp4bQ1zwduxw8K
	HWZStZstJr+myjW4NqMGDgA=
X-Google-Smtp-Source: ABdhPJzjVjDlWxNle3CpXUsuif5mM+dOfdpIWnuNma4NHn4mUv1/9NgOHd65kl83U6fDLhmfZ2QCUA==
X-Received: by 2002:a63:cd41:0:b0:3c5:1242:3a0d with SMTP id a1-20020a63cd41000000b003c512423a0dmr1088134pgj.266.1651806827590;
        Thu, 05 May 2022 20:13:47 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709028a8900b0015e8d4eb1d5sm397734plo.31.2022.05.05.20.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 20:13:47 -0700 (PDT)
Date: Fri, 6 May 2022 11:13:43 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8712: fix uninit-value 'data' and 'mac'
Message-ID: <cover.1651760402.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is a v2 patch to fix KMSAN: uninit-value in r871xu_drv_init,
https://syzkaller.appspot.com/bug?id=3cd92b1d85428b128503bfa7a250294c9ae00bd8
Previous version and discussion could be seen here:
https://lore.kernel.org/all/20220414141223.qwiznrwgjyywngfg@ppc.localdomain/

Changelog v1->v2:
- Split to two patches.
- Add kmsan reports.
- Fix uninit-value 'data' by adding error checking and initialization
  rather than changing logic of r8712_usbctrl_vendorreq().

Wang Cheng (2):
  staging: rtl8712: fix uninit-value in usb_read8() and friends
  staging: rtl8712: fix uninit-value in r871xu_drv_init()

 drivers/staging/rtl8712/usb_intf.c |  6 +++---
 drivers/staging/rtl8712/usb_ops.c  | 27 ++++++++++++++++++---------
 2 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.33.1

