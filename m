Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FE1C28C;
	Tue, 17 Oct 2023 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjcvlJeO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso8383793a12.3;
        Tue, 17 Oct 2023 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697533487; x=1698138287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/Hk67Q+giYTh6qT9YmC2zwxxSpcK1axa1hb87I3ZOM=;
        b=UjcvlJeOlPYbQYXpPggpMzhpZCkvX71EA38frbOjYmB8SFwUHslBTu5NRSVZl5Zmkc
         1OSxAO+ng4P+DJW7tjJjqiFiFHINkVe3h6vohIm27z80XFOoT5xzPL08vHlyePWEsx+C
         Cny4uHOG8VtM+XOSnkecu/rtBXfShUIcttCYhZqMgVjmq9Qrk2z4iD/jbl10tcj5Rvid
         CdtqNCaLwVgcc97ngC0/0Z0CR0jeipuml2YHOgzORqMxrY74PoNcMIyFaP5JQmBnS7fG
         p/rlrzrKSe37vKnq/UlMHQk8HZrCSbPuzktU7qcXqtJBWkr4gGPYLp0GLaMDHbZQPMsw
         /vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697533487; x=1698138287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/Hk67Q+giYTh6qT9YmC2zwxxSpcK1axa1hb87I3ZOM=;
        b=QyfExvTW4oyaVa9mlRdEJU/3af3rZm/bjAd8vgbcodTQHmORUBG2Na3LXvGfShBhAQ
         DVThPDGgTSEu87F042pEul4HkilgAePg1+EbsAXhZVqThGk7y86uRbZ7xjTiCnt/+1Na
         Km339yWkD6+/TGDqvLOVFgDxY1e/GWeEPHioJ8eqnd0RZQPp5crWExBEkb3JoHLihsdl
         PGK6PBuccuBDPgZOQS3ITldOeGiTVQ6tR6h3U86//UkCDJ8lKjGe7GOKWvbIJxfk7lic
         mvP/LV3+rbU0LanaF5+pgO7c4Re7RPnrW+3CbpMQMoLPlqTvGAC/2CRarc9BXYPgIW9R
         n8qw==
X-Gm-Message-State: AOJu0YzU3O6Fo2QyD961JX1F/J68itqWDLEUG1O0Ehu0NpSX0wVmYPB7
	wVQMBA3XWzU5frJgyDj1ZA==
X-Google-Smtp-Source: AGHT+IE556fO87GyMGId4qv9PrxSAzYqqPSIlNZ9KTKHH19u1KQ7UVQmLIXEouDr2rZadRDRs7/wDA==
X-Received: by 2002:a17:907:98e:b0:9b3:308:d045 with SMTP id bf14-20020a170907098e00b009b30308d045mr1205146ejc.46.1697533486465;
        Tue, 17 Oct 2023 02:04:46 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id eh15-20020a0564020f8f00b0053e775e428csm798353edb.83.2023.10.17.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:04:46 -0700 (PDT)
Date: Tue, 17 Oct 2023 12:04:40 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: anonolitunya@gmail.com, outreachy@lists.linux.dev,
	julia.lawall@inria.fr, dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] Staging: sm750fb: Rename
 displayControlAdjust_SM750E
Message-ID: <ZS5OKMTY4BDX015/@dorcaslitunya-virtual-machine>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-2-anonolitunya@gmail.com>
 <ZS2sCEF/LsO8Fzk1@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS2sCEF/LsO8Fzk1@ashyti-mobl2.lan>

On Mon, Oct 16, 2023 at 11:32:56PM +0200, Andi Shyti wrote:
> On Mon, Oct 16, 2023 at 11:14:08PM +0300, Dorcas AnonoLitunya wrote:
> > Rename function displayControlAdjust_SM750E to
> > display_control_adjust_SM750E. This follows snakecase naming convention
> 
> I'd go one step further and call it display_control_adjust_sm750e.
> 
Hi Andi,
Thanks for this, I will include this in the next patch I submit.

Dorcas
> Andi
