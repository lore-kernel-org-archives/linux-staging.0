Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA27B;
	Tue, 25 Oct 2022 15:17:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v1so21641395wrt.11;
        Tue, 25 Oct 2022 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNYnzxUYxZx4XD4Lwaw+hJ+8re+ot06tXHAq9yK6z6I=;
        b=lLz0o4cAIskTwp7ABd3e6vyx5q9XxRcKxkusLDtvncdPEUydTQN6ylznML/3yB/0B6
         Y9gCW+xnxc00wI62CK2Id71kIm2nTL5yZ6A9kA4FnEBAnSCc+YMg/zWSLzBdSSwxqcbO
         Q2tBKIH/Q5WtjxR1VQVZ0eHNyECpX6rskKU9JCTZT3eWsAvwGobcfo8EFNJt5Uih/aue
         lWPYXHA6lKVRqJyFit/eNyzZqiib9/lf19QFCa61PAguWbmSrV6SWapCKMCjARNSzg89
         2E82SAv44NB+Irys2ei9Y6ka7JobgmEq+Vym3LLPyxclsI3iiYFhh9QZhsqc/ZSXWigz
         iLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNYnzxUYxZx4XD4Lwaw+hJ+8re+ot06tXHAq9yK6z6I=;
        b=rF3UDeL5cicRTZs6jp8Mx0JbtaGR/aMV1iywkt1cFCEDAlxgINkvdkeN+A6eFB6Y0f
         OSG/hL2oECiqSML927aopzVrIYXkXXqYUDgE+o6Em+A4dZrtNkYKQeUIEn31vzPBf7Sn
         PkfCWigzYjLQCLY/LCMmkAq57EHPdvGHFE1zdquifzTeSPZV2blOhj8LdHsLPXCTzCf8
         MbD/AH7HnVoQCFJFLlTOPicW+vh5UpDTtQj+orwwGo4TYsd1xtduGBYorXTjKVBLZxiE
         RlLAFWKC+95LhXV2GH6Fm0Lxd1ewdrziIJhiZY8+lQhf6s2WQpEDSkIVHTmR9eeJ56pm
         /MgQ==
X-Gm-Message-State: ACrzQf3suvGRN3JsSIVPkZM7Q6ap238An94v4xS5LW62vsBWiXm6mfX5
	YlXTOTz1nujwTmpdli2gJUk=
X-Google-Smtp-Source: AMsMyM4k+sL9ejhrgxIrUG2j+VYySP/clvgyL/EnFgkDZ96m1kQCxllzpWiqTW4fA086/Ds6KHJt9w==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr26168784wrg.571.1666711068568;
        Tue, 25 Oct 2022 08:17:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d5689000000b0022e3538d305sm3358017wrv.117.2022.10.25.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 08:17:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mripard@kernel.org, paul.kocialkowski@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] media: cedrus: Add helper for checking capabilities
Date: Tue, 25 Oct 2022 17:17:47 +0200
Message-ID: <13124586.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <Y1eChJS/0aEchtpH@kadam>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com> <20221024201515.34129-5-jernej.skrabec@gmail.com> <Y1eChJS/0aEchtpH@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 25. oktober 2022 ob 08:30:28 CEST je Dan Carpenter napisal(a):
> On Mon, Oct 24, 2022 at 10:15:08PM +0200, Jernej Skrabec wrote:
> > There is several different Cedrus cores with varying capabilities, so
> > some operations like listing formats depends on checks if feature is
> > supported or not.
> > 
> > Currently check for capabilities is only in format enumeration helper,
> > but it will be used also elsewhere later. Let's convert this check to
> > helper and while at it, also simplify it. There is no need to check if
> > capability mask is zero, condition will still work properly.
> 
> Sure.  That's true.  Out of curiousity, can cedrus_formats[i].capabilities
> be zero?  Because it feels like that's what should be checked.

Yes, it can be. It's the case for V4L2_PIX_FMT_NV12_32L32. All variants 
supports it, so there is no special capability needed in order to be listed. 
What would you check in such case? Condition still works for this case.

Best regards,
Jernej




