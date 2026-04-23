Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910740DFD5
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928643; cv=none; b=Gy1tC2mrSv22+MYLSyM6/TBZoSnEnS1L1q1ZAnaCb1+ERi4K+JaeRGN2US6ngRJC2xGsDffZeMMfgvVnWtDV0xvWawioatsogem9gQ6RJ7X4qdy+RH/9i/fCXQm/RVTLEXimLXFeQ+YpPAuDu4SV6zVtJ/4RBNXeDYlneY52qZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928643; c=relaxed/simple;
	bh=zqTtblBgVBvR4PqgE3QaoFiL53X3HfCSi/tlFkgspTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6wmbjZAYok7QNUHI1LotbT2xogr74aVnPprGgQ47xA3TE/Br7PX75ZNp4hMJpEm5+Uquao+6bvnBJ5aIRcUA5JRmXvtoBkqiJoHdllRiO7Q/umnom+GEmam/DFbVTtkK6zMn8n76yl8yKcAxUKQ4BWTxsTPRTjFsuMfLym9GdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jca9x0EI; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jca9x0EI"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79ab3e26cceso57625357b3.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928641; x=1777533441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=jca9x0EIAo+/PC07/ek+goIXTbHihgCyRlGyDC//rOCdlBJXIMahU80Y6JoB34OmYz
         OjS1MdmixRTAJIvdNWxzslfDFSeTzZClqf7pB+F90yVUr3QBxJ3b3Tos7ejo46rJC3eI
         H3mdzh6F2Q8ERH/gvhVeMJ//bSCmWAwszsaloYSlghTw9JQkylvkrHPfeYYSQs14QQTY
         peg8kK5mqwsv9rG8j8nyH+GMnHS1SNgo72vXAeZmgN2HCAigrNJcZthdfxyAISQuxv5M
         xS7Z24lrU7ypKBWNrYGY7Pu3S5Evll6cuVcdvnP2VBm+AGnX/S2iqxeDjMj+ajt3DhUi
         k20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928641; x=1777533441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=aFENaE9yNq8PXJw/fcH0Co0x5DKkx3Vy6w8YquYD7RcdplJOlAJ1su6CzvCLhYW++6
         V7XnXY18PJ8NgSB0nWrL6XslQ/GJ8NE/BMSEnjTqLKxeIjuNWUeCPXO7HlQnjm/v5+5p
         h61rW4+wtbmbUBI1kapYWfbCMu+dVFfbRLuf6pro96su4gHpeBF61I0aZl03XGH+9MAe
         Uq0Fm1gc68jSrThazaODvyCsOHm0ACPLxAmBGTfBcljWpFvsAJ7/Sf93Tm25GjcbXlaI
         Ij2bGOUQdpFZMQq4hPEnC83A77PRy+jSbPiR+OhOsi/2kW6pbDDIvKQYnlyS8o11UhiD
         +E4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jKOhhY2JYfXB3iYrBC8kepCHc70znvSfVsIslVvCC28eWiG4Yf1vb94sfadwBbRVzMTikq/tM0DBcGq1C@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj0J5NnfTH8jPG/TxDobb8/6a3BZOngW/m9glzCQc4IUKDdB5G
	FcSfXcIsDZqbLNnBP5raEQsBxq+2F47hJh+ctr1BcS1fwtbw/hJzXxnL
X-Gm-Gg: AeBDieuZN4tQUGVbGG3/BkU2Apuikn95SXIqODXrldiklxemO9/zJyovSzKw6MC17Mt
	Ujj+GpdSnOj7A5uMoz64S8aWN22VGuhJWDcrl0KUrQZRyolNfc08ksGRgYUjpcUhZh/UNxd4Geg
	iHAyMa3hFH23Wf6js6SvvZ2qGa5gZtFKynW9xDwEObYdihDFfrpTukpxVpVTM6L5igq9hMFSY40
	UQAC43zgmPUV3ClcOPL06Z9Tuz3zlaX4ZLKYye5pDlM6XzemcnUKt99YaTHm2OcifFNGIjPYO7o
	vdg6F//94EV8lNKYSnv8UvnAg8uPV5bFPvzDbYddZlI5EimQcZNyeEkRiqzBJ1pEwx4iE3BHVc5
	F9G7zNoGDmWoEg/vyvNnir/do/22AABSSD+QT15uyDPfX7frKIVZJcn8OSFR3JLIxbpGymcY7MZ
	beZZXhSRwPLXHLXLbo2vKwPucDDGFU
X-Received: by 2002:a05:690c:698a:b0:7b7:fb9f:e9a1 with SMTP id 00721157ae682-7b9ed0279c4mr260079227b3.47.1776928641023;
        Thu, 23 Apr 2026 00:17:21 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8e2bb7sm77076787b3.22.2026.04.23.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:17:19 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:17:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aenHeWS4y8iLkMAn@stanley.mountain>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423060246.296986-1-robertusdchris@gmail.com>

On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> When calling ia_css_pipeline_create_and_add_stage() function, there's no
> condition to check whether ia_css_pipeline_create_and_add_stage() throw
> an error or not. So add conditional check for the return value of
> ia_css_pipeline_create_and_add_stage() function.
> 
> This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> 
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---

You need a Fixes tag.

regards,
dan carpenter

