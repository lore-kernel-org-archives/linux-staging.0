Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A436166A;
	Thu, 21 May 2026 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355324; cv=none; b=Df9X5OeQlHazKpB1H4kzvwNACfujwUz1Gu/U6pxCAdtJg+NE2Xv/i9MkPmLQfeCEwRVLRQHk9Hx9FpqYGW0aRXJgissZhPWgzm4LAoWc0CzjQNgzByjzCFBKbMOpUHY1B7jlclFHX85R3wq7/+6sDmWuCGdOfSLiziM7hSuXA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355324; c=relaxed/simple;
	bh=WRryzoD5PYBwKP5XX+3ceY95djixIOo/+fsrDG8z9xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjwfxPonjg2y57sdlROIBqYmrU22SVp1kouHtpka0YGvLc/rtAlch/N8q7RgnM4SOgghD9n+vefzkDRuHiKfI2H5QqwAxn5MvBHd/7NakYyWwls3bgp3HO8qoEy3HjiPJN+6ejP6mVn738wSlVdcQDXRCtbwW+q9mlb5nHlljFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gmbAu1A6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gmbAu1A6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4337F1F000E9;
	Thu, 21 May 2026 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779355322;
	bh=3x85B8ZNcso/Z/jHyiuGnO8WMljjjgSK4PnnDC9FgjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmbAu1A6ltLfgI1xiabBy9rG7Ji1F54Go83ALa1ePhQCX4codfqmb+8lMYM3h8oxR
	 2Yq1QYBOn8Om1YN0PId/yOkgOfkaR0JT0DEYTiX/T7SXWaC/Mw6MEjCFFCKl5HvOXj
	 nOpA59Xd4XPcjuB59HkkhrXDSuFV9eEppjfnFKhU=
Date: Thu, 21 May 2026 11:22:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Dan Carpenter <error27@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
Subject: Re: [PATCH v3] staging: greybus: audio: correct sscanf() return
 value check
Message-ID: <2026052100-alongside-magician-527f@gregkh>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
 <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>

On Tue, May 12, 2026 at 09:15:54PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  v2: added "Fixes:" to commit message
>  v3: added all these v2/v3 lines here as requested by Greg KH
>  v3: while on it, replaced title "Greybus audio protocols drivers:" ...
>  v3: ... with "staging: greybus: audio:"
> 
>  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f954..ff323ca815 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
>  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
>  			&desc.ip_devices, &desc.op_devices);
> 
> -	if (num != 7)
> +	if (num != 6)
>  		return -EINVAL;
> 
>  	num = gb_audio_manager_add(&desc);
> -- 
> 2.54.0
> 
> 

Does not apply to my tree :(
