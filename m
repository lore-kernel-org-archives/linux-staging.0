Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFCA70
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c5so11425596wrq.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sxHYbIagTY0Rj3VDE4njnR9TtQ4q+tnGcvf96n95VI=;
        b=TZpTzv4do1azD0beuDNSI5EmFn9me3hj2tbX6H3G2dm5L3Tof9hBQA2L2TQUn/UfoO
         BsK8nL4rQjw6YIYRBYVzbMIRxNLvEGmOT8NlkWWS07TLjvxPnxn9/gV1q1yHC6EEIDnl
         Tc1PnaoI0z2pZqo2a5GdhqAyy13DWE3Wzs8024p2qbhb+av+ME0XL9QELB8yEREoAmru
         gV3d8JBGM26enH0ppimSMVbSu/qGBnUq8veQw+iCfpZzLftIxzG7vWgAzDGl/bG/WWo3
         vJqvWIdIjNXgdcxbR0H6W4Wmyc3X/9yxZ6X3PpBCjHsZed04fIRN0Io5bdfJZsdgbs9i
         lQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sxHYbIagTY0Rj3VDE4njnR9TtQ4q+tnGcvf96n95VI=;
        b=BbPPPV/zUHsCmVx58egOVkBHMwTIZw//L7RyOuzeHHRe0AFFPFKWDTkBCS48WJ/2VY
         7wRGSsOZm3Bu0bqAGVwA5xcN3U9FfcbCLLYmx5forXwgCimnNulY8RHHK/vLq1hsaqR+
         sdpIOhAWxQ/W9sMcNQ3hRpJphclDVTTr+R8xshcUWfsk1fIYWm+josRnuvTJuoy7BLFn
         rx0Bbmp9OmCdnClg5jhgHRd8yrqEhALeHKB4F9N/ldcRwL0QgTFXWKTFFYmAkn5fK5GA
         5kGKGoePRCBRuiobg3MnqMd2Z8zTqkfft3tqORAVohpnQt8FiF0QW20yi5Ygv0Q2zreV
         TRIg==
X-Gm-Message-State: AOAM5331iVtroKf8QmBbyTEgORxEHcDAPzqpZDj93/W0BlWhi7pwKCjX
	TzWFkeb5wX27PMqZQyTLk9Vz5pdwj0LluA==
X-Google-Smtp-Source: ABdhPJwYcm1cRFVCAnUWXW6VCk437Iw3u55qX6oVuXWD+XLRkEihYZ3X+JlgVw/3M9BWI3F80146eg==
X-Received: by 2002:a5d:4bc9:: with SMTP id l9mr7537974wrt.97.1622878225029;
        Sat, 05 Jun 2021 00:30:25 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:24 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 0/5] staging: mt7621-pci: some required changes after first review
Date: Sat,  5 Jun 2021 09:30:18 +0200
Message-Id: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
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

Sergio Paracuellos (5):
  staging: mt7621-pci: make cleaner 'mt7621_pcie_enable_ports'
  staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
  staging: mt7621-pci: use {readl|writel}_relaxed instead of
    readl/writel
  staging: mt7621-dts: move some properties into root port child nodes
  staging: mt7621-pci: parse some dt properties from root port child
    nodes

 drivers/staging/mt7621-dts/mt7621.dtsi  | 21 ++++++----
 drivers/staging/mt7621-pci/pci-mt7621.c | 56 +++++++++++--------------
 2 files changed, 36 insertions(+), 41 deletions(-)

-- 
2.25.1

