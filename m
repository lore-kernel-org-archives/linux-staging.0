Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2793DBD68;
	Tue, 31 Mar 2026 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946477; cv=none; b=q5rZcQVjda4XtU09aR1gbEY3vym7P4WO09xqD1gIMNwPXYGRauKvRcqB1jzOHnZMggN4UZ3uUMTmsu78JJ0qsAfH0oCcu4u09Ju2xF09c4z+myW89QtUsOicAljygEwacrXMuWAl+3bdUu9U1fZ7CEVr1kE10H4pgakX4OWsGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946477; c=relaxed/simple;
	bh=Ow5QtkdCrVhkI6Uzpc3MlefHztnz+NI76TC2hUeZo1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5JxtVfsJskYcyo7tUjUe+W2BaSfI3SCDB/AP0bADLpNWALybGffg3zlX3aMCKNpXCVaSib/eoUu0CUPdX+uPFeKaZIdltZaFYLyyEw4aVBtdkanliKZ1MLOSI5gEuYzpYODMnsEgtgSzsi+fdEJwSt6prSA682IoBHSo2myr0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WqCS7bS2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WqCS7bS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD69DC19423;
	Tue, 31 Mar 2026 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946477;
	bh=Ow5QtkdCrVhkI6Uzpc3MlefHztnz+NI76TC2hUeZo1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqCS7bS2m1sxzz0iFJYvY1t575acYvJ592Opl/aBNE0rhqQbUi3hgoRokZH/q3fSf
	 IzjpnogoCXGoY3tSKWvUG42JnY/AniQDoEl0PE7/a5Nop/R+4JE3oyAG63URk9FHCK
	 uFdZaCeFdn+5zAaFgG2PrfAEReplQxkqMtEq9MQU=
Date: Tue, 31 Mar 2026 10:41:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiyuan Guo <tommyguo039@gmail.com>
Cc: error27@gmail.com, b9788213@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix CamelCase warning for
 READ_MACREG
Message-ID: <2026033156-resale-pug-5aae@gregkh>
References: <20260331043954.5400-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331043954.5400-1-tommyguo039@gmail.com>

On Tue, Mar 31, 2026 at 12:39:54AM -0400, Xiyuan Guo wrote:
> Rename the _Read_MACREG macro to READ_MACREG to resolve the checkpatch.pl
> "Avoid CamelCase" warning. This aligns the macro naming with the kernel
> coding style guidelines.
> 
> Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
> ---
> Changes in v3:
>   - Dropped unrelated whitespace modifications caught by maintainers.
>   - Rebased onto staging-next.
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index c1185c25ed36..eb902c810ac8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -11,7 +11,7 @@
>  #include <linux/delay.h>
>  
>  static struct _cmd_callback rtw_cmd_callback[] = {
> -	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
> +	{GEN_CMD_CODE(READ_MACREG), NULL}, /*0*/

Ok, but now what does the result look like?  You are creating a function
name called cmdREAD_MACREG(), is that intended?

That's why those leading '_' characters are there.

How about unwinding this mess of function pointers and #defines
entirely?  It's not needed and is just yet-another layer of indirection
in this driver that needs to be removed.

thanks,

greg k-h
