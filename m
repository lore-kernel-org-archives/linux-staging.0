Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD336EAAD;
	Mon, 27 Apr 2026 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261894; cv=none; b=gTpkekVwxlegZTPeo+Ab3IEod96+nJJSPpfILiaNVqeKMg1uvTwF5vjys4DwHtnUlbn6g+rXK542HCC0UH3rDD0a2D7BlXlgxUv16kwopwHZ/nRu0piZLPI+GI9eM1NycmPGR5DmdBQFIfoskz/MOLpXZEQtVGlFHrjMaknvz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261894; c=relaxed/simple;
	bh=fRfZhfkQiDfIn3mkBKvfiuE0/FT5ZRdCqjXegsrgEM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLnIpgmB1s0ZJ6I8Qwq9KrgDPfuTVAG3UtcNhwaFJIlyTyec43gcW474QWp8T4Hp1qShcYp5D9Rxx3oczZClBJdgFVOx7t3JISfwPUEhzFP73z+KGK798DLRCYd3xiW7CXgIpLZ05sAa3YH0KsUmaPA1nmgyOvgBF3LQ/Kma/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mLW0tZGK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mLW0tZGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A094C2BCB7;
	Mon, 27 Apr 2026 03:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261894;
	bh=fRfZhfkQiDfIn3mkBKvfiuE0/FT5ZRdCqjXegsrgEM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLW0tZGKSrA66fq1pUaliKQCaUHUaKvxeeZyoOoDFM7+hwgOg+9ppg0Ptdw2TFSqP
	 4zSKzi521e2qaEitlgJUjzznxx9+pUKwT0KQnXoDYOMluDO9T5WyX7Pyoe68+1wgb+
	 H3Djkaz0LVXacAhJjuz9jN5O7/K68VomVK27M9nY=
Date: Sun, 26 Apr 2026 22:18:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiyuan Guo <tommyguo039@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	b9788213@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove GEN_CMD_CODE macro and
 callback array
Message-ID: <2026042658-lapping-uneaten-d7a4@gregkh>
References: <20260403005218.300096-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403005218.300096-1-tommyguo039@gmail.com>

On Thu, Apr 02, 2026 at 08:51:58PM -0400, Xiyuan Guo wrote:
> The GEN_CMD_CODE macro and the rtw_cmd_callback function pointer array
> add unnecessary layers of indirection and make the code difficult to
> follow. Remove the GEN_CMD_CODE macro and replace the function pointer
> array dispatcher in rtw_cmd_thread() with a direct switch statement.
> 
> Additionally, rename the associated command enums from CamelCase to
> UPPERCASE_SNAKE_CASE to comply with the standard Linux kernel coding
> style.
> 
> Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>

I like the idea, but this worries me as now you just dropped a bunch of
"unused" entries that kind of documented things.  Have you tested this
change on a device this driver controls to verify it still works?

thanks,

greg k-h
