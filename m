Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B036EA9E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261893; cv=none; b=rYDAGnqwGlSRKtIa/t8THTCeML1+3IwR4alAPang+IpjkUv9oB5RLmQGHuxKMrdy6NtqiuHff+7LSagqeF6eZwDGxr/F/0zDB4i69CXmivYyIdeLjOXPyewW+DiTNGIIXOyjxgG+NfYcoaFla5+xJFUz2pcIoFK0CzZ93KqcTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261893; c=relaxed/simple;
	bh=4TgZPmbvD+KFDs4uKDxmewp4YL1uykRlbdErztWjmpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb5j6iwganVyNkKpjO6aFK3aKLcoylwNw+d3P3v2p27HqTgbw9ngEdyR7b8fBdwDxINzUgkg/8GH63ui8uiWPmk1e/ceFkWbbiJP7zzjbDB0dOk8nEPvZ+HnlmeWSfYnhj6wop/u42Qf0+ek3RwQ1SVh60HHNiSGrfMQRGyAIbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EEOZ3wqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EEOZ3wqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC766C19425;
	Mon, 27 Apr 2026 03:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261893;
	bh=4TgZPmbvD+KFDs4uKDxmewp4YL1uykRlbdErztWjmpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEOZ3wqV71Vzg9vU7CMECMvA9j2IZbnZdYmqOBcz5ucRV9ieuIc+0OuxfJCsuF0Oh
	 eshnvkeRESlmHUMGJAUSTBDM6I/plU0muJfbUe2ZKuvzGyqR/07hRwgAmwKPFOSvqK
	 yaxaoFPeX4F7QC41QK0Jg+G7/WT3VVa8yqDoZHt0=
Date: Sun, 26 Apr 2026 22:16:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 3/3] staging: rtl8723bs: cleanup if-statements
 formatting
Message-ID: <2026042600-skillet-grew-18d1@gregkh>
References: <20260421220058.29317-1-khomenkov@mailbox.org>
 <20260421220058.29317-4-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421220058.29317-4-khomenkov@mailbox.org>

On Wed, Apr 22, 2026 at 01:00:58AM +0300, Andrei Khomenkov wrote:
> Fix if-statements formatting to improve code readability
> and conform to the Linux kernel coding style. This fixes
> the following checkpatch.pl issues:
> 
> - LONG_LINE: wrap lines exceeding 100 characters.
> - LOGICAL_CONTINUATIONS: move logical operators to the previous line.
> - PARENTHESIS_ALIGNMENT: fix alignment of continued conditions.
> - BRACES: remove redundant curly braces for single-statement blocks.

Shouldn't this be at least 4 different patches?

thanks,

greg k-h
