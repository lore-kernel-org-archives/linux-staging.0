Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D3220F29;
	Sat, 15 Nov 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763212635; cv=none; b=Mj9D356wTXT0gNplEuvlqJHx0D6lKXP+C0dfMAoA7KlGafk0C+3uW8cbO1o1cAC9z4SmQ5aFAiRiSAapjtjM5ElE2F7U2iPey0PPrh9PyF5ioCvX19c5wL5UXF08H0AdjW0ltAt9kcKMthbNdsbT3Cqlxp7laS0+QOLDsOyxk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763212635; c=relaxed/simple;
	bh=8oG8Uauz3t6zi4rCZpI7TfWEbCPWnsJwuEQVEx/mnxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nej5KbIgdz9gYPiYdGYE+nOc8U6Ya5VeHCUzakP8jd133pfrAxFBulFbce+Xy+ItmCj1p40pB6dN4xFZPIjG81VJBe7u6QEU0uRBsXnJUBTib6PFN4+vMTYyWqxm6zwjkRG3iiWitVFxL5i8oN8fFc/qCvyKaV3ZGDoyJuFQ6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0aqm31J0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0aqm31J0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B995C113D0;
	Sat, 15 Nov 2025 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763212634;
	bh=8oG8Uauz3t6zi4rCZpI7TfWEbCPWnsJwuEQVEx/mnxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0aqm31J0iX9WgkwAvdvMKk8Un3eJg5mznmTiWLj7P35U+1YsvvLyPMGKYh3JGUgZ7
	 sRE6PT+PLe8Thb4vj4/dAUzTnmKz+cjLfRx/U9EygE7/iZ/Rv/CH1MdD/kaehhFBmZ
	 ADVt+3VtXm+WJ0xw7W8t8tVwpGVFO9AcPWf/BimQ=
Date: Sat, 15 Nov 2025 08:17:11 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chang Junzheng <guagua210311@qq.com>
Cc: outreachy@lists.linux.dev, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Junzheng <guagua210311@outlook.com>
Subject: Re: [PATCH v2] staging: greybus: audio_manager_module: make envp
 array static const
Message-ID: <2025111500-ladder-siren-1b39@gregkh>
References: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>

On Fri, Nov 14, 2025 at 09:40:43AM +0800, Chang Junzheng wrote:
> From: Chang Junzheng <guagua210311@outlook.com>
> 
> Fix checkpatch.pl warning by changing envp array declaration to
> static const char * const. This improves code safety and follows
> kernel coding style recommendations.
> 
> Signed-off-by: Chang Junzheng <guagua210311@qq.com>
> ---
> Changes in v2:
> - Restored original indentation of array elements
> - Only changed the array declaration as originally intended
> 
>  drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..78013d59fc93 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	char ip_devices_string[64];
>  	char op_devices_string[64];
>  
> -	char *envp[] = {
> -		name_string,
> -		vid_string,
> -		pid_string,
> -		intf_id_string,
> -		ip_devices_string,
> -		op_devices_string,
> -		NULL
> +	static const char * const envp[] = {

Did you test build this change?  Why not?
