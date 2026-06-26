Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A63EFFC5
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782494951; cv=none; b=G0SEdvNn02BO/tgLCA1bH5SLtLmiaAN47tXgUXvOjPdAeJJujJmy9x0EO5XM0MXCAurVp4RK0MRmQwyfuOOMD60nrpozFSXcG7fWw3GV8aEohHRzdiZzmhXMO5nA0/4tgriGBJDK12gYgCcQr/1/7u+DbGYeWpW8Lf1ocQshkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782494951; c=relaxed/simple;
	bh=bmnqIteIrsdazyLdwoN0OJVJpD3EaqY64A0zc/yqpkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENkuMh99CotjDnG1zKScTgZiNH8GRqbmvV15y9knKYl/6TGQs22F5if1SlqvaB6DSBBoILZGGh6/5gb+RYyiLoNnNnj2aspY41RjZY22PpaSOmDi6EO5YqEq86xQlEdGk/PWvMsEuT3OFh2Xk5cCNVYQO86T05+4pEQJ/n7e+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ/4pSSa; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ/4pSSa"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e943356247so949801a34.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782494949; x=1783099749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=BQ/4pSSa+bQrBAesMtScGOe8SIpqrRpXSZMFWx4tPRxbukxeD+F2AlnR6FBndEDozO
         tCdb3JRr0DDlumDIW6JF8WVh7S+et8C6PDo70HuaQ4N8EmzyX/MEZZjQx06lv8ZZ4ys5
         fS3st0ZemLD5vcgGWUuhnp/SpzuzSQLtwrrYqgsn/ilQh1QLTdawIkmwWl6YR93MIWb+
         hEJe/Lzf7+zFYUhtYxYlsuKyjcwJFmYEsOjWvypS8rV4RxJKhDeLMDYgasyNy+dPqWVY
         h/3waislIXjHCdJ+Z0wmH3UgZYmhvWJ8BzebSvespoooTu3dl0ocNXJvOTNkvLur+LaD
         VDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782494949; x=1783099749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/VSPjiBxVWzwoGtJrzRhtH5hK8hWcYXUpH5mPgMo2s=;
        b=MvCIoYlu9gsx7u8Cgkxzq/i9AVKP7q91ijC1ztOG9v1Za+gCbmEn4SX0P2t+qYsTMe
         9qi4c7qsueRmpSUMTCilFVEwhJbv4bP0ZD7q+XcutYFa/1cw7KMi71cI58/TufrgSl/k
         XdPtPMx/a5KxjpshC0A+74uvGEmog+29KKvZ04BGN19hDM/x358mFKZSiEqWpy7QnjEO
         2jQiScG+SOGS37ys19bhNnqNpN8r3q6zJf8iAaxEljlbqHFLCzdCOpSOLE1taCQFlqTl
         sZJpvsxfSx+dmJJHajx72H9jS8UhQ08Meh6QUsRQXJFW2lIIYV/rppEk3q57rX8vKQ+7
         njwg==
X-Forwarded-Encrypted: i=1; AFNElJ9ArajlEqqBi9iNxx+xmdgwYw4+ONTZHf+tuEIvUGxhE5/O+f2CeLrEMe3feNIRjXDtC1Y6Tf8zqz0SG6vI@lists.linux.dev
X-Gm-Message-State: AOJu0YwTCAKeLsaGkxuNn/oAxGDv9uJotX3KZ8HZsXgZ+iAl6e2MgHDM
	EUZ6efg9ZWN57+/df9oFLC9Q3rsVOS8xcf+5eIyrtuRmAAAmXO5x+yrjKi0UfhQt
X-Gm-Gg: AfdE7cnTk3NE8Ut7WPhHHsQVr/Ptsl044geXDrkVtS2tffOawvOoHoTB0QzUjOt2XKq
	3ThDfwA6JlKaqIz2H8rP8LPn2U3Tes3wkxIUOfEZKzu6v2GDlr/wLSJhIFI/fG7iWXDGU+7tIl/
	Q0ZF5oqj4EEuaBAiWIKmvzhrJdMEI19Zc48BXirgHPU4BiDJl8Xr0x9+XEnMfzr5aKI3QPl4KHr
	Zv6oVuvpaCNq9BSg3OszqkpQUVE7NSgsDE+Wr8SmvWiVqMvyo2tUmlpin+CquwhG60PySZfyRWU
	FuBXmmU4+WnESyLLfrT8a86GLsn5f+otAXTSN04u/YrWAiP4WF9ZXxgeKYL+jBqoqxNJ3G5BGCI
	HPlBPwDJlFaZ/mZcet3E1sVrfBOzizw+W8JHfHhQ/8ggkBtZlEEwc3oxNmBUrK+RoOW75crA1Ln
	12p1rX
X-Received: by 2002:a05:6830:8291:b0:7e6:ed97:ce5a with SMTP id 46e09a7af769-7e99c2ec47cmr6930978a34.4.1782494948915;
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa78751fsm2063757a34.13.2026.06.26.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:29:08 -0700 (PDT)
Date: Fri, 26 Jun 2026 20:29:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in
 codec_vp9_rm_noshow_frame()
Message-ID: <aj623aQRkNiVdrnM@stanley.mountain>
References: <20260626164025.52694-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626164025.52694-1-doruk@0sec.ai>

On Fri, Jun 26, 2026 at 06:40:25PM +0200, Doruk Tan Ozturk wrote:
> codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
> ref_frames_list without excluding vp9->prev_frame. When the previously
> decoded frame was a non-show (alt-ref) frame and the current frame is a
> non-show inter frame, the freed object is the one vp9->prev_frame still
> points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
> (use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.
> 
> The sibling cleanup codec_vp9_show_frame() already guards this pointer
> (tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
> Add it.
> 
> The fields that drive this path (show_frame, frame_type, intra_only) are
> parsed from the VP9 bitstream, so a crafted stream fed to the stateless
> decoder can trigger the free-then-use.
> 
> Found by static analysis; not yet runtime-reproduced (Amlogic Meson
> hardware required).
> 
> Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
> 
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
>  drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
> index 8e80ecf84..572f418c9 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
>  		if (tmp->show)
>  			continue;
>  
> +		/*
> +		 * prev_frame is still referenced by the MV predictor in
> +		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
> +		 * already excludes it before freeing. Do the same here to avoid
> +		 * a use-after-free of vp9->prev_frame.
> +		 */
> +		if (tmp == vp9->prev_frame)
> +			continue;

I have not looked at this code before so I'm speaking from a position
of ignorance but codec_vp9_show_frame() checks vp9->cur_frame as well.
Shouldn't we check that here as well?

regards,
dan carpenter

