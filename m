Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386D70
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Kha/E3uhoOiUrD0C/aeRnYYOJ8L7PhbQTFEePWXTQ9o=; b=GiF2UwUHIZnHkEkOlcxLLgluR7
	syNox8h+RaBbuIUiOBghBF3CDGQNuaIbRzy7mWDoxwenL11iVarDDi6MmiRxTFuHb4kP13LZvn2f6
	35thsXdGlyCG8MGNauINAug1BzBEFT4pbD4wIwaSunIPgfbfA8chATkAqldy2DO/PybrFImdLg0wO
	mNCslbxOAuh01cjc+scg0jSBhcVB/IKtD58/f7a4sI5WIyiXdtrZHuStvqjyjgZ+eAffpU+zYNZVS
	Hu1zZPxQtOxOmhNtAXhJ8AFMfHi/hVJ78H7v36FIrf0oQO/kkb9wcbdYgR1IsDDx2zA9fDFxDwcsV
	kRF2tr4g==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lRzFU-006IH7-5h; Thu, 01 Apr 2021 15:28:46 +0000
Date: Thu, 1 Apr 2021 16:28:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: media: omap4iss: Ending
 line with argument
Message-ID: <20210401152844.GF351017@casper.infradead.org>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>

On Thu, Apr 01, 2021 at 04:07:38PM +0100, Beatriz Martins de Carvalho wrote:
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index dae9073e7d3c..e8f724dbf810 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>  	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>  		    ISS_HL_SYSCONFIG_SOFTRESET);
>  
> -	timeout = iss_poll_condition_timeout(
> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
> +							    1000, 10, 100);

This is not a readability improvment.  I would factor it out into its
own function.

