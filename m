Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A9747F
	for <linux-staging@lists.linux.dev>; Mon, 23 Sep 2024 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727071025; cv=none; b=T2OGR72FXMG9c0f+5iECymtDAAI6cjybeuDNhhAQv+H5N/80dgC0SXaxfnrU6qUw0EkqpPOTwQPFkQiRMZO8JxluQKcYRSua9vglSlgOGZt0tODM9RyNbaD76Ko2YTve4ZFkOBMuoG6SR9Ap93VmtZrTYAkEPy2izsLIFbXwe7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727071025; c=relaxed/simple;
	bh=8XHdegJrDtRjkDr1fLO1MePOq9Jq3plHd7gzZtKT07w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ds7D8vF4bhsmOuqikTJfYYSpX48Uydo5RYwCENXj4pY0icwE2ODcLJCOn/2aG1fcQm9EKCgICm9jwLBYTxvDwNVjDKJ83hLwa/sTdsInZmpcvYSrtVAF/BWrpUH/MZ+8eU/jOi+cWZt2blT5lK3iDJx9GzHO/OIuonM+NZRpvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBtZ/3Rm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBtZ/3Rm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so30364935e9.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 22:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727071021; x=1727675821; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cn9eQezNMITG4+l3vbGiZ29Iu+dsnWMiEnkuwzKHARs=;
        b=eBtZ/3RmsJtH89EEu4R1zHvZwtb4GTD99jOh3KuV84X/g+k49tq0/aVN9aSZeXLaRi
         v3Vcz8Lu/4JsOTT598d7PNIMUwDxRlAHQU54accyktsV+dPTqHriswZl/EYb0RmMWxxu
         SQyacmcFBdNKCJj9Gjq+C/mOtmO/XPHUTK7hLyjfnGQ4xwFexby1HhnAz+To4ZBMU8Zo
         iciyvuPpveKqggN4ihpPO0MYlg5848TWlrhbvagbniS6sw19HazjHgiePpAYolS8mNxe
         q69t+9c720dlPPwz9JOoSbXn7IMj7Hvj9X4iILB+Hig4o2AAb++xBwv4DSUIsZnpNXeI
         vwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727071021; x=1727675821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn9eQezNMITG4+l3vbGiZ29Iu+dsnWMiEnkuwzKHARs=;
        b=fAsuf8w3oG/DSe8TRzuNtFm29NRiGCvStyvKH1bHpvgR9HLG+DYbtPp/cPkIr973W8
         IuMgDV1gUQl7EEZKRos8pYgSPQx5IjaQEMw0GrE572bj5xn7+uifSV1HYHEeFWx9zRv/
         2UgePvxl5oXu/eqdJmaBUQAgUS+l5U3Owpc5p6kCTyChEWaTDgD4KJT8RKCXevqPDUwp
         Mf2FQjrnP0xsOSbMHPsHZ14xj+YLphQom23PRBUadek0n9x4kRKRaVQbiPpw6ePmR6n+
         c6A6uD4SXnGbW4E96SUM+du0WIjfVzPtbm5f4PiCnF+zREZXHZCYm0TgD1sDn5o465Lr
         LKGg==
X-Forwarded-Encrypted: i=1; AJvYcCWMGYBlvTMZKn9TlY5LtN4zmHscW5/ICSzIn11FnvtvS8vjrutSjfBAeyXuv2mb1c5J/J3GYOZKBKyQlzy2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx70zU6W84U3U+n7RASTG7qNB+OC1LRbBAdJhEUA9tZCOXXGWiq
	yvEhsnunVgPs9QQUavPZSwcTs1uKwfWAVriSAZV02y9jiAgCP5dR
X-Google-Smtp-Source: AGHT+IGHylUjkoDorlZJ8kK4rBFvqqLDIH1JCMfYtstW+Lcg2sXgZtwYo4n8pm/dFD8f5dNWWBdSHw==
X-Received: by 2002:a05:600c:511b:b0:429:a05:32fb with SMTP id 5b1f17b1804b1-42e7abfdb08mr64147485e9.10.1727071021269;
        Sun, 22 Sep 2024 22:57:01 -0700 (PDT)
