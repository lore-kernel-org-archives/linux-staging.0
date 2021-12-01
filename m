Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3F2C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 21:57:08 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so37251892otg.4
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 13:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YrRZ+cDt9aijwJi2m8Tkj3TgFbHG9MWj6VoJ8Ts+1zU=;
        b=RTsfG0Pmn6DlB5j3K16qg3vA9Z9NNpd2Hy4OvVj5xRwOdhPLEt7d0LHiMz3WbKPlG6
         pR+97WIPnGXCykRUhvTLNFWFrZswETddgPrrwj1X4ZhcDsjp6Rv2ehjW0+0N6WW+7q3S
         c6v7HYmXucJrdZR6OoQNuR3QCiDf7g6k+Rh2Vm5+q2eYR+hhwQjsrmgwB2eSMbxKTDtf
         0UYOjkYsT+eJcxbnmIijyW22D5qtQRdfAshSJ6CQLmauf0Wtriam+qJ8DL9bZWLNatQQ
         z1MudKzIZtiDOAbqC39In+YesMo/ziQ4o5h7TSUszCarjTBd9rVbLW2kJTPflrh61PoE
         nZSA==
X-Gm-Message-State: AOAM531v5L1fXC/vBbhMEZWHlqL61m87DjIQeavEmRaP9GRW9sJ2IN2K
	B5kE0xhJFCVqhdKBGxcFug==
X-Google-Smtp-Source: ABdhPJziPLuy+LbX4tUcDrFPtbefkHNQNGxg04CykWpyhOEvg829/JhZ5WltvkfPJ+HJXg+GN1Nt/A==
X-Received: by 2002:a05:6830:18b:: with SMTP id q11mr8427647ota.113.1638395826668;
        Wed, 01 Dec 2021 13:57:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h26sm346938oor.17.2021.12.01.13.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 13:57:06 -0800 (PST)
Received: (nullmailer pid 2748731 invoked by uid 1000);
	Wed, 01 Dec 2021 21:57:04 -0000
Date: Wed, 1 Dec 2021 15:57:04 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, david@lechnology.com, devicetree@vger.kernel.org, linux-staging@lists.linux.dev, robh+dt@kernel.org, maxime@cerno.tech, dave.stevenson@raspberrypi.com
Subject: Re: [PATCH 1/6] dt-bindings: display: sitronix,st7735r: Fix
 backlight in example
Message-ID: <YafvsMJksKEYn5n/@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-2-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-2-noralf@tronnes.org>

On Wed, 24 Nov 2021 16:07:52 +0100, Noralf Trønnes wrote:
> The backlight property was lost during conversion to yaml in commit
> abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema").
> Put it back.
> 
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7735r.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
