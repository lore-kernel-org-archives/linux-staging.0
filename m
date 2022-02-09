Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262552F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 18:33:54 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q22so4675743ljh.7
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/VHbBhh1Q5BW0eHT7ODuGdUrQwpBM3ZeS/JzBlzS9jg=;
        b=keJhsHcEm7hotnsbHxViXXol0pALn6nLuo0isXo7S9YQJwQgaJ+dOc46DYLg9W81MY
         7JnC/TE9t/lDp8oUoJNnkHs6z9sCvhRMWJJyZ5kDtS8htfmpBWaVFwYi31IZLLck9pe9
         KyxGtXlAM4bvJjDmdgl38SSajtMIvXGZooE///ovgxOFXLtZT3GlvjzVqMOCkcC0IaCV
         gFJ9mIHg/89NDvwdM+vwb0OASB/94Lx8ladYZJ6DRYZOm0FDiELrnEfKGUtX2vyAf3jN
         4V5QzUhEa1ccxg75bk2osR2BRZUS6eOJ+2sw61GkcFsXUv/dfWlZ8mLMgHNctZr+4b+C
         mflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/VHbBhh1Q5BW0eHT7ODuGdUrQwpBM3ZeS/JzBlzS9jg=;
        b=fCAi93l7MxXsYIdhplVQc/NGvYypa4xCacZXlQcB+gbHKfpqEoPr/r0/VCeN3HLNwg
         US1OPSY13aN2/YW3raKqIZ2J4OUZAqtT+CFgmR/ohSzB3WM0WGp4l769nN6xUl+x+DZv
         HNyQG8rn1OGtvHIzQqtKC/lL4rJJIPjeVyBGNfX3L6I+SmXWpZSOKl2GXOpa4X372So4
         mCc5AMBRiPb8Wf+aDEy84kIgzFz+OvawxUP9gWjPnGRiyaIJS8bdYsIeIjHsOInXLCO5
         YFVqIZ1bZTnzwZUgs0VO2vfFX279PB14+AIBc3Nwlp/VncttzfBDTDgNbPkV73jkGzA0
         uFXw==
X-Gm-Message-State: AOAM5316e4OfzIdq2p6Ax3CWQqd+xQIhnvdtilVYjFScf/ZFRmywZJdU
	QavCAT+A8XscizZuQBSkZKE=
X-Google-Smtp-Source: ABdhPJxh9nYl2aI5spHPNmfjqz/wXlDX3E9kOtM5a728QIC8T9TyOZy7Wzyxsh3VLJ0ATjuEK4fl5w==
X-Received: by 2002:a2e:bc1c:: with SMTP id b28mr2337728ljf.40.1644431632033;
        Wed, 09 Feb 2022 10:33:52 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.154])
        by smtp.gmail.com with ESMTPSA id u21sm2606127ljo.81.2022.02.09.10.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 10:33:51 -0800 (PST)
Message-ID: <be19eaee-2b90-d0c3-c80c-d8fb379bdcf3@gmail.com>
Date: Wed, 9 Feb 2022 21:33:50 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] staging: r8188eu: keep the success path and error path
 separate
Content-Language: en-US
To: Vihas Makwana <makvihas@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220209174819.5068-1-makvihas@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220209174819.5068-1-makvihas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vihas,

On 2/9/22 20:48, Vihas Makwana wrote:
> -exit:
> +	if (pnetdev)
> +		rtw_free_netdev(pnetdev);
> +	else if (padapter)
> +		vfree(padapter);
> +	padapter = NULL;
> +
>   	return padapter;
>   }

Why just not `return NULL`?




With regards,
Pavel Skripkin
