Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013F3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 16:25:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84A5B60560;
	Fri, 27 Aug 2021 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630081550;
	bh=Ao7M5CDIGfgWT4AvVe5ib8Z005rBiV82V/A70GFEIKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRBzDbnlpz0iU/UVn58DJd39gtDdv+/ODQ5OS6FYsjEkSbzNcyRz42bNBHifhLpEu
	 RpZN4bYwYzsQAhqPYJmzhYfihUnqjc1Isc1i6r3zBpB8dkL7AyKkXk0e8j+ISAGcqX
	 4KSix7/BrEHc0ucoFspMshpnr2ebgZYpUCEWFwOo=
Date: Fri, 27 Aug 2021 18:25:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: rtl8723bs: remove unused functions
Message-ID: <YSkSBy4iu3byyza/@kroah.com>
References: <cover.1630080164.git.hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1630080164.git.hello@bryanbrattlof.com>

On Fri, Aug 27, 2021 at 04:12:56PM +0000, Bryan Brattlof wrote:
> Changes in v3:
>  - Fix issue causing some emails to drop their In-Reply-To: header.
> 
>  (For the curious: NullMailer & my email provider where conspiring)

Did not quite work, see:
	https://lore.kernel.org/r/cover.1630080164.git.hello@bryanbrattlof.com
as proof that only this message, and 1/5 were linked together.

The other 4 were out on their own :(

Also, there was no "v3" in the subject line as the documentation asks
for :(

v4 please?

thanks,

greg k-h
