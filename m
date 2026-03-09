Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A53ACA62;
	Mon,  9 Mar 2026 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072233; cv=none; b=OvK1AcJsOCUHmaaH5dTLnaWmYVxjI37fVZ2l43i7UYTbDyK6XsJLa/AY4z523s6VDeo5dTY7hcimW90jF7L4nb5shh3tlR4EfrZJJAQFVe/LGtaNnjPX9//H8n7RTQOZue3HyB+SFAqVwofGGXMj+90fpaF2JuL0DaLR5XgjZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072233; c=relaxed/simple;
	bh=SwVP4t0NfembXlAWp1GF3hPUHd/LxFlFHVUj9h+WxcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhZrIydh0iPxddv0ZKE7WwZ7OS+r5nvvT9gP/wKz3rM76XiBHgd5QZhEaWqMTwMKyz8TQcsog2V7lF5W8+qo1e1MXHSgZWflCpwxDgiimUKUhjYyuexLZ6gwK/C3L69897mB0ZURn4EQE1sO8cZb+xjXVJnB2TsvIY3tLdSZlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZUCGHCr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZUCGHCr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7E0C4CEF7;
	Mon,  9 Mar 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072232;
	bh=SwVP4t0NfembXlAWp1GF3hPUHd/LxFlFHVUj9h+WxcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUCGHCr5o1tQAcRM5XosgBjIP/b6MNq7X9eW6OVNKppY1Toth+twFZ+HAFRbf97XB
	 1q4uKirLw8y0UdA0dhzM39E5qqOP8br1U8VimxBesA6fUA6ThYZRj9S/9CF0HbSadT
	 dLt3PVGKXonrHpQcx293AhFKyVcPpLfEWfdsE9yo=
Date: Mon, 9 Mar 2026 17:03:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Prefer 'unsigned long long' over
 'unsigned long long int'
Message-ID: <2026030937-deception-tubeless-56bc@gregkh>
References: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd.ref@yahoo.pl>
 <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>

On Thu, Mar 05, 2026 at 09:58:19AM +0100, Tomasz Unger wrote:
> Remove redundant 'int' keyword from 'unsigned long long int' type cast.
> 'unsigned long long' and 'unsigned long long int' are identical types
> in C. Prefer the shorter form as suggested by checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138..0ef88b7d24de 100644
> --- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
> +++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> @@ -58,7 +58,7 @@ int main(int argc, char *argv[])
>  		goto close_fd;
>  	}
>  
> -	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
> +	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
>  
>  	/* Get certificate */
>  	printf("Get IMS certificate\n");
> 
> ---
> base-commit: 6ae79e7736ee6a5f920867e5346d8a106cd1db74
> change-id: 20260305-greybus-unsigned-long-long-e7465302d3fa
> 
> Best regards,
> -- 
> Tomasz Unger <tomasz.unger@yahoo.pl>
> 

Someone sent this just before you did:
	https://lore.kernel.org/r/20260304193206.4992-1-rayfraytech@gmail.com

sorry,

greg k-h
