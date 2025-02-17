Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607D216E35
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799099; cv=none; b=jkNcRYJNme9JlzFdQluBcg5j1nDH0Q7tOKA8gb484E7ARP9paqqIHiDezb8htUiAP2AkUcEi90MZfp18xrRawq+6vsNDgOo/Ds99lglGkQQ1yry5IN8sJGyI6RqE6syMCpqMF+aIoV3qwHMWTFmkHXScDO34Ah1mvARkSdVo8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799099; c=relaxed/simple;
	bh=pfta4Pm4pk5IpJlxB0EEt/X0m5YBmHer64jfAMzh9PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6jkZd2XGI6zYGXsW+TL0GVn8KTd9fCZPifnB36mZQuqxwiMzyoCXYN0fEaJ6LxBSxOgTFT0JxuEBR2He4N4l/zpTwrfiDIDGsMu38jTli6oI2IXah1krl0zCx9ljiAqPKLeyEUgV6syR0wVR9x0mwlQazAtelgAurXVdTBUrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OodFbY1B; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OodFbY1B"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso675833366b.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739799095; x=1740403895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HePxZ4NzY+6vqhU8FtuMDirnS9ZXHHg6wU/jN8842aw=;
        b=OodFbY1ByvEhvQXr3YEvLK0EhExbqAkR1QL0OGrShur2IWEQlq4W4zeMi/ux4/CBIJ
         rrbIbcP7pP99tZijr/0DzDkxUYFmZIkVwxBdfTs12AqvtwafJvrzivPfsTI+pDJIQYS8
         GSL3glc9vz1wT41b4VK5G2irdGdmCYu6d9xZ43PRp9ro/7jvcr0E+2z9066YOANu4flg
         ktdgQshciht+CXww0VfRRAXypXV/Rkkpd2gt35UwEFtcQjq8asHll8AO0yp/38e4Q79L
         gQiGszUZbO3HGdlKnNZYDO4kJ7zWGlruUxuvkS1GzKKl432slbT89wcXjXwkyU29KIqZ
         O/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799095; x=1740403895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HePxZ4NzY+6vqhU8FtuMDirnS9ZXHHg6wU/jN8842aw=;
        b=LJF5jx5L9A26moeo6e0zXsx4W8Mq0SyDdZTeRN9GYRY0xGxOGBP+LEILQ6F83tOHAf
         TcoPAzA6BdpgKWr57HXFscVtHrCOOvnGskIYe+pIBHKrUn4MEDGnJp3r7ZrctLcjHEt2
         hyABr41FkGwU1N7EPjS05DIWf7rjwlOAG+873fLC4aAYGNOt/jjTLZylwc9Wbgb/oRnt
         bBTkEXlX6DjjWr0TiLFPi7+lQA4DwlYZVLSVLlrs/RaQEQcDbNd5VTInm/PBdZggW5cI
         za6aDzH/oIP9AvGYMZ+/SpcqlHHLCnD1cihyp3/9J3MCktanYTBrUt6s1kC92TRZrf6Q
         XeOg==
X-Forwarded-Encrypted: i=1; AJvYcCUl+OgFrsmS3ix02RnR/kzr3Vv5UJGdvJ3AAY5cXwbcYF5n3sGOelkUc0cuJjKdMgj3nxGzgSH5mqnAk7DS@lists.linux.dev
X-Gm-Message-State: AOJu0YxlSVMBGEKrXb65d4SiAd1B5m/MCB1Cyi8YWCGcxDcERrCLztz7
	Hu+wslQcO8A6huyFiDl0h0moqYhG5KsXo+1u/pBfdoEvWGUKue0Shk+BmdRdGLI=
X-Gm-Gg: ASbGnct7B2Fjt/p0xKjnuNGx0nVCPsN8PGpuliPIV0W3B512rmyRUnGu2wEyCTa6hTq
	PPUkN+saI3oSZYvH5SBROk+N6VDh5MnrOutG7XvI8fE7jUPOSFyqFs7hueUoL/dRHul0fv2bgY8
	mQ2GojmnZdgFCwfJjTE1hXJK0soc8JkpZN79xos4A0rQlRuvJPuWHj0SYAgmyC8BgB7PqQlRL/T
	SIN5hmUJ5peL2vLfd2tGOpvmpuB65jAbPFeFSS1POH61m6HmdNKLMoNrRN8ulStJaiWsh0OM5SV
	Uy4tQ/bG0tbraTb9cz4E
X-Google-Smtp-Source: AGHT+IFh9Z5T9/NZ6mle03lBLTwxdm39QVeknchTQU0+AZJXPlmONlIdxst1Xno5kyJLM8pO7oAAVQ==
X-Received: by 2002:a17:907:7842:b0:ab7:63fa:e48f with SMTP id a640c23a62f3a-abb70bcb84emr885152766b.26.1739799095507;
        Mon, 17 Feb 2025 05:31:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb9751553fsm241554166b.86.2025.02.17.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:31:35 -0800 (PST)
Date: Mon, 17 Feb 2025 16:31:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kuba@kernel.org, rmk+kernel@armlinux.org.uk
Subject: Re: [PATCH v3 2/4] [PATCH V2 2/4] staging:gpib:agilent_82350b:
 Removed commented out code
Message-ID: <629f57dc-d6c7-48ca-8b05-f1d0169eb454@stanley.mountain>
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
 <20250217103046.54294-3-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217103046.54294-3-kumarkairiravi@gmail.com>

On Mon, Feb 17, 2025 at 04:00:36PM +0530, Ravi Kumar kairi wrote:
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> 
> Removed commented out debugging code to make code look cleaner as
> spcified by TODO
> 
> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 5a74a22015..7936c7285d 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -176,7 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  
>  	event_status = read_and_clear_event_status(board);
>  
> -	//pr_info("ag_ac_wr: event status 0x%x tms state 0x%lx\n", event_status, tms_priv->state);
>  

Same comments as for v2.

You're not supposed to mix delete comments with delete duplicate blank
lines but at the same time, you can't introduce NEW double blank line
warnings.

regards,
dan carpenter

