Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D093FC5
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 05:00:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d6so2898267wrc.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uLV1H8lOUqllhWhMWtTAgHCu5bS8aT/YHsgKcThPqTo=;
        b=hc7YsC+KdwME/FdU9dBYKerpWNTd36HebU7kzGoHCb+v9NITrk4VBHlGJvNybmu2NV
         HgE8Mf/5sNZF40dlkEq1WNn/bQXmZaQ8GE+1DwvvCVLJN6Vh4+EwzVF+uVaAAsUXh78F
         +pek75WzITpMDasRDOWC9VZaEw1ofuCHUhYEVjWY4njIvlhTUnaqp0U2KDfhyiZMigEv
         rMY4ocfnD3d5grfgbOERKJpYe/SqoefgRwTF20fZm8JLp9nRpXXylHeJ3C+9xf4GOj1D
         6ABRyEjeu4AMiIT4p+dO4FzrU1DmYLHV33Ja4mYGzE93h2w4nLKFlkx9+l4NX/i6TFl1
         FWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLV1H8lOUqllhWhMWtTAgHCu5bS8aT/YHsgKcThPqTo=;
        b=18gXjUwS2fgMFd9yCCgmRanMa6imz0nhiMuK+lI13Jlmd2r0/bKC2XUPeoghY63c/c
         brClioJPk0bRh4EeCYtOm8cSjDfnf5LN2F9Jof+NVeStTaBxR5qFeF3zd7UbnIqpeBCi
         y3SnPzE+6/JREUDPDWnDD0TqqzosTDjO553dVORzhdHumn1xZu9uqYRr1doKHKyggZga
         EvQzWvYKjLQXefpeRzelXdKat/1gEKA0fGoycjAw/CCkBrKAL0pRdY9FDk47s4ZPAjZy
         yqxUXzISAOO2lzbtLx+Tj3yJ9+PPrrVJn+y6TfLDvMTc+VteI5F+RA9bLlFxIjazIKD2
         XwvQ==
X-Gm-Message-State: AOAM533bLLWADrD08jN/EgmNTeAwzN78geJ0e7pNZC48gvHslgjnWNsH
	MA9HBjN9gx20XTnTdriVZAc=
X-Google-Smtp-Source: ABdhPJydVjWKiS4HM+M6BTpD6DBcjrGFUBfUfGlobfx9VO3CWDAwnpe828DpeeusVa6m6HrEob5EuA==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr36130452wri.20.1632286841330;
        Tue, 21 Sep 2021 22:00:41 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id b187sm4811625wmd.33.2021.09.21.22.00.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Sep 2021 22:00:40 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-pci@vger.kernel.org
Cc: lorenzo.pieralisi@arm.com,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	tsbogend@alpha.franken.de,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	neil@brown.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] MAINTAINERS: add myself as maintainer of the MT7621 PCI controller driver
Date: Wed, 22 Sep 2021 07:00:35 +0200
Message-Id: <20210922050035.18162-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
References: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the PCie Controlller driver for
MT7621 SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..a7f0cbad7ac5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11842,6 +11842,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
 F:	drivers/i2c/busses/i2c-mt7621.c
 
+MEDIATEK MT7621 PCI CONTROLLER DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
+F:	drivers/pci/controller/pci-mt7621.c
+
 MEDIATEK MT7621 PHY PCI DRIVER
 M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
 S:	Maintained
-- 
2.25.1

