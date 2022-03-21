Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376F29A4
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 18:38:46 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id v206so622597vsv.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2bACGeOCwnvZUjBmMkeAql3W9c1PsU+eEoImw6H0WE=;
        b=gvUzCFZWGuHWDVIr1L6Rk7VDWw6Q02bskZP1po8Vb3ZXg44MpD8su40Kk8PXf5gnZ0
         ZJj5jaK4VOcGU751sQjiaevPam+0kq33+g7Mrzp6KgDaqgy1aQeLZLVNrUFjWUFKUwGA
         EBERMr1zaSox8sEnCLA8nHbU3wWNlS0lTBXAyR3wWCSVwJ+9dcC+6xDFdKGEn88KpryH
         xm9RGBPaNqniBuiLmxlqaNkl2ms01cquWqlHUPb0zc64CxZ8oaFtLYYycQMvTvvukHOk
         zR3i5q+iKbSkzLwg1aw+j9GUqoUsa8wOmV1u8o3hA+mQY5nVnuDVqXNBt8Ie9DKfyLd8
         AnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2bACGeOCwnvZUjBmMkeAql3W9c1PsU+eEoImw6H0WE=;
        b=uWs8NisvnlJr5Ds91t88YTNsYfLSqIdCU0IDZ0nfkulU9oLq98ONU353f2Js0Pa6dI
         UJzc56EHTMGn2y8qdLwek6DFOlEwVdKFPYi33tGwqcsUnhTA1UBhMjngwDSt6Lcnmdcj
         POIUqwE6z4GfVOFx8MCO5CZKolNzdFizWTGAirBBa7gQmM1V2hWtf+Ra26F4xUfXHWlt
         soB3s3MiX/lA927GhA6LrG5c06LxlMtE7X2qW6viJ42JpRFx4IWXNhgC4Zali8GP83ut
         MEQXyPHijPMWOFYZbWvfbdEhCsIDbHar8HA6spvh5N/WkLf58d/YRdFkIBotoS0B0FGz
         VRtA==
X-Gm-Message-State: AOAM531A+PkfBuW8IJNFfM3MfxZo4GILgrObgeS8DcZY3KqEhReNriwV
	o5319/O1t7CVzQ6+NXamwbwgrlo3Jd+rnnY0lX8=
X-Google-Smtp-Source: ABdhPJy7nvHcZWKav0Rnnbh+UsUrB/8MI7Air5eUiET+wAuPr8sKptE3jfG0UtNLLDHjk41No4tIDuzDwdEIB9E60d8=
X-Received: by 2002:a05:6102:83c:b0:324:e435:eb01 with SMTP id
 k28-20020a056102083c00b00324e435eb01mr5273876vsb.13.1647887924960; Mon, 21
 Mar 2022 11:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220321123712.3068778-1-jakobkoschel@gmail.com>
In-Reply-To: <20220321123712.3068778-1-jakobkoschel@gmail.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 22 Mar 2022 00:08:07 +0530
Message-ID: <CAAs364-uRFrWbB4JmCZkRKeJ3+ejgrLJOY_OUM1h6r-JsDXBbA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: codecs: use dedicated list iterator variable
To: Jakob Koschel <jakobkoschel@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, linux-staging@lists.linux.dev, 
	Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, 
	"Bos, H.J." <h.j.bos@vu.nl>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 6:07 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> In preparation to limit the scope of the list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
>
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..a446d6455fbd 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -497,7 +497,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>                            struct snd_soc_dai *dai)
>  {
>         int ret;
> -       struct gbaudio_module_info *module;
> +       struct gbaudio_module_info *module = NULL, *iter;
>         struct gbaudio_data_connection *data;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
> @@ -511,11 +511,13 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
>                 return -ENODEV;
>         }
>
> -       list_for_each_entry(module, &codec->module_list, list) {
> +       list_for_each_entry(iter, &codec->module_list, list) {
>                 /* find the dai */
> -               data = find_data(module, dai->id);
> -               if (data)
> +               data = find_data(iter, dai->id);
> +               if (data) {
> +                       module = iter;
>                         break;
> +               }
>         }
>         if (!data) {
>                 dev_err(dai->dev, "DATA connection missing\n");
> @@ -563,7 +565,7 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>  {
>         int ret;
>         struct gbaudio_data_connection *data;
> -       struct gbaudio_module_info *module;
> +       struct gbaudio_module_info *module = NULL, *iter;
>         struct gb_bundle *bundle;
>         struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
>         struct gbaudio_stream_params *params;
> @@ -592,11 +594,13 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>                 return ret;
>         }
>
> -       list_for_each_entry(module, &codec->module_list, list) {
> +       list_for_each_entry(iter, &codec->module_list, list) {
>                 /* find the dai */
> -               data = find_data(module, dai->id);
> -               if (data)
> +               data = find_data(iter, dai->id);
> +               if (data) {
> +                       module = iter;
>                         break;
> +               }
>         }
>         if (!data) {
>                 dev_err(dai->dev, "%s:%s DATA connection missing\n",
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613

Thanks for sharing this patch Jakob.
Reviewed-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>

> --
> 2.25.1
>
