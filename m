Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA98358203
	for <linux-staging@lists.linux.dev>; Sun, 28 Jul 2024 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722196561; cv=none; b=OV/QwxH86hqNxqTM1dnTo10yuXeJ4CPEf3K36JT27oDQFwa2hObvMdE85WxhJv37wZXyWlIfeaxvf4ULgl8EwKUSIrOKjUwLu/eGA6rS/bzuQTicBG43dQwk4T6nfMVAUCq+XOIHziGLAmduJIyv7epfxutjDsicrQZUx4y6JLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722196561; c=relaxed/simple;
	bh=22pWZ/TaV3wpWoMdbQ0VIkGMfKePfnDCHQ1Yktf0FEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWtS8aKZ1iBGDDXyhivJwRa9rw32hDoziDLZblOYfNOTX/YlfRRSDgWyn13bxjFKdK/qjug6hijruEzCDiaCzHvrwQmEZB/fLDuyzBsxr4Quv+5zmU/s0QuZLRGWuElp93Ucew0+XInPU8ay6DFaq7AX4fkjG9gWfqidW0DqyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw6LzSzO; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw6LzSzO"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7093d565310so2067913a34.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Jul 2024 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722196559; x=1722801359; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQELjj/ebXwfVulzjoY3Mdj90GTfwybyPt8ZIbx2dBo=;
        b=Dw6LzSzOaDc3YCRrr0A/7u01WC4t058sjedpxvleA2gFY183xd4sXZk/yyMxHZF1Pm
         dzE9i2cJc6lT32ewC2KZqxWeLyc0BPMH3WENOs+RQpmmmXMDM6X1XHs39aAXWwCB/+L8
         33s/wg5j+ViqwV5K21BOGYqSREvng6lY3+ftFWhQbLI1SXycvNZ3bMnpbXFwXQKkZB9f
         qkzRa5rpMm9eJFU+N4e4aG2HclKit0+2uCJ8eBu6sHrH1Pt20Mn4u9N9rumU/7BGvD4W
         3pvEWDazD/79hCjc+1I7J4NW1SW5bVlFSecA2DnT+vuGxYkPZK1HndGOP8D8TDV3ehQK
         ID7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722196559; x=1722801359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQELjj/ebXwfVulzjoY3Mdj90GTfwybyPt8ZIbx2dBo=;
        b=fRHoqjPtP5aXCQcNtuYm8Hf/AfmEDyUsC9Nb7jVEmA/XyLg7K3rSBcvApJY6kriSSz
         D5cXGIqpXgeNMZcUUF5SQTEKIKk5e+GTsRbHgMa+c8JXLzo/Xmk9fSv0U152vwG/k5kf
         /0F15ummLZlrkJpx3ZN8VwMS9Y/UZBzUrpDAVanOrjJnRallMaK3Djh9pupYUtQ1o/bl
         Yk7hNg0CIZigv7cxrz1Nbr204R6+YgtcKKWZ3LWlhcSHu++GzO/j25uGBKccYfdU22RH
         aHHRgcUYBXAxEaeXGpeTj9UXdYMlLwPAJXLgw8pika1qi/Yka/wTr/V/5J+mNgWmtge4
         htWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEDN/MU62l39TscQ005eoftN0Zb7qbMnNyY63IuR8k290N5Xh6XnsUBSTxL2FOpRcqYkKKW2ScU73yt+bSTfkHtG31XoOyXIqG1nEvAg==
X-Gm-Message-State: AOJu0Yz5gU2ixMhqJjWD/1ZNhmCx2weVwnJUP1lluSY57l7Amf9g6rCV
	Xclzt0uZIYyKVbTTcYxMm5olwmqdtnr6t7gRATVjKXMOzmDNnVkS
X-Google-Smtp-Source: AGHT+IGN37hUcxL473FOIlK8k66DsTHmzqi6xtzIiVec6+/+1PpeCzyrj/uI8qAQ+TFaDHdBThmxHg==
X-Received: by 2002:a05:6830:65c1:b0:709:4bc5:a016 with SMTP id 46e09a7af769-7094bc5a406mr3099581a34.25.1722196558894;
        Sun, 28 Jul 2024 12:55:58 -0700 (PDT)
Received: from joaog-nb (189-18-172-64.dsl.telesp.net.br. [189.18.172.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28de71a1sm7003007a91.41.2024.07.28.12.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 12:55:58 -0700 (PDT)
Date: Sun, 28 Jul 2024 16:55:50 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: nuno.sa@analog.com
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ramona Gradinariu <ramona.gradinariu@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Haibo Chen <haibo.chen@nxp.com>,
	Michal Simek <michal.simek@amd.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 13/23] iio: adc: ti-ads1119: make use of
 iio_get_masklength()
Message-ID: <20240728195550.3iujiagxnmccybt5@joaog-nb>
References: <20240726-dev-iio-masklength-private3-v1-0-82913fc0fb87@analog.com>
 <20240726-dev-iio-masklength-private3-v1-13-82913fc0fb87@analog.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726-dev-iio-masklength-private3-v1-13-82913fc0fb87@analog.com>

On Fri, Jul 26, 2024 at 10:23:05AM +0200, Nuno Sa via B4 Relay wrote:
> From: Nuno Sa <nuno.sa@analog.com>
> 
> Use iio_get_masklength() to access '.masklength' so it can be annotated
> as __private when there are no more direct users of it.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/adc/ti-ads1119.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
> index 630f5d5f9a60..44d9f69c9df3 100644
> --- a/drivers/iio/adc/ti-ads1119.c
> +++ b/drivers/iio/adc/ti-ads1119.c
> @@ -435,7 +435,7 @@ static int ads1119_triggered_buffer_preenable(struct iio_dev *indio_dev)
>  	int ret;
>  
>  	index = find_first_bit(indio_dev->active_scan_mask,
> -			       indio_dev->masklength);
> +			       iio_get_masklength(indio_dev));
>  
>  	ret = ads1119_set_conv_mode(st, true);
>  	if (ret)
> @@ -508,7 +508,7 @@ static irqreturn_t ads1119_trigger_handler(int irq, void *private)
>  
>  	if (!iio_trigger_using_own(indio_dev)) {
>  		index = find_first_bit(indio_dev->active_scan_mask,
> -				       indio_dev->masklength);
> +				       iio_get_masklength(indio_dev));
>  
>  		ret = ads1119_poll_data_ready(st, &indio_dev->channels[index]);
>  		if (ret) {
> 
> -- 
> 2.45.2
> 
>

Reviewed-by: João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com>

Best Regards,
João Paulo
