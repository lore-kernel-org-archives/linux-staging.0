Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DDA429033;
	Tue,  4 Aug 2026 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828051; cv=none; b=HutSOfgbev508nNjMjbL6PFwcBAv+/PWr/SncLAQqve+fjGCxEv4b/ljIwhth733MnTp76LmvY205XhfMkPHTwQA5L+1ZduPmAxmlQw89SIklMAE9Iudkc4lc4VWca4zwku/5swdMd2s5coTx46N5heEJVKpmEvfxx9UWKhRQR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828051; c=relaxed/simple;
	bh=W3fto8xk/dUb/aABHCl83zGDbw7jQ4ikv+ac6GUYQfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peKkRWQ0qw8187ULcYX2IF1J+7du8aeChQ7mVdAHVpZDrniL8oKLnWmFDcAG6gcJCKTD2LsYhWq4cSW5C3/4jOTlZa1CY9T5tDp8xg+cfY979wwLkYLMNnOtEOdf2x+HBxfioF8ScpWoVA1WHF4NhfdgA1knwIzPe/WgLPh1IGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HjzZf2st; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HjzZf2st"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0971F000E9;
	Tue,  4 Aug 2026 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785828050;
	bh=4LHuRgmhftTScec4rlOBlz53cWChf0FAhtNKz+eYMzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HjzZf2stwrejMXTfxazuYtz4V8NWzcDjuLpve606eg68NLnDyGH7cZdfQdGGYvDUl
	 JeVSYivCvPTVA5QYaqauWhJ67NmrWzq5wX0nav0JizvMdqebjCtDFWNMkXByUzde05
	 cC0YGV45Nj7a2B6Jx9ZLKE5TbMGJKUgG8PXxVRxE=
Date: Tue, 4 Aug 2026 09:19:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pedro Amorim <pedro.aml.dev@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Align wrapped function parameter
Message-ID: <2026080404-paging-runt-f506@gregkh>
References: <20260803204743.335743-1-pedro.aml.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803204743.335743-1-pedro.aml.dev@gmail.com>

On Mon, Aug 03, 2026 at 04:47:43PM -0400, Pedro Amorim wrote:
> Align the wrapped function parameter declaration with the
> kernel coding style to improve readability.

Ok, but:

> 
> Signed-off-by: Pedro Amorim <pedro.aml.dev@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index ea57b1f5d156..374ff4c4ca15 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -589,7 +589,7 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
>  }
>  
>  static int gb_loopback_async_transfer_complete(
> -				struct gb_loopback_async_operation *op_async)
> +	struct gb_loopback_async_operation *op_async)

You didn't align it here :(
