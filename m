Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A85158535;
	Fri, 16 Jan 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568617; cv=none; b=GfjQXVB5zqYFunKElx2iYRpTKm26mbNywVxa0x7tpSTqYFZnWKS1XuSQ87O702aBmd6S7/F3WP0Y6rvkRqBT1p+apTHXyYRQpFkFAHVqgEgWyut1UfLy+yQWTyWLa/ehc1ST37XY+yK6LOc7JYtqx5gmSIQZ0bO7fZdJ0rN3Bww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568617; c=relaxed/simple;
	bh=g44M86cVtXQWXn1zi4e/AZuqxD0DS8FJUzBMYaZc06w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sahcPumaOy3SoCgHNmgMsSXMMt9enYVhB6BrCJ7CsnjPCCxfUEQWFcW9GBnCWxBVe0duwQ97Okj0U1mxgO2937C+4FmFCfLyF00CzaE5SsXb4fSpWwPTxGcKR6T+2zjnWZsgOhWeh6qmqGEgEwLRmbDYmQwGIKyRkbV5xWJ4SG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iqBWBX3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iqBWBX3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F49FC116C6;
	Fri, 16 Jan 2026 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568616;
	bh=g44M86cVtXQWXn1zi4e/AZuqxD0DS8FJUzBMYaZc06w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqBWBX3I7Ww/tRj98xrRsfc6yP9kecNgEr4/fo9/3tJInj3vQLL3c8SpvCGUtO5bx
	 H8ZuLQW+ztmKeR/5N+Us8yvXSnxDcsEF2HMzd2p1rggPa6C2WITRzAdA+jLhUH8L2Y
	 3gK04yHigLPbwJl1wlkSdbJQ/yQSCrrQlxIFWh2I=
Date: Fri, 16 Jan 2026 14:03:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] staging: rtl8723bs: Fix parenthesis and blank line
 issues in HalHWImg8723B_BB.c
Message-ID: <2026011649-dwelled-amplify-49b9@gregkh>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
 <20260112174227.14922-7-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112174227.14922-7-mahad.ibrahim.dev@gmail.com>

On Mon, Jan 12, 2026 at 10:42:23PM +0500, Mahad Ibrahim wrote:
> Fix checkpatch.pl checks regarding:
> - Fix line ending in '('
> - Remove multiple blank lines

That's 2 different things.  Sorry for being pedantic, but staging is
where people learn how to do this type of thing, please break this up
into multiple patches.

Note, you can do the same type of transformation on multiple files at
the same time, so maybe this series can be redone that way?

thanks,

greg k-h
