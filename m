Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F912C80;
	Mon,  7 Feb 2022 08:50:05 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id s13so39845899ejy.3;
        Mon, 07 Feb 2022 00:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kp8nZg26AuEMvm8QEtueCcP+FrKWg8a9EQmnI5dKMtc=;
        b=i9NmlbplMBKyJptoV+0Ap8F9ZDNfpzM54h3O+whKY55ghEvHjqUCIQCPE3Vc9y4XfN
         SdPnc1zwArIgWqV9fIhoPMKyO73MpLg5XV/24wUbnMuveF3DCkgjjXZZPmMZa/BqjdmO
         kXV+wu2MlLamw4IqRXaFIQ1JWx95IvHQUJhIxh0QUodKAIeE7+qQD86oPdTQjmthaC1n
         HRl4F/EuM83ftwuIKQORLweYYBiWXs/Nh2Hfj0XuPSy0ehR8X4rCHvMQgct1nulZmpEc
         PqpRfpNMmc6oH4pKLjFX5f4aSKl/+WKldpaxPh9IP8Oi3H1NC5cP6acRJ5KG4muZ8KwE
         RayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kp8nZg26AuEMvm8QEtueCcP+FrKWg8a9EQmnI5dKMtc=;
        b=MNwzn77q9xAOfe0REhPkWL3mziivka660IaIzEc9OpfPdnxVM2rz5zJJ10foqCMAXC
         LFCu35FuSwjof4CLlKRnOAE/GIswuo+Ur7WopnO9ytfyN7gZkmUS6cOu77DJPZYpacbc
         9hmVBTeMueO/CzOpn8HZ1byQ3oSRoDUkmaThGPkUQZiX1lnxrzIhMUTLiM4cjl0QsCfF
         BnDgg75EGOZTxq+sU5tPsEScm5RdGQ1YaE9kTP/jzoBZou+8/5AEXowgsGGp2HMLOg9e
         MrHoHPPtHO67nWi60x7J5OQPLyCkIzCa4s7E0qYGqe8r7hsMM+BvX71FPqYC3A36q58k
         5XnA==
X-Gm-Message-State: AOAM531G2I34C/sKzfBk8J4ikyMAeiDbapZk/B7/b6WidvaTn0qYFLNg
	ei+kYZqINoTnZuu0CTagudIU8pl36bHOeA==
X-Google-Smtp-Source: ABdhPJxIrJn4H6z5Uh+XugYTFQFkEqQT/xm3/GRroGI4nndtytFjOtPRhPBD8MtsV1QLALi1vZOmmQ==
X-Received: by 2002:a17:906:619:: with SMTP id s25mr9129849ejb.341.1644223803512;
        Mon, 07 Feb 2022 00:50:03 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net. [89.212.178.211])
        by smtp.gmail.com with ESMTPSA id hq28sm3417230ejc.204.2022.02.07.00.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 00:50:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helen Koike <helen.koike@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 02/66] dt-bindings: interconnect: sunxi: Add V3s mbus compatible
Date: Mon, 07 Feb 2022 09:50:00 +0100
Message-ID: <8021451.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <YgDbv8aQEOOjwTb0@aptenodytes>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com> <5386b1f5-9e75-4ce3-6641-bd7667c85d42@sholland.org> <YgDbv8aQEOOjwTb0@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

Dne ponedeljek, 07. februar 2022 ob 09:43:43 CET je Paul Kocialkowski 
napisal(a):
> Hi,
> 
> On Sat 05 Feb 22, 14:14, Samuel Holland wrote:
> > On 2/5/22 12:53 PM, Paul Kocialkowski wrote:
> > > Since the V3s uses the internal mbus, document its compatible.
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > > 
> > >  .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml  | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.
> > > yaml
> > > b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.
> > > yaml index 29c9961ee2d8..b67bf9261a6a 100644
> > > ---
> > > a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.
> > > yaml +++
> > > b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.
> > > yaml> > 
> > > @@ -31,6 +31,7 @@ properties:
> > >        - allwinner,sun5i-a13-mbus
> > >        - allwinner,sun8i-h3-mbus
> > >        - allwinner,sun8i-r40-mbus
> > > 
> > > +      - allwinner,sun8i-v3s-mbus
> > 
> > Please enable the expanded binding added in commit 245578ba9f03
> > ("dt-bindings: arm: sunxi: Expand MBUS binding")[1] by adding the new
> > compatible to the "if" block lower in the file. That way we can add V3S
> > devfreq support in the future without changing that binding.
> 
> I had missed that new driver but surely I will expand the updated binding.
> 
> By the way do you have an explanation about the cell index given to the
> interconnects (after &mbus)?

This is mbus channel. You can find appropriate one checking DRAM driver in U-
Boot, where mbus is configured.

Best regards,
Jernej

> 
> Paul
> 
> > Regards,
> > Samuel
> > 
> > [1]: https://git.kernel.org/torvalds/c/245578ba9f03
> > 
> > >        - allwinner,sun50i-a64-mbus
> > >    
> > >    reg:




