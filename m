Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F805C92
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 18:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63094C433D6;
	Fri,  9 Sep 2022 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662746590;
	bh=bQwRnD4uoR7miTObIoza35eZR6TgzD9lzCalStKcSl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsKTJb6OE8cnezYVusd+lWkGgVoJ8z+sAYkfLYTwON64B+I5lX+MDDri+LTLMPPER
	 BahO2HIzQMPo8nYnhkAe8Kuta6NH8YIQy8rI8DUa6zoUr5dpwTCquZTIYfEJwqhciP
	 nGHZ2f/+Nb9+a1vfmTR3ktIWMtdf+QZGlCu1AgcU=
Date: Fri, 9 Sep 2022 20:03:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/2] staging: vt6655: remove unnecessary volatile
 qualifier
Message-ID: <Yxt/3FOysEbwCm9T@kroah.com>
References: <cover.1662724786.git.namcaov@gmail.com>
 <c3a7d9963b1c38c5f493786d7268c430617412dd.1662724786.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3a7d9963b1c38c5f493786d7268c430617412dd.1662724786.git.namcaov@gmail.com>

On Fri, Sep 09, 2022 at 02:17:55PM +0200, Nam Cao wrote:
> Remove volatile qualifier for the member rd0 of struct vnt_rx_desc,
> because there is no reason it must be volatile.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  drivers/staging/vt6655/desc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/desc.h b/drivers/staging/vt6655/desc.h
> index 17a40c53b8ff..3f0f287b1693 100644
> --- a/drivers/staging/vt6655/desc.h
> +++ b/drivers/staging/vt6655/desc.h
> @@ -182,7 +182,7 @@ struct vnt_rdes1 {
>  
>  /* Rx descriptor*/
>  struct vnt_rx_desc {
> -	volatile struct vnt_rdes0 rd0;
> +	struct vnt_rdes0 rd0;

You can not just remove this without describing _WHY_ it is ok to do so.

Have you properly determined why it is, or is not, ok to use volatile
here?  And if so, why are you leaving:

>  	volatile struct vnt_rdes1 rd1;
>  	volatile __le32 buff_addr;
>  	volatile __le32 next_desc;

Those?

Please read up on why volatile almost never makes any sense in the
kernel (note, sometimes it does), and please write a better changelog
text for when you submit the next version of this patch series.

thanks,

greg k-h
