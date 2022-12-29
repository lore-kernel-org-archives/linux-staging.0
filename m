Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5FE1389
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 07:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F94C433EF;
	Thu, 29 Dec 2022 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672298108;
	bh=2fA6Sq9NqC2aCmtbfFOV/twRnlM34/b9KZeZf/oWcfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJDXu41xL7mRYdMBfobooHtmmJ2gYf8/Kru3kwzywI9wnG2UMQ1WeNbF2RCuSzQGv
	 GAduGH14waQzESCerpa/uMKjeQPg5ttwnrGiNDEe2TIufyHKD1fZtFJpIwFmlcbW1V
	 A/fBnFmF6gAt99C3uxLMEgT9Y7fqTpEkGscWjGXk=
Date: Thu, 29 Dec 2022 08:14:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tanmay <007047221b@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: media: omap4iss: Fix null dereference
 for iss
Message-ID: <Y60+cx0Q+kdcfcWp@kroah.com>
References: <7f4fe87ef8a9995bc2c64bf2e5a03ef6948b8692.camel@gmail.com>
 <Y6y0r9fPnfWvwlua@pendragon.ideasonboard.com>
 <CAKKF0qA8oB7ZkkQ5-bj=66sP+WmjL6gUDV5EMTBM3SSW5_+qXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKF0qA8oB7ZkkQ5-bj=66sP+WmjL6gUDV5EMTBM3SSW5_+qXA@mail.gmail.com>

On Wed, Dec 28, 2022 at 11:19:54PM +0100, Tanmay wrote:
> Hi Laurent,
> 
> Thank you. I will take care of the wrapped lines. I haven't personally seen
> it return Null so yes
> in the best scenario it is a speculation but in the worst scenario it
> shouldn't hurt.

We do not add checks for when things are "impossible" to hit, otherwise
the kernel would be full of unneeded and useless checks everywhere.
Only test for things that can actually happen please.

thanks,

greg k-h
