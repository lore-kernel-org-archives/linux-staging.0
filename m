Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBB3C555B;
	Fri, 17 Jul 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291034; cv=none; b=TWFbIztsqHhp8cChppDFKixG4oAIpbayL/8juG+QaTlj11a/1V5QeqAK+qsh/E1RGRy4yvEo4Y9b25nQNkgC1pdO1ZaoCYf2JpsyS26HnbamiosAMhxK7GjJZOx+85VhO3JjlgWusenUD/TIsbSCivB4phR6hJ6eBJMh8U2v+f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291034; c=relaxed/simple;
	bh=k6mlgVIoqBDyXwwnPpzNCedkwdmHr8sLn3svj5g8fjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciXODe6JprJATew87TDYmC603vIt4r0KbJaw0WHa4tkzXT4SCcNhnIjaN444I0U0XAgY7nq+Qy/rgRhZ16CRT3VF1P/wN45vl+pU6damnxCCFqAea/ovyCWodsdFFL70hQhCZD+bfCzBxhGKGnsSUhd6EuJuFR43kRp6ZqDeSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BU9RgBs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BU9RgBs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AE31F000E9;
	Fri, 17 Jul 2026 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784291032;
	bh=ChL3l74cZcedKaM7tZuw+dVPZB3KNOmjdTARynDUfVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BU9RgBs3A8Nr/o+PrhLgQk+7gvqOaZbNLn8nZ2uyoZejlbaENWq+aE4ER0oLpm6j6
	 97o4grxNqWU/KqyPIVTWfMBpM8v2gfV0DwvmfU3dT0DT0FiTvzYdkqto8bxDZxrlu8
	 jS/rbTe4RDuea51/e+Y0zGHstyiZmHf/X7nAxTQg=
Date: Fri, 17 Jul 2026 14:23:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename MACREG macros to snake_case
Message-ID: <2026071727-amused-scandal-9bd5@gregkh>
References: <20260712132026.8836-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712132026.8836-1-bohdandmarcus@gmail.com>

On Sun, Jul 12, 2026 at 04:20:26PM +0300, Bohdan D. Marcus wrote:
> Fix checkpatch.pl warnings regarding CamelCase naming:
> CHECK: Avoid CamelCase: <_Read_MACREG>
> CHECK: Avoid CamelCase: <_Write_MACREG>
> 
> Rename _Read_MACREG and _Write_MACREG to read_macreg and
> write_macreg respectively to comply with the Linux kernel
> coding style.
> 
> Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 4 ++--
>  drivers/staging/rtl8723bs/include/rtw_cmd.h      | 4 ++--
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b932670f5..f3b8a2bdf 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -11,8 +11,8 @@
>  #include <linux/delay.h>
>  
>  static struct _cmd_callback rtw_cmd_callback[] = {
> -	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
> -	{GEN_CMD_CODE(_Write_MACREG), NULL},
> +	{GEN_CMD_CODE(read_macreg), NULL}, /*0*/
> +	{GEN_CMD_CODE(write_macreg), NULL},

Why just these 2?  Why not make a patch series to fix up all of these,
one patch per name?

thanks,
greg k-h
