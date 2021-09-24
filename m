Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF22FAE
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 22:01:46 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id ee50so41368149edb.13
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pX5YZx2h9TlXbdaicj5FzXug5Eoaczz6tg4zWLgjm1Y=;
        b=o88LMJU4DMw5kbc3cZbqcRKE1X9fvb20ekkXqBJ2Otb0V4teT34iHC2KyhvoFTMu/G
         2/sZKdhaGgnb1UlzaiZNXElWe5wsUEwZX0LrtGRoSIYTC3BizxwmaWCQXnT2zC1P6zNY
         x6gkMPP91ME0DyEkozbfkyJs7GG0mgDTYGJKzAMULvbPYLQ4EA4PAEVlH+9VmxkZg07G
         7TS8JYNggugR2JJt3aQ8ZD94bHi10EYMCGBLtI7hOB4DMhfCyLyHUBUESCUJ83Qw9kFc
         MAIxyKVIRwozbGi1Jt5IQsSUOjKqomrS/QlBJFYVReImbFmfGkQfIyRwbSAvCIRW+Ru3
         7m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pX5YZx2h9TlXbdaicj5FzXug5Eoaczz6tg4zWLgjm1Y=;
        b=psg4pdoPODFd76qU2AOj1k5oYpSs9I48aauSOdXLP27ubT8aCCfrMQBhHCxUBaPU9/
         lZRP/dtLUsISOS8lrGy1cu0iI8w89Sny/I/6RdNYiBsq8z/sKWLpZ7pRWeT6BySzzAsK
         VzVYhB9JRijBC7G+W1q3sBSx/sjkQDH9tbsBBdrOo69K6x+YFvB27cQoxA4+XpM3gotm
         tujsykdekviG5kdvQ7UH5z7DO9aEj5CxGHTI3wsN5beX171L/EvXw2R9Q/BQUgiYYM3C
         SmRsiCecnSLBChZTaC28s+RPax8ZHxlhcGBPrlgN/6K5b+7H5qnziO2X7WMXM3oQ/X5j
         XnSQ==
X-Gm-Message-State: AOAM532obb+PbA6vwnQ5Au7cTnKxjjPvy6VZRsQM0ddu/Gh47UuMzivX
	O0b/NTnA27ehjAGi2FKC1ks=
X-Google-Smtp-Source: ABdhPJymlDjEsUUVhVDSSnS1jfz9rsmM4qz8IYOILPg1Q+tje7071w3pssdG4j92XYwFFUgN+XbrPg==
X-Received: by 2002:a50:9d44:: with SMTP id j4mr7781803edk.173.1632520904998;
        Fri, 24 Sep 2021 15:01:44 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id v21sm6301520edb.62.2021.09.24.15.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 15:01:44 -0700 (PDT)
Date: Sat, 25 Sep 2021 00:01:42 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: vt6655: replace camel case port_offset
 instead of PortOffset.
Message-ID: <20210924220142.GA4788@tom-desktop>
References: <20210924210008.106355-1-tomm.merciai@gmail.com>
 <20210924210008.106355-4-tomm.merciai@gmail.com>
 <58c61a30-c368-8e4f-d9c9-1f39cadda869@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c61a30-c368-8e4f-d9c9-1f39cadda869@embeddedor.com>

On Fri, Sep 24, 2021 at 04:56:16PM -0500, Gustavo A. R. Silva wrote:
> 
> 
> On 9/24/21 16:00, Tommaso Merciai wrote:
> 
> Where is the changelog text? :/
> 
> Sorry but I insist: take a look at this:
> 
> https://kernelnewbies.org/Outreachyfirstpatch
  
  Hi Gustavo,
  You mean the changelog in the cover letter?

  Thanks.
  Tommaso
> 
> Thanks
> --
> Gustavo
> 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
