Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069EF23CA;
	Wed, 13 Apr 2022 04:44:20 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id b189so552367qkf.11;
        Tue, 12 Apr 2022 21:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZLPVnz8+CmyHrIBYurkIW2TTvDikbuZwnfUEIgf50uI=;
        b=nANZ40d7vawO4uMCRvgPuFdQC14wrez+F1spKBqrPRbKH/PbQhWPj3BukiLVnold9U
         0wojkJNsY/E/O3lZwDBdyV/13isiyg56SFHMum30GeQ7MI5Wf/DZFDN4R1G32WD6xGX0
         CLBFcVbLaS3pLQPo0qSRfDpIi+erD8//drjNs+KK0WU5rBicFeJqf8yEhHO2LP1gUIZO
         VSEo1ZYvh6MXAXGgL0PXgLBXlaV14PDz+1RGQhj+FMImklOK2cNXja9eacJOGDduK6Rv
         pp598Y/ISAHe/3kuBj/Ay5qTboJIMigTawILJSa59NyK7yV0Poy7rwUcusXQxPXhWbBG
         cbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZLPVnz8+CmyHrIBYurkIW2TTvDikbuZwnfUEIgf50uI=;
        b=3HZ8B3durv9lDRAHU90qyZM954kTvsv0LdeJBUBStJuIMvQR2t2MAFYa4HFiqwkIrU
         ZX6GHmLB8jFRn3mvkLtclHn8r9XuBUiq62g4t0OU0tnUnVSCEvnoTix8mHlSGuMQJoaI
         NoS5kHh9kth7wXBfWojCleJcb6Na6UpOxnZhr4BG7jZsfpWCt80PUeQXnw1fRtTOtT2x
         NJCl0UXvPW/q+b0VgmvlNDLyl8JpasfSRfupoWtPJ8zx5tTDYnLhA9xcZfJZjCCDSDMm
         SrS4NNMHGKTiH3vpxzx0hHPWDTYQTk019840IQhuPqfaIT5jigpAr9M07C/ZMvOq6Ptd
         u1QQ==
X-Gm-Message-State: AOAM531biEqhQ07NKvkzwiA3kpoDfobeqJSyOPdJIrhT/b0JrHy4U2sR
	4rZIEuKdhXh/oysvtQgtLnC7V1gUThF9CCx2
X-Google-Smtp-Source: ABdhPJxhvR9BbzTTdUPd0GN26sm1C64fuJ3oWzB8hVSptjitL40jxKTzif/wA+YYGD7UvYGksUmXDg==
X-Received: by 2002:a05:620a:4014:b0:69c:10af:d98e with SMTP id h20-20020a05620a401400b0069c10afd98emr5471620qko.633.1649825059953;
        Tue, 12 Apr 2022 21:44:19 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id b126-20020a37b284000000b0069a11927e57sm10232117qkf.101.2022.04.12.21.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:44:19 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:44:16 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: greybus: remove unneeded return
Message-ID: <20220413044416.GB3357359@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649793138.git.jhpark1013@gmail.com>
 <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
 <5792471.alqRGMn8q6@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5792471.alqRGMn8q6@leap>

On Tue, Apr 12, 2022 at 10:35:58PM +0200, Fabio M. De Francesco wrote:
> On martedì 12 aprile 2022 21:59:15 CEST Jaehee Park wrote:
> > An empty function with void return type does not need an explicit
> > return. Issue found by checkpatch.
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/
> greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component 
> *comp)
> >  static void gbcodec_remove(struct snd_soc_component *comp)
> >  {
> >  	/* Empty function for now */
> > -	return;
> >  }
> >  
> >  static int gbcodec_write(struct snd_soc_component *comp, unsigned int 
> reg,
> > -- 
> > 2.25.1
> > 
> Hi Jaehee,
> 
> If I recall it correctly, Dan Carpenter suggested to remove this empty 
> function. 
> 
> When developers remove lines of code from a function which becomes empty
> after the removals, they also remove the resulting empty function and
> delete all the calls (if there are any left) at the same time.
> 
> Thanks,
> 
> Fabio M. De Francesco 
> 
> 
>

Thanks Fabio for pointing this out!
