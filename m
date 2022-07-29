Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50FE4C67
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 15:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DABEC433C1;
	Fri, 29 Jul 2022 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659108967;
	bh=dc+Yq1KU2LevdXHCY6u4sGEuoDgnzP0NMKytWaNyyMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ev/fhjtfSa1TXvCqtpE5mVwsv7VgFjLuWQEk5xDO0/M+CjbMQ4hax4v2SOm5/fW+L
	 /aRCdmFSZ7/hAfn6szljNfpyKvz2bCVAC4T9tCaHT8rJwOif+uACq0PKObaUPS7wf/
	 uFB0iZxHp/CpX2xqj9Ajr+ulRt34cPuMS8M8hWqQ=
Date: Fri, 29 Jul 2022 17:36:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sidong Yang <realwakka@gmail.com>
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix wrong comment
Message-ID: <YuP+ZECjYV6KyFcB@kroah.com>
References: <20220729152554.8211-1-realwakka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729152554.8211-1-realwakka@gmail.com>

On Fri, Jul 29, 2022 at 04:25:54PM +0100, Sidong Yang wrote:
> The comment should describe the error when user calls rf69_write_fifo()
> not rf69_write_fifo().
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> ---
>  drivers/staging/pi433/rf69.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index 659c8c1b38fd..8c7fab6a46bb 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -816,7 +816,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
>  
>  	if (size > FIFO_SIZE) {
>  		dev_dbg(&spi->dev,
> -			"read fifo: passed in buffer bigger then internal buffer\n");
> +			"write fifo: passed in buffer bigger then internal buffer\n");

This is not a comment.
