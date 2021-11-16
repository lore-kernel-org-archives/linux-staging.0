Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB5C2C82
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 15:03:19 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id b1so48142772lfs.13
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x8Pb1HDChQ0vfcfqFJfrIYfJGgmQhlUPanGxtam9Nxo=;
        b=hkhpW8Qn2CwoAdqUYRxmConYIy1Qhpj3ZjtGflMaUH06gTJKfZGx5FyLfcbtLVv7Uj
         1dfMlUWpT34C5P5OZwK7pseUPsnSE0a7178dFPQgLSoM6bHm4BD0pX2APIS4BZFNPfke
         ReesSCjgm1N2/riiUpesljlmm/3Z+yMO1mlhIQ1qF9tHUHt6TiPq7/Z7/VfsTxoQmViD
         /iauVULHVgyhfIsfZerw1dvvMjUbsr6V/nQTYe83bjGiOcbvQpujzirQ4ND62xrj+1hd
         irdGSLG5Dh3uKBAq4yVJHIdD6e2TcBcnZ7e/7wqgOHiFT4nuBYehL4Al9xV0swHTVU7V
         ykJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x8Pb1HDChQ0vfcfqFJfrIYfJGgmQhlUPanGxtam9Nxo=;
        b=V4aZ66Ty/u1ewpLoS+6ZA0VwHXuN8uS0d0LS7cwuXePun6T6MbPiiNzDCExtNg6fsz
         K3czvhJqvHBcsMjN/67um+0uNYjLzFji4projWk+1dgc130+KlGkT54hzRNBe9pVIdtR
         pCzBouiH+xTckEzqB0ASQoolhuRYSzvXpk5rUPc4t44YJ6v1dCjui9oymLjRSt2NWBZN
         oaDKX/6R4oopAaHza3qPl8bCgXTJVY7H9C7PZTqHTVY6lKBoUBeN0mOaq4f+HdfxWeUn
         bROTJWkESgYSVsGEpf2/Xsl/1PYBNKMtcN+qYSYXYH3Yoy8HX7kfbh6A4VHX2YtAPYdC
         Sy6g==
X-Gm-Message-State: AOAM533pGxJnioQ8syeLKVG2API2OqmMviz+mIIwWXRssbXhf258SgE/
	4Ep0lNEAgvly9Vsyw2gRBGA=
X-Google-Smtp-Source: ABdhPJwzdKU03kzvBzu1kM7rBjmdOhyAr3Yjh/MCEDbeIh7ZWPwbUgj7rWgenPiag7fAneg8CY9ESQ==
X-Received: by 2002:a05:6512:3ba6:: with SMTP id g38mr7264286lfv.330.1637074997023;
        Tue, 16 Nov 2021 07:03:17 -0800 (PST)
Received: from [192.168.1.11] ([94.103.224.112])
        by smtp.gmail.com with ESMTPSA id b12sm1257799lfb.146.2021.11.16.07.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 07:03:16 -0800 (PST)
Message-ID: <b2a92947-7bb1-849a-e82c-3a505a66989e@gmail.com>
Date: Tue, 16 Nov 2021 18:03:13 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] staging: r8188eu: remove unused defines in wifi.h
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211116011451.896714-1-zmanji@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211116011451.896714-1-zmanji@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/21 04:14, Zameer Manji wrote:
> None of these defines in wifi.h are used so they
> can be safely removed.
> 
> Signed-off-by: Zameer Manji <zmanji@gmail.com>


Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>




With regards,
Pavel Skripkin
