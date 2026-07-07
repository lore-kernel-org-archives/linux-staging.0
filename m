Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334A39A801;
	Tue,  7 Jul 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417910; cv=none; b=aIFPZF2+6p9lwjnY78GB0ts5KGEv3gCVHlpjn04Ig5ly2yrtXOWCur6MTvnf3EkhPirHrlZDYSF+vg8y1sCmxlEBX7SIX0qlj5bsvwr24QFXRPZY5eMfW5TWt/bSZVo9pY4Ukx0ZqJo0vc+5mWEmhpJRlkDrKp2+Yjf2SeUIYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417910; c=relaxed/simple;
	bh=Ep6DILMPlvE9Ew+RTsxDQ8OdX2a+vTgf5PDYETxkhFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs+2KkkgAHkrJdLwE2rE7bxxMZWV51atd9EpTQPLWUCi3G2eTuDdW8ggUtKxwLjdrwsPSk2NJl6IOMxYYhXmFh6AwknPtwGR65tfObJwOKoNuWEF1D2+Clr5/bIkYALwsf1wbR+G1LjsIc/WPtfg8Q+xXc0JyF+yzkljAEqT4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Q8vUilZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Q8vUilZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4D1F000E9;
	Tue,  7 Jul 2026 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783417908;
	bh=IEVmKGkknPew8ln0QDROHZ//ygDA1UTkIXzPxQG/bRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2Q8vUilZBXE+kJGkqw0fHggjxhWfBQjqlgG4C/U6X5swtTyrNxSUhU7vf0aSO2A2W
	 wDnVMUJQJcoXNhEIb1fsMb81GGr1+v+2tsGJJquldJ/7bfGqSfrp3+negz5EaQW9CS
	 KjN2Z6CN3rE9sGlhmM84lzTu7YT6cDsWzfqnZqqg=
Date: Tue, 7 Jul 2026 11:51:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiyuan Guo <tommyguo039@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	b9788213@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: remove GEN_CMD_CODE macro and
 callback array
Message-ID: <2026070716-tapeless-slacks-0bb2@gregkh>
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
> ---
> Change in v3:
> - Dropped unrelated whitespace cleanup on the #endif comment.

No longer applies to the tree :(

Also, I'd really like this to be tested on real hardware as you are
doing a lot of changes that are not necessarily just "coding style"
issues.

thanks,
greg k-h
