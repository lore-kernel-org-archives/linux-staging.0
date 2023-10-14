Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBF5681;
	Sat, 14 Oct 2023 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1iWzz0U"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d8164e661abso3183869276.1;
        Sat, 14 Oct 2023 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697269832; x=1697874632; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPY90v//iOlz4xzjpngsgS9qOCgffU46A47kFOVCgRk=;
        b=Z1iWzz0U6EPA3CLc3hEgwQCf+RO6i1brY38PnQ15sgvOWVeAxzB2gff9epqqMT/lab
         nk7fl2tU8QIbquuJf1oDdrrRII1h+Op0YrhRi8N2cV17wPKNfh+b0RLV33Kb7ptxzRk1
         9m1RDTEcWJ5FshSKpHWb4Zo8GZCo6yBCAwKq1orzhlQD/Z3TFNsbBms8oMXVvzqfdpWj
         7eMriLuCaKQs148gnP286vZx1bL5W01N531o0UqZ3kgtFLbyI7rTWOyVTiVOGl/+mNH+
         t3ILKWIt641qOpUctIRtFXCtMbIpnL947GQ2DdOaGKZ3BnzjrMMDqYt0BXsv1mbscPPJ
         ffPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697269832; x=1697874632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPY90v//iOlz4xzjpngsgS9qOCgffU46A47kFOVCgRk=;
        b=HBi+owNP/V9SWMRihZ+2rDYbuZ1Tf1bAHVIpnvy/la1SNMwwJjaQrzjrzyQmoxZAq+
         6gJvzl8APWoUxd+dHbz+dShC1xmrl9yniiAie2aXDS34V2W2s3mzk2T38N8gbzFYL/JG
         6zp+NOUENdYB4l9IlDQKAzk3skyCoEsV/L+LcNquWVX3g2u4g5kAc8175w5LS3BVZXTc
         LhanexTUcNl9SsXgHVwFIIIWNVpM222uEo8uSLGPzj72zStvT8T5umh//1bg6+IoNWea
         4Z+owTi88umJP4GqOyn0RAkds2r8uMcjIuZm4gNyXuLCuYwHgTGUud8zoUZ5/tPyTvpa
         Rkfw==
X-Gm-Message-State: AOJu0Yxafb4WWbZrDhbhp508JqF9CQ+wP8XzbqURU3lQhUKud8k2+30i
	J10K1oeYI4VpJSfLS2hnWLs=
X-Google-Smtp-Source: AGHT+IFht9Pdhs+YTaM4rxnXiM2VmkWzCxyw1wFLf+EfItgEJyZaPCjpLfoN989eNS/y3/xAN71mXw==
X-Received: by 2002:a25:c702:0:b0:d9a:c946:bb47 with SMTP id w2-20020a25c702000000b00d9ac946bb47mr6793962ybe.5.1697269832173;
        Sat, 14 Oct 2023 00:50:32 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id 81-20020a250154000000b00d7b8a1074d4sm1042967ybb.57.2023.10.14.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 00:50:30 -0700 (PDT)
Date: Sat, 14 Oct 2023 08:50:22 +0100
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Add bool type to qlge_idc_wait()
Message-ID: <ZSpIPippZFtMw2aG@gilbert-PC>
References: <ZSoxLxs45bIuBrHg@gilbert-PC>
 <20231014065813.mQvFyjWb@linutronix.de>
 <20231014071423.UgDor1v0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231014071423.UgDor1v0@linutronix.de>

On Sat, Oct 14, 2023 at 09:14:23AM +0200, Nam Cao wrote:
> On Sat, Oct 14, 2023 at 08:58:13AM +0200, Nam Cao wrote:
> > On Sat, Oct 14, 2023 at 07:11:59AM +0100, Gilbert Adikankwu wrote:
> > > Reported by checkpatch:
> > > 
> > > WARNING: else is not generally useful after a break or return
> > >
> > 
> > What checkpatch is telling you here is that the "else" is redundant and
> > can be removed. Although your patch suppresses the warning, it makes the
> > code messier :(
> 
> Ah wait, after reading Julia's comment, I realize that the "else" is not
> redundant at all. Seems like checkpatch.pl is lying. So ignore what I
> said.

Thanks

