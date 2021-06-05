Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBA470
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 07:30:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q5so11488285wrm.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Jun 2021 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=bd+05e0JzKpIujMEB3lXEYM66DgeoBGa36l8f44awyY4BDk0I3ZAsmJJmc65L/CzyT
         qmk35YNPikfc/lo+g+dNkIZNZCPNeE9ZlCxSHrBJsH663uH1WkQvbxZgO3XbUSfNDo//
         V6cPG5YWBmUDJSQP/CiX/p9/OTDxrN5I4FaBur/+StEVSA1J0yTHKK0TCwDFivtUVq6z
         /KaM6ZomEy7khsXcu81ylG9XAU45UBOJZXseETZett+SE1+dShwCY8VTXBoIufT+c2Tv
         JH+lIkE1evW1fK27NGH8csaG0sW3W8ZH77OKiKz+01zd8ogFNH0RQaycWCI8wwYVrrIH
         Zoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=FhgE+v51jugU/zA4JlnUmt2nOD81AOu9I8GI4FNHd17I49/oW97A8IU/m1rbSgHzlh
         wRmgrjCBcuWJnpalr7qYQqCpt5SOBWWZq3dHUjHfb3uwz+zaNNcbbkYiQI8v5gHRvgGQ
         ubWMwJqWvnRrvRjswQ0lfxu3Pw3f0vscZQxHcOfcQ78jelYnoDP2yBksegtDIynIlm5y
         RU65Pm+kazKXx64eottlcnHrZz0E1zMiolqzY7xNWvnzfH6IjpJQZ19BFtczZ1q3f1Lz
         zZApiPdbgUiVtPFEkF6o327hogaMAJWi866+kvKOQjqCcL2ehI0aBi2cE2+7HByKkWum
         NRpg==
X-Gm-Message-State: AOAM531ETnSQJz8mC/BmTUiG+0fk8tLkvTAC4yf7c+6PzTQ8F4ACpat6
	IeoFqojhHMGjtW9tu1C8gwWppMbXzFfVCA==
X-Google-Smtp-Source: ABdhPJx8k21+gv8mCMIEJPZsgLTFfbHkErWhgc44aKANzZ/WnIA8fjF/uWjPIfRuIL/wYeP5qEdXZA==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr7169319wrv.423.1622878226608;
        Sat, 05 Jun 2021 00:30:26 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id l13sm781419wrz.34.2021.06.05.00.30.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jun 2021 00:30:26 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 2/5] staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
Date: Sat,  5 Jun 2021 09:30:20 +0200
Message-Id: <20210605073023.21435-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of define RALINK_PCI_BAR0SETUP_ADDR just use standard
pci defnition for this which is 'PCI_BASE_ADDRESS_0'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index c14fc48e74fc..b83c338a2e3d 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -47,7 +47,6 @@
 #define MT7621_PCIE_OFFSET		0x2000
 #define MT7621_NEXT_PORT		0x1000
 
-#define RALINK_PCI_BAR0SETUP_ADDR	0x0010
 #define RALINK_PCI_ID			0x0030
 #define RALINK_PCI_CLASS		0x0034
 #define RALINK_PCI_SUBID		0x0038
@@ -494,7 +493,7 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 
 	/* map 2G DDR region */
 	pcie_write(pcie, PCIE_BAR_MAP_MAX | PCIE_BAR_ENABLE,
-		   offset + RALINK_PCI_BAR0SETUP_ADDR);
+		   offset + PCI_BASE_ADDRESS_0);
 
 	/* configure class code and revision ID */
 	pcie_write(pcie, PCIE_CLASS_CODE | PCIE_REVISION_ID,
-- 
2.25.1

