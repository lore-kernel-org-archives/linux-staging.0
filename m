Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFBB79C7;
	Tue, 21 Mar 2023 09:29:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so3921016wmq.4;
        Tue, 21 Mar 2023 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679390967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7V4YovgUrJnyS5jGoDPlqc+Up4efo2jPaQdP4esL6/4=;
        b=dzkh4NaVpXobT1dncaCScU+b53LnyrnIem3yeQcfkJE5wcNPPwbD/66xaSet9fpVwm
         aEhSlY0Xw8wN6Ga+UauOPM4iRwqLoLio9oVK4tYNANdm/B6psi3wxk9hZXNZ7MI9xljH
         y1tdyMwUih90dGue6fwdjYJawL64KxTVf1lZcdT4OwurVVfh4jl5zjax/S7VuNa4tCiQ
         4mDjteaFXJ+z/MdwCBWhzOCR2E9EYWiU8esueEqLTLhoFoRSD2ZLRl/uppLKZqI11iVb
         Tt95AEkxqJk4iH6RYv/gxjhO0C3CSNxvksNfrDtOC+JgBwB+ANWeZe2AU+r2Z1V8Cw6W
         3mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679390967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V4YovgUrJnyS5jGoDPlqc+Up4efo2jPaQdP4esL6/4=;
        b=VFgSt/w+jWcX63GEdhS+qI/zd95mOdcPirBXrGFq2RMunEpQE+VTLCSF9HzKOS71SJ
         +SxN2jwBa1ew5ceYWd+XbFTSPDmD1YcC/JotJWk0Mfg+r1NVpS+AceJ38vcJDrOnXf4E
         /uAE2f9pR4vGDN/JU30IjXb0iV7ufGBRIOg91fGwpk2FEFCxboaaBAKQv3vKAnXlXunO
         lINh3Z4HvZbifVVJH2m35pYjMNiuJGVd4hZtOw1Brfvo7CrZp1oo4TM9CE/nGJXd1A2w
         gJDMBiqrXaAHrJYD+ZB8ZbASHPkrnY6UYKZjOpoWgm5ivVs66fGAQibmRPUZxWsxoMM/
         Jp+g==
X-Gm-Message-State: AO0yUKUvVbIMvqlSLIdjUa9Wb8vL2skPTrUSB6uQDIbkLpBG43tk2Q+M
	O0q9qbXI5AL5iibBubYqJ6O39S6yWrRWJw==
X-Google-Smtp-Source: AK7set9nxVCClOMAhcmwP8gqhalKLS/ur/Euy/AJPvWmtQdLC/8ERdbphzmCApTadQF54MXrG/1hgw==
X-Received: by 2002:a7b:c314:0:b0:3ee:3b7b:73c1 with SMTP id k20-20020a7bc314000000b003ee3b7b73c1mr700827wmj.28.1679390966741;
        Tue, 21 Mar 2023 02:29:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ip24-20020a05600ca69800b003ede2c4701dsm6721744wmb.14.2023.03.21.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:29:26 -0700 (PDT)
Date: Tue, 21 Mar 2023 11:37:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <c561746c-6061-4c8e-8961-114a507d72e9@kili.mountain>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
 <ZBlov9bVs4pAJIlA@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBlov9bVs4pAJIlA@debian.me>

On Tue, Mar 21, 2023 at 03:20:15PM +0700, Bagas Sanjaya wrote:
> > 
> > - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> > - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> > - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> > - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> > - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
> 
> I think from the diff below people can see which exactly functions that
> are renamed, so the list above is redundant.
> 

I like these lists.  They don't hurt anything.

regards,
dan carpenter


