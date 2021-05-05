Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8671
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h4so1583323wrt.12
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X774Vcomx4BfOVPt7Z2adberUs8Au7niVr/J1b0jh2o=;
        b=SvmYDFOZM5gWRq5fbj4AsTX+Roiu5Uylb2oNxdRCJcgryvv/dE9aNqOTJBbTZviPfo
         D2665VGReS8PJrh86Is3iw86QAYyY7oB0Fv/HAPx3vWyVxoJU88Y7v/i7O8THqt9w5bI
         mgU6Em2hNFbcAbzyfjL6G8GxihwRe7WJBvDaui3nJaH1NIM+ubFq9ZEhne6BHfwB3pB1
         DSE29LWYIN3Y6NUBmndgGAF6RAym+Bxi54sv8b9SfyQKae14gZNu8GfUkwr8ITjsPC5W
         MchExj4Zr+8HXSPt1ocTKWc/HN0bdcBh+nxrSPoRcXrUQJeMCGzlzkPBn0HDL1duEbGP
         C9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X774Vcomx4BfOVPt7Z2adberUs8Au7niVr/J1b0jh2o=;
        b=Xf/C2Xp75DIVJlbt/Xqy6+iqeLnSYgb3mim0gImfTvRmkZrYldShpLiREVClQLMg97
         iGKWGQGEWMLU7S2tbDVmetTKie8uKgrK1DGIaEGIwz9lMbrAic/dRoS2mM0OlJ2QOGcb
         NSbpnwCH4ByBufohKxSdTjti2B37KhHG7rNh/EmDWSGrNkan78fXFJY0uRaG3RGkqZwF
         VC91N/aJ/QuGpZgFGwV0EE2iJXKNgDvCIdygT+QDXT/EKd7qD3M248AySUT+JAzP1/Qc
         cdBfh4Ulw7tbrT2xJhTPKOJo6RZ4/ThiHvFaIYqr/PAdg8pZV7NpR9JDpu4QEAszenLt
         xtNQ==
X-Gm-Message-State: AOAM530RI0Xbp3ks9iXLl4Qm9tzopV/RSE+PJ4JlFzXYCUSPyfR1Pual
	BAJ/IbmQrMSQKj0tKrSWmhykz/h8DUe7Ag==
X-Google-Smtp-Source: ABdhPJy0mn3/apDX9rzJTTQ9R3rk3qSIXUOJbSZcYtSeo+dMK7xC0iZFYwqPyyRhV//h8GqdAEKyCA==
X-Received: by 2002:a05:6000:1143:: with SMTP id d3mr22684208wrx.404.1620217066864;
        Wed, 05 May 2021 05:17:46 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:46 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 08/10] staging: mt7621-pci: remove two blank lines
Date: Wed,  5 May 2021 14:17:34 +0200
Message-Id: <20210505121736.6459-9-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are useless two blank lines in code that can
be removed. Hence, remove them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index c675e74ce507..fe1945819d25 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -548,7 +548,6 @@ static int mt7621_pcie_register_host(struct pci_host_bridge *host)
 
 	host->ops = &mt7621_pci_ops;
 	host->sysdata = pcie;
-
 	return pci_host_probe(host);
 }
 
@@ -622,5 +621,4 @@ static struct platform_driver mt7621_pci_driver = {
 		.of_match_table = of_match_ptr(mt7621_pci_ids),
 	},
 };
-
 builtin_platform_driver(mt7621_pci_driver);
-- 
2.25.1

