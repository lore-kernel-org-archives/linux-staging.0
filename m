Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8F2FB8
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 15:56:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so11431879wms.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89tgqMbPoVwSlozfld7sxkrojsS72Xn5GCD/OTQ18YY=;
        b=QvvXOofsJGK+u0C+37Zy4FwvFDgwBhOiuY7AsPxAA2YS2a4+h/wAL2RazbY7+Gzg2n
         OSTwV6OJi+XeVLcUryK38wMOTgoacATwYNWGbxMfOFeE1YYe3sNFqemBc7WIsOG0PS4o
         zheu3AiY2OjB7XHL+O9KUck+DYWoe/rHTboyo97m9fGeXXXVTaZI6hDcOCQOsB+w7o/S
         avNvyKoYLtslNUfR0FPOY/6OsGFfXVLmle5YtLJOy3fYE0wt2CMysulzz2+/t64EgerJ
         Ot/U0gnX/LK5oZnr1pi5wD5b45tsZndSkf622tRCtkdWhL42tfiUvpKrlAW2jA99j+1R
         Iclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=89tgqMbPoVwSlozfld7sxkrojsS72Xn5GCD/OTQ18YY=;
        b=gxTyLoNUc73JOPgcJ5iO9T8nOH258GRGeCmC9aECzet6cceKERqJqnAqykun6UrLQS
         qmRYnQGuWWEmHNFTgNi3cHWym0gBo7q6rZ8MgViZom5e24ZQseEZjizQudcUd8BVYiWi
         Q76sWc+YGXsXLAIJwCVY0FAd1cmqT4/jmc6b2/a8X1WgdXWLIcJvhDJ4ZhU9uiwBBWz9
         798MYKa8I/kC5HjRdK6PWycVHjnPa0wwbMdajoQ+4FfWJCvUD8qkMYTLna+8FO+kWaaz
         xcrxMsEvTX11GiP5gC0vZfoHnIFgq0ktGxZmb5O+4EB1wEFtc538gIrxmUSBU9fnoIKY
         n3fw==
X-Gm-Message-State: AOAM532+pgOErbKRvnMr6RL7O7iXBGldsB5aXF2yQECV0+0FWrwvHVS4
	nl1BVR8tFeKlka39f9t77Qfpgl+j84E=
X-Google-Smtp-Source: ABdhPJzi2qn2kIEp0a3elG7/PbGuj9bZB/T55XnumrEDUh3P6ztvKkKgZGX0yll3t20rrEdtTXUhew==
X-Received: by 2002:a05:600c:4106:: with SMTP id j6mr12346467wmi.76.1623599785568;
        Sun, 13 Jun 2021 08:56:25 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id g17sm17539746wrh.72.2021.06.13.08.56.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Jun 2021 08:56:25 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	ilya.lipnitskiy@gmail.com,
	john@phrozen.org
Subject: [PATCH 0/3] staging: mt7621-pci: define ralink PCI_IOBASE to avoid manually ranges parsing 
Date: Sun, 13 Jun 2021 17:56:20 +0200
Message-Id: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Ralink MIPS platforms do not define PCI_IOBASE. This ends up in
 pci generic apis not working with io resources when calls to function
 'of_pci_range_to_resource' are performed because internall function
 'pci_address_to_pio()' is call and it results in getting 'OF_BAD_ADDR'
 as result. If we define PCI_IOBASE pci generic apis properly works for
 ralink pci controllers. In this particular case, we can remove all
 manually ranges and resource from driver code decresing LOC and being
 more standard.

 In the future, this is also useful for mips pci drivers which are still
 using pci legacy apis. After having PCI_IOBASE defined, only defining 
 'pci_address_to_pio' for PCI_LEGACY might be remaining to also make 
 work 'pci-rt3883', 'pci-mt7620' among others. Sadly I don't have devices
 to test that so I haven't write the code by myself.

 Thanks in advance for your time.

 Best regards,
     Sergio Paracuellos


Sergio Paracuellos (3):
  MIPS: ralink: Define PCI_IOBASE
  staging: mt7621-pci: remove 'mt7621_pci_parse_request_of_pci_ranges'
  staging: mt7621-dts: fix pci address for PCI memory range

 arch/mips/include/asm/mach-ralink/spaces.h |  10 +++
 drivers/staging/mt7621-dts/mt7621.dtsi     |   2 +-
 drivers/staging/mt7621-pci/pci-mt7621.c    | 100 ++++++---------------
 3 files changed, 38 insertions(+), 74 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h

-- 
2.25.1

