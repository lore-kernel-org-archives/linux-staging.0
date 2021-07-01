Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92172
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 09:45:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id u13so10779856lfk.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EteEmF3Lp/VaCzgm6zJMhc5umO2ASKXQnNmmMqr1tyY=;
        b=n27K8xSc5i9k4pRnthrnVcOCeJ7Nl2hOJLEBy4pNnYc/TBewzXbVZfhTzlnkCiSZkH
         +p1Ml12cArHwaAQuucyF4Y7bsC9WQLu3qOFSN5G8liifR9f/TYUXxg8Zr9qwoW21817z
         Ljigm3UGNACmRDtyQJ+XcTFhI423ymHuXLbP7HECNQFoy7CaNNRBzmQyCvjEfpgToYyj
         okdbdH9iH20L5JXc+M0diFvNYFBft9LDb1decwb2boaSbwXKriengXBtHtyruoR7vpHQ
         dkAI1A67aUvw+wzWs7fllAZ6Zd/rVs2+9pGhOTttsJCzoF2q7idqNXde1mPxDGQ1sBJ0
         kFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EteEmF3Lp/VaCzgm6zJMhc5umO2ASKXQnNmmMqr1tyY=;
        b=dkB6sXTCgb7k3QO+nCCG60IUUjQ53ETOllK8Ts8PplIHmsEP66YDWUy24K0LpmIpvf
         DTXfe0t1CCHhbaayN4vwFg+a+PB4zGUj+L7tfCLYP4BbsDyp6AUseV8ZkLyDOIoe7M4S
         NovKeKAEM98gdnk9NCVKvDFAn0mkDdjSkoNSZsh/tH5T2Gs/nRXDwFhx4abDXreUVQSg
         gxyxhASNisQf53OBLw8QZiwNn2fz973bMrzFBelI9EsaDQWLrYEs8r1BTPKlBWj0JBf7
         OcIpOmPVlCA2GBfcdt12ae53lFZr8bqgp2IHjz8LERheKd38+p45APNQ+F71k5cFpI+Y
         9PBQ==
X-Gm-Message-State: AOAM532q6tM4LMPDijgkzDuwRvmHlwx2mQgOJguQCl+bj7ErUQs562uh
	kDSkmhZ9c2tunpEeIKeLw4vaUodinqM=
X-Google-Smtp-Source: ABdhPJy1ZxB6OSrNUo8EIlwIhP2R2Oh066AMEgk+CCD2AjW50J2Uohgej+UhDxh5J4YfsYDMcgb8FA==
X-Received: by 2002:a5d:6841:: with SMTP id o1mr14964784wrw.370.1625132356515;
        Thu, 01 Jul 2021 02:39:16 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2de7:3e00:21:6759:f8f2:826e])
        by smtp.gmail.com with ESMTPSA id k6sm22370164wms.8.2021.07.01.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 02:39:15 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: repair reference in USB IP DRIVER FOR HISILICON KIRIN 970
Date: Thu,  1 Jul 2021 11:39:03 +0200
Message-Id: <20210701093903.28733-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit 8de6b7edd493 ("phy: phy-hi3670-usb3: move driver from staging into
phy") moves phy-hi3670-usb3.c from ./drivers/staging/hikey9xx/ to
./drivers/phy/hisilicon/, but the new file entry in MAINTAINERS refers to
./drivers/phy/hisilicon/phy-kirin970-usb3.c.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  drivers/phy/hisilicon/phy-kirin970-usb3.c

Repair the file entry by referring to the right location.

Fixes: 8de6b7edd493 ("phy: phy-hi3670-usb3: move driver from staging into phy")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210701

Mauro, please ack.
Greg, please pick this non-urgent minor fix on top of commit 8de6b7edd493

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66d047dc6880..a4e0c20b416a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19153,7 +19153,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml
-F:	drivers/phy/hisilicon/phy-kirin970-usb3.c
+F:	drivers/phy/hisilicon/phy-hi3670-usb3.c
 
 USB ISP116X DRIVER
 M:	Olav Kongas <ok@artecdesign.ee>
-- 
2.17.1

