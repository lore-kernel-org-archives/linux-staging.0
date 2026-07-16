Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80514F112;
	Thu, 16 Jul 2026 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177144; cv=none; b=eSzTE8eil126ol/8G0qFOpxVovU36jO1M3cjwbmgv9/5zWGumo/sfsn6VNB1DTzn0Cp8N/m9egnsw6okncC/KEivRI0gZjXXZWqr2kZdHIfI0Ut5F0iuHpaG7fjAOKVJTlVomLqIL6C+32WE7RnVQ5HLT1mnY0j+Th0ivn+/5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177144; c=relaxed/simple;
	bh=C9CAHtHYTccJtbFHNTUrxXQBkuxRuSYl9tg9NXizbw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcnpfHQiPJSp7xab4FRqEi/VctfjJY2GIR5QenqI25l+J9THHHpO9WyciRanJdRqzr9W+nnsojP0l9hD1m+dozKyirH2RSgbUGmf1czA5n3yPFaLP7I9HD5ce7JJrBGTG8O6vS4H/ea/NzlWcrg1j3Nz/S6z9Qu3w9i/pNd4fPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BgbWvr2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BgbWvr2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476071F000E9;
	Thu, 16 Jul 2026 04:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784177142;
	bh=pjmg5hv07OwtsQn7Fg26EjlXn4/Nf0Q4xHrDPulmU34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BgbWvr2V+U4+o0nNtGVX3I3U6/1dNs/t3vS7mOebTf5wfkNuxV45Tzm6cxs1rT7iE
	 SMB+zUZPEQU7kHJhqU5iZ2Mdry6yD1yfezNK6mR5y2Uqc1ZD2KBKgYbCmB37bS7emR
	 Utia5K58hcpwO/SR3qJTVFM2Ue3WHNo7CjXDACyw=
Date: Thu, 16 Jul 2026 06:45:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?0JDRgNGB0LXQvdC40Lkg0J/QsNGJ0LXQvdC60L4=?= <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/61] staging: rtl8723bs: monolithic HAL cleanup and tx
 power limit fix
Message-ID: <2026071631-twerp-charity-583a@gregkh>
References: <20260715124829.90290-1-ulijg308@gmail.com>
 <2026071541-spindle-voicing-fd97@gregkh>
 <CALVCEwZvMMOWi5D92UNbrE28Bxxxa5vNagxoFo2iOBCxpdUZ-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALVCEwZvMMOWi5D92UNbrE28Bxxxa5vNagxoFo2iOBCxpdUZ-w@mail.gmail.com>

On Thu, Jul 16, 2026 at 11:03:59AM +0700, Арсений Пащенко wrote:
> Hi Greg,
> 
> Thank you for the feedback, and I apologize for the messy submission.
> 
> To be completely transparent: I used an LLM to brainstorm refactoring
> ideas, draft some of the verbose commit messages, and assist with
> migrating the custom CMAC logic by proposing to replace the driver's
> custom function with rtw_bip_cmac() using the kernel Crypto API.
> However, all the standard cleanups—such as removing legacy wrappers,
> dead code, and empty stubs—were executed and verified manually.

Then as per our documentation, you needed to say that in the patches
with an Assisted-by line.

Again, this is NOT how to learn how to do kernel development, nor what
the drivers/staging/ tree is here for.  Please learn how to do it on
your own _first_, so that you don't submit obviously-wrong patches like
the first patch in your series was.  LLMs are great
fuzzy-pattern-matching tools, but you have to manually check them as it
is you who is putting your name and being responsible for the
submission, not a tool.

good luck,

greg k-h
