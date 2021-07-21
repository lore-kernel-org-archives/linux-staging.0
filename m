Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9470
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 08:24:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4958D61019;
	Wed, 21 Jul 2021 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626855853;
	bh=XhnHeBoYkaCZCBf/RqL6mJUJh1G/RSkhLv1VfzoiC8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPbHPyVsKw2mKOAanYkc/POtAf6HlZetFN3+kzMKR8RpeJE63o57iKc6gCFGeU6u2
	 IOpE+uU/4M/eBSGkzMIv1MFUasJ6YfP9suwx8UhnimOsXOgceYMetNqnJluGbNhZ6n
	 RxCI9kvleKMcEG09EEyxkaVyCOqj4TpVXGKDDaSM=
Date: Wed, 21 Jul 2021 10:24:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, fabioaiuto83@gmail.com
Subject: Re: [PATCH v2] staging: rtl8188eu: Remove no more used functions and
 variables
Message-ID: <YPfZq8tIiIEI7uIb@kroah.com>
References: <20210713190358.11864-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713190358.11864-1-fmdefrancesco@gmail.com>

On Tue, Jul 13, 2021 at 09:03:58PM +0200, Fabio M. De Francesco wrote:
> Remove the functions and variables from rtw_security.c that are no more
> necessary since the patch that replaces getcrc32() with crc32_le():
> https://lore.kernel.org/lkml/20210713184629.7358-1-fmdefrancesco@gmail.com/

Can you send this as a patch series?

confused,

greg k-h
