Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8577A;
	Sun, 29 May 2022 06:40:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id y13so15569552eje.2;
        Sat, 28 May 2022 23:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oONO6WQdQgiLZe2yfgF19dnfhBaN0Q0QQXJTQuPSQa8=;
        b=WizP0tOLHFY2yYYJCUAc+dzaT/eZPmgMpaFlUYgvZAMBFE/p0Iquf/FGynlmmRkOjt
         3+AR2mjyEt/qwhUwIq7q/6+xvi6BytIzDWrBg5mQb6oj24pdk5OX+x6j6bn3Pd6CAgER
         L8sIoMSJyH9wAtf17fer0voGdtRUbEm6Byd3wiB6zVVHIDL02lJ9HtAJdQq3rG5gFzZT
         PuYfvWcc5VTN5PT3GMtaLzKTHNsvOld5+vqVGabqgdPJa03VZHXzx7tRPLCF0tlV6mXb
         E+/ug4zfhyi5dL+ane1xbUBKF39AAfLZ9PhFKvkKK6FhzaYKiQ6VKBXGs0kcKycZ2oRd
         dByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oONO6WQdQgiLZe2yfgF19dnfhBaN0Q0QQXJTQuPSQa8=;
        b=akq7Wu3d9i2vtoCZ1VeNRwPDsDMtl35k2vsvuTKB+4Jq5DBRtD1lRG/HYC7lynx6lC
         2bxOLNKGS6wuq6FxVftwF/Z4weL87tITW5TXNz2iYJsEkNiVmzH840wjnMkQ71hzDFdG
         fv1HfJrOLx2HwczMN+eEmnbPU5F/waXHDFPkLZR+IvgiCkbMMsLyjrabAoOHpwakL8HR
         Zw/Lzyzs7xBTK1NLjs/hBzof4v9QW+efuch3nl8iYg5/CDFbZyw/rd+RK2ltrqnCf3EP
         scp/nQC5SKjqjvLoL0qvWh1K/FM0HO+UFjh4UvNoe9F0uuM5J2dF7jb1GfOFwts8e19S
         EYmg==
X-Gm-Message-State: AOAM533kcu02pndItHfy0kMi+rpdvcwFxKgz1JTvLXExRrPJefsX2S7E
	aEShmw6CPQ4+8lSvRgUfLn8=
X-Google-Smtp-Source: ABdhPJwQZX9JGZTHf0Ls6o78Dj++YxB0y0nggFjPkGyaUDGcMUrkrEdxaFhvrLzEpGC8rcKttE/1MA==
X-Received: by 2002:a17:907:8a16:b0:6ff:794c:c368 with SMTP id sc22-20020a1709078a1600b006ff794cc368mr123709ejc.673.1653806422012;
        Sat, 28 May 2022 23:40:22 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id a21-20020a50f0d5000000b0042dce73168csm301350edm.13.2022.05.28.23.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 23:40:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, hverkuil@xs4all.nl, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, samuel@sholland.org, nicolas.dufresne@collabora.com, andrzej.p@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v6 11/17] media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
Date: Sun, 29 May 2022 08:40:19 +0200
Message-ID: <2102641.irdbgypaU6@kista>
In-Reply-To: <20220527143134.3360174-12-benjamin.gaignard@collabora.com>
References: <20220527143134.3360174-1-benjamin.gaignard@collabora.com> <20220527143134.3360174-12-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

This series looks very good and I plan to test it shortly on Cedrus, but I 
have one major concern below.

Dne petek, 27. maj 2022 ob 16:31:28 CEST je Benjamin Gaignard napisal(a):
> The number of 'entry point offset' can be very variable.
> Instead of using a large static array define a v4l2 dynamic array
> of U32 (V4L2_CTRL_TYPE_U32).
> The number of entry point offsets is reported by the elems field
> and in struct v4l2_ctrl_hevc_slice_params.num_entry_point_offsets
> field.

Slice control by itself is variable length array, so you would actually need 
2D variable array for entry points which is not supported. However, easy 
workaround for that is to flatten 2D array to 1D and either have another slice 
control field which would tell first entry point index for convenience or let 
driver calculate it by adding up all num_entry_point_offsets of previous 
slices.

Hans, what do you think?

Note, it seems that H265 decoding on Cedrus still works without entry points, 
so this problem can be solved later. I'm not sure what we lose with that but 
it was suggested that this could influence speed or error resilience or both. 
However, I think we're close to solve it, so I'd like to do that now.

Best regards,
Jernej

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c             |  5 +++++
>  include/media/hevc-ctrls.h                            |  5 ++++-
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 0796b1563daa..05228e280f66 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3010,6 +3010,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - __u32
>        - ``data_bit_offset``
>        - Offset (in bits) to the video data in the current slice data.
> +    * - __u32
> +      - ``num_entry_point_offsets``
> +      - Specifies the number of entry point offset syntax elements in the 
slice header.
>      * - __u8
>        - ``nal_unit_type``
>        - Specifies the coding type of the slice (B, P or I).
> @@ -3150,6 +3153,14 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>  
>      \normalsize
>  
> +``V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (integer)``
> +    Specifies entry point offsets in bytes.
> +    This control is a dynamically sized array. The number of entry point
> +    offsets is reported by the ``elems`` field.
> +    This bitstream parameter is defined according to :ref:`hevc`.
> +    They are described in section 7.4.7.1 "General slice segment header
> +    semantics" of the specification.
> +
>  ``V4L2_CID_STATELESS_HEVC_SCALING_MATRIX (struct)``
>      Specifies the HEVC scaling matrix parameters used for the scaling 
process
>      for transform coefficients.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-
core/v4l2-ctrls-defs.c
> index d594efbcbb93..e22921e7ea61 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1188,6 +1188,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return 
"HEVC Decode Parameters";
>  	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return 
"HEVC Decode Mode";
>  	case V4L2_CID_STATELESS_HEVC_START_CODE:		return 
"HEVC Start Code";
> +	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return 
"HEVC Entry Point Offsets";
>  
>  	/* Colorimetry controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! 
*/
> @@ -1518,6 +1519,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum 
v4l2_ctrl_type *type,
>  	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
>  		break;
> +	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:
> +		*type = V4L2_CTRL_TYPE_U32;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
>  	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
>  		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
>  		break;
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index a3c829ef531a..1319cb99ae3f 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -20,6 +20,7 @@
>  #define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE 
+ 1012)
>  #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
>  #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
> +#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_BASE + 
1017)
>  
>  /* enum v4l2_ctrl_type type values */
>  #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
> @@ -318,6 +319,8 @@ struct v4l2_hevc_pred_weight_table {
>   *
>   * @bit_size: size (in bits) of the current slice data
>   * @data_bit_offset: offset (in bits) to the video data in the current slice 
data
> + * @num_entry_point_offsets: specifies the number of entry point offset syntax
> + *			     elements in the slice header.
>   * @nal_unit_type: specifies the coding type of the slice (B, P or I)
>   * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the 
NAL unit
>   * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
> @@ -360,7 +363,7 @@ struct v4l2_hevc_pred_weight_table {
>  struct v4l2_ctrl_hevc_slice_params {
>  	__u32	bit_size;
>  	__u32	data_bit_offset;
> -
> +	__u32	num_entry_point_offsets;
>  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
>  	__u8	nal_unit_type;
>  	__u8	nuh_temporal_id_plus1;
> -- 
> 2.32.0
> 
> 


