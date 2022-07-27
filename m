Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B012A3D
	for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 06:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9DEC433C1;
	Wed, 27 Jul 2022 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658904063;
	bh=dT9PySUtedQZbXYkEvW3U83X64gVVqmDriSBOZXzJIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqy0WimsByLB63M5mVD7vfZplFEZjVLvcYPG80hAA1+e1vhJ8ta4/lj29ZEpgxsLc
	 PizQm5bbO/GTmMxI/ZnLR4Cub2tbdwOCy1DU0THjWS8kQJXrmh9ACmNihv0CrBzsF2
	 DFqgeApiU7SLol1zVNYrPhF/tmLP7cNQLhZe4GeU=
Date: Wed, 27 Jul 2022 08:41:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Strachuk <strochuk@ispras.ru>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] staging: rtl8723bs: remove useless comparison in
 _rtw_reg_apply_flags()
Message-ID: <YuDd/K5LSj1035pw@kroah.com>
References: <20220719155309.463286-1-strochuk@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719155309.463286-1-strochuk@ispras.ru>

On Tue, Jul 19, 2022 at 06:53:09PM +0300, Andrey Strachuk wrote:
> Local variable 'ch' is initialized by an address
> of field of ieee80211_supported_band structure, so it does
> not make sense to compare 'ch' with NULL.

Where is it initialized with an address?  You need to document this
here.

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

This is not a bug fix, but a code optimization, so no need for this
Fixes: tag.

thanks,

greg k-h
