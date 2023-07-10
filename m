Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB4423CC
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 06:08:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso45847505e9.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jul 2023 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688969313; x=1691561313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4SVhLr95VKg7glfqsuHxNHjzeVCLSq/G/5K7c2rnENU=;
        b=v25DDkqIvucSEnkVDBb88JM62u6UhxMQmhQEFtBnnepd5N01xMl0aZZVn6408Mc+Lw
         EFk7fZY6ZcEQk23n4bad7oobs3z43ET/5TOUpQYiKV3TExv0Sl2RvoRjLmyDn3uJAEMR
         iJ1Y8GLCpUMkEmnzpAzlxQfEL4/5GRMZ61m03oOd0P9sIYjwxLnfmhV3kgMagrlCMVxe
         BWmdvCcBx5yeF2EjT5bhkQcLc+t2EMDaULwR9sUI5uajclE+BbbyNM5ASzl/OW8UA0fY
         LlYmv7/OZg1goHL8cROLX+UMOCCmx3Rt7Iq2Vi5Vqjh+nM6oel3ayJ1lV8cVlz/oHDjy
         E+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688969313; x=1691561313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SVhLr95VKg7glfqsuHxNHjzeVCLSq/G/5K7c2rnENU=;
        b=jIEioVh2SEHHEIIh4i3VgVm2NtO2McTjJ90jJZ8BIvF71iattHw8BdIhpUtSpMCVK8
         zfvfwbZ7A/b6QJc/1KAzJCy9GE9tyO/0fJMqDNTzlFXBeESxzeTqbrybcffhoXsjK0CD
         ayT//NDvWs1EPEXqpGX5+pPreAOfVSbqu1sAFNBSHq6yHSRIp5JoEsBHQI4jr7SVf5cm
         vW9/iznsrOvvH+iGuJNCKlFZa0j3KuSVimOwBhJ3ZbUcYRIP6FnWc36Zmh50vZISV6ZP
         qjWWsPV+WwkMdwpKYGL98WFPfc87U18RwnnpkOQlo4Lo7LVa9/VXLxqvxMqtXijJc6re
         rcaw==
X-Gm-Message-State: ABy/qLYvb4uth1Fk0oi/PE/2AlmVcjZkB9H1+CakET72Wq9prKvsD0zM
	apiY1F4VCp2Fglp5iQdUe8GFMA==
X-Google-Smtp-Source: APBJJlGNV916/RhwLEjTgvYReVMDbcpN8czCnegfqCUHKHwq3DJsXoz6Rt5Ff9q1Mo7Gh3MrEVA4Sw==
X-Received: by 2002:a1c:4b0a:0:b0:3fb:d1db:545b with SMTP id y10-20020a1c4b0a000000b003fbd1db545bmr10833003wma.20.1688969312699;
        Sun, 09 Jul 2023 23:08:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003fbcdba1a63sm9235567wmf.12.2023.07.09.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:08:30 -0700 (PDT)
Date: Mon, 10 Jul 2023 09:08:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, xu.panda@zte.com.cn,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Message-ID: <fb7fac70-1d81-4dee-97ed-66c6a58720ca@kadam.mountain>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>

On Sun, Jul 09, 2023 at 01:50:07PM +0800, Zhang Shurong wrote:
> The "exc->key_len" is a u16 that comes from the user.  If it's over
> IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.
> 
> Fixes: b121d84882b9 ("staging: ks7010: simplify calls to memcpy()")
> 
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

