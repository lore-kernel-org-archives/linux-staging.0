Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5303B3FC9
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 18:02:29 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso22672521otb.11
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 11:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M/SGga67jN2G7/llzVrub5qhFrk1aFwuQmWZS4qHJnU=;
        b=okrlIaaft0HU8UhZS2NjMM6QYFIkb4WkeY0AuTBtzRM1ZE+8DZPsHi4pJOg7ozcYVm
         yClrmtdmiE9MfbTt0FmRYLCCxM2Wz+G0SUYGpyl6W3f/jcXTmDEexZKelsIIPI7v4cdk
         eHy402etn6Pj1rigGHitBw/gqfV0uzbzb6yFBqkBfIDQLz6jChte/pMpVzj5k53MJyzm
         pyew4J6e8kuaaGAF6PS27osaO+PAwGjrrylu67byoTq5Izo6D4Sda9E7dUfv0dYFUDB3
         /GYbhrwUbWAvs4z1N9uuso4e/esX5QEDl1ez+ZXzpVGvanpzeQvp49YhWJq4XPTKuxlZ
         GAsw==
X-Gm-Message-State: AOAM5337PagFY2bMdam/ovaIwuMkPackc8sqLZ6yzvyV+HnvPOs1a/Jz
	uEWd9Bxoj2Ua9OICy0zDJQ==
X-Google-Smtp-Source: ABdhPJxRFQOGJe/1Gc8YPX/AbyB8SwC/3eUvlri6WIZ7hLGxw4bR0uSlc2koc4irHc7tVC7tGlyNSQ==
X-Received: by 2002:a9d:1783:: with SMTP id j3mr11058382otj.366.1633370548465;
        Mon, 04 Oct 2021 11:02:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l19sm3029186ota.17.2021.10.04.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:02:27 -0700 (PDT)
Received: (nullmailer pid 1570795 invoked by uid 1000);
	Mon, 04 Oct 2021 18:02:26 -0000
Date: Mon, 4 Oct 2021 13:02:26 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, john@phrozen.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, neil@brown.name, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: add dt binding header for ralink
 RT2880 resets
Message-ID: <YVtBsrmCDk/sLsRJ@robh.at.kernel.org>
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-2-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926145931.14603-2-sergio.paracuellos@gmail.com>

On Sun, Sep 26, 2021 at 04:59:29PM +0200, Sergio Paracuellos wrote:
> Adds dt binding header for 'ralink,rt2880-reset' resets.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  include/dt-bindings/reset/ralink-rt2880.h | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 include/dt-bindings/reset/ralink-rt2880.h
> 
> diff --git a/include/dt-bindings/reset/ralink-rt2880.h b/include/dt-bindings/reset/ralink-rt2880.h
> new file mode 100644
> index 000000000000..266ef521a584
> --- /dev/null
> +++ b/include/dt-bindings/reset/ralink-rt2880.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.
