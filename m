Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388E4A93
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 14:53:13 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id t21so1790399qkg.6
        for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XCJgFl0zb6Np3SwMPpLvvP3l3nq1MdfLV+ikmQDUG3s=;
        b=AUPu13zo54l+idCIL+fH26rteHJK42TpmEDpDH/cjEYqJBmuqqTINgGSIP4WKKUs9B
         HomsZELFx2heoftLLvSzvUeXyxO5PmLsXZzFzfrS9k/QACvzHyzB5NcbphcDuFmb33ZG
         pg3zOvN9r/Jw5/V2Jtv7pZd/slHYzRvl8L5XTARxXKrOBHbrUYRlkhmmvmrTcOdFHm1A
         29QFqcKACAcGricMQ5Ey3GZKQbC2yfbaFvPRf6l4+b2YsPKSXGMUeXgIuNzQE3rDxK0A
         LNFBl/Ipx4zoGpucjh6jlD8cLZSxSwRgkXS8z8FsfC2UazNrpTunlXOdHMpnKZAN2DTg
         S2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XCJgFl0zb6Np3SwMPpLvvP3l3nq1MdfLV+ikmQDUG3s=;
        b=H4nG2wZSxdbuozPp5vlSVBHCxYzmq+Bk9906jAv3r2O0/SWYBaax1nLujauDI4HMRU
         BaMIHI3XCryTSs3jeUnLZpv0uocXwwije/alnlX39K5gXT8QPcI5nsRJ+7LK5zgbx8CS
         VR14T/eQnHRHHY9FuRwd8lLLOlHcvmo0hyopylg5jKjb2TIzDivvzR3olDIjPMvM4Fm+
         FqZ2kq10rlQxb8wql0gjTfVptXhIildAT4v2fGQq2tr9aYXj/qXHQgmZCRXjX0Fr7Z3f
         qM1e8UauRr2WGooJt9c6Ozcay4p6Jwlqj9Rc34/1QU59QxrACioEvaSjlm6a3l4DLk+9
         Un+w==
X-Gm-Message-State: AOAM531hby/7+EA2sq3nuQiZZ7gC6RyntqWoEIIni0XIWOzpkhNwgTmm
	24Zd2M3eXqfDe9t98a8BA8f6ZQ==
X-Google-Smtp-Source: ABdhPJwXH1h/po2pdL5t6lLulOVmk5rA2cO/TnGOOCjAdQ1pevbQSrVjLH/1u3+wQIHPgXNBctDZdg==
X-Received: by 2002:a37:bdc6:0:b0:47d:4c1f:817b with SMTP id n189-20020a37bdc6000000b0047d4c1f817bmr4699996qkf.154.1645195992776;
        Fri, 18 Feb 2022 06:53:12 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id bl34sm19728766qkb.15.2022.02.18.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:53:12 -0800 (PST)
Message-ID: <d2a039f25b5e359c4df1eb55d9f4ebcf66234d93.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: v4l2-ctrls: Add new
 V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Feb 2022 09:53:11 -0500
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

Reviewed-by: Nicolas Dufresne <nicolas@collabora.com>

> ---
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

