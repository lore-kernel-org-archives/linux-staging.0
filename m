Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A65A51
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 08:36:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id c30so15153202edn.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MB9scqqPsTa03Eqh0VWt1ExIoMmVWG8R3CoCktXXkVk=;
        b=HqpHZZsSDgBv6P3rScAj7s6USz230THVM0x9s6S+CO4s5FUyVrdCSLzj1tUaLRZS3G
         BPWlEAUTvvtCEcm1vPqXGiCzHaLi36+jlrhdXsVAp1VPCGAaYAZjgHNVj4XgN67Unyo9
         lTe+EogYJZ2adCBHJSViLRT7lvWZe3ILJLyzA4CdV5hk/u3p8kdkG7y0an23r1i2ujyS
         +ZYiXli71sqHkQBBj7GEps/iQv/t89S4M3q/ZvMPJkWhIRraO6zQBJkOKGwNAlT2KNos
         tFnpjCC0hmHp8xMoSxd/Kj85+qQ5RTqSHFLfcQSbOhWSphhX5RLReIHrUS/Z995x0yIu
         W9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MB9scqqPsTa03Eqh0VWt1ExIoMmVWG8R3CoCktXXkVk=;
        b=d4xSWvl9nHQ+QhrCaLfxXaZGdxj/SQFLuMTkP+FnB/jemIotEC8sZ4yG60MIlfV2aS
         EEj3yhdqhGLyvJSBSZy/DubUEeauIm+8Un0SM4fm/52R9kYblMlC35Lxw8xIMEHNeKVi
         48BQucNp9XRUtRmVbnQaVxlot3il4hHmUOZFYsOU8UodKmX9j+zCYJ3Xd+tsrdyXnfqT
         U1MjPHCKg+ShgLaZCGEUzau+mqPHmchBggulIWSTy2ysY/c7mr+8EN+OCCt1goPJ2mV4
         +7YPCaAhzs89mTWdCEQf3V9x2lzlJ1c7WHYxmvWOuiWjq1Xos6A/6W3bcUbNIUObMbI8
         I1cA==
X-Gm-Message-State: ACrzQf3iU/g0iAX7+RCckeQPx/JK2FElz3KpuIXscUqkIwqqEJV3m8yx
	I7PJqIv/nOT/8vggHd+VAms=
X-Google-Smtp-Source: AMsMyM4606UTICcNA9cVDyDNLoh9tSLeD3uVYYCvEY93tCTgZlmlNLqpvFtfBiJvbgYt87SCGYkd9w==
X-Received: by 2002:a05:6402:84c:b0:451:a99b:f74a with SMTP id b12-20020a056402084c00b00451a99bf74amr32511912edz.100.1664354209959;
        Wed, 28 Sep 2022 01:36:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id gy23-20020a170906f25700b00730b3bdd8d7sm2024526ejb.179.2022.09.28.01.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 01:36:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: remove two wrappers
Date: Wed, 28 Sep 2022 10:36:39 +0200
Message-Id: <20220928083641.8275-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes two nested wrappers around the function
phy_RF6052_Config_ParaFile().

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: remove PHY_RF6052_Config8188E()
  staging: r8188eu: remove PHY_RFConfig8188E()

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c    |  9 ---------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c    | 13 +------------
 drivers/staging/r8188eu/hal/usb_halinit.c        |  2 +-
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h |  1 -
 drivers/staging/r8188eu/include/rtl8188e_rf.h    |  2 +-
 5 files changed, 3 insertions(+), 24 deletions(-)

-- 
2.37.3

