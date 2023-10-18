Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7A8486;
	Wed, 18 Oct 2023 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V88jOWnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29228C433C7;
	Wed, 18 Oct 2023 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697614807;
	bh=52gu4uhHVMhD/2inO2iHCSdv7ffG5JVaRL7n7IKgzIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V88jOWnNtotfbOOgqvqTCotxydelHAlUUl284iLp88/HB+ldzp/8igPk2zTn2uCJ6
	 pEtR5S9WXCHXFS7kwze77ZrIdqmOkTdhgR3n1Sx5gO5BWdUwsw+frIuKCkyAwjofml
	 ihWQZxpS4J0heyaFv8GnMSjccVa8mQFvZWNiYwMY=
Date: Wed, 18 Oct 2023 09:40:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix coding style - remove CamelCasing
Message-ID: <2023101841-unglazed-hydration-d6b8@gregkh>
References: <ZS+HyqwvyVyfzGXs@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS+HyqwvyVyfzGXs@lab-ubuntu>

On Wed, Oct 18, 2023 at 10:22:50AM +0300, Calvince Otieno wrote:
> This patch addresses coding style errors identified by checkpatch. The
> changes include converting camel case names in constant variables to
> UPPERCASE. These changes align with the coding style guidelines.
> 
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/vme_user/vme.h        | 12 ++--
>  drivers/staging/vme_user/vme_fake.c   |  8 +--
>  drivers/staging/vme_user/vme_tsi148.c | 88 +++++++++++++--------------
>  3 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> index fbcbd0204453..0b40859fee23 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -33,13 +33,13 @@ enum vme_resource_type {
>  #define VME_SCT		0x1
>  #define VME_BLT		0x2
>  #define VME_MBLT	0x4
> -#define VME_2eVME	0x8
> -#define VME_2eSST	0x10
> -#define VME_2eSSTB	0x20
> +#define VME_2EVME	0x8
> +#define VME_2ESST	0x10
> +#define VME_2ESSTB	0x20

Checkpatch is wrong here, this should stay as-is.

thanks,

greg k-h
