Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F80C2C82
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 19:20:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so9234886wme.4
        for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 11:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHvQ+K436pIW+sg+FxJSgyD0z+0xgXVvoQwXwN0NoI8=;
        b=L5mzaOdl+irdA54lrtusf/bAdn8QJSQvQ5hU1wDzhA+M1MCyQrE4KZ540BrJE4EhGM
         WNBin0UqB9S4wJ0VJHSX5Z8F+KNfKXE9sYrFLRtsuGD12vR3SwP2ZyNV40iOnSlEMQwf
         da8aioI2Y6KQpdmmSCrhUJynmTCdSCyiurrUAOVK4A8gEPTZU/eKg6pgK2blVmTaP2oL
         IKCb/jzKPDuIEedGPitL7wI1CnYy/KitFXKZPU/lk+GeuCHNBf99o3TClf+hr4n35Ko9
         lZG5ci/D5WLihOaDcJlYUHEJsby+WDLP+q8hZT1Nii0mwauLmuK1emokZbT0bm/VZrtd
         WbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eHvQ+K436pIW+sg+FxJSgyD0z+0xgXVvoQwXwN0NoI8=;
        b=lUQP2uGvwxRlFOZz1Xk84mBmjEtqeWrRUPy/5kPHMEinNxyj+hFHyncfTY2QlMdCIG
         4wbCL0Z8bzG+k3xvTySpFEGMB5a30iS3qCfVMkfrHA3llr9zE9BLl7g6N2ldiawgNxpy
         4AlgkggmqJoP8YKI/mAYWVd5yExGv3HRvqpb9l4vn0ahT3ojkDFKhQ3T693v9vE7o+BS
         2QaS5i++H43jpgs0hjRPCF49lvMBuniHRP5VwFJ7ZJ+k5pebJRbmH4F7QTw9fIRVRPGp
         qL0E/B4VerUameSNUy6OjJxowUpEtWgNB7kyTFWu1/55GAdZZOAINrv87l+lZFI+HOwR
         Gc1g==
X-Gm-Message-State: AOAM531wl2emGFx6IlhnzlAVA3glgFiEVQ1EyIG97rTxzqLp6t/M2JR3
	C2gsXraitUYV/we9zYQ65m4yd3rbkyg=
X-Google-Smtp-Source: ABdhPJxHcFC2315W3iCnkGegloSY7Zk3B9XgGDRLfCzVvYJKVTAVLK7Oz3gaL/7EOF09So6/8BeW6g==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr45841105wma.53.1636831247236;
        Sat, 13 Nov 2021 11:20:47 -0800 (PST)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id g18sm18530442wmq.4.2021.11.13.11.20.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Nov 2021 11:20:46 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 0/3] staging: mt7621-dma: remove dma related drivers from tree
Date: Sat, 13 Nov 2021 20:20:42 +0100
Message-Id: <20211113192045.32153-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

A few weeks ago, I sent the following mail[0] to know if someone has interesent
in mt7621 dma related drivers from staging. There was not response at all. There
has not been interest at all for a while other than trivial style clean ups and
AFAICT, these drivers are not normally used. ralink-gdma is used by 'i2s' but
there is not mt7621 i2s in tree driver at all, so having this has no sense also.
The other one mt7621-dma corresponds to mediatek hsdma controller. There is already
a in tree driver from mediatek for this controller so in case mt7621 Soc also need
this the way to go should be to work on the already mainlined driver. Because of
these reasons, remove these two drivers from staging tree and properly update
device tree include file to remove related nodes accordly.

Best regards,
    Sergio Paracuellos

[0]: https://lkml.org/lkml/2021/10/25/59

Sergio Paracuellos (3):
  staging: ralink-gdma: remove driver from tree
  staging: mt7621-dma: remove driver from tree
  staging: mt7621-dts: remove 'gdma' and 'hsdma' nodes

 drivers/staging/Kconfig                   |   4 -
 drivers/staging/Makefile                  |   2 -
 drivers/staging/mt7621-dma/Kconfig        |   7 -
 drivers/staging/mt7621-dma/Makefile       |   4 -
 drivers/staging/mt7621-dma/TODO           |   5 -
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 758 ------------------
 drivers/staging/mt7621-dts/mt7621.dtsi    |  38 -
 drivers/staging/ralink-gdma/Kconfig       |   8 -
 drivers/staging/ralink-gdma/Makefile      |   4 -
 drivers/staging/ralink-gdma/ralink-gdma.c | 917 ----------------------
 10 files changed, 1747 deletions(-)
 delete mode 100644 drivers/staging/mt7621-dma/Kconfig
 delete mode 100644 drivers/staging/mt7621-dma/Makefile
 delete mode 100644 drivers/staging/mt7621-dma/TODO
 delete mode 100644 drivers/staging/mt7621-dma/hsdma-mt7621.c
 delete mode 100644 drivers/staging/ralink-gdma/Kconfig
 delete mode 100644 drivers/staging/ralink-gdma/Makefile
 delete mode 100644 drivers/staging/ralink-gdma/ralink-gdma.c

-- 
2.33.0

