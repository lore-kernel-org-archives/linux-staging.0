Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA696D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 06:24:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A953610CF;
	Thu,  8 Apr 2021 06:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617863093;
	bh=sjxX9tCZgh/Blz8cOgBNQ0zrgLRPpvtKQKsvkokDa+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmahgufK5maORTGIza2vLT0hMnIbROyczIFMOJNODaNaADo654CQQHB69gYa91mfy
	 8rpoCvMzQKNrDsmSdif9p3nsX1ZSekbx/x+KEx+Krf8acX5Nj+5HuOBn6QNGQi0rMy
	 yybXmYKjwqxlzn1UEo23h9Yl1dtddBE0VSnrxVJs=
Date: Thu, 8 Apr 2021 08:24:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3] staging: rtl8723bs: hal: Remove
 camelcase in sdio_ops.c
Message-ID: <YG6hsvA54ieV6ujj@kroah.com>
References: <20210407181914.7079-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407181914.7079-1-fmdefrancesco@gmail.com>

On Wed, Apr 07, 2021 at 08:19:14PM +0200, Fabio M. De Francesco wrote:
> Changes from v2: Remove unnecessary comment. Shortened a function name.
> Changes from v1: No changes to the code but only to the subject for the
> purpose to differentiate this patch because other removes of camelcase
> have been made in other files of the same directory.

The "changes" need to go below the --- line, not here in the changelog
text.

thanks,

greg k-h
