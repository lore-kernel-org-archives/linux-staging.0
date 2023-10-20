Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60587369
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 00:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="ai+92Zem"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-35748b32d73so998855ab.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 17:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1697760939; x=1698365739; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mavY78H1YWmzBveT0yeZCxcrcnmsQliTa1UnMt+0QL8=;
        b=ai+92Zembs+2JHsGr4750EDBY6rcagO2wdU2nYt5cFTEYJHVrdqCXTGmg6OZne7wCW
         qRULfBc0A2R0jMOqii6VY44+/T/BZDUd3FJXqWoOPNO/BTniWaQlUhPG2rMmrUlgu3au
         x7cxuLof20KszFLG8LsszCqcl3R4pR0lxaWO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697760939; x=1698365739;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mavY78H1YWmzBveT0yeZCxcrcnmsQliTa1UnMt+0QL8=;
        b=NKToTCwGPiTqMGEji7XxGmmw1x+FLfJcMHjuMYxC8nZiw0PDh+40nrVHerAqE4Woar
         kmutJKhu9MhP/CGaM4y6ElOth6JLgikldwShTf9GtDYpWTcTlfXSc7VUVm/YhnyB4v8v
         2jwQMkRkua1Qx5+qO4NAxBCyEyFkxpjqVcQRhcBqJ0Tj2Pln5FLortecHxXUU5MjO6Y1
         Zgp9AVHxd5natULbWLq+h7t2tfdO3ojeiu89psXe1Sfi2Pl4KbHLMi87SGP7VlrKVN6+
         gA0z97i+xmKKFyaDM8FRtKmelMQ81k/GlPsc1Tttct/GIRaUNeNA0nG8G14sBi38E0/S
         fp7Q==
X-Gm-Message-State: AOJu0YxkMQWR+i++STrDnuWmpwC9z3fBojgxu66ONnfjwKiBPTOxpNgq
	GyyaRF0HD5Ks24o3I6LtND4EGw==
X-Google-Smtp-Source: AGHT+IFTT8bntjPNn9KbYkuJLNM8Jou66TfYltHPkHiegMie47QbNKhG+fplwP3pmZrXUi1Ab1wcZw==
X-Received: by 2002:a92:c262:0:b0:351:19a4:8e67 with SMTP id h2-20020a92c262000000b0035119a48e67mr608835ild.28.1697760939322;
        Thu, 19 Oct 2023 17:15:39 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id 2-20020a056e0220c200b003512c3e8809sm226274ilq.71.2023.10.19.17.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 17:15:38 -0700 (PDT)
Message-ID: <e24e41be-b2c4-4bda-8a34-a628c55c4061@ieee.org>
Date: Thu, 19 Oct 2023 19:15:37 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Alignment should match open parenthesis
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231019213949.GA2922@ubuntu>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20231019213949.GA2922@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/23 4:39 PM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis

Sometimes checkpatch.pl warns about things that are not
really that important.  One class of this type of issue
is white space errors.

Yes, consistency is good, but the kernel simply doesn't
have universally consistent conventions, and I doubt
it ever will.  There might be times where a source file
consistently follows a white space convention that
differs from what checkpatch wants.  Suggesting a
wholesale change to that file to "fix" that typically
wouldn't be welcome.

Unfortunately without some experience it's hard to know
which checkpatch warnings can be safely ignored.  I would
place white space warnings at a lower priority for fixing
than some others.  For example, this is also a pretty
trivial warning:
   CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid 
precedence issues
And it is most likely not a problem in this case, but fixing
this type of warning is probably more constructive than
just adjusting white space.

I have no objection to your patch, and it's a fine way to
get some experience with the patch process, but I don't
think this particular change is necessary.

					-Alex

> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..405c8e78aa72 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   }
>   
>   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>   {
>   	unsigned int max_pkt_size = 0;
>   	unsigned int i;
> @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>    * Validate the stream configuration response verifying padding is correctly
>    * set and the returned number of streams is supported
>    */
> -static const int gb_camera_configure_streams_validate_response(
> -		struct gb_camera *gcam,
> +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
>   		struct gb_camera_configure_streams_response *resp,
>   		unsigned int nstreams)
>   {
> @@ -378,8 +377,8 @@ struct ap_csi_config_request {
>   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>   
>   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		struct gb_camera_csi_params *csi_params)
> +					   struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_csi_params *csi_params)
>   {
>   	struct ap_csi_config_request csi_cfg;
>   	struct gb_connection *conn;
> @@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
>   }
>   
>   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> -		unsigned int *flags, struct gb_camera_stream *streams,
> -		struct gb_camera_csi_params *csi_params)
> +					  unsigned int *flags,
> +					  struct gb_camera_stream *streams,
> +					  struct gb_camera_csi_params *csi_params)
>   {
>   	struct gb_camera *gcam = priv;
>   	struct gb_camera_stream_config *gb_streams;

