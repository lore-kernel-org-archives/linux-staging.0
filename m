Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FD62C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 21:57:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso37257749otj.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Dec 2021 13:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aN8dRcN6+zd7oasgWAONmcRJZK+uIK9pRTcKdcu5dUA=;
        b=r/YSk8CYwvbUU4SGUrg+fgX6oIfl7sgGQR5Jat2UasCOM+w2Pn5vJNa1xJScjixhPc
         z+9eis3Z4OTPNiVJ9j0B0gcYzYc3uKdp6YNFdPMSXK5MWedg/L0++7tf9kNj346IkEfN
         i2dLn7fF9MWTFkeWoLLvBboR/kug8f/3nwU6RHIHjYLBczvsINh6L2BuwMpTTMcd4hMZ
         p8PJxCa49eoFHVkT58WSpB/XXxDBvNxqyryUJEDgxpBS2ktKhf49YOk6KihjpMZUCrI0
         XtMy7c4+1nZROVS1sZ0/NsEqrUhkMxnDCFKPmi5xrLAGtY3RWdLekFLk1o6YXriieGXT
         DHQg==
X-Gm-Message-State: AOAM5333eu6mlZY8ZBeYZd34AZEQ7SZLU1kInEnGROmdaNEo9LhLoSt5
	/w8GjLtF/PTuDQAC7zsalA==
X-Google-Smtp-Source: ABdhPJxqCAXkJXICQHbkkyRujU57Gt2ub99dnsnj7jJyb3igqg9+/2JuSfI76oP3+F8RkuNXG3nXDg==
X-Received: by 2002:a05:6830:3499:: with SMTP id c25mr8435409otu.206.1638395838094;
        Wed, 01 Dec 2021 13:57:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id be12sm612186oib.50.2021.12.01.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 13:57:17 -0800 (PST)
Received: (nullmailer pid 2749175 invoked by uid 1000);
	Wed, 01 Dec 2021 21:57:16 -0000
Date: Wed, 1 Dec 2021 15:57:16 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, david@lechnology.com, devicetree@vger.kernel.org, maxime@cerno.tech, robh+dt@kernel.org, dave.stevenson@raspberrypi.com
Subject: Re: [PATCH 2/6] dt-bindings: display: sitronix,st7735r: Make
 reset-gpios optional
Message-ID: <YafvvLHSfY2U4eA5@robh.at.kernel.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-3-noralf@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124150757.17929-3-noralf@tronnes.org>

On Wed, 24 Nov 2021 16:07:53 +0100, Noralf Trønnes wrote:
> There are other ways than using a gpio to reset the controller so make
> this property optional.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7735r.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
