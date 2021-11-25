Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6832C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:41:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8178C6108F;
	Thu, 25 Nov 2021 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637858495;
	bh=8DqLv+OqtZUk1jp02ETyR1S9lJpF0HOuZitAup5P6no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QO305DD0iwziWMwFBnxVsAmK63WvSGTCReEa0eTQj9HQPd7pRjDOD43KHhxveybBH
	 BCBuWLjzOai/DLoZyFSJuXPNN/psFzgz2xheRdog0muLhgWK+A2QAfcQv5tgViYrvQ
	 xQJMn0CV1EBENWyuQ8Gizj+NQZAqZGLewgJtkkGU=
Date: Thu, 25 Nov 2021 17:41:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zameer Manji <zmanji@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unused hal fields
Message-ID: <YZ+8o591fl5uQ5dC@kroah.com>
References: <20211117142108.1505715-1-zmanji@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117142108.1505715-1-zmanji@gmail.com>

On Wed, Nov 17, 2021 at 02:20:20PM +0000, Zameer Manji wrote:
> Several HAL related fields are never used or are useless. This removes
> those fields and any code that is now safe to remove from the field
> deletion.
> 
> The fields that are referenced but are useless are:
> * interfaceIndex: only written to, never read.
> * CurrentCckTxPwrIdx: only written to, never read.
> * CurrentOfdm24GTxPwrIdx: only written to, never read.
> * CurrentBW2024GTxPwrIdx: only written to, never read.
> * CurrentBW4024GTxPwrIdx: only written to, never read.
> * bRDGEnable: never initialized, always false.

Please split this up into one-patch-per-thing, this is very hard to read
and verify that this is all correct when it is lumped together.

Make it a patch series and resend please.

thanks,

greg k-h
