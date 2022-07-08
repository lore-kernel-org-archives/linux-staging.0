Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04816812
	for <linux-staging@lists.linux.dev>; Fri,  8 Jul 2022 12:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC65C341C0;
	Fri,  8 Jul 2022 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657283387;
	bh=J2yR9Su4m6O7NrdvjkRJUBFG1USSmR4vqERhi/9104k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2CbhAIJGF7ZRzfaUo0rj8P5FwqluJuH1MGFtXkkhPd9Z8q5aQloF7itNdp4LFZk59
	 psUt4qxglD+Keco4IzYurIl4QDSWzJ+KFxt0bzgD7eoJ3B0gQZT8kWX4mk/Xaep8id
	 VfDzBPz8giP+jIs4S+xURhXl+jwd2QVh7IHIW68A=
Date: Fri, 8 Jul 2022 14:29:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Joe Perches <joe@perches.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: vt6655: Use loop in
 vt6655_mac_write_bssid_addr
Message-ID: <YsgjOPUDDtD48tMO@kroah.com>
References: <cover.1657134099.git.philipp.g.hortmann@gmail.com>
 <b3b93ae7ce41562565e9007eb4580b9c47a2881f.1657134099.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b93ae7ce41562565e9007eb4580b9c47a2881f.1657134099.git.philipp.g.hortmann@gmail.com>

On Wed, Jul 06, 2022 at 09:19:01PM +0200, Philipp Hortmann wrote:
> Use loop in vt6655_mac_write_bssid_addr to avoid multiple
> similar statements.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> Code for testing:
> for (int i = 0; i < 6; i++){
> 	iowrite8(mac_addr[i], iobase + MAC_REG_BSSID0 + i);
> 	printk("i = %i\n", i);
> }
> 
> Log:
> [ 2592.189081] i = 0
> [ 2592.189083] i = 1
> [ 2592.189083] i = 2
> [ 2592.189084] i = 3
> [ 2592.189084] i = 4
> [ 2592.189085] i = 5
> ---
>  drivers/staging/vt6655/device_main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 298963cbca1d..099f0b95417a 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -192,12 +192,8 @@ device_set_options(struct vnt_private *priv)
>  static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr)
>  {
>  	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
> -	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);
> -	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);
> -	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);
> -	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);
> -	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);
> -	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);
> +	for (int i = 0; i < 6; i++)

Taking advantage of the new compiler level I see, nice :)

