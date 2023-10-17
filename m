Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583E43A84
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANa2DXWs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c9b95943beso47999775ad.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697552599; x=1698157399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8x4u3Tgqxm/wT15hbhSA2dGVONGLw0lsKJBjy2cxi4=;
        b=ANa2DXWsez0Ptvrfa+G5pWxY9nCjlxm2Z7t+4d88yxSF7haXCaO6ZMRVUioYbBSMHA
         F+LJg4Q05E3C+ZVvzWKy4NddaHSYyGI1mIQBdgXSBw3bS85wwzVgDovHYzkufXgSlZSU
         J5zmGHuih2eF8jIB4koxrtK6fv20rfKhpG/UVLvVqTFX+NY2b5Ctlarmmfb5x2ARytWS
         alQV4A3Pi9Fv9EgapzhtxHM+NItzqk9I1vXDXq+xtXavb+AAvQ/ewnpkBWcC0cFocrQO
         51VCuQONPllkwOoPGzZNKoMzi7FdSu5iF4BVTPXzuxnlo2I09PON1Dop/4xR9Nxd8eoQ
         kioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552599; x=1698157399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8x4u3Tgqxm/wT15hbhSA2dGVONGLw0lsKJBjy2cxi4=;
        b=GLj1a2fR+iSkDWfz74wBZtR02hSdCFKdb6xq5HUNnaTWJ2xLrKQm0UPUT2IWNUeKue
         WwTnESKZAXgbVNzxGiezzwDs9w7mMX4uKEhjyVI3X/0jgcJsgSJDgsQbqgukTmtP/OmJ
         hsRHLLgnWkI/21V4Fc+J9kIR61A+mgpTAxX71bWNTaI4JwNAcpnnKEFt1mcwb+WLyPbd
         j9103MOLySryyvQvWGoeTnk6KuJPf/pXkZsbbJZ6chn6u1tL7sM9SahTE2cpQDsPnTun
         36WQTRR0yqgRMzLWr2AtlGIF6q/Hbr2SsutkzWDiiPTgAnkHICDOhxvTIOAC0h3ao67Y
         2+xg==
X-Gm-Message-State: AOJu0YxshL4/XR2XejsSu8abV5jrzlHWL5Hbnf4o65gJxErqB2eWVOTC
	j7WIMplNQuJ7s8rz+Rh1uMQ=
X-Google-Smtp-Source: AGHT+IGQ9rbPOMmVl+v2/m2m1wjMd3AyNTDDOmysGd0xpq/VkIt4k5dwSI61dpmOkHe71FK+0u4lpw==
X-Received: by 2002:a17:903:1cf:b0:1c9:d46e:d52d with SMTP id e15-20020a17090301cf00b001c9d46ed52dmr2487529plh.64.1697552598729;
        Tue, 17 Oct 2023 07:23:18 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001c1f4edfb9csm1606814plb.173.2023.10.17.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:23:18 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:23:13 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <20231017142313.GC3156@ubuntu>
References: <20231015133558.GA5489@ubuntu>
 <20231017091814.GS1751252@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017091814.GS1751252@kernel.org>

On Tue, Oct 17, 2023 at 11:18:14AM +0200, Simon Horman wrote:
> On Sun, Oct 15, 2023 at 06:35:58AM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Prefer using the BIT macro
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> 
> Hi Nandha,
> 
> I am assuming that checkpatch clean ups are acceptable, perhaps
> even desired, in staging. So this patch seems appropriate to me.
> 
> I do, however, see a lot more potential uses of BIT() in qlge.h.
> Could you take a second look?
> 
> ...

Hi Simon,

I will look into it and update the patch

Thanks,
Nandha Kumar Singaram
