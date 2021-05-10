Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C870
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 16:01:53 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so10884201oto.0
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 09:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CL3EK1BbXw3K+UiGWC4PvFk6RuXbgUMu/FDCEBhRsXc=;
        b=Q4ay18bXCnCiD5t2njnb66TDcaJDtwXIP7zofBvcvBaBRioRVvOoWeeZNuvdeKfwZV
         8Y9IFkB92htW0+ySkbxEsJrdvJt0q/o8N7F8YqDCN98JxirpzIS/pf487skviUZ4MSiJ
         8ypJKf7HPYmQvpAZSxzPLKlCZbDHFopMSvNfUr3iO4ogxiUwazFUmyCJ68z0vN7fQOCe
         RZqIMz0LJB78sJTieYe1cEH2+vHHn64nlpPdwa1qp6n/RuP9pQRvPqKj+zGszSmjCXnh
         M0C3g+vteMspEArOyLLXjX7DQaKdKWBi44Ak1E30GoWlIet6DbvE5THszLNBZf2gjwFV
         xbZg==
X-Gm-Message-State: AOAM5331a199e0wBpHY3Hvg3qtSv0x/SDKSA1Ut9wS4gfFZ7ystiIY8O
	mLGOr94bZ/nbt1B9t2TJ+Q==
X-Google-Smtp-Source: ABdhPJwzu2GWumJg2qIXQSmyaxw+mou6CJa+ByX8g2CKbnhufna4u6fSpqm2l9DESdyyxTb7QO/5MA==
X-Received: by 2002:a9d:6645:: with SMTP id q5mr17169694otm.80.1620662512536;
        Mon, 10 May 2021 09:01:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u201sm2693880oia.10.2021.05.10.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:01:51 -0700 (PDT)
Received: (nullmailer pid 202602 invoked by uid 1000);
	Mon, 10 May 2021 16:01:50 -0000
Date: Mon, 10 May 2021 11:01:50 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: ilya.lipnitskiy@gmail.com, neil@brown.name, gregkh@linuxfoundation.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH RESEND v2 2/6] dt-bindings: phy: mediatek,mt7621-pci-phy:
 add clock entries
Message-ID: <20210510160150.GA202555@robh.at.kernel.org>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
 <20210508070930.5290-3-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508070930.5290-3-sergio.paracuellos@gmail.com>

On Sat, 08 May 2021 09:09:26 +0200, Sergio Paracuellos wrote:
> MT7621 SoC clock driver has already mainlined in
> 'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
> Hence update schema with the add of the entries related to
> clock. Since until now things were not properly being done
> we mark also 'clock' as required in the binding since this
> will be now the only way to properly retrieve frequency to be
> able to make a correct configuration of the PCIe phy registers.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
