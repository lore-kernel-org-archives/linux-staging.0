Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CEAA53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 19:59:53 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1c4c7a83bcdso1388319fac.0
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693079992; x=1693684792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjb+U+WE049mgp+WRei7ubvTkYgIbSGu0eAZ4UCcyDs=;
        b=GCBerMg8wyznFGaX2LoIAXYKyU4/DX/MnlV8FPxlkGcaneu6meRLNGD4cgvDDZ9o1Y
         AJ/0rUF2c2ZfH9KXL/oslOf3gjET5/06XVCCVl0jQ604YU/qTSiYn1l690PbLSPkxFBM
         pt7Kpl+isAKjX7khXHVmYQQp+axLtzWI2HVykEJfQ6UVMZ0UMinLpIDJfQ73QJdAS8hj
         5/PSqT2XV/Iytypxli14ToXUB5WiMTX8qd/ZZolTw+4M8P7ZmUEZzIedEP7BjF4chWuZ
         Un6RFiZKADYEcSPFn8rfU+/RsgLaowmRd5kz/HvmAzH5wQAMkTFfOoQy5Ww3fBNk6ZYE
         o9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693079992; x=1693684792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjb+U+WE049mgp+WRei7ubvTkYgIbSGu0eAZ4UCcyDs=;
        b=XkY+i+zOS4jpG0WSSFYy20wjAWQxAly38cRYaae51AV37sKyCHcIGyQvNYq1j93+V/
         bMFHXeIwZ/69UVTMDg/uxwHp2dE36aqzpjSMkhoMIUpH4pVaCL8ZXeWJ/22ZzSDtVQm1
         a3O6pmQ0eabHaRqerjklzNtWzw1F+xjyhYrXs5o4jUsshWmgEJN0vTNOtAJLzW9DDX6u
         K11z202cWEx5jQax/SIskvsu1hNlX7lEmT9Vq2oNgg8GmdnYlPZl/aFeZJQIrsleyQfr
         GAlxj18bxdZyB6vsUqa/tFa6/CrJaqAnrrZIKyfB0mprXBY779Yff6xlDV1PBbXw5gED
         hBjQ==
X-Gm-Message-State: AOJu0YwN2WzSiuutv3D3DM6R+AlB0J6lRfW3gMDl8Lg0j1qqthze0QHL
	NG4B2OcbxrFrIon90iN36Ac=
X-Google-Smtp-Source: AGHT+IE/N4S9vPY/r+DhxtCrSo04/7zVTKcdDHA5wSvVchVpH2uKztqqHpdRzDU8P4SPybC3ZOiX1Q==
X-Received: by 2002:a05:6870:80ca:b0:1c8:c803:c28c with SMTP id r10-20020a05687080ca00b001c8c803c28cmr6906087oab.34.1693079992520;
        Sat, 26 Aug 2023 12:59:52 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id u38-20020a056870702600b001cd0f7aeee7sm1788421oae.2.2023.08.26.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 12:59:52 -0700 (PDT)
Date: Sat, 26 Aug 2023 16:59:47 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment to match open
 parenthesis in vme_fake.c
Message-ID: <ZOpZs0/ate0wHt1t@alolivei-thinkpadt480s.gru.csb>
References: <ZOlCJ6uqBf+8HBa7@alolivei-thinkpadt480s.gru.csb>
 <2023082632-crumpled-crease-4b7a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023082632-crumpled-crease-4b7a@gregkh>

On Sat, Aug 26, 2023 at 09:32:53AM +0200, Greg KH wrote:
> On Fri, Aug 25, 2023 at 09:07:03PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Alignment should match open parenthesis
> > as reported by checkpatch to adhere to the Linux kernel
> > coding-style guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_fake.c | 65 +++++++++++++++--------------
> >  1 file changed, 33 insertions(+), 32 deletions(-)
> > 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You sent multiple patches, yet no indication of which ones should be
>   applied in which order.  Greg could just guess, but if you are
>   receiving this email, he guessed wrong and the patches didn't apply.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for a
>   description of how to do this so that Greg has a chance to apply these
>   correctly.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

ACK. I'm fixing it now.

Thank you.

Alexon Oliveira
