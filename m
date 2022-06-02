Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610CAA53;
	Thu,  2 Jun 2022 14:51:08 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id v33-20020a4a9764000000b0035f814bb06eso942340ooi.11;
        Thu, 02 Jun 2022 07:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1E/3KWBubmd3TEa7PIO3GoA5fzjc3dGvE7ZiPQxDE7c=;
        b=C2tA48d/QTs5v3Ml6bJBb8fqU8wxQ4LG0OEJvCXaegv0e3TnmLH9WqQJyvCwgGszw7
         U6POPNXoLxfcNs0IlQCCsBzzDwmakUtzsVVjo0JPIBjft67rt1pPd8M7FgYrsGzqXsNe
         jdvTjcNQ71wWZZLFSZ0DsRB21Q62uUgdWT2O68KaOMVhX+U/vBBa4sd5hA71sx6cFXhP
         4/pgehjwsEhLdWqrZBogSMvL01u/xzP1LG49DUsIjZvIYqxHZ0Xi6EC5jFBq24pUW4uH
         K51qhp1KmQjypiZPEbBuqXaByKe2253DBJt2JoHtmzPv6U1M42u7CHCeT0LhV7mDbHTT
         2v8w==
X-Gm-Message-State: AOAM532hEs5dLzfEJzYDyo0BZYU6d2PyhUz38Yc+0ZhM6PQ+H1Y8Zxmo
	RPF1GGKMrO9KMfFsfdlEjA==
X-Google-Smtp-Source: ABdhPJx/W2nQKKhkMKZ/abujq/Z3ImQBTqczfZI8YQDqn9Fpzc1f8SxvzBCup7RNWtudJZXcjiRXyg==
X-Received: by 2002:a4a:97c3:0:b0:35b:29f9:a212 with SMTP id x3-20020a4a97c3000000b0035b29f9a212mr2200527ooi.50.1654181467373;
        Thu, 02 Jun 2022 07:51:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l3-20020a4a94c3000000b0040e5ff4a737sm2325045ooi.26.2022.06.02.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 07:51:06 -0700 (PDT)
Received: (nullmailer pid 2299234 invoked by uid 1000);
	Thu, 02 Jun 2022 14:51:05 -0000
Date: Thu, 2 Jun 2022 09:51:05 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: media: Add Allwinner A31 ISP
 bindings documentation
Message-ID: <20220602145105.GA2298322-robh@kernel.org>
References: <20220525191026.696636-1-paul.kocialkowski@bootlin.com>
 <20220525191026.696636-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525191026.696636-2-paul.kocialkowski@bootlin.com>

On Wed, May 25, 2022 at 09:10:21PM +0200, Paul Kocialkowski wrote:
> This introduces YAML bindings documentation for the Allwinner A31 Image
> Signal Processor (ISP).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/allwinner,sun6i-a31-isp.yaml        | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml

With the indentation fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
