Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0C2E5B19
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854776; cv=none; b=H1uxUm71sJODveFL3H8z8OPjizOwvJ2Q25nxd7nFXTlNu1ucJ7bmHubNEkMTydogBTTWEZE6ro9hj3iViFuDoPhSwXwDa4ABNN2gu+LY8eX6ZF5pmpIUBIP+CUoEBKppOOf1vGWUmn+L/6TTD722u4y06KX86tPHnMGRJQmA3AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854776; c=relaxed/simple;
	bh=ST8lcJ+2yDbKpXgUqoVEvCsnKZ/+vATfwEWuT1/oEC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHZn5OUSVaVS8EZia0GYB3OiIx1EdrDIyErDOty+7pwYjRMRcYjtbJY6htIKPbojjjrb/HHMQtw/EKXV1zVsW65WoXrX5ZTWq5rsePTxXoqsSWpJ5UnueAt+p9T44W1s1PVB/Ko+4YyfkVvYcWmklco+F/auEV7/J2sX2ALQSAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ig00fovu; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ig00fovu"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6159c26766fso1021318eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752854773; x=1753459573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Q1Nu3K5LZZ1ceVlLq9+6xcxFVBX4qH4aUvmo3kZ28=;
        b=ig00fovuTQ8x8FSOnUPs/UJxUe+NP5yVo2uttosWafyDvnggDC9VfaZMZzA+f7HfjL
         qDDsZuB0B5hRfF5BrLFIL5BBkU4cCipoaL0ePV8EEEGOx+HFh5I8/XFAnredZlBC/l4i
         tyCgujnxBNuFBul8SAq1urUrVAktp9O85b5RwaWlRd46UTAYQEIbTf3pbIQSIN5KTvn7
         gMn4hAM7ykmRq4pMsxYqye471PJzDkcCsbBn4P3lZB5ncveJXv14KdQfFT3P3dslbxnJ
         DnwIVX0uMup9ueyWZ7VaN7l6jhI9ieRIAetCeTTmJnh/931Rq7ladhkoVIIrlglO/U3Y
         hUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854773; x=1753459573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Q1Nu3K5LZZ1ceVlLq9+6xcxFVBX4qH4aUvmo3kZ28=;
        b=sJ9v+kwKaeQv9OKyWCscudrEwEc9eB4RtItAcFBcADHvQM6Nwdiim2S4/POfYzVQzC
         w+1BGIzpgJMmpGwO1DrNt7nsipDqAO8EezA8D4fzLMwAqxBlj59Ip1K2zSpz2ipUVhvO
         WLwNuhjFe4ozh00CVo9pt+Dx+oLR/fIyXDy3NktpYX3ZwTWvu6UmHD5l1bJCR4OhmRVn
         YTSmUtDumpuu4n/GbrToYp27xZY6cXqzajHY636bsnw7U1uBUXI6sVNDIGaGAH25Rah8
         QY2RNvhkpLsn8cemf6Inmxh2LD1+lIejN/7Yh/NcSzYWqZAirewy0BlB34/lpBvRNAEc
         iFdA==
X-Forwarded-Encrypted: i=1; AJvYcCWYRX92Ui0c3hfR55jvDEllJKmAeSqH/cXI5dMfzs+GSwGmqyBtl6dkNhReSqKRHv6T3O13K9AIgB41iKUe@lists.linux.dev
X-Gm-Message-State: AOJu0YzsBHrLD16qMD3YatOGyAkf83HlLIQwdPc1mtvkyJ0lrXPa6MqT
	gi94WHkOgzqcs1GdjwCD2O7OacpM1enxfNdFwSieQdwIFpkbPTjJIvzGR/rZzSqHPx8=
X-Gm-Gg: ASbGncsoTMvY0kwAEvDggx8v9rfFUGNqVU8mz6R/A9wUgr3LdzcaGFzS6Pwrb4UbQlf
	DwJ+8RuKloLHGLWhWBnLWbvq0CKPvW1bbwvklU2lxjFHdSRzNIiLVNslTPGm9g5ckMYUA3NE8tO
	AsnUxgu5UDlz85qATB/tLct55wz837xhr8ikJDWiqUktHc2YzQwAWyLv8m0fH5BNOfo08YELqjV
	qX5/Q2iOWHSIfZOj4MdTyh4Q4cUsenYkqZUHIdCsq5tJuUycgBlCxCQe8QcbRywM7jAd3ijg8Rx
	4jbO663MUut+joLPsT37NLXHvQUPa71i174NgnsXS/Njlwh78ehnBMcsz8s8VXA+wICUg7j1IFy
	RPC29WVRA/foDuCCLCiSQS6KCAcDZBg==
X-Google-Smtp-Source: AGHT+IGeuPdqUEt/1o9qCSn3JuCLxLBD7G98jAwQVyZLgiGe8We//F5qCqqXh6NWoKStNnOYX7sQDw==
X-Received: by 2002:a05:6870:f603:b0:2ff:94d7:b006 with SMTP id 586e51a60fabf-2ffb2251036mr8483664fac.13.1752854773078;
        Fri, 18 Jul 2025 09:06:13 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-301b01d2df8sm228752fac.31.2025.07.18.09.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:06:12 -0700 (PDT)
Date: Fri, 18 Jul 2025 19:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10] staging: media: atomisp: fix indentation in aa, anr,
 and bh modules
Message-ID: <8f7db034-6b38-44c3-b841-ef4bc1db3973@suswa.mountain>
References: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>

On Fri, Jul 18, 2025 at 11:02:14PM +0800, LiangCheng Wang wrote:
> Fix tab/space indentation and move a standalone kernel-doc
> comment of the 'strength' field of the struct ia_css_aa_config
> to the whole-structure one.
> Align with kernel coding style guidelines.

There are too many changes all at once and some of the changes are not
described in the commit message.

> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..488807a161b9a6ba9ebc4a557221cd21bd1df108 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> @@ -16,25 +16,21 @@ const struct ia_css_anr_config default_anr_config = {
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
> +		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,

No need to add a comma to this line.  The comma at the end of the line
is useful when we might add another element to an array.  But here the
length is fixed.

If someone were to add a comma here and it was new code, then that's
fine.  But I don't want to have to review a separate patch which only
adds a unnecessary comma.

>  	},
> -	{10, 20, 30}
> +	{ 10, 20, 30 },

Same here.  This comma serves no purpose.  We can't actually add
anything to this struct.  What would be actually helpful would be to
use designated initializers.

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9..3de7ebea3d6e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -11,14 +11,14 @@
 #include "ia_css_anr.host.h"
 
 const struct ia_css_anr_config default_anr_config = {
-	10,
-	{
+	.threshold = 10,
+	.thresholds = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	.factors = {10, 20, 30},
 };
 
 void

I added a comma to the end of .factors because there is a 1% change we
will add a new member to the struct and it's the right thing to do.  I
was already changing that line, so I'm allowed to make tiny white space
changes like this.

But notice how I left off the comma after the numbers.  That array is a
fixed size and nothing can be added.  Leaving off the comma communicates
that.  Also there was no need to change that line.  It's unrelated to
using desgnated initializers.  If you added a comma, you would need to
send a separate patch for that with a commit message to describe and
justify it.  As a reviewer, I would need to go through the line
carefully and verify that none of the other numbers had been changed.

The commit message for the above patch would say, "Use a designated
initializer for default_anr_config.  It helps readability."  There would
be no need to mention that "I added a comma" to the end of the .factors
line because it's a minor thing that we're not really stressed about.

regards,
dan carpenter
