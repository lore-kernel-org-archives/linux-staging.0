Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414B7C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:40:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b17so4767989lfv.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1nrGQ86+KEfI8lMZHBguNMUxlHPTUJKQmanBNJ/nGq4=;
        b=nrd5SfiyZHt+2ltkwlDZXu2oumrGC+NMBOQ/IBLNU+gIu6YJu8jA19ISD3U+v3LA1S
         9IACzs8SvEQ1WW14Jbta4JwBp/UjPB8fLc1d0zznwG/1w2ddswHs9P0ojyqANVTnTe2z
         Vskxb2BeDp5Cwa/53oGVW8hlucug/+jrM0GzpGJQqt2kuUVP9wNHGH45RUa+39QPNWdD
         WkgniIt7vt+zWelIxTZ9TIOZr6AnG+u3b9SyY0WT8Qf/oiKpXgJZRQgQnDlM/9M78E06
         BWBo6KJXES3KlnqYZKk2IOebIxGYYuSOn1hi5AXuhzCOdD9tvw7k3BM7v1ShjOI4cxxX
         5mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1nrGQ86+KEfI8lMZHBguNMUxlHPTUJKQmanBNJ/nGq4=;
        b=N07sIdYrqaCozAeDt2YqmGr+1xnUnt2m/UcfnlgT9if68ERms7xGyEkDYcQ/vh0Hmg
         Ewa7aNEmqgu7Sa2TkChSSuJG8X4XlSUFv3GZ38t+RNmx0O2Oz93xBwvVlPfuU0T2aFzw
         jr4llP+af0+s2hRoy8DffRHeL5gQDFXpZLIFoAppHEvJdSK5oNyLehZPQ8VOfG+3ofSx
         gfHmENLLGFjjAqDg+BLDwc1KPiXKftwII8+iObmt1LI7XK0P2X5QbMb7rnyWwYk6tphL
         uKC1/tapNRyJaMtcidoy8QaAKnYsIlvTFwl7Gj2BiOfL+GBN3bkmHDLXLDNuxjG4XSUt
         8tiQ==
X-Gm-Message-State: AOAM5330XYsbbmawuFQoS5AFkJ1AxR0CW1PB8cOnzOvVwGdtS6e4HeGp
	Pv/7nlIHA6nfDPABKwvJLPQ=
X-Google-Smtp-Source: ABdhPJwk8/p4WUYEA2KWURqU/C11tiVOeYaTBCJOPUuJRAD9MHy7EXAvT660DPGpD84+WTu8EoQRsQ==
X-Received: by 2002:a05:6512:b83:b0:44a:9fb7:784b with SMTP id b3-20020a0565120b8300b0044a9fb7784bmr19016074lfv.547.1648986035922;
        Sun, 03 Apr 2022 04:40:35 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id f11-20020a0565123b0b00b0044a2809c621sm803729lfv.29.2022.04.03.04.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 04:40:35 -0700 (PDT)
Message-ID: <0107f709-49ad-a0c3-916d-0f7b32991a0d@gmail.com>
Date: Sun, 3 Apr 2022 14:40:34 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/7] staging: vt6655: Remove unused macros with CamelCase
 in mac.h
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
 <646acd285c1239f301692456bd9f46eda449d02b.1648882847.git.philipp.g.hortmann@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <646acd285c1239f301692456bd9f46eda449d02b.1648882847.git.philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Philipp,

On 4/2/22 10:29, Philipp Hortmann wrote:
> Remove unused macros with CamelCase variables in mac.h as
> they are not accepted by checkpatch.pl
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---

You can merge 1/7 and 2/7, since you are just removing unused macros in 
same file.





With regards,
Pavel Skripkin
