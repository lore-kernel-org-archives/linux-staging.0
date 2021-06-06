Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7870
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 16:14:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a20so14639334wrc.0
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 09:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9ogf6tFPfmSz77603cXTR8DgiviIxVSn2KbquZsM0A=;
        b=GTWu5lHtjwAEkXOMJH2loQs+c264V16cs8DrxQK8N4+hmMXSXQFn8beOKdRyMbLnf4
         LTJrh7NZIBAJ6w49izMi71+WLpraHHcKTQud2v6F5AprvkdXG9C+tMoZTtp3MPvvqayF
         Msg/xS8WThlWTy3JCvhNQbhWXaxU0EH1EbFkChFgfUddGA+PfpTuzmF3timnlXqxxv+B
         CvpcriAR/cN4tQsgptPDvzWJYvAiJ74FHmIuaeDLlZJQQr6ZtbEqQOutTMYlt42VKnUG
         O6Nmg7DXM1da6gUJVKwecRkQ+Ipl3jXw43D0Fcz0b2ckvVtqCLznysMy5CfZMebeKwe+
         +QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9ogf6tFPfmSz77603cXTR8DgiviIxVSn2KbquZsM0A=;
        b=F2Ks4KUPC7tbsNF0ALVQcMOqs6Nl7e0Iqvx/dTGS9wAH9bUfuBOHfz4NIC2J4dXMsR
         uedihotCzvdH+XHzIujcuTQU0JNnhshhKWE938RN17HgK3ilXIW8k3+0VrbI/AuJx7yt
         4P0c0Xrou4n0bVKnh8LwpaFEheL7H10x9c9f1ke+5q0hrMSeF1wNdyGTPfcUxMaG90d+
         ij6LW9WH4wJvBhTPtUJb6laRKcyGZyfdTIKX5j8bquHne9QIS2AQWgpTNKFlJWUlo0UX
         SLhg76b8MFbVdRVYDzaKAER4HB4G3ogsUXg7n4hT0AJmm27ICAZ0YhBvRDuRj7gZLxoL
         A5Jg==
X-Gm-Message-State: AOAM5306m6/xOJR+maHKAPz6g2L8AGNmgw5qk2xq59cOupYFnWxTbZjQ
	9nbbhZoMQ07SyUtateCFPBrv7X3rXzjX3Q==
X-Google-Smtp-Source: ABdhPJwocMLhkmptVQHwslrE6G764FomCcw5XxhZ6YwRATXP0Imvcmrb+QSzFsVMwrbahGq6ao2QQw==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr13163982wrr.47.1622996041180;
        Sun, 06 Jun 2021 09:14:01 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id n9sm11724427wmc.20.2021.06.06.09.14.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Jun 2021 09:14:00 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH v2 0/6] staging: mt7621-pci: some required changes after first review
Date: Sun,  6 Jun 2021 18:13:52 +0200
Message-Id: <20210606161358.7114-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Some things must be updated before get this a new attempt to get this
mainlined:
    - Device tree bindings need to move som stuff into child root nodes. 
    - Use relaxed version of readl and writel.
    - Other minor stuff.

After this is merged in staging tree, I will move with 'git mv' this
driver into 'drivers/pci/controller' as I've been suggested to do by
Bjorn.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Changes in v2:
    - Add PATCH 6/6 making use of 'pcie_port_write'.

Sergio Paracuellos (6):
  staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
  staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
  staging: mt7621-pci: use {readl|writel}_relaxed instead of
    readl/writel
  staging: mt7621-dts: move some properties into root port child nodes
  staging: mt7621-pci: parse some dt properties from root port child
    nodes
  staging: mt7621-pci: make use of 'pcie_port_write'

 drivers/staging/mt7621-dts/mt7621.dtsi  | 21 ++++----
 drivers/staging/mt7621-pci/pci-mt7621.c | 66 ++++++++++---------------
 2 files changed, 39 insertions(+), 48 deletions(-)

-- 
2.25.1

