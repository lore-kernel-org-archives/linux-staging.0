Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581D17F9
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 08:14:46 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id y198so14844325vsy.10
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 01:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckeifvMgypYIXe2YgiWpWX4ERXd6JiyVbgZjkElUqkw=;
        b=bb7BiXkUvettQVFG2b2eBr0W/iV4goyxNm4XVLJaGy3HZvPh3RVrvIv2tWXYjmUMlh
         ZEvrUU9MpAmROK1hzjTHYtCU3uamFwmnMTfBh4Hoc8whz5qulNvW22QiiBV5aEVGE9T0
         2vQR/l09RmcwQnXTP0ipRtP3ovapuGXq8Nl5vn8KrPGTot22hASsXHcww6FEQeM4jZI8
         mkO5yAHAjNK0Gr6KNqLH0q6zQcZsnVFDSe3Wsv+CsIR3U6dNHs8yRlK/ZmGz5rwzCjBC
         UIJeWgmJI3dghIi9npT36UR17kA88DimcfHWkPsHOTF7fnb0qnozz+M+HX3yY30OHukQ
         OYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckeifvMgypYIXe2YgiWpWX4ERXd6JiyVbgZjkElUqkw=;
        b=CJjkIfpreaHFeHUCMUANK+J0rq1Mxf6F4AGiQ7sQbFkFTA5L6Glz0aIAz5pLJt4+Ej
         w9hNoPwEgYiriu3x5FHhcbjxe/8ogvKN25zrLQ0cKuuHhlUyp0RdVpTzyVGS0pUGfiYA
         FoSNpiFH3D9BqscpEgctUM0RykZy4eM0ug8t8x/szIuxBvnMsFeeImzJ+w3MNh73fMsB
         WA5U7wwYYXzXyeGz3hlbdPClyi4fkvClQQtwOR9tFJNJVjJxyCeFrNqBJztEP3zxxy75
         Mw75PG4rB//2M/Y48O3U4J6LUsYZW6c31sNmZoHtAdC6bk7J5ClaVap9EOv1TqiXNB0o
         wbAQ==
X-Gm-Message-State: AOAM531SANvvhdHOcBUPhQuYHzRvOQzuNmE8+uBvZqziqyxqFiqtzJBl
	jjvYZX/QGFZ4v8ZOo6ePfNh7DE3n6bwdKCvJzHY=
X-Google-Smtp-Source: ABdhPJxFQoIeG8FrbG0yH0KD2Y75ZKlCMCBW5Kpuo5y1CF1Sci0KcpcoTnZkk11mu+xEVVK3UFdPxQXu7KlppP2mTmU=
X-Received: by 2002:a67:fe12:0:b0:31b:9356:40fe with SMTP id
 l18-20020a67fe12000000b0031b935640femr8815628vsr.1.1648455285174; Mon, 28 Mar
 2022 01:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Mon, 28 Mar 2022 13:44:09 +0530
Message-ID: <CAAs364-MaXu5JevibWzV1GD1VN+XQPGT1uBUke3-9MfUq7iWQQ@mail.gmail.com>
Subject: Re: [PATCH] greybus: audio_codec: fix three missing initializers for data
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 27, 2022 at 11:31 AM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> These three bugs are here:
>         struct gbaudio_data_connection *data;
>
> If the list '&codec->module_list' is empty then the 'data' will
> keep unchanged. However, the 'data' is not initialized and filled
> with trash value. As a result, if the value is not NULL, the check
> 'if (!data) {' will always be false and never exit expectly.
>
> To fix these bug, just initialize 'data' with NULL.
>
> Cc: stable@vger.kernel.org
> Fixes: 6dd67645f22cf ("greybus: audio: Use single codec driver registration")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..939e05af4dcf 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -397,7 +397,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
>         u8 sig_bits, channels;
>         u32 format, rate;
>         struct gbaudio_module_info *module;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -498,7 +498,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  {
>         int ret;
>         struct gbaudio_module_info *module;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -562,7 +562,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>  static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>         int ret;
> -       struct gbaudio_data_connection *data;
> +       struct gbaudio_data_connection *data = NULL;
>         struct gbaudio_module_info *module;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> --
> 2.17.1
>
Thanks Xiaomeng for sharing the fix.

Reviewed by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
