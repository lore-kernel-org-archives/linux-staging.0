Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141322FD69A;
	Tue, 25 Aug 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672197; cv=none; b=svp6uchcAZ5tOSv4ajF6SrmVyJDkIy2k0sSgzmr4gJ/Mik/lKqufvaB+1AjhF9P/eWfPStTEvSm81P5d7yUadvkJbFbeOhDZ5Jh/JMFRbSHr8kyeG5u70zvS0yHVMWRTkS64proyguhG8qunaujdZLETCMHgvwcjx4QlEE74V8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672197; c=relaxed/simple;
	bh=CtEsQGunQrnIuzCrHBA39h7yWQe52pADQV4gQJUTK2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7biMhgMrnctvSEqR3Z9B1kU0t02K10CTNwEAAi0utqEoDa7WoamOt5kIzsiF9Rc2CmjtGl4DqMj6BIXE1c+NayijD0idV7vboAbGvvF0HWI6v1MDw1YpAai7Etxchq9qL8DgCTytrHbggV9pRWa+2/pAclebQNUYrW0AEwxNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T25vhmDv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T25vhmDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D2C1F000E9;
	Tue, 25 Aug 2026 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787672195;
	bh=yfUXyfXI/SMk45xQCk/FgtwJwmLXgJvs9GmPxbE52gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T25vhmDvpDENEAY2aKYne8OydgIl8h+luXO1oOFzJeZLn4jwuMKQhx1M/IopYlGx8
	 iu81nxIEZQxbZLEHUolzsl14V4KxBSpMqCi6IfQbf3KH2d6pg63dySKyNFIv6viIwW
	 1tUSKULlrvEC7qinPz/ONq1R0ubJgPuvSZog6XYQ=
Date: Tue, 25 Aug 2026 17:36:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: huangjia2hi@163.com
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: use dynamic vendor and product
 IDs
Message-ID: <2026082557-certainly-secluded-b3bd@gregkh>
References: <20260818061520.67387-1-huangjia2hi@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818061520.67387-1-huangjia2hi@163.com>

On Tue, Aug 18, 2026 at 02:15:20PM +0800, huangjia2hi@163.com wrote:
> From: Jiazhi Huang <huangjia2hi@163.com>
> 
> Replace hardcoded magic numbers for Vendor ID (vid) and Product ID (pid)
> in gb_audio_mgmt_node_desc with dynamic values obtained from the
> greybus interface.
> 
> This resolves the associated TODO comments by using the actual vendor and
> product IDs provided by the interface structure.
> 
> Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>
> ---
>  drivers/staging/greybus/audio_module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index 4cd1f42c11f0..9eed3ac0c49d 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -358,8 +358,8 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	dev_dbg(dev, "Inform set_event:%d to above layer\n", 1);
>  	/* prepare for the audio manager */
>  	strscpy(desc.name, gbmodule->name, sizeof(desc.name));
> -	desc.vid = 2; /* todo */
> -	desc.pid = 3; /* todo */
> +	desc.vid = bundle->intf->vendor_id;
> +	desc.pid = bundle->intf->product_id;

Are you sure this is right?  How was this tested?

A blind TODO change isn't usually a good idea.  If it was this simple, I
am pretty sure we would have done this a long time ago :)

thanks,

greg k-h
