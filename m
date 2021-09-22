Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F23FC7
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 04:20:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w29so2736804wra.8
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 21:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqGtUx9WPHLk/n3qN2nHQZLutxXdz1HLw9b+FtMolfw=;
        b=f45pCETC8O4XOm2EiwFj/EV80aP0fr93abmF/uVfV4g2XhZU4iMRX5QP9Ok+5w8bJ3
         L7ZhcOEiMrvx1A62PRuNVxGcfc8hhVvDQFb18E3V7XTY2DIyKcSPShOVKZzeAFf0f2xP
         4CMJPbEZ5yjXYTH2Noq3l6zBhXrLRDFSX5kurga1i6DENvTXZ9khMywBWgyN8L+2gvMS
         QG28CwCDq0aYqc6rud7spkyx/sNWr8/j18tGr4iTye5qxkLMHkYBCo+nYBB937eDJ/SF
         IsLwunbKkR4z43Z6ke68BlUErDZgmva0uIX1CzdUCm3qB3QxUgQo+jufs9b5uViZejro
         Tt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqGtUx9WPHLk/n3qN2nHQZLutxXdz1HLw9b+FtMolfw=;
        b=48ZKFWyx4yjjD1T44x5FIigGnTwlstYrB5+JHcgANfOd5jhDWM0X/NcfdeQ+CHs0zk
         N84mkEDL1/Sd0Z/rx+U9sWDt4pVykYcsuqNBNyPnxrivLy4H41bkSUWyA5lU32FFJ988
         lIzEno/aQ5TM3JYC08jGyvR6C1EwzH/mDUSiTYYCMjxvSjOBbf232O1AFuxTXVt1eoyc
         p/XJ+JcGmp3D0CNE4UTnrWVPP9XViZoHIWa3q9WVh1ONXJQZjPa7pI+eo+/YwJcBKqsk
         Z81ykh/tzduvLScR5P1xG7ZUZgG3ejWSk6jzkOWPAmEh4vbcU2YHEJpfr6tXPDDGC9r7
         Gdsw==
X-Gm-Message-State: AOAM530w8wvpW3ABWOzPQ9Feh41wXJCmIUws1u+f7qnQSYUtAQ8Kt9W1
	klycNE19y4Gl/st11WdD8zE=
X-Google-Smtp-Source: ABdhPJx/bfBAx4qXAVyNkK4+9AR4BoXl+YyvjhmV8vf76DyUMb+sMv0V5B6ijbkTVpzdi6uim7hsAg==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr8195117wmi.4.1632284443631;
        Tue, 21 Sep 2021 21:20:43 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id b7sm1089003wrm.9.2021.09.21.21.20.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Sep 2021 21:20:43 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	Liviu.Dudau@arm.com,
	robh@kernel.org,
	catalin.marinas@arm.com,
	arnd@arndb.de
Subject: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
Date: Wed, 22 Sep 2021 06:20:41 +0200
Message-Id: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Request for I/O resources from device tree call 'pci_remap_iospace()' from
'devm_pci_remap_iospace()' which is also called from device tree function
'pci_parse_request_of_pci_ranges()'. If PCI_IOBASE is not defined and I/O
resources are requested the following warning appears:

WARNING: CPU: 2 PID: 1 at ../drivers/pci/pci.c:4066 pci_remap_iospace+0x3c/0x54
This architecture does not support memory mapped I/O

Since there are architectures (like MIPS ralink) that can request I/O
resources from device tree but don't have mappable I/O space and therefore
don't define PCI_IOBASE avoid calling devm_pci_remap_iospace() in that case.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi all,

This pach was part of a three patch series [0] and [1] but the other two
patches have been already added through staging git tree. I would like also
this patch going through the staging-tree to have all the three patches merged
together in the same tree, but if it is not possible I can also live with
that :).

Changes in v3:
 - Went back to the same approach that was done in v1 of the series [0].
 - Adjust commit message and description as I was suggested to do by Bjorn.

v1 series:
- [0]: https://lore.kernel.org/linux-pci/20210807072409.9018-2-sergio.paracuellos@gmail.com/T/#meb2e6c283f6d391407cb0c1158feea71de59b87d

v2 series:
- [1]: https://lore.kernel.org/all/20210822161005.22467-1-sergio.paracuellos@gmail.com/ 

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

 drivers/pci/of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index d84381ce82b5..7d7aab1d1d64 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
 
 		switch (resource_type(res)) {
 		case IORESOURCE_IO:
+#ifdef PCI_IOBASE
 			err = devm_pci_remap_iospace(dev, res, iobase);
 			if (err) {
 				dev_warn(dev, "error %d: failed to map resource %pR\n",
 					 err, res);
 				resource_list_destroy_entry(win);
 			}
+#endif
 			break;
 		case IORESOURCE_MEM:
 			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
-- 
2.25.1

