Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64A1A9B46;
	Wed,  4 Mar 2026 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630673; cv=none; b=axp6xSmqWhuSCt6qk7et0ILNXx1MpsZJiLi//nh4vG5ex65XLdDriXO0Uc4cs4BgyxzSLoidcdVzwu8CjtRvb2alC69FfzhoJcBZ6ghB8uF/3TXlAf5VUyxhkgUtkEKiuMW03dgVfN6bQ+rPFrqRc5mZhu9rIauyzNyw/gksCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630673; c=relaxed/simple;
	bh=hUAihoEBA70tx3yW3N4Bjaaktq4R2hLalawv1WO3k3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eigWzJNtBlGDWMS0a+DilALP9QrvPgeFXgBSDXsq8t2qAohLin6HpTdlqub3HOM1iwA7nJNbIz47hjwtdr0CSbtOOGC2ZPrQVdB+1Bb8qz0+vKNZbvhX6raNoFILNTouAmzxfnaWppToRyBTDjydvY9ORd7JLrOgFaJo23NSdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HKYJLzim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HKYJLzim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333C7C19423;
	Wed,  4 Mar 2026 13:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772630672;
	bh=hUAihoEBA70tx3yW3N4Bjaaktq4R2hLalawv1WO3k3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKYJLzim2Qpin/KQ4bPkL1OsFMh9c3g7oTj49GFQL7Ge23Wki29kAX7tushJoG9PJ
	 KkXHIILsi+L24BfD1JTjK0EDa+igW6Hib1AryFPAYp9jOYuK/QYBAu8NzuxWd12FYY
	 onGpyGmq8jh4vyT6UojRaTWN91mD9kgqPN9Gz67k=
Date: Wed, 4 Mar 2026 14:24:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix
 interrupt-parent property
Message-ID: <2026030408-expediter-rise-0082@gregkh>
References: <20260304130556.37311-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304130556.37311-1-hossu.alexandru@gmail.com>

On Wed, Mar 04, 2026 at 02:05:56PM +0100, Alexandru Hossu wrote:
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  .../devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml   | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> index 6d1cd651e..cdc295f2d 100644
> --- a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -31,8 +31,6 @@ properties:
>      items:
>        - const: interrupt
>  
> -  interrupt-parent: true
> -
>    xlnx,use-rx-data:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
> @@ -56,7 +54,6 @@ required:
>    - reg
>    - interrupts
>    - interrupt-names
> -  - interrupt-parent
>    - xlnx,use-rx-data
>    - xlnx,use-tx-data
>  
> @@ -64,11 +61,16 @@ additionalProperties: true
>  
>  examples:
>    - |
> +    intc: interrupt-controller {
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +    };
> +
>      axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
>        compatible = "xlnx,axi-fifo-mm-s-4.1";
>        interrupt-names = "interrupt";
>        interrupt-parent = <&intc>;
> -      interrupts = <0 29 4>;
> +      interrupts = <29>;
>        reg = <0x43c00000 0x10000>;
>        xlnx,use-rx-data = <0x0>;
>        xlnx,use-tx-data = <0x1>;
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
