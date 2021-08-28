Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72B3FC1
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:32:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z10so13885664edb.6
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mwl0/ofwUR1fW5Jjat5etpDE/bNVRf53IkoL+dJORwA=;
        b=Rw+R9akTqXGUUygEgELjBYlAC/860T6+4EtzYW6AVQHWFgIUERNXqXpAsIbY6oMGYB
         P7qknDvnjyaPokiq5ChcfNwJf+8KlxckeHIG+ekMTvFK0up1Y6opI4YxG+jk63WdB4ld
         FJt+XbCiGO/+vYgxNKRxEGuq255JgqkhiPWSr0WISgxCEClqUDgIuvO3wZaJJeWo1NGF
         rySEDRee0gIZq+U10ypA1dyBKCihuCeSi8NO1oh/XtPqQRXlp36pRM/C0NXApKHqXOKH
         +mzKIU/DJQMKqyiqcmJ1xJKG5gI8fWcksb/9/GHaswDhQEoZJqwmVhT3PS54+wSyaWZG
         lwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mwl0/ofwUR1fW5Jjat5etpDE/bNVRf53IkoL+dJORwA=;
        b=pKXPNjxCP+LwgrwfB70ZsTXzGjYJC5SJ4g2jlz6Tg8k022Om/d5s/TXliDWdfrsWzI
         jCLjp8mCQJztOkljgOeaqBnpg/NGh4ukcwhH13Fla3hUatVXQz+Fuc03vT9jsNQLE+C5
         YHH1KGQIZXxSi/TapWBkXpfSDow9fQ96rco/lq6KuzTwBRr2tGlH5vwxMKzN7l2q9xON
         buM7nEx10lqwtYq9G/ZW0cCPQXqUgtyrfa3uuGA2n81SzJQJX+Je6b/8R4uoLKLiS7r5
         sk3LFe98RxQa13h3Wor4X0hkDTVC5C8P0pDrqPhYrvRNmLxqInLkWom1SQx71iEL+bk8
         oGyA==
X-Gm-Message-State: AOAM53081NDfrcwOhqLPNuXsNQB5sTBC0VSNQc7JXyWRsTbz3QpW8jG+
	MrRxEJ8B5gmMangmUV9KvL0=
X-Google-Smtp-Source: ABdhPJyYQ0N6TQRJ4JplgfVs3+sbZaNEXcdsfA2TF1udOnQET68RzhP2YCyhtmXmc2M4GrRlla4c2g==
X-Received: by 2002:a05:6402:26d2:: with SMTP id x18mr14315972edd.195.1630150354010;
        Sat, 28 Aug 2021 04:32:34 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id k22sm4121604eje.89.2021.08.28.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 04:32:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCHi v4] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Sat, 28 Aug 2021 13:32:30 +0200
Message-ID: <9823013.QzV6juPZh1@localhost.localdomain>
In-Reply-To: <20210828111622.3jytsm56cblqkvil@xps.yggdrasil>
References: <20210828105109.5776-1-fmdefrancesco@gmail.com> <20210828111622.3jytsm56cblqkvil@xps.yggdrasil>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, August 28, 2021 1:16:22 PM CEST Aakash Hemadri wrote:
> Unrelated to the patch, but if this was a typo then you can easily modify
> the subject prefix for new versions with `-v4` using `git format-patch`
> 
> -Aakash
> 
Thanks for catching that typo. I use Vim and I should have pressed the 'i'
twice to go in insert mode. I prefer to not use git send-mail to add version
numbers. I'll resend it soon.

Regards,

Fabio



