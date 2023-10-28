Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8BD295
	for <linux-staging@lists.linux.dev>; Sat, 28 Oct 2023 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsTaJD6R"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b3ec45d6e9so1924287b6e.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Oct 2023 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698524737; x=1699129537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6s/dbIiHsKw5qILIs0FnO/CHdVCCm522luSBKh8UXM=;
        b=QsTaJD6RXtw7byJs0X4Ch8/gMckhFKmpMDDNkU0hkttvGAT28UalxsGEla7dRFakFw
         or0bWVSCvL+ebwo44a7mUzBt4eMyxn1IDYbpKPpn3APu8WS7XaWBgBabWW9CR7WcBSjK
         FlSvBh5fmmvy+gNFNkhdAJCHN2CO+UlmH7nN52A+HDpbQPBlOz63ZXseZG8kDuIdUoPf
         euXadjMmBlTYFmsBD/7Yltxm++bVzKV+vaVJrq35nYuO5Nr95NvTX4F34fG8FlcLREPw
         sTD8KFnq+MBMDdESnd94iy4KtyfCuRl9A+Cp8rF1l9kX+kbvuR+LRIb9ebbeVAiLNmU0
         PqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698524737; x=1699129537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6s/dbIiHsKw5qILIs0FnO/CHdVCCm522luSBKh8UXM=;
        b=xAZkArcTZ5cOrHkY4UcSRC0Tz4gs2y0bDmq9WGt26kZdnMaFRupQuI7kc//Tu3rRRM
         bPtWynW8MSfF68DZD2ZUHpYU1w2zKuySZT9/WQidZ+5F6fxcQy8Rcn6YhNsZ1+GQ48H5
         iyECUrdpfCRkF7SqGJsO+lyHbXRa5NLEvaC1Tuxw2ppNsym1H7BPMcU/Cshvd/HzHWm+
         1Z8Q2ng5xNRmcQs/86zdl92+jVTWi1q4s2ZGnDwBxrlUtjUbwe8aLL56B7ASuEGGujpq
         fwr+iwS2fixTguLQZf5RnVKG570t0FCy1PecDGffh0lpzBYS3brTPNyiI/NpGD7h27IU
         vbaA==
X-Gm-Message-State: AOJu0Yz5Y+wxXsTeDFoRa42XrYz/EVZNc85sNVfoqWgV3UjyxFvrOotg
	2TIpPW+W8yuPz5bsDbn3FeA=
X-Google-Smtp-Source: AGHT+IHgdcrSFcttPGdKfN9SFlEHz8t+uTkvmaSR08wn5o7z7JDWzEKSLWaWmcv5gBShAZhWs2kn5A==
X-Received: by 2002:a05:6808:2a87:b0:3ad:f536:2f26 with SMTP id fc7-20020a0568082a8700b003adf5362f26mr6254410oib.18.1698524737423;
        Sat, 28 Oct 2023 13:25:37 -0700 (PDT)
Received: from ubuntu ([122.171.167.85])
        by smtp.gmail.com with ESMTPSA id a18-20020aa780d2000000b006c06804cd39sm3288830pfn.153.2023.10.28.13.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 13:25:37 -0700 (PDT)
Date: Sat, 28 Oct 2023 13:25:31 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using
 ftrace warning
Message-ID: <20231028202531.GB2432@ubuntu>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
 <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>

On Thu, Oct 26, 2023 at 01:20:47PM -0500, Alex Elder wrote:
> On 10/22/23 7:22 AM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> 
> This change looks reasonable to me, though I don't think
> ftrace provides device information.
> 
> Acked-by: Alex Elder <elder@linaro.org>
> 
> > ---
> >   drivers/staging/greybus/bootrom.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> > index a8efb86de140..79581457c4af 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
> >   {
> >   	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
> > -	dev_dbg(&bundle->dev, "%s\n", __func__);
> > -
> >   	gb_connection_disable(bootrom->connection);
> >   	/* Disable timeouts */
>

Thanks Alex for the review and feedback.

Regards,
Nandha Kumar
