Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4103C4B98;
	Thu, 21 May 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352701; cv=none; b=hnrkc66Yqb2pYBDmnPkSKW0ZSjsRiZss1a4QOywt3EcGWglborqu5Rtqi4PTbhrmzyzN5yMxcms5+DBOJehn6WmmQ2OMo6/NL5zD7GBOpvqKf5cOIjb3ew1V/9nuMV7KzwcuyARit6rLE0d1K3+7HlmtbPOUGpQT7avzRClMPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352701; c=relaxed/simple;
	bh=X8wNNh3mHYbITd4fLoWXP+zFvbL9Cek815duHAfJK7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLx12LM/wmR+4VMZFZNEvJ9cUc/S1LuUfu/MQDFDcj1104MAZKI+DkLrpVwR6P5bBnDHMUA/uTOI8WUv0zImZ9AELRaVJHJmEySiGM9+i3rtVSJWCZNeKjJVtR5rbLYyXQW1tEdzGXSb45fCPInnkoOfd8929j0g3IOJO9hXe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WM0TDwlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WM0TDwlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177731F00A3E;
	Thu, 21 May 2026 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352689;
	bh=7BMXjlF7UCgxRCz0l9h6V5mLh+8r2F04IBr4+wMNLtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WM0TDwlYSBVmtRPNoSzVp9m/ADnl/Smn/+5Vwz72CHkUP2f1SHEqWPFOJ+NXvrQo4
	 fV9M+cxxy5ykvVlL+8H/+SxRxAf1U0ONE2W8iFu/rKuY/ivqLKHpNai4ykLAF5iujl
	 ugkbUzrYZVZRmbn0jcnanUlg7nq8gdEWVBeZXERU=
Date: Thu, 21 May 2026 10:38:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Elise Lennion <elise.lennion@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
Message-ID: <2026052158-willing-dreadful-857b@gregkh>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520180401.539215-3-grandmaster@al2klimov.de>

On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
> kstrtoint() returns "0 on success, -ERANGE on overflow
> and -EINVAL on parsing error". In contrast,
> manager_sysfs_remove_store() and manager_sysfs_dump_store()
> checked for 1 which always failed the operation. I fixed this.
> 
> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f9540c..581791d566e3 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num != 1)
> +	if (num != 0)

Doesn't checkpatch now complain about this?

>  		return -EINVAL;
>  
>  	num = gb_audio_manager_remove(id);
> @@ -65,7 +65,7 @@ static ssize_t manager_sysfs_dump_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num == 1) {
> +	if (num == 0) {

Same here.

thanks,

greg k-h
