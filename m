Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5333EB;
	Tue,  5 Jul 2022 16:37:47 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id p128so11647093iof.1;
        Tue, 05 Jul 2022 09:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c55GW3JhZSSyCs5z2S50t5xP4aI3+vGX0Hxqnl5VHBw=;
        b=sJlZWwY1bWK2u29KnT861HXHWCuY69RbXf/eKp0vZiHa+LTlVczvVYekuJTHaJwjyZ
         i3whtBb7hWXOLd8RZgZU52aGDaw7U6/6aZze54rsIsNGQCbIpYiUhs8hflthGU6J3anH
         asoTfevYLltVX8kkdKxK6QHf3XzfQoa0cCuvxar4aCZTkWAK5al31HarRa9xO5y929eJ
         nV/xTGzovTo7vJwbzXhotBk4QeEqsimWFBRXWF4T4Neh8v16XfF2SKHrY8LBU5MoUG+3
         qc6JsPV3nkkaw06l8n05Nfoho46aK3m78A0jxVcb1++7k6tvaCn53+Umakdxjnu8RCXk
         HtFQ==
X-Gm-Message-State: AJIora8MACHipzSUrglQ7ACbR8XBt/NFWiHYEXr0m06r9EsuubKy/ynk
	7cO/PCclUdLk8vzjkAgi4A==
X-Google-Smtp-Source: AGRyM1vY4x7KgFkloP8FcLuexH2ZmYRLJDRXCJ33C28v5rVjyEV6dX4JIuxxIftRTQsK9XuPc/RFMA==
X-Received: by 2002:a6b:f20f:0:b0:675:5519:744b with SMTP id q15-20020a6bf20f000000b006755519744bmr18448319ioh.202.1657039066422;
        Tue, 05 Jul 2022 09:37:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m9-20020a02cdc9000000b00331fdc68ccesm14830816jap.140.2022.07.05.09.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:37:46 -0700 (PDT)
Received: (nullmailer pid 2234555 invoked by uid 1000);
	Tue, 05 Jul 2022 16:37:44 -0000
Date: Tue, 5 Jul 2022 10:37:44 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-staging@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Hans Verkuil <hans.verkuil@cisco.com>, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: media: sun6i-a31-csi: Add ISP output
 port
Message-ID: <20220705163744.GA2234496-robh@kernel.org>
References: <20220704173523.76729-1-paul.kocialkowski@bootlin.com>
 <20220704173523.76729-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704173523.76729-3-paul.kocialkowski@bootlin.com>

On Mon, 04 Jul 2022 19:35:19 +0200, Paul Kocialkowski wrote:
> Some Allwinner devices come with an Image Signal Processor (ISP) that
> allows processing camera data to produce good-looking images,
> especially from raw bayer representations.
> 
> The ISP does not have a dedicated capture path: it is fed directly by
> one of the CSI controllers, which can be selected at run-time.
> 
> Represent this possibility as a graph connection between the CSI
> controller and the ISP in the device-tree bindings.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
