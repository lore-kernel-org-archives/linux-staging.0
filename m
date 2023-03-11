Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A257B;
	Sat, 11 Mar 2023 14:23:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so5166296wmi.3;
        Sat, 11 Mar 2023 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678544596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC79/623i27Cxw2oHO9ZNA+BBrwFL63Y2y1N3InP394=;
        b=qzQizoZdoOAV8U0V1DKM5AXdgHedYktTRCqc8eC9LY8VLJ7hJLsoruAM0UiOQahmDd
         XzJUNT1h33ILhuAaLC1/gCgyj0ug74fR6JdU4uICnxvXs/BIwAlCSsOnMqXSpAZVPFQB
         gRhfgrAy5Brobv5P5ndTNL2zvMm0bOM336CF0k4kIVymF5hhSiGpaH7DvSLA3Z7AUWDv
         95MJZy9KOJUi24Olo88njU/+YREJD++FvAs2glMz2snGUkV77kPJQ3lruJGvbrP1mEzX
         CnN2nnZwr2EDAQ1nVDLeBKQIVUO0XtpryhpQ2Ra5exgRbm5KFC2ro5DeiuCtYExUlno7
         VS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC79/623i27Cxw2oHO9ZNA+BBrwFL63Y2y1N3InP394=;
        b=AKFbbx7y93BmZP+NuttX7lOFTHs2aG3tYO8s+5YjMaO7b9aAgITGDpiQlcKgnBsz4C
         My1yN6AEbUVKxY+FL/7jWVAm+3xB4g4ysHnlFzi0fWAK+p22B48wQSE8D1my0Wo9RHUh
         +Hnox2cQXCPiHnBpNgzjiZq8Wy7HYG+QAgTx23fDQB8dalAT8W6seadqZaeUVZKQ285i
         ZcNrwLzG4dfnFlljeSC7z3oA0QH89vGieEMfUxDtbYncci07QnUIaIhEsXnqoBggERw/
         1a2efYoN34JILHzI2r3lN/haEcqePqc+yTrzckZPKF4RYasvOtqB79Jq26gaa/5B3ygj
         pxdg==
X-Gm-Message-State: AO0yUKVIduT+9yGJXo4kku3uq3EdjVGn+apDwRaKa0tUxR4ewsdk9h0s
	zRYLyAtDeL2+TKEb1cQ/n+k=
X-Google-Smtp-Source: AK7set+0hL7GplngJh2S5guRgk81WnVs+2avq3FwRMHVkBPis5fUt0y6gsw5oWe7JFtN55dR6XDQCw==
X-Received: by 2002:a05:600c:314d:b0:3eb:3945:d3fd with SMTP id h13-20020a05600c314d00b003eb3945d3fdmr5912869wmo.14.1678544596078;
        Sat, 11 Mar 2023 06:23:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003e00c453447sm2988242wmj.48.2023.03.11.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:23:15 -0800 (PST)
Date: Sat, 11 Mar 2023 17:23:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
Message-ID: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>

On Sat, Mar 11, 2023 at 04:06:51PM +0200, Menna Mahmoud wrote:
> according to Alex feedback
> 
> " I think this type of alignment is not a major problem,
> and alignment isn't done this way in general in this
> driver, it's probably OK to keep it that way. - Alex "
> 
> 
> ,I won't resubmit these patches, right?

Yeah.  Find something else to fix.

I feel like in outreachy and similar that people send a first patch and
then they get a bunch of different feedback.  And it's like checkpatch
is complaining and it's staging code so probably the code is actually
ugly in a way.  But often it's better to abandon the project instead of
getting obsessed with it.  Zoom out a bit.  Find something else where
it's obvious how to improve the code from a readability perspective.

People are giving you feedback to help you and not because they are
about that particular line of code.  They won't care if you work on
something else instead.

regards,
dan carpenter

