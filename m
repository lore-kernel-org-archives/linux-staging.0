Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0547F
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LPgHqoFy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE5CC43140;
	Thu,  5 Oct 2023 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696492538;
	bh=7xOGM03y69uffWbZv9bkXu3YfXv+0u6k/RTRiM3+i6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPgHqoFyx5SNfutFWp96HsUtfj/gqhRJQwubvYxCDpMuMUMQHtEetE7iksY84tgOC
	 GRZ4mOhG44IZpRcTmAsL3MYkCQuFx+opZ42F9Wel4h2/lg528cTx1vsIMSIjV9vnxz
	 rXiXtFFTQ91qDLNJIC2AaTOw2YkM6XFw0cFgOZcc=
Date: Thu, 5 Oct 2023 09:55:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8192e: renamed (3) variables
Message-ID: <2023100529-mounting-sandpaper-5fe2@gregkh>
References: <20230928000225.27912-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928000225.27912-1-garyrookard@fastmail.org>

On Wed, Sep 27, 2023 at 08:02:25PM -0400, Gary Rookard wrote:
> This patch renames the vaiable in staging/rtl8192e

You did not rename a variable.

> HTUpdateDefaultSetting -> ht_update_default_setting

That is only one rename, not 3.

> in (3) files of rtl8192e:
> 1) rtl819x_HTProc.c
> 2) rtllib.h
> 3) rtllib_module.c
> 
> Linux Kernel Coding Style "cleanup", no change in runtime,
> staging/rtl8192e builds before and after.

I can not parse these lines :(

Please read the documentation for how to write a good changelog subject
and text, that's one of the most important parts of getting a kernel
change accepted.

thanks,

greg k-h
