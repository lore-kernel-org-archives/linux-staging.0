Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84949659;
	Tue, 14 Apr 2026 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776140450; cv=none; b=LKsUKI+mck4ubokuMa2zwEsVO8wPMNJG4AayfW5Xn+Y2Poh6EzCemdhfJo0p7W4Svqx0ftGT7K07NgIUI9Nb3iKs6b+5URFVagmQiXeO1iQjoMyywjx3Xv3lWa4znuVD57jdCDUY6rot9TNNZ2QUGxYfiQhjG9XrOUAL7lKOmjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776140450; c=relaxed/simple;
	bh=6YpAVXPEgukebifR5vbGzim9Jr3Nza/14mgZOYim224=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaWHerOS6M46wma8u6vHs2tymdPxgG71f3IvBNiQvtpQ5+fx1BjFkRw4DYdGGlrbcFNZmYEDW4pnLyx5cgdQUfdvXyvo+H4QALodBvQxTe23S10Cr2H824xv8GL9eY6Q6PFQL1UAVFryIDI1/y5184GIAwQP6PY8OPGU5xl/XZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YBoGUokq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YBoGUokq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29474C19425;
	Tue, 14 Apr 2026 04:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776140449;
	bh=6YpAVXPEgukebifR5vbGzim9Jr3Nza/14mgZOYim224=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBoGUokqhfJnWHMgQrqcjkuAsRf//Xqd1fn3jSbBvz9xPvbPKucE+ba98z1xUmTmS
	 RZgDXTwusRkNufLPtt7a/6M9ocrQ9xDqGiKvv6k9MQS1VgZRWrR+tGpngwDKGrzvna
	 cd0JC0MXReGMt85ADMkZ1GAwROqdvRnpdp/8U2p4=
Date: Tue, 14 Apr 2026 06:20:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: deep@crimson.net.eu.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: move executive logic from arch/mips
Message-ID: <2026041458-unethical-apprehend-1492@gregkh>
References: <20260413230109.2014810-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413230109.2014810-1-deep@crimson.net.eu.org>

On Tue, Apr 14, 2026 at 01:01:09AM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

For obvious reasons, we can't take patches without any changelog text :(

>  108 files changed, 52564 insertions(+), 3179 deletions(-)

Did you really mean to make the driver so much bigger?

Please don't use AI to generate patches :(

thanks,

greg k-h
