Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B002588
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 13:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0CCC433B5;
	Thu,  8 Dec 2022 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670505482;
	bh=truX/ZpVDN5TEyfVc1MtGApLFXGe2FYCr1TxAk3v3y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzAM4QkBdlhqOplnoC2ZXv7FeAjhwCpyTGiEeGzQhO68EWJRQYC+t82eY26tfdCGk
	 xg9NfzKr0VtiVZ2u9y5wu66EWrwaCQQdMExbE/h//UwnagWvWIskXgOAnI/GTf3cef
	 u6DzvRhXQuuaKU6JkBBg8TuPq1A2hAzacN4jOZy8=
Date: Thu, 8 Dec 2022 14:17:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matt Jan <zoo868e@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <Y5HkBnptiY06DtRL@kroah.com>
References: <20221208103813.GA100066@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208103813.GA100066@zoo868e>

On Thu, Dec 08, 2022 at 06:38:13PM +0800, Matt Jan wrote:
> Add a space around the "*" at vme_bridge.h to clear up a checkpatch
> check.
> 
> Signed-off-by: Matt Jan <zoo868e@gmail.com>
> ---
>  drivers/staging/vme_user/vme_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index 0bbefe9851d7..e17a8f7de165 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -4,7 +4,7 @@
>  
>  #include "vme.h"
>  
> -#define VME_CRCSR_BUF_SIZE (508*1024)
> +#define VME_CRCSR_BUF_SIZE (508 * 1024)
>  /*
>   * Resource structures
>   */
> -- 
> 2.25.1
> v2: Resend the correct patch set, noted by Greg Kroah-Hartmamn <gregkh@linuxfoundation.org>

This "v2" stuff goes below the "---" line, not down here below the patch
itself.

Also this series is not properly threaded at all, please use 'git
send-email' to do so so that our tools will properly pick up the whole
thread, and not just individual emails.

Can you fix this all up and send a v3 please?

thanks,

greg k-h
