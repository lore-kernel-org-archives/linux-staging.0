Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576CCA78
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:47:51 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-56ca4d7079aso1506645eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691160470; x=1691765270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqQIoeRe9FkNhi9ugijKBQt/la768uvgsVywzbmfOKs=;
        b=UDJPK1g82+VUkheJ1k9KGdQSLdTRDLlCAHraLHuTx/4JMdou6JZGwc91eweFvMz4+B
         hMk4jYgH2tnI69Pv/oE9cTD6SYWIZtIGdsZIYFK8RR6LkeE0NL1/nIecSD+0BOSRWx8x
         ngOwPgTayQpMbMWPu+7OlOZHj12EnCj6ISwqnFl6JRNoIFhdvQnm0uEWtDxcPahAXvLR
         ZdaGxC2pzCDwlIhTxoPws0gwMy3er1bgnmiuCMUj4Smyoxm87cNdMTqfOllJ4+U5h27d
         3N/GaBlYSktHmG7y19Fb5fCuUzMhcdOfcJMwlAL8hnvwvEakIuk7dRzCMxfvUFI8MMXF
         U2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691160470; x=1691765270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqQIoeRe9FkNhi9ugijKBQt/la768uvgsVywzbmfOKs=;
        b=heewbwI/i0jmwKo4lszjO8Wo3NHM1YX30K2dpyfTfB0D48V7DxMbfrXI9KeVz8AMX1
         qatcCofrGll+6j46nsBJtYF4X9ETCnedE+7/1d+4rcz3nj6XgIuJPNS4SYLVtB4vBlUJ
         TBjYe0Z6cANw18X3w+oKT/lwW7jBzEkOf9n6qmo3YAq8z16rifVj+FoC1TGvhtF3I4KT
         jF1hZ55F6PSn26BMrnQuVukUaGrBJviiy6gcsBZNstkAuYJIqYWkUVKGviHUgcOKX+2O
         cMCq36eaT8VEpw1UUcl/uFeZoO8+Q98don//3Ioeua7x7yJ+5Ht0BEBDm9UyvNzFNZUV
         PiTA==
X-Gm-Message-State: AOJu0YymsQjjGihrPzBFCgtXcuPVxYzelDI73LNSPmN9oHmpuCZMtAeF
	3JhyZnKm40TYrph+4viegw8=
X-Google-Smtp-Source: AGHT+IHidmnEjRp2S4bc5k/9fnHJ51zi2bnqpQo0hYSkcdN9W11z9+2an0iV7gY1rrSC8DXtR/bGhQ==
X-Received: by 2002:a05:6870:d611:b0:1bf:7b3:5116 with SMTP id a17-20020a056870d61100b001bf07b35116mr2340963oaq.47.1691160470165;
        Fri, 04 Aug 2023 07:47:50 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id g20-20020a9d6194000000b006b9d237ea0bsm1178982otk.34.2023.08.04.07.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:47:49 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:47:44 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <ZM0PkFjWAiTrrpog@alolivei-thinkpadt480s.gru.csb>
References: <ZM0Lmt5Dp/k6iO21@alolivei-thinkpadt480s.gru.csb>
 <5539044a-0d67-43d5-9d75-42c65d616239@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5539044a-0d67-43d5-9d75-42c65d616239@kadam.mountain>

On Fri, Aug 04, 2023 at 05:33:19PM +0300, Dan Carpenter wrote:
> On Fri, Aug 04, 2023 at 11:30:50AM -0300, Alexon Oliveira wrote:
> > Fixed the following as reported by checkpatch to adhere to the
> > Linux kernel coding-style guidelines.
> > 
> > Changes in v3:
> > - Fixed changelog
> > 
> 
> Nope.  :P
> 

Gosh :(

> > Changes in v2:
> > - Fixed CHECK: line length exceeds 100 columns, noted by Greg KH and Dan Carpenter
> > - Fixed CHECK: Alignment should match open parenthesis
> > - Fixed CHECK: Lines should not end with a '('
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
>   ^^^
> 
> Changes go to under this cut off line here.
> 

My bad. Sending v4 now.

> regards,
> dan carpenter
> 
> 

Thank you.

Alexon Oliveira
