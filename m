Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA93E367F5F;
	Thu, 30 Apr 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570721; cv=none; b=n/m2QiGHn28LcZobMW2Hj70vI1PyRTbdeC4wXlazZA5ILsgh+3vCLeqO4itxf8xWAWjHxoTQ02nV9Dt/Xg+9Awne7wYvgsGfjhQJd1ZLWF2hcBOkLIxg2YMH2yzdEOVX8+cpI8UWYwsxLfJlzIRTNjgZMDCY/F/7hXGzVcZSNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570721; c=relaxed/simple;
	bh=923a2egtDJu6jEiVI1Ruyt3NpWqkf4XXra7/T2Ccwb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAbHfkjP/K8+smqeQlGf20NtTTm1tChX/bcLMtzdt/Dsdar8WfyqlheOabW8AnmxLCQWtg5wgY9LKkXn9D9M4BzHuir+CN4Ib9yzd+pgLxzpPjsmXGzRBdZ38ogVdo1rBamb1ZkDpEdcsh8FpnNdAG3o4OLsibIvV7Qan4Zk5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LICY1UDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LICY1UDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D8C2BCB8;
	Thu, 30 Apr 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777570721;
	bh=923a2egtDJu6jEiVI1Ruyt3NpWqkf4XXra7/T2Ccwb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LICY1UDKTj3pkbxBgfgdE4FGyda2itYJUdjuiA0wkg87NGE/2Lx8iWxSRS5RSw6Ll
	 Wh5yehv0ta0L1UBBeFVHdTXSvlnTpGTu5/+lzg6NvZjWmnOILYcMItwtU52YGB75Bk
	 8uwOh6346bQydjOq7CDVQUGfezloRVy0l5R6cPts=
Date: Thu, 30 Apr 2026 19:38:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bentley Blacketer <sonionwhat@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: bootrom: replace dev_info with
 dev_dbg for firmware name
Message-ID: <2026043002-dinghy-carefully-d8d2@gregkh>
References: <20260430173045.4619-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430173045.4619-1-sonionwhat@gmail.com>

On Thu, Apr 30, 2026 at 01:30:45PM -0400, Bentley Blacketer wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.
> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> Signed-off-by: Bentley Blacketer <sonionwhat@gmail.com>

Why twice?

> ---
>  drivers/staging/greybus/bootrom.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

No list of what changed from previous versions?

> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..058044ba7 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  	 *
>  	 * XXX Name it properly..
>  	 */
> -	snprintf(firmware_name, sizeof(firmware_name),
> +snprintf(firmware_name, sizeof(firmware_name),


Why this change?

Please always run your patches through checkpatch.pl before sending them
out.

thanks,

greg k-h
