Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2B2F2A
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 13:29:36 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id o10so8297074qkg.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=4GhGoUc/c11sseBRYQgnSGHSukX7xuuq//IPBzW+/F3ULsPiwfAXs/iPbJ2EpckRc6
         mzAS19V+zo/+vlD/Ole7qsvK6uHUe5Vlddpkz20LDNIbKPchqKPErG445oXCSeUEJ3nR
         Y93rF0TEX3mMjgsypXRO4FCc/MMX+bOfzy09qeAXdVv1ZGOMobYHWLpcQg3HYvO6/TMq
         Xx9DPu5l8RnrOKl5oFNxmeie0IHYsXiQ6ePF8GCOi5Zubof5UemFP4bWtt2lRpngB7NN
         3iqHa+dEEBnh9Pg/DFZ8iNRZC4bTy7fQ1A6ojRaT7PlRvaioiTe2YQdvZa2OFzCZswit
         fv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=G3v4dPad07WrjRZHLL1ExVtZMIqsgRT4Yg8WKp7Smuipl6Li0j/cOWD8FGaOjwPQFT
         EAUkFhF4LIxvu7Bi+CnL+Seiob7XdHkNa/YYwjjRLjN3KUm9XGkyoJgPo9SVJG/ewg+1
         vVcCuip6erOtwBPu5ljZ1dF9/DAEtCGmFFImFAwhEm+3fEZbf2eH+x1eVZq1eiTt1N4Z
         e9AzLahDW3p7rLZuaRxC5GveZwM0pkA8cBtpTKmHDYigIF1Y31vwNqic73BLtn1TNwha
         tQ9Zu1WI8rBbDoDFg2N/2kuv9jnAud5brUPIl0fCOvqIptVQgb/lpJwKpCNZjFM4l79b
         ppzA==
X-Gm-Message-State: AOAM531EUDwphYdc4Eat1uS9KuraELtVjm6lAz8AW5OGF0qvmFtSQPAf
	6JpeFamPiuohCncHr1Vufy6P+Q==
X-Google-Smtp-Source: ABdhPJx3tflCKvRAYZjABa3eTJaLgwV9YMRtRuFiWIDpJpG/kVVAP086Nrm+UHeTe0IgS1KD4BQHlw==
X-Received: by 2002:a05:620a:ced:: with SMTP id c13mr693431qkj.636.1644586175987;
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h6sm11294073qkk.14.2022.02.11.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Message-ID: <d986ab76a7c52a9a2ce62c1edb07f520c9df51c4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: v4l2-ctrls: Add new
 V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Feb 2022 08:29:33 -0500
In-Reply-To: <20220207141937.13089-2-digetx@gmail.com>
References: <20220207141937.13089-1-digetx@gmail.com>
	 <20220207141937.13089-2-digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 07 février 2022 à 17:19 +0300, Dmitry Osipenko a écrit :
> Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags that are needed by
> NVIDIA Tegra video decoder. Userspace will have to set these flags in
> accordance to the type of a decoded frame.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Can you share here (out of commit) a userland implementation that was used to
demonstrate the new API ? It does not matter which project (GStreamer, FFMPEG,
Chromium, your_test_progtram). Should be fairly straightforward. This is just to
be transparent.

>  .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst   | 6 ++++++
>  include/uapi/linux/v4l2-controls.h                          | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index cc080c4257d0..f87584ad90ba 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -616,6 +616,12 @@ Stateless Codec Control ID
>      * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
>        - 0x00000004
>        -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
> +      - 0x00000008
> +      -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
> +      - 0x00000010
> +      -
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c8e0f84d204d..e3d48d571062 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1563,6 +1563,8 @@ struct v4l2_h264_dpb_entry {
>  #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
>  #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
>  #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
> +#define V4L2_H264_DECODE_PARAM_FLAG_PFRAME		0x08
> +#define V4L2_H264_DECODE_PARAM_FLAG_BFRAME		0x10
>  
>  #define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
>  /**

Please update the doc too, see:
  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst:

