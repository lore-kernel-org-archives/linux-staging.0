Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAB570
	for <linux-staging@lists.linux.dev>; Mon, 12 Jul 2021 19:11:05 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id w1so18671010ilg.10
        for <linux-staging@lists.linux.dev>; Mon, 12 Jul 2021 12:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KDeCEh+D/0pr2XfzfVAb7hT42m+8aaWxMNpNgHC5hY8=;
        b=IMgCDU+3hca84uR8rDdjMEuTvuyVZwt7xvWez6So07RND0Vn0tn0l7kyJ55YT1GFN6
         9iop8kRr2IwKoMPneZw9pMesUehyxE9mbKU+zR5zO4S3x4Wgj/eTtGQI0/XqK6T79YvB
         0o9ruPkJmundXZsGilWRJUUmxodo5othjFf+JNsKZTtLj5h5obYmxzm6vcRcERPocmRI
         jAOga1E/7P/NCx+Hs1sHAuU+Jm+2BoBI0OeVYTgxvJgc4xlQW+I/MDHu8YeqP4Zn9XKe
         1CWYU+D0SfLTq0X6gOF2Xhz1keL6VIlnOw+p96MwjSvKZwPPnn9IHbskoc1leV4ekELP
         YAfQ==
X-Gm-Message-State: AOAM530qFBEcScep87QthBNa2TL8KW55Xwua+UGrdmqWChOk9PvK12Us
	DzO6UEyqPuM/TNdIqG0OFg==
X-Google-Smtp-Source: ABdhPJxINxOQbkOPSUeTHrh+j560TiyF4+WVEtfyHKvmJlOXN+oa6fjedFHors7KConAc0zn96SOSw==
X-Received: by 2002:a92:c805:: with SMTP id v5mr221476iln.293.1626117064532;
        Mon, 12 Jul 2021 12:11:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d8sm5312716ilq.88.2021.07.12.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 12:11:03 -0700 (PDT)
Received: (nullmailer pid 2316421 invoked by uid 1000);
	Mon, 12 Jul 2021 19:11:00 -0000
Date: Mon, 12 Jul 2021 13:11:00 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: festevam@gmail.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-media@vger.kernel.org, phone-devel@vger.kernel.org, kernel@puri.sm, laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, shawnguo@kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, slongerbeam@gmail.com, krzk@kernel.org, m.felsch@pengutronix.de
Subject: Re: [PATCH v5 1/3] dt-bindings: media: document the
 nxp,imx8mq-mipi-csi2 receiver phy and controller
Message-ID: <20210712191100.GA2316363@robh.at.kernel.org>
References: <20210618095753.114557-1-martin.kepplinger@puri.sm>
 <20210618095753.114557-2-martin.kepplinger@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618095753.114557-2-martin.kepplinger@puri.sm>

On Fri, 18 Jun 2021 11:57:51 +0200, Martin Kepplinger wrote:
> The i.MX8MQ SoC integrates a different MIPI CSI receiver as the i.MX8MM so
> describe the DT bindings for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
