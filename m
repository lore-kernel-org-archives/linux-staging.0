Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1672D063A;
	Mon, 23 Feb 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857809; cv=none; b=OSCcxKGv2gzuOKOiq/3pd1TZzUU3gRW0i6dTaB/KFi4qsRbEGUo3EgER3Ic027VDjCq59UzAqHrMJDj9hOFKKddydPpkXO64SFx1rYKpFevp9bntIErQwYXcHvv/jfDYcB5salEwKMnbC5s6nfFHvzG6+rgKoPvkmZNtvQiRNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857809; c=relaxed/simple;
	bh=PZUL+megGzeEcyPrl1AO6ng9llZVUQMp3AuVcgA9fHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuA15/Ktf8TqstpS0Z9LEOuDuHL6xvNWs/PbK8Vp69lo5vltIX06dT3b/3YO65bdVH5bYjnF4OkWt2jvCP0ERUk2ATi+6wL4Otwi0L4y+vEOQVtEu3HLDVElyPiK3quK75SkLvLxdkl8ttNx9w+at/S5sgbScpsSMkEfaGlz3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=APNuCNUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="APNuCNUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E829C116C6;
	Mon, 23 Feb 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771857809;
	bh=PZUL+megGzeEcyPrl1AO6ng9llZVUQMp3AuVcgA9fHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APNuCNUNwa1G89nsg3qI7hYklkjm7eJDEKHaHar7MObLm4e7Iyu3YbwzPr//KD5Ow
	 AZEulXXUM5T5Ovaz63z6dPk4323Rpifd/h9PdU6y/W0cGFsUMt2AApEbP3ZAJ30ZTd
	 nMGlznbBdWS+ST33seqxqxTb3tqMFoxFnp9QmGTQ=
Date: Mon, 23 Feb 2026 15:43:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: remove unused header includes
Message-ID: <2026022303-aspect-dandruff-8fcc@gregkh>
References: <20260214134008.21501-1-rajveer.chaudhari.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214134008.21501-1-rajveer.chaudhari.linux@gmail.com>

On Sat, Feb 14, 2026 at 07:10:08PM +0530, Rajveer Chaudhari wrote:
> Remove unused header includes from axis-fifo.c to
> reduce unnecessary dependencies and improve compilation time.
> 
> Replaced kernel.h include with container_of.h to directly
> include dependency instead of using it indirectly via kernel.h .
> 
> Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..c90bf2d841ce 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -14,7 +14,7 @@
>   * ----------------------------
>   */
>  
> -#include <linux/kernel.h>
> +#include <linux/container_of.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/wait.h>
> @@ -27,9 +27,6 @@
>  #include <linux/io.h>
>  #include <linux/moduleparam.h>
>  #include <linux/interrupt.h>
> -#include <linux/param.h>
> -#include <linux/fs.h>
> -#include <linux/types.h>
>  #include <linux/uaccess.h>
>  #include <linux/jiffies.h>
>  #include <linux/miscdevice.h>
> -- 
> 2.53.0
> 
> 

Does not apply to 7.0-rc1 :(
