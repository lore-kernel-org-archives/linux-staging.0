Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248D29CA
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 14:53:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B176E60E0B;
	Mon, 18 Oct 2021 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634568780;
	bh=/5CgXtVv/3GIxEMurkQWBSAadZn1nHoUiimdgKpASPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpYYBp1GTllaNTapDskkC4PLDgTlbUy2beQU4mnZxBj4GDt6a+N9E7K3dSKMNjY64
	 jPeZq2+do9gBuwXIIC2hFqFf0w5cuEB0CwwJ75kawPu2OPVgFmkqQg5ho+mP4EtSAj
	 0x0LRbOGhtx5WnitFu50UKrCmBAx8dqt5aeG0C5c=
Date: Mon, 18 Oct 2021 16:52:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: fix camelcase byData in card.c
Message-ID: <YW2KSVbZUhmcZu/P@kroah.com>
References: <20211018082042.15814-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018082042.15814-1-tomm.merciai@gmail.com>

On Mon, Oct 18, 2021 at 10:20:40AM +0200, Tommaso Merciai wrote:
> Replace camelcase variable byData in card.c

Replace it with what?

And why?

Please read the section entitled "The canonical patch format" in the
kernel file, Documentation/SubmittingPatches for what is needed in order
to properly describe the change.

thanks,

greg k-h
