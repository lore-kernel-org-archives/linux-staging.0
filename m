Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4872
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 14:25:36 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id b5-20020a9d5d050000b02902a5883b0f4bso5031094oti.2
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 07:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NO5xlMoNjYCr6KREf7vnuwTavEBKSBCosskSU2E1U4A=;
        b=VWklstmlZ+H4QY7bdVC8M3zv2PHYpiXry/MTyyMazl3bDUGBWl09IbTgmywZXwI7ml
         FtnqyimPYyV9KzMkWLGR2BsNvb35/Ws/df/4ANcoABdpcaMAgmvB6Gs8SHdpJHdJu2+K
         EDbLLV/5E3AGkCK35jWRJrSzMbR17J4RBd8enudnQLTw9xNFr66IihbYx/H0FJXnztoq
         r0rECTlHzzJzTLDkzwfKdsgpFBcz5temHYw8m8MB2wlfH37IFwBVtNGmWqDLu4JYfW4s
         IzNQN6yKe2nq11tqXtM+I9FtiDvH+UmGx2r5yC+j+o5HRnagcuQt0tXun8YLNtg1Snxw
         52PA==
X-Gm-Message-State: AOAM5335OMOLrNinCPm2MKX1n72nBxMPo697JSk7cwfA0yQQjwQE4UFz
	ZaDjFcoOJ80DTFqYK1elmw==
X-Google-Smtp-Source: ABdhPJw4F88w3A2wOguIyMIrYqJqK/2fOGIqigAkknVGyAjqgSNQEKVRVS8ziJsZawxLOzJU2MaRAg==
X-Received: by 2002:a05:6830:2159:: with SMTP id r25mr3846804otd.313.1620311136040;
        Thu, 06 May 2021 07:25:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m25sm443067oih.15.2021.05.06.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:25:35 -0700 (PDT)
Received: (nullmailer pid 277878 invoked by uid 1000);
	Thu, 06 May 2021 14:25:34 -0000
Date: Thu, 6 May 2021 09:25:34 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: linux-staging@lists.linux.dev, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, lars@metafoo.de, linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com, jic23@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: staging: iio: cdc: ad7746: add
 binding documentation for AD7746
Message-ID: <20210506142534.GA277826@robh.at.kernel.org>
References: <cover.1619841953.git.lucas.p.stankus@gmail.com>
 <2c2f4d486a94e0740e112bfac0d9306bdb7ea69c.1619841953.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c2f4d486a94e0740e112bfac0d9306bdb7ea69c.1619841953.git.lucas.p.stankus@gmail.com>

On Sat, 01 May 2021 09:32:31 -0300, Lucas Stankus wrote:
> Add device tree binding documentation for AD7746 cdc in YAML format.
> 
> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
>  .../bindings/iio/cdc/adi,ad7746.yaml          | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
