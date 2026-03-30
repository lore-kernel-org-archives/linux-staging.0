Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6B36492D
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853840; cv=none; b=ecnPsYPJufdTa+qaGv44Qub9op/8x9Y5+nWfdBIM8LRMY0H0jQV4Et15vKZjPJr9rPwd9wyvh+qb6er/lt7N6+3wdHIu9THuzJRvrhy7BNXxxC8XxkEwRbnKiednrVPHrrYxYH8lyeA1YH/YybAAuxTmeqd6iSNhsE4rZVOnxws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853840; c=relaxed/simple;
	bh=Pm/Yurbmv03zpTpR/a5u3CsUGB2BYuA6KJR6Flu46lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qI/11ifZF+J3JdqtVK20ODsr7Ix5n+j6SUf3x14laERy7v2/nea7N/Rf/+Mi9si8UQG43FEpgIJlNIup5BCA4Sk0e+zbCjr3ixBCx4NPMyXwVYJna0V63MKnyQJBu0308u5gfgmpkO6bkG1b0eWu+Nq4fiIZZN+cvgImnG8kbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O5d9ZXGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O5d9ZXGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2CCC4CEF7;
	Mon, 30 Mar 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774853840;
	bh=Pm/Yurbmv03zpTpR/a5u3CsUGB2BYuA6KJR6Flu46lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5d9ZXGQkMGvoCBuQM0AAw9mUgSovaC1rPA3Lcps32ktDJkgtoy3VW7kRZ2/wh2XB
	 2aQLhoyLe5UuvfXQmszwo38luMuijP/3ic/Yi4Ftg3C9sg+WjinockBcl+nMvfUNH6
	 oxaDWDQne9C0P0GC94wYKIZ/5MQDsSzYiue9VFKw=
Date: Mon, 30 Mar 2026 08:57:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [GSoC 2026] Graduation of rtl8723bs from staging
Message-ID: <2026033054-chill-surfacing-2d50@gregkh>
References: <DHFWW14E4F08.WVUW4ELG1CZC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHFWW14E4F08.WVUW4ELG1CZC@gmail.com>

On Mon, Mar 30, 2026 at 01:43:48AM -0500, Ethan Tidmore wrote:
> Hi Greg,
> 
> I'm proposing a cleanup of the driver rtl8723bs to remove the HAL
> layers, dead code and to systematically fix style issues from within the
> driver. I believe this would be a "Large" GSoC project.

I believe that is an understatement :)

> This would be helpful to the maintainers/reviewers because lots of
> traffic comes in fixing minor issues with this driver, so if this driver
> cleaned up it definitely slow down the firehose of patches submitted.

If it is cleaned up properly, it would not be in staging at all, so yes,
the flow of patches would be less.  But that's not a reason to do this,
the real reason is to actually get the driver out of staging.

> If you approve of this proposal I get into much more detail in my actual
> PDF. Excited to hear your thoughts.

I think that to do this properly would require a lot of work, and would
be outside of the scope of a normal GSoC project.  I suggest you map it
out to try to come up with the required steps to prove (or disprove)
this :)

thanks,

greg k-h
