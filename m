Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733FA2572
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 06:49:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id h10so74155wmh.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Mar 2022 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X8zlmcZBe54nzv+sPTCpjVIQwlQlmj+Rk7igGR/RQiU=;
        b=pX4zif4eg8fCDj8Pfh8tupbxqQSdh+FZH3MlyHmQO4y5SplcfkqADTwoBWPzPe6lhb
         QFNNosPdZ3rsIySIlcs6hc7cpizRRUVmlXoKOKajZhwX2xafPykjM/1RmvOJrMG3YPeI
         WfqLrSpF1fhrzMyvmO+A/6n/YRrCUWXyU9CtJTcDWw/xGOVRH4ONYxFDJ24z3Sqht5t2
         elGg8oN72AyO+KhPoXTI3CQQXa9CPgTfx7EzleEX9W/G/xglmPMLb5ZiR24K/Fhx/H3r
         PfLEXFJtuM7rXG3+49doY6nujMGYiWDTYIzSxJZj6do2onZIe7qEXkls1mW24QTqyS1w
         tv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X8zlmcZBe54nzv+sPTCpjVIQwlQlmj+Rk7igGR/RQiU=;
        b=1P90QNAjaB8RC4tyu8Onafvq7haYeww+2Z2NrCsD0rIEJxTURKXxLPrwf5mNthh1X2
         SuiMGvft6x0brDn1ASHrlMrV+1VTrkaz7fECNJGrj361YMOlAWrjKnytiKDHMb5Kja9T
         BTbOrSPeVlj5G5CjQAy5fXBYJ5QMqAix1M22PjYjuiR1ArzaxRD03QOiQaCNmiE+7F5a
         2Z/0/CMud1JC3PPcAUyw7NuHS7rp3+lf9vmkeWm622q2OXR51TZdqfI+HhAY2BbVjOEF
         X+qBM80HAw74ojHka/F0Us/V7FxIENu4pLbAgMivXTxR9QHpmvgkwhed/zlTKpPmS33n
         k+dA==
X-Gm-Message-State: AOAM530D7flf6RriUdMnUQLsmgKXDzJnm3XgaPvKjGZW/OA4Pk5J1ODZ
	M1FHbJPXmzLUlHvA9musecY=
X-Google-Smtp-Source: ABdhPJxtKjt8AqmhFu+MN7rzZi35l53F431OBF5ua5oY7VpSjEJPNejwLvKq/68cdabO2j1V79LzjA==
X-Received: by 2002:a05:600c:a08:b0:38c:93c8:36e9 with SMTP id z8-20020a05600c0a0800b0038c93c836e9mr5823801wmp.97.1647758977549;
        Sat, 19 Mar 2022 23:49:37 -0700 (PDT)
Received: from leap.localnet (host-87-20-105-171.retail.telecomitalia.it. [87.20.105.171])
        by smtp.gmail.com with ESMTPSA id l13-20020adfbd8d000000b002040daf5dffsm948321wrh.18.2022.03.19.23.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 23:49:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: "Ryan C. England" <rcengland@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, "Ryan C. England" <rcengland@gmail.com>
Subject: Re: [PATCH] staging: android: ashmem: Fixed a struct coding style issue
Date: Sun, 20 Mar 2022 07:49:24 +0100
Message-ID: <2821664.e9J7NaK4W3@leap>
In-Reply-To: <20220320033337.47118-1-rcengland@gmail.com>
References: <20220320033337.47118-1-rcengland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On domenica 20 marzo 2022 04:33:37 CET Ryan C. England wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Ryan C. England <rcengland@gmail.com>
> ---
>  drivers/staging/android/ashmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..f2bf7995b403 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -	static struct file_operations vmfile_fops;
> +	const struct file_operations vmfile_fops;
>  	struct ashmem_area *asma = file->private_data;
>  	int ret = 0;
>  
> -- 
> 2.27.0
> 
Hi Ryan,

Welcome to Linux development.

You are working on an old version of the staging tree. Please rebase to
the latest version of staging-next. drivers/android/ is not anymore here.

Aside from the above, what style issue were you trying to fix? Everything 
looks fine in the line that you changed,

Why did you decide to add the "const" qualifier to vmfile_fops? Do you 
know that since then the fields of vmfile_fops are not anymore assignable?
What should we do with an empty list of file operations?

Furthermore, why did you drop the "static" memory qualifier? Do you know
why it was (I suppose correctly) "static"?

Please don't ever forget to build your code before submitting patches.

Thanks,

Fabio M. De Francesco 





