Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0C70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 08:18:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9246A611C1;
	Wed, 21 Jul 2021 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626855534;
	bh=6F/Sr+tGeuAReYoA3DIB0nuRnQHk7E0lWp2ELe2fuEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGbu1xFER90n1Qw7tk33kEXRP0zerpZX9B3xKnUDegdaVXNRo9MGtBBl/weXxc5KE
	 j8UWhWvu0FgIDcC81CMm6RkXTFLr449osW1DgPE/sv3vIhTYsAL4bwEQ+8Li+XjJs7
	 W63FD+SuhWdGiA/NSC0X7cP/44uUDFglCOFxMAZ0=
Date: Wed, 21 Jul 2021 10:18:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: Remove no more used functions and
 variables
Message-ID: <YPfYa2P2WtHLxUc3@kroah.com>
References: <20210701164115.4288-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701164115.4288-1-fmdefrancesco@gmail.com>

On Thu, Jul 01, 2021 at 06:41:15PM +0200, Fabio M. De Francesco wrote:
> Remove the functions and variables from rtw_security.c that are no more
> necessary since the patch that replaces getcrc32() with crc32_le():
> https://lore.kernel.org/lkml/20210701133809.26534-1-fmdefrancesco@gmail.com/
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Please, apply after the above-mentioned patch to make the code build
> with no errors.

Does not apply to my tree :(
