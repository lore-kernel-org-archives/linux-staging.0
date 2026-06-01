Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE43BB40
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312156; cv=none; b=oHpv2owEfR/WaZC57pw3glGU/ltQqpNnddWH753vmclBcMuCSaKNBNCvNOCPtEb/802G0fg0u36gjqK8eBYJB7TvFrJWs976T6FEQvdDQ+Ynwc0hTf6XsSn7hs3Kub8/WebLVGN10As+MapOla7thGQXB34IXltO02qWzjnGbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312156; c=relaxed/simple;
	bh=QpnjQudDF58V1/FPsPcDplOMFvOALDVksNq/0qRLSds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alDlfLBZzf/1uAAu0AquaimvKuxM+yRJzxYM/OMFalbOjszCOaPy6IIh+mpeg9ZtDBSAHznrsD+wiHtFmqiQ/UbEAHuHGWvKCHV5C6g7TCFUIMBFX6y/FN1vxzR0PkyeSkhz59aQmRlQbZuAXeGbgvSqVuVeMTvB7D8y6xq3fA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL7bcdqQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL7bcdqQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-becfa735b9aso138828966b.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312154; x=1780916954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvWyF+YOv3aLEiatSz6/qAj4smg4GeRiDdaf9XLf71g=;
        b=bL7bcdqQcnSOs78jr5oyhT5WYpbBewDHF7oK41FbUVNv/ZCy+9TG8OeUgxvUZbDohi
         WkJL4nPv7214cGrLdYQboVAiu3+jf9b6Qz1XAco5Soz6L3+qAXM4dn/ujnuegf9ZhEso
         gXLoR5U6MylsevPF7w0SimwFS6/EQ1s+ShoINXvLiLInah3W2XszjXCAkN78tGwl2tY3
         BuyKGUyh+RCxNlPK3eu3FFsGxaE0W24cwopaPFtmTohPQEtLzT5tn+DYkN5q01422qfI
         98ZwRwWMKJU474p45oicQCAGlQMm+OaFL2wQdxqwSxQw8zzBkAiWAyoZAjEYQBSxptdl
         3d0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312154; x=1780916954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvWyF+YOv3aLEiatSz6/qAj4smg4GeRiDdaf9XLf71g=;
        b=ssNHXEVPnTKqKXoXTtysCiI6gCtjbgrK2O7cthyIjBKzoRztRGgJd1sxzx+1TN9rmM
         qYkDflV0mqfBGtGXhB88Oevh39Uu+gk8BfO+53quSdiDe2Us2bkP7o6ZLOLwG4TZ3qAg
         2PvTOvADtfcn6IjzYMW3Rt9gvOhv8lJCZIk2f65bBkdCdShCAwce3oY/VANAfvdrso6j
         /vw5fEvJvMvJrZeEh+k4ocPl1r7mmOji78BegaSWrbWl+2RXJRj96FrpfXzKst3YO/Qb
         yMmf1VfTloTwV7b1u+EXMnmE//pjuo4LoFWT7pyhu9AAMBtVGYyfBTmzG/pz+OEdqZx9
         yjhA==
X-Forwarded-Encrypted: i=1; AFNElJ8lS2uZLqJ9vlPhfZMujSayI47IAQm6wqdMXX3PV3IB/7wSD9N5TVklCcyOUoczck/qdcSjWEnwXcxhH34D@lists.linux.dev
X-Gm-Message-State: AOJu0YyIDSY0q9Fa5dAEQWQyPHKbjdkY8YjTtc7YRd/OjSOEwlPG01Hk
	/3mrPKXO/+mZZcQtk20AZLnPhbRFIvfhgz0OqkHGgs/HMogMsvjGgCp3
X-Gm-Gg: Acq92OEcvaAbAdHZJt7C0hGaD3fCuoojVst4Z32jLg2gnm8aFs6epblLJ2xI/7cY/pe
	l0egoateI46oWLVP50ZLJ+xyw+3Z63PG8Q9Zlhc0u11ARftudrCcv1Pq2NEV8M9KcHJd7LmiPLm
	91xWb9IFXmTszo9tYaVIpnvra/YGa4LlTwB6+oQt5QPCAxNF8S8xc/Dn6jy0kOocZtE0HSfHs83
	bzdZPsOO6vTN8gW+U5tJbwKIKyn2wTGjoHZE4lRlW1yuEdjHXY5Nh3545d9zF8VLFxr3vDN/rpy
	xCrQ7/Ft4k5o2z9Cn7cBsFFXSWugvSD3iAduk1iX5wJfU1Li/ILFaF82QvdjAXXqLOftDetnZHg
	0y3NhN623p7E4vrMc2PusqcmS1j1t4IUA0yqOFWb7wnbKpPKt0YtxHwdWkXpTfDBWLG/QkTglrV
	Aa5YhrXtnpGTipIg5qCSJZLuFFU+Pnai8VQg==
X-Received: by 2002:a17:907:2843:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-bec64e37d56mr245047366b.24.1780312153930;
        Mon, 01 Jun 2026 04:09:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed94f9f82asm78921366b.20.2026.06.01.04.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:09:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:09:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove duplicate init_status structure
Message-ID: <ah1oVeRAQMeaLJN-@stanley.mountain>
References: <20260530222432.4303-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530222432.4303-1-dennylin0707@gmail.com>

On Sat, May 30, 2026 at 10:24:32PM +0000, Hungyu Lin wrote:
> struct init_status duplicates struct initchip_param and is only used
> within the sm750fb driver.
> 
> Replace the remaining users of struct init_status with
> struct initchip_param, remove the duplicate structure and eliminate
> the unnecessary cast in hw_sm750_inithw().
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Looks good to me.  :)

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

