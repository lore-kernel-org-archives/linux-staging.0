Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9472B9BB;
	Sun, 29 Dec 2024 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467745; cv=none; b=YMiLPfs/Kq1ymeTIyDzb72/xNSwCGED2vrx6cpuDhr1EKAbfEVNT3TOHasVUhW1nW9a81GVBuROhbgvLuFgbrvPbaKnN5fv+3NVW1yyiaON7Gy/7ZN2gQVUr3JTQc4t+7zMr+1n216mAm06eA/594CJh539XESX0unereIChj6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467745; c=relaxed/simple;
	bh=1cMlKpN7TQTyjNVM3gmLCjPg6wJdgM7RLIvixfpgwLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsEXmt4jYklNuAQt9iBWKWsuq4zP8cudATODHKQ17gDN8EkbqfOMjRx5v2+gFEdlO0TzSvKRuap8aIWHu8ehdFwnz8JeYFz4UQ3eUfP4R1OPXMA3E4YRZeox6svlaCI9xBhDW2lLMv+wIh4Hfc03uq+FdHInpRkVy88ITq1nOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qSLvMizD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qSLvMizD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1DEC4CED1;
	Sun, 29 Dec 2024 10:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735467744;
	bh=1cMlKpN7TQTyjNVM3gmLCjPg6wJdgM7RLIvixfpgwLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSLvMizDdGi8ExEDIiUS+IdxuK+0QqwZxQ7cfCzjn96/62L8OozEAEzZT+XbmDddo
	 AJWHEj0GgDjqO0MQk8WPx8Q2b5cimEmRLAjkSeddJ96hxjuam4z8b5/BQ0UYDKdYNR
	 /nv6JVg2xUQiNIcdhSHo969TvwAplQLZWAfhplzk=
Date: Sun, 29 Dec 2024 11:21:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix network selection in
 rtw_mlme.c (completing todo)
Message-ID: <2024122947-observant-nature-d4cf@gregkh>
References: <20241226130029.1394-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226130029.1394-1-evepolonium@gmail.com>

On Thu, Dec 26, 2024 at 06:30:24PM +0530, Atharva Tiwari wrote:
> this patch fixes the network selection logic to avoid selecting a network
> with the same ESSID as the olddest scanned network if it was scanned
> within the last 500 millisecounds
> 
> and please give a specific value for "new enough" on line 481,
> i have estimated 500 millisecound but inform me if the value
> needs to be changed

Why is this paragraph in a changelog?  How is that going to work?

> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
> Changes since v1:
> - Changed the "new enough" value from 1000 millisecounds to 500
> - fixed some styling issue

You sent 4 copies of this, on different days, so I have no idea what the
"correct" one is :(

Please fix this up and send a v3 showing what is different from previous
versions and only send one copy.

thanks,

greg k-h
