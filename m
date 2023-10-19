Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6D46698
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsjKcJ9u"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32d849cc152so6699176f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697694662; x=1698299462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4KPSAVtKqgOLeDR7mdK9Is2A/SYRmO80toMUaOj5BI=;
        b=FsjKcJ9unRqeGqctSh0JUA3Jwy4BRxFsUjLf2tHWOLpNHciWMK6i1tOTMBKmgVNNJa
         maoEZzfak/WpYBmhCSHkbika3MHr5WzO7c0ztjOX2P3w9bLutt0FcFV7kzbCUQU4cMQ1
         FAoGJ4zCxJbss3IT/HEbDgLr2Tb/O+Vrre8rmUOOMGCeEJJQ8MbK7a+ibkJZ+7FR5lR0
         z0EQGm6/46ZlBVxOLQKpQOcxc/wlkUNaCvN+yr9A8TMdDQhWhIpcRqy3B4zPxDcstsm3
         EDwxfonCTRS0WJT66YlpkFbs0/tDWbDtNlGW3ei7bmEzvL0MwLGIuyBzqLKAzBOlY1I4
         Mk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697694662; x=1698299462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4KPSAVtKqgOLeDR7mdK9Is2A/SYRmO80toMUaOj5BI=;
        b=fQ4zkwjJIJOZ3khzJd3v8eh0QVk1rDmJvdwjv3/X7i52EaL3c4GJguv2h9uuuTa0HK
         WXOZ/7FwudY8HWwK3XmTqntCEhPLzyxQFP5Dur62p6Tu4bSfPItJIrTV+pAKGAmnAG5N
         LNRg0uCLoZG5Ks3s7GhWVZ7KVAP0wq/uJoSOIpkAncYKhKDpoW+FvI48q04la8HmBKrc
         sUXN3KbfTtNu9qlAtJWNQVokyQMVE4S2fW9uRkhrV3FlWzY4hMYHZCxoSLLphr4C7rF7
         2y74SGq62WI2cAYNb/XJPxauH/P1uW8A5OLE5C6ay4B/as7W6Tan22hnfVgrkFN0h3b0
         Y4dA==
X-Gm-Message-State: AOJu0YzSc/d+eQStyZJazGw/iMS/QOFUXI5+i+SeaIy/EQiNSCwpq/PD
	FZI7kWVe4letWB4kMMAzYJJvEg==
X-Google-Smtp-Source: AGHT+IE/RcENarL/9duTp5rLL5MNGs6qDvtMuwpOiCBtPhCt0mgkH/IaJ1WfWVJPheD6IGLXsKBOOg==
X-Received: by 2002:a05:6000:18c:b0:32d:9daf:3f94 with SMTP id p12-20020a056000018c00b0032d9daf3f94mr659746wrx.53.1697694662034;
        Wed, 18 Oct 2023 22:51:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m5-20020a056000180500b0031c6581d55esm3634725wrh.91.2023.10.18.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 22:51:01 -0700 (PDT)
Date: Thu, 19 Oct 2023 08:50:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>
Subject: Re: [PATCH v3] staging: vme_user: replace strcpy with strscpy
Message-ID: <7baab878-ab15-4e8f-a1bd-6c028a6dbf2d@kadam.mountain>
References: <ZTDC7N6GLXZqaevN@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTDC7N6GLXZqaevN@lab-ubuntu>

On Thu, Oct 19, 2023 at 08:47:24AM +0300, Calvince Otieno wrote:
> Checkpatch suggests using strscpy() instead of strcpy().
> 
> The advantages of strscpy() are that it always adds a NUL terminator
> and prevents read/write overflows if the source string is not properly
> terminated.
> 
> strcpy() lacks built-in bounds checking for the destination buffer,
> making it susceptible to buffer overflows. These overflows can lead
> to various unpredictable behaviors.
> 
> In this specific context, both strscpy and strcpy performs the same
> operation without any functional difference.
> 
> The reason for this equivalence is that the driver_name string "vme_fake"
> is shorter than the size of the fake_bridge->name array which is defined
> as 16 characters (struct vme_bridge {char name[VMENAMSIZ];...}). Thus,
> there is no risk of buffer overflow in either case. VMENAMSIZ variable
> holds a constant value of 16 (#define VMENAMSIZ 16)
> 
> The null-terminated "vme_fake" string
> (static const char driver_name[] = "vme_fake";) can be safely copied into
> fake_bridge->name using either strscpy or strcpy.
> 
> While using strscpy() does not address any bugs, it is considered a better
> practice and aligns with checkpatch recommendations.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