Received: from [10.188.212.131] (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afbceb5sm90536575e9.20.2024.09.22.22.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 22:57:00 -0700 (PDT)
Message-ID: <84c96000-e198-4502-b37d-0ca15c311968@gmail.com>
Date: Mon, 23 Sep 2024 07:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: atomisp: Fix typos in comment
To: Yu Jiaoliang <yujiaoliang@vivo.com>, Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jonathan Bergh <bergh.jonathan@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dipendra Khadka <kdipendra88@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: opensource.kernel@vivo.com
References: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240923033032.2420839-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 5:30 AM, Yu Jiaoliang wrote:
> Corrected typos:
> componnet->component,
> cofiguration->configuration,
> doubtfull->doubtful,
> consisit->consist,
> coppied->copied.
> 
> These changes fix the typos in the comment,
> without affecting the functionality.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>   drivers/staging/media/atomisp/pci/atomisp_v4l2.c                | 2 +-
>   .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 +-
>   drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c   | 2 +-
>   drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c     | 2 +-
>   drivers/staging/media/atomisp/pci/sh_css_mipi.c                 | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index c9984f1557b0..eb46ba4f4f13 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -55,7 +55,7 @@
>   /* G-Min addition: pull this in from intel_mid_pm.h */
>   #define CSTATE_EXIT_LATENCY_C1  1
>   
> -/* cross componnet debug message flag */
> +/* cross component debug message flag */
>   int dbg_level;
>   module_param(dbg_level, int, 0644);
>   MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8f2f4e8eddd9..c18f62fe66b3 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -406,7 +406,7 @@ input_system_err_t input_system_configuration_reset(void)
>   	config.unallocated_ib_mem_words			 = IB_CAPACITY_IN_WORDS;
>   	//config.acq_allocated_ib_mem_words		 = 0;
>   
> -	// Set the start of the session cofiguration.
> +	// Set the start of the session configuration.
>   	config.session_flags = INPUT_SYSTEM_CFG_FLAG_REQUIRED;
>   
>   	return INPUT_SYSTEM_ERR_NO_ERROR;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index 7ce2b2d6da11..3bfaf52c5cdd 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -951,7 +951,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
>   	unsigned int i;
>   
>   	assert(descr);
> -	/* MW: used after an error check, may accept NULL, but doubtfull */
> +	/* MW: used after an error check, may accept NULL, but doubtful */
>   	assert(binary);
>   
>   	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> index 2d7fddb114f6..0ab83e1b51b8 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
> @@ -362,7 +362,7 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
>   int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
>   					   const unsigned int buffer_size_bytes)
>   {
> -	/* AM: Body coppied from frame_allocate_with_data(). */
> +	/* AM: Body copied from frame_allocate_with_data(). */
>   	int err;
>   	struct ia_css_frame *me = frame_create(0, 0,
>   					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index 80f0395cc560..710744ff0b24 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -169,7 +169,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
>   	/* ceil(words_per_odd_line/8); mem_word = 32 bytes, 8 words */
>   	mem_words_for_first_line = (words_for_first_line + 7) >> 3;
>   	mem_words_per_even_line  = (words_per_even_line + 7) >> 3;
> -	mem_words_for_EOF        = 1; /* last line consisit of the optional (EOL) and EOF */
> +	mem_words_for_EOF        = 1; /* last line consist of the optional (EOL) and EOF */
>   
>   	mem_words = ((embedded_data_size_words + 7) >> 3) +
>   	mem_words_for_first_line +

Hi Jiaoliang,

I cannot apply your patch:
Applying: media: atomisp: Fix typos in comment
error: patch failed: 
drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c:951
error: drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c: 
patch does not apply
Patch failed at 0001 media: atomisp: Fix typos in comment

Are you using the right git repo?

git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing

Please rebase.

Thanks.

Bye Philipp

