Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962517AB8
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 12:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23921C433C8;
	Wed,  9 Aug 2023 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691583688;
	bh=lxZkcW9VfEj3r2MbCwShiHqYNarVQxG41BuXDQ8GgCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nz30+GzhOTK9fL0ZJ4cTrBOZFLpZ3sdqUgow83Xco/6qcAjpScI44oujP/EGDCoOK
	 XmpeKrDlZl9R9qbM4g+JiMlU4HuoWQ8mAj007vCUnbmbLznXwt6xJgqlSiqyzh7f9g
	 VZD0jKqzQwv+NRSVcmaTbh1CdgVFCcONJiiTS8dM=
Date: Wed, 9 Aug 2023 14:21:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
Message-ID: <2023080952-maroon-waviness-9621@gregkh>
References: <20230805075114.15186-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230805075114.15186-1-straube.linux@gmail.com>

On Sat, Aug 05, 2023 at 09:51:14AM +0200, Michael Straube wrote:
> Replace strncpy with strscpy in two places where the destination buffer
> should be NUL-terminated. Found by checkpatch.
> 
> WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90

If a global search/replace could be done, it would have happend a long
time ago.

How was this tested?  The functions work differently, are you sure there
is no change in functionality here?

thanks,

greg k-h
