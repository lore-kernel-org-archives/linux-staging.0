Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B46D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:10:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67AD3611EE;
	Wed,  7 Apr 2021 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617808230;
	bh=e/ixiZ4CCmjiK2gcpoNfqBHWtqlt72s+ixpj88qwYTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qy+RZI2LM1nQl0TAY6m1yni5i2fxpAQtOEZKksNAGsZzQuoRfRWSfUSy+jCP3MJcY
	 N4nucFyjzNnYiGCDDcJD4UB1hxvRJX75T7k4QMmKz2G8Wm+h3l1YyUTEZCyTrpuX85
	 eFbSwWMZq4Ow+ctOxn+LijRixgISicmdPN9ENTjw=
Date: Wed, 7 Apr 2021 17:10:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	"Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <YG3LY0hhDhzeXa1V@kroah.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>

On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
> The code under "drivers/staging/comedi/drivers/tests/" is built when the
> CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
> on the "make" command line since the option does not appear in the
> Kconfig files.
> 
> This patch series fixes a compilation error and various other niggles
> including checkpatch.pl stuff.
> 
> 1) staging: comedi: tests: ni_routes_test: Fix compilation error
> 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
> 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
> 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
> 5) staging: comedi: tests: Correct unittest_fptr

Should we move these to the normal kernel testing directory instead, so
that they do get some build testing?

thanks,

greg k-h
