Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431031A7F2;
	Sun, 11 Jan 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136659; cv=none; b=t8Ud0+hEQFnrHcmxP4PbsAdzwlJCJYwaq3tvTiUz/n7ApC8njyVNa7u7CuPFqxGApGOphQtHqgPkruAXsaBwax7ptb2VMWy1ATssfnCYJtRQugZk/HopMTk8IXTGAZwxNYDGKgG66cuGYSVJlB5phqxVka/x/r8c7u+vRzclghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136659; c=relaxed/simple;
	bh=nHy6WtyHcDhSAp1Cs34t8PfTWcJPE0iI2PjeNY40Mi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXW2uSl7iqB9cLSE6v+0mJTDw/wrIMqs79ZrV8y2F2Ir7WDyvBLxK1CnoWPZEULwckdlRYuggskSIQ0VBypiJ+uDFTHouhTcTfpogurGlDtN6Yk9q/R6Cg8KRY0ST1WUtquckfO8GEZErKxk5QOju3pm3VNN+aQm0nn4ygYpIfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G3NESEqd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G3NESEqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE37DC4CEF7;
	Sun, 11 Jan 2026 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136659;
	bh=nHy6WtyHcDhSAp1Cs34t8PfTWcJPE0iI2PjeNY40Mi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3NESEqdsoxbztz9GPFjFB0np8E/Ok/s99Jk0lo71W4QktSf4wrCEhoaew59h+81I
	 nkgSZqUMEtcGUhLZx4UzEgfqxUNo1cREND+5BfCFQfxBZJeHWaGS5VSri5mIdtyI7I
	 SRkZtr/rEN8cZx2/ZgNECMCcM484hpjVmM5MX3SA=
Date: Sun, 11 Jan 2026 14:04:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	guagua210311@qq.com
Subject: Re: [PATCH v5 1/3] rtl8723bs: io: Add independent
 rtw_check_continual_io_error function
Message-ID: <2026011156-progeny-ecard-4fc1@gregkh>
References: <20260111032136.7078-1-2023060904@ycu.edu.cn>
 <2048B07E5179CB78+20260111032136.7078-2-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2048B07E5179CB78+20260111032136.7078-2-2023060904@ycu.edu.cn>

On Sun, Jan 11, 2026 at 11:21:34AM +0800, 2023060904@ycu.edu.cn wrote:
> From: Changjun Zheng <2023060904@ycu.edu.cn>
> 
> Add a new function to check if the error count exceeds the MAX_CONTINUAL_IO_ERR
> threshold. This function follows the single responsibility principle and
> prepares for the subsequent removal of the global continual_io_error variable.
> 
> Signed-off-by: Changjun Zheng <2023060904@ycu.edu.cn>
> ---

This patch is corrupted and can not be applied:
	checking file drivers/staging/rtl8723bs/core/rtw_io.c
	patch: **** malformed patch at line 228: }

So something went wrong.

Also, make sure that each commit builds properly, I think this one will
break the build, right?

And finally, please use git send-email to send all of these out
together, your 0/3 email does not show up as properly threaded here.
See the result on lore.kernel.org as proof of that:
	https://lore.kernel.org/all/12B32ED3FD2801A5+20260111032136.7078-1-2023060904@ycu.edu.cn/

thanks,

greg k-h
