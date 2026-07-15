Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F9136F427;
	Wed, 15 Jul 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124802; cv=none; b=Oa//AXPnD7eqDNdKKvLQx7HKChJuEqtnn+SdeopNdtRcXsGLCxgoMIGrH0qc3CAizV66LKAkh+Rfo6joLNKEe9KyeznfARCYiELo/iPzICeRP/GUt+aqiXY5lIw7nPmD8TNmZTA0ShYaT7yRZLmtkVXZyZ5ToZMmVLqZ7VjHC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124802; c=relaxed/simple;
	bh=IOnpMwml4645KaUv2srDYKpKDZbxosXaVn4vRYAhYiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrR8PTWkQGMSDAyfFgxJeKawai6/KRnR2SwYqSGJZm390bhmF/DNGjXrbkcM0wnLlf2y1h21/uNmMfdOY6upMmfKslLXgbdbA/vnN3/9GJdt21CXJz3NICMUtQgXgGkqN+1OpYE7urbhvyZ0rH7YQpwnGEqb3CdIC78OZY1uHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cmXMukeX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cmXMukeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB571F000E9;
	Wed, 15 Jul 2026 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784124799;
	bh=vOrCvdwb3d/k84l35UCEy2bee2iSYOHc96HkTyrpcx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmXMukeXxz3YID3Egr8JjAr4JMT7L22lgoNWv3t417vBf/MIkrBSmmBjLa2rUOys7
	 o4m9XvPzDX0faa9NQgOkg0th+YeZPTne7srzVhBvTj/+8RjnUliEeXwpZ5sJLEbi8j
	 RLG/0ERW52lH/l2xLstW/EwLuH0PPMShLWEECV74=
Date: Wed, 15 Jul 2026 16:13:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arsenii Pashchenko <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove redundant
 ReadChipVersion8723B wrapper
Message-ID: <2026071546-commodore-mobility-c2bc@gregkh>
References: <20260713035156.144502-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713035156.144502-1-ulijg308@gmail.com>

On Mon, Jul 13, 2026 at 10:51:56AM +0700, Arsenii Pashchenko wrote:
> Collapse the static CamelCase helper function ReadChipVersion8723B()
> directly into the main rtl8723b_read_chip_version() function.
> This removes unnecessary code nesting and cleans up the CamelCase
> naming violation in a single atomic change.
> 
> Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
> ---
> Changes in v3:
>   - Merged the previous 2-patch series into a single patch as suggested
>     by Nikolay. Completely removed the redundant helper instead of
>     renaming it with '__' prefixes.
> 
> Changes in v2:
>   - Resent the series due to submission issues with v1 (no code changes).
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

The versioning goes below the --- line that is in the diff, don't create
a new one please.

Perhaps use a tool like `b4` to handle this all for you?

thanks,

greg k-h
