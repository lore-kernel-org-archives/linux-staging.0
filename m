Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA4C279DB7;
	Fri, 27 Feb 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171351; cv=none; b=DeK8EkgWa/kLUUTpw3dSx1W+2xDJk2ivuPuHpOWFk0QoGV0f0idZFZlzWA9D0K3RNcEOsFqGHASxzM9Bxu8HMvZzPbcDhclBfWlFHS/EX5K6g/mkLX6F34QUfEpbij7GdF0mK3fo+7vUteRPidseeZkg1nZVYt/mIVZVcf6leSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171351; c=relaxed/simple;
	bh=j9e246v3Ljy3YzgBZeTbu3l33ahzQ+c3oQNpKuUaO6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIFQtQhDt6feLlrz05lkmUembncozeLPxOfMFLg5QnnaUsqHS7Jmeb1S5JEp4WzSu4V2YvpohdOFmj6J9RHpO1XP8lEXn/cX+nrBZzQKTLZqbOjlcN8QB4KfLbyLCx/DWibHUfIcN3BqThp0tPxqomgOOX44XRobgRF6fTBNS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wbQqpxq8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wbQqpxq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23681C116C6;
	Fri, 27 Feb 2026 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772171351;
	bh=j9e246v3Ljy3YzgBZeTbu3l33ahzQ+c3oQNpKuUaO6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wbQqpxq8HS5hful3VQ5kb0Utwd7Li+ArsQ20MF/kIiqYw0AH7g7wVM1AM+hD4d9js
	 QkCeWz61hNjeENLAmunDPN3+fdd3gWqaQAqVJ8vCzA3hZxMQf1nbd52fhhBm+mNQar
	 k/iwVBFio24AO1s5EObNOZsLoPEEQd7RDh7XpJXM=
Date: Thu, 26 Feb 2026 21:49:03 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: techy-Nik <niktechgig@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove RTL8188E references
Message-ID: <2026022624-frighten-dyslexia-e685@gregkh>
References: <20260227054145.2261768-1-niktechgig@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227054145.2261768-1-niktechgig@gmail.com>

On Fri, Feb 27, 2026 at 12:41:45AM -0500, techy-Nik wrote:
> Remove all references to RTL8188E chip from the driver code.
> This includes renaming variables, deleting unused macros and
> struct members, and updating comments to reflect that this
> driver is specifically for RTL8723BS.
> 
> This addresses the TODO item to remove leftover code for
> other chips.
> 
> Signed-off-by: techy-Nik <niktechgig@gmail.com>
> ---


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
