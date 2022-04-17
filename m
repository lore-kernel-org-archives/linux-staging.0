Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DA367;
	Sun, 17 Apr 2022 20:42:04 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id f14so543880qtq.1;
        Sun, 17 Apr 2022 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=siAKpMcN2i6Q5zwPWMFzdjMytkBZWIwEIG4ky16AcDE=;
        b=POT4kupDxVMVYxPM9uQ91fxJF+fbbvfcfAK6+sd4/52H+jBSq/EHv+JVS201vbVhTI
         58Ziu9h2KBrJMhG90YOixxlX5mFL3miqMxgkP+CWBQmQKAYw7uP7dvh/SlG/B4A6LQE5
         4hYureZf3iXY1B2JOyjwnaECwkaY4YxS/y/iy6ffD4rXUv9jjcZDklQfkTs9VCQwltIl
         17ZqlOOG+da029OX07OoI8PFbmvzBVo1L5bINDSoU6FvtCBbTAsJeEUYO8jr25hs0tE3
         IJk4sYY2cm5icEDjZ9MGfZa/Sbe9xyCgf7w44s50LieRSLt1SzdelfYd4SSCWylHAear
         YhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=siAKpMcN2i6Q5zwPWMFzdjMytkBZWIwEIG4ky16AcDE=;
        b=yQdeG6sXyeKFUYFbDcwkLgw2Y+yOftePp7ySCDEOBSr+36s0A7g5PQAkYCC/O1NHRg
         87qQNU8B34UTuiNA7xKsfcguDUBb4eZFgP9yndKtAIcvDgcbiq7n/oD4gkcc5oD0GKYf
         yu53n3ASee6vI/Ha8brXwVs9YeWoh1i7ZviPX8FmD1LGMoTxTeHSssgoeuOVmZXAh14P
         XyW4TIaKP/y3frcT/gxiDH42OgLJY7mW9N8qBBlvNlr5M7iTVeDwV0gmaXNfc5Dmj6AY
         kN1FkCNmB34jYgdwSRjqnKgBE5ICRXElzcDxFnShRlM93vkxYlNOZI/6eZnl4gIPLkPk
         FURA==
X-Gm-Message-State: AOAM531voSLtvRKYeBXZ/jLBFQb/LRxXkmtJdhtBqCvyVjHJKdPSL8cC
	F/8wkSlcqjP7DgkidBRDIxZDdRlbaM8NMsW5
X-Google-Smtp-Source: ABdhPJx0kCkCJfgKcw+kUzw+Q6cJHzf27oLCO+xIYKc13wBBsro0rB/QZNqK5Xbf9vslD4NrwrOWAg==
X-Received: by 2002:a05:622a:1109:b0:2f1:f7e9:1b3 with SMTP id e9-20020a05622a110900b002f1f7e901b3mr3868301qty.671.1650228123726;
        Sun, 17 Apr 2022 13:42:03 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50e6:61ed:4df2:ed9f:52ea:476e])
        by smtp.gmail.com with ESMTPSA id y20-20020a05622a121400b002eefd7bf5basm6706502qtx.63.2022.04.17.13.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 13:42:02 -0700 (PDT)
Date: Sun, 17 Apr 2022 16:42:00 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2 1/6] staging: r8188eu: remove unused member
 free_bss_buf
Message-ID: <20220417204200.GA236965@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649990500.git.jhpark1013@gmail.com>
 <e41e0d3b62395d04f41d6934074074c431e7aacc.1649990500.git.jhpark1013@gmail.com>
 <3608313.MHq7AAxBmi@leap>
 <20220417201415.GA233554@jaehee-ThinkPad-X1-Extreme>
 <a28f445f-f088-620e-6baf-4cad3e1a8146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28f445f-f088-620e-6baf-4cad3e1a8146@gmail.com>

On Sun, Apr 17, 2022 at 11:16:38PM +0300, Pavel Skripkin wrote:
> Hi Jaehee,
> 
> On 4/17/22 23:14, Jaehee Park wrote:
> > My understanding of Pavel's response is the free_bss_buf member of the
> > pmlmepriv structure wasn't being used anywhere and that the
> > rtw_free_mlme_riv_ie_data function frees the memory of the pmlmepriv
> > structure so the second check is redundant.
> > 
> > However, as Fabio said, the free_bss_buf member is being used and pbuf
> > memory is not being freed.
> > So I'll revert the patch as it was originally (which was just removing
> > the {} around the single if statement).
> > 
> 
> Why just `pbuf` allocation can't be removed? This memory is just unused,
> isn't it?
> 
> 
> 
> 
> With regards,
> Pavel Skripkin


The free_bss_buf member is unused. So it can just be removed right? 
I guess I'm confused by what Pablo is saying about causing a memory 
leak by getting rid of the pointer to the memory allocated by pbuf. 
Sorry if I misunderstood. 

Thanks,
Jaehee
