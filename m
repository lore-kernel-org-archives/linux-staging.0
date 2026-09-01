Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746347F2EE
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255632; cv=none; b=B9uB3wRWdwByW3Rp2awEULspljd9Qdtv7+LvtqMjojXzZvZihZd5vU2tz04L4LKcw597BiipRQdi3XyVW8PK7VvcD8LGXr7PbYHavGcN513gV2njbAfIgRhig6aSZFQfz3iDdR/QFO919gpu6CCockIGmJpBHuQArCKe4pSfoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255632; c=relaxed/simple;
	bh=j2KUNNjAO6k6s3Ed07hC4PhFOqZ62ANAmWIS37Zb6cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL+xW9i7TAlq0rrzxFjo4E0VFwGtSAKOonwi/U0QJfvd8SsUZJE1X9vFprfy3bbigsPihC+3TeE96V674HMXaQgo53AILEq15vlCiV9y2RnnM5/T3Sj19btwuVzt/N/HBLd3ksDJKPFBxlI2606aJhy2Suy1hgJH/Mqa5INEt4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XBodcIHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XBodcIHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F671F000E9;
	Tue,  1 Sep 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255619;
	bh=QTv9mLre2ppynOPt5ytFq++ksWegRk+YtDRWCfHasfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBodcIHNbmeot3RfNMDmoDcfCLg9kute2NDDQLugVN6Hg2qPzDy1W4WvcgcN73NUv
	 uHTlbZjK7xgwikmZCaSyKd+ycsYwbrPrN6O9BgaZIrc/BNXSCza0UpRoW3aXFH8UhS
	 zbx4eUwgipEwi4Q8e9qef88rOp97a/lYFrShYDdw=
Date: Tue, 1 Sep 2026 11:40:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Noah Techoueyres <noahtechoueyres@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: loopback: Fix argument alignment
Message-ID: <2026090156-effective-anybody-a347@gregkh>
References: <20260803015022.534-1-noahtechoueyres@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803015022.534-1-noahtechoueyres@gmail.com>

On Sun, Aug 02, 2026 at 09:50:22PM -0400, Noah Techoueyres wrote:
> Align function arguments to match the open parenthesis
> per the kernel coding style guidelines.
> 
> Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index ea57b1f5d156..c33b8aa5871c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -679,7 +679,7 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
>  		}
>  
>  		if (!gb_operation_response_alloc(operation,
> -				len + sizeof(*response), GFP_KERNEL)) {
> +						 len + sizeof(*response), GFP_KERNEL)) {

Now you are over 80 columns, this keeps going back and forth.  It's fine
as-is.

thanks,

greg k-h
