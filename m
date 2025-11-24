Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67A274658;
	Mon, 24 Nov 2025 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002283; cv=none; b=KYuJusWz6n4Wm02aDFjJgcDNPWqiDRsXqBJCiAzGVslEcgcE5RW3YoUPoZCSuZce1pWSxh34PAcFLV5cQLqmCPJGWEoe+8WlYy0dFGE8KwUy119wrK6TuOxd9OorvZo/Kmkva5hU4/apSjC5ggzjxY826JSo/QmCzXgWqmZv6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002283; c=relaxed/simple;
	bh=wQugYOHXFig3DIQ59puMZSl2HrVTJpj7XoRftj0gVo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksVhagejKmUeGwbsK/MRTMSaRAkJ6TrgXSMGBsOQYmxpJYAsMK5fnS+MlD5Tmz/yilct/CbEHR99PquzoOarn/ebpqiRU4p36Ulj1nw7jOQ1zc1IgND3vpNSzl1KSxItaA/H3Yx0ct7hN/fn1k4vepZn6iODSOJ5D8sh6RXtQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GhAOBw1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GhAOBw1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D250C4CEF1;
	Mon, 24 Nov 2025 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002281;
	bh=wQugYOHXFig3DIQ59puMZSl2HrVTJpj7XoRftj0gVo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhAOBw1mpm38xM+ZHumHsfsqt2Am+3HEtP26jnyQoHljbCF5srYGzi1QqfEzT37/1
	 tB3x0WjgfgWvqZcy4/7qnS812GVnl8HBJiAa8LzqNox4SRRuzj0zrFeB0EysYGWq+a
	 bRIP0sN/jmk2by607mLrNeszT1LKwwvYks1BM21o=
Date: Mon, 24 Nov 2025 17:37:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: make envp[] static const
Message-ID: <2025112407-gratify-demanding-c817@gregkh>
References: <20251122083814.49753-1-sameekshasankpal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122083814.49753-1-sameekshasankpal@gmail.com>

On Sat, Nov 22, 2025 at 02:08:13PM +0530, Sameeksha Sankpal wrote:
> The envp[] array contains string literals and is never modified.
> Declare it as 'static const char * const' to place it in read-only
> memory and avoid unnecessary stack usage.
> 
> This fixes a checkpatch warning:
> "char * array declaration might be better as static const"
> 
> Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..1b83c05f2434 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -159,7 +159,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	char ip_devices_string[64];
>  	char op_devices_string[64];
>  
> -	char *envp[] = {
> +	static const char * const envp[] = {
>  		name_string,
>  		vid_string,
>  		pid_string,
> -- 
> 2.43.0
> 
> 

Any specific reason why you did not build this patch before submitting
it?  Please always do so.

thanks,

greg k-h
