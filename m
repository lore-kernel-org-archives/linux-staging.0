Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600B2C80
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 19:21:19 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id o83so26417804oif.4
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 12:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IHEXqz8f4V58xggUiJsoHJioyZZs6cSm/XqeqYEpeTU=;
        b=5B6yMOknL0gMy7PAzCuPqYbcZooTkp6ywX0C5vD4OXpci+yX10bNnFQ53r5AW3bcRX
         n9tJJ3No+LI/ncA3iFTYSy+dsH156N8gjbroHET85MMvs86piJPPTjw1+iiO/4vdV3Hx
         MHwqB2sIEfgI1A8tP15IJMPOUUb0ItfSe++ukvgQWBoRx7ZDC9sxEpxc7OQ1r0upn65l
         Tej38Mhk/AJf3Pp9om/zSp0L5V7tvI45f44f4BHiwACYezOEBnN2GB0fD9i/M+BNY0uC
         JKQaj9Y+3FFe/hCU+3aGZYca8PpBir6cQNBJUwLRu8esk4gqfQIlfSnwo4svZgtjVFX4
         Vnlw==
X-Gm-Message-State: AOAM530H33Gt4/ipeYRlhpjjg4VvnCbGjT+qFQUJg1Dfh5f7J10L/nQH
	HLHWx8PRhj+1cwSuxaddBg==
X-Google-Smtp-Source: ABdhPJwpx3d6wNHdX/AjX1YdO2WbjDeTZkYA5MtvVOj0szNXGgSxw6yMQaI9RifVBVTrTlMRI51M9Q==
X-Received: by 2002:a54:418a:: with SMTP id 10mr821593oiy.13.1635794478401;
        Mon, 01 Nov 2021 12:21:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t22sm2349564otd.25.2021.11.01.12.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:21:17 -0700 (PDT)
Received: (nullmailer pid 868227 invoked by uid 1000);
	Mon, 01 Nov 2021 19:21:16 -0000
Date: Mon, 1 Nov 2021 14:21:16 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com, Ojaswin Mujoo <ojaswin98@gmail.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Mwesigwa Guma <mguma@redhat.com>, devicetree@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 2/2] dt-bindings: soc: bcm: Convert brcm,bcm2835-vchiq
 to json-schema
Message-ID: <YYA+LDHLJTmQVHWp@robh.at.kernel.org>
References: <1635682086-3200-1-git-send-email-stefan.wahren@i2se.com>
 <1635682086-3200-3-git-send-email-stefan.wahren@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635682086-3200-3-git-send-email-stefan.wahren@i2se.com>

On Sun, 31 Oct 2021 13:08:06 +0100, Stefan Wahren wrote:
> This converts the VCHIQ bindings to YAML format.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 17 --------
>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.yaml       | 45 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
