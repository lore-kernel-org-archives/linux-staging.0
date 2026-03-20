Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A617A305;
	Fri, 20 Mar 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992176; cv=none; b=qzFo0cw5NvGbiCcVmXK5QF2SZKqy4XhEg+9gVdbgdNPxgRZewgQTN3KJpEE0wk2GH+p6uLFWY2BzWcpHpiG0YPw12uOaFejFMJyB+DHh1cp+AJphWvMM8PYtUPm+QphRgND44rJ5sAn9wl0srJrE8tN9sgt2q0HUujYWwPSWAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992176; c=relaxed/simple;
	bh=GtpoHNcGohtYk4SjvPTJEqUlGSfY9kQej46rZizsncA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUC7Le+XSLWZ50aEqNlKA5Ay2nfpyQbZyqIIZ3ggNsQbxyxtnRsjqT+98ZNQjE0xsL2Di2SD3MVSfRLqpPiHA3UXvwNyuiiCbpLr1SWUhCCeF9no2L9lriceaMvV8cUYPUtSwis944qd/pRQ9ZkmaRoXmy+/PAvwXetmCFDqpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tPdppn0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tPdppn0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A4C4CEF7;
	Fri, 20 Mar 2026 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773992175;
	bh=GtpoHNcGohtYk4SjvPTJEqUlGSfY9kQej46rZizsncA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPdppn0AUBaXI0AkMan84Qh25deoRoz8NNWPouoHKPWOZS3hP47EQ2tyjUcWPBOg/
	 8TFV2JANqIQ6WHkRhatL410q8kB1vAX8zJNzMf3AE/K9PbnkaT9WX/gmy0Q1NLcHQ7
	 1nJusaXKgp8W3ktubEwpXrr8L3wTyIjXgtGKXJkY=
Date: Fri, 20 Mar 2026 08:35:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH] staging: rtl8723bs: change error handling to use
 standard errno
Message-ID: <2026032020-captivity-overlying-adde@gregkh>
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320072951.54045-1-omer.e.idrissi@gmail.com>

On Fri, Mar 20, 2026 at 08:29:50AM +0100, Omer El Idrissi wrote:
> Replace non-standard return values with descriptive
> linux kernel error codes in probe path.
> Also replace the variable name 'status' with 'ret'
> to be more consistent with other kernel code
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++-------
>  1 file changed, 19 insertions(+), 11 deletions(-)

Your suject line is a bit odd, why two [PATCH] strings?

Also, you can use the full 72 columns in the changelog body.

thanks,

greg k-h
