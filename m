Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F0B2C80
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 19:50:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B76C60F36;
	Tue,  2 Nov 2021 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635882628;
	bh=1AN2XE0kzWSDxsvYW6TO4ghuQIr2nWEv1qaBJxXBLak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6tVW/E6nrAs+5qRyDx1DGuA/Q4YBA06jbBkDrNAkM/l/b9vNETTLgM5wacP/5DM4
	 2XehPIak964nG7Ef0+TwZK4zH6bUMt/cl1z2HaZxYsjC9gvHAAOedA1n4nkvgGlj9J
	 2eJ/9DTbSE29zk3N5FP3HrciyfYvmwqrKjC8hzQ4=
Date: Tue, 2 Nov 2021 20:50:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ankit Kumar Pandey <itsankitkp@gmail.com>
Cc: linux-kernel@vger.kernel.or, linux-staging@lists.linux.dev
Subject: Re: [PATCH] gdm724x: add SPDX License in gdm724x drivers
Message-ID: <YYGWgK59iafEHSbo@kroah.com>
References: <20211102185844.GA94400@ankit-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102185844.GA94400@ankit-pc>

On Wed, Nov 03, 2021 at 12:28:44AM +0530, Ankit Kumar Pandey wrote:
> This work ensure SPDX-License convention is followed. License is taken
> from file gdm_mux.c present in drivers/staging/gdm724x.
> 
> Signed-off-by: Ankit Kumar Pandey <itsankitkp@gmail.com>
> ---
>  drivers/staging/gdm724x/gdmulte.mod.c | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 drivers/staging/gdm724x/gdmulte.mod.c

Why are you adding this file to the kernel source tree?

