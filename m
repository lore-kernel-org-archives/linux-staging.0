Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29411173
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 21:08:57 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id b24-20020a4a34180000b029024b199e7d4dso2452261ooa.4
        for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 14:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=frRBpIJZObpmwDftURD9RgvF5osDKnY9SoJHh87QQOw=;
        b=QbVVxKJKC0t908EUAzsyFJcLhLhiS0T85Hs6a+0fE25IAJWR/Yk7eiDH/PJHbDP5my
         mssRVxowT6S3jJqu1NeAPpcaBd2SSPtFC2gk6YTnEIhM4xh+HSFxwR2Fz0osZ/YR9T+o
         qnlSDLqLczJpbZMUL6bT/CqdLdAkUha/ssqSsypZzeGbgJJLb7uqX/VQ7680YvEa2hzz
         e4V/e6TPEtw+ZOIaREZIFQ/ntTVz7E35B1d34QyU0CU47gjJMHuqwlvFA1XS06ceNdr4
         QTLdgVfQtui5dsw2GtHPRsEYTyN/wsyjhzZBr5IR2cddlxwtQk8KDVBtB2WkEx1kup3l
         TWfg==
X-Gm-Message-State: AOAM531MyWS4X3vLz+VK/9HmXNX3J6qA6Kt+LTXqMPdOYvuey8LhnVxo
	MbnB1NBHkh7T7Au5BaIqXQ==
X-Google-Smtp-Source: ABdhPJzJs34aVbpGHJvcdeb16PRfJefG4VEzrs4xqpD8Aaguoyrw3bHFo2RGmH5YAQAotMKwhfD7TQ==
X-Received: by 2002:a4a:e54e:: with SMTP id s14mr10720963oot.27.1624050536344;
        Fri, 18 Jun 2021 14:08:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 16sm2246125otm.57.2021.06.18.14.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:08:55 -0700 (PDT)
Received: (nullmailer pid 2877551 invoked by uid 1000);
	Fri, 18 Jun 2021 21:08:53 -0000
Date: Fri, 18 Jun 2021 15:08:53 -0600
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: pali@kernel.org, tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, neil@brown.name, linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, john@phrozen.org, robh+dt@kernel.org, devicetree@vger.kernel.org, ilya.lipnitskiy@gmail.com, matthias.bgg@gmail.com, linux-staging@lists.linux.dev, bhelgaas@google.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mt7621-pci: PCIe binding
 documentation for MT7621 SoCs
Message-ID: <20210618210853.GA2877517@robh.at.kernel.org>
References: <20210609140159.20476-1-sergio.paracuellos@gmail.com>
 <20210609140159.20476-2-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609140159.20476-2-sergio.paracuellos@gmail.com>

On Wed, 09 Jun 2021 16:01:57 +0200, Sergio Paracuellos wrote:
> Add device tree binding documentation for PCIe in MT7621 SoCs.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/pci/mediatek,mt7621-pci.yaml     | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
