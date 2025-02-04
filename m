Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB463D81
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646914; cv=none; b=QljWb5o8bXrmj14OKD1DOOmFDwWsloV34H72GpmL5i0cmnLvBB6q50q5rgkq7RJT7w6os8fOqTZlT01j5Ydeyj1Vz4PSQiHXybvuZUNf6RLAONXn/LCMqzX3UkN5Ke9MiOYffDynIdAAaLctThJVOW7AP+y5XLXL+zR330uFASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646914; c=relaxed/simple;
	bh=x2xZuTgj8F8VL73KXsQYMQFOYxZzLkUVYRejA1T+AU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUlRGkds0VIlXI4KP9lt0dYkID+FZWfZBV0UkPGElchyuq5JZgeVNtYJ78EIkYnY7QvHdHgPmZ0vbjOAa1Kprwn5me3CMsesvT0MBDz3CuXcr0BYRZNaxSQRjhwj/R13A/KpD8+nT69EJPkpD5pB74lj8oI6FdQ9ETqMyIi7aRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMUm7mhl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMUm7mhl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38da6dde4c0so132637f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 21:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738646911; x=1739251711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFMCpCXcfoP88Nl0QZl0yfcxb5Z0aKe6W4l1kB9DKd0=;
        b=nMUm7mhl4yUAzYPUl3+hlIftlnLszEwVo7zk4TE+m/E/gtC5EPJM8eKACXVVjDQq1F
         oYVMijIegMKJT0MqFiBLtGnqUYVo7fMD9aSXj4diRdxL5yoP+825aCrPviaVn5/ABXkV
         KIPML08bpZ1TZ4iNkMahF94kPBTo9LxWT+5TqJcO1AR2zYNOw10OD3d3q7sVDPNx9xWi
         78ZT+Kkz1DAuc5clgPqP3PujTZbEsa9fPC1H70E5oUziwUJDVH1M9KOmI3nqx3ItzH7c
         1+4IpBx+pSJzgu4wVqxfFpsfJ1fRyjJAxVBFdF5F5Le9VYzqJ4WUu864a96KMcxnGoHG
         Llgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738646911; x=1739251711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFMCpCXcfoP88Nl0QZl0yfcxb5Z0aKe6W4l1kB9DKd0=;
        b=V+lcg1Fnir7XYoB8wlQjc0bPUBpRQO5SmuRWY4r/IDR2e+ITyWmDo4hRaoSJPyPpmN
         0zeen8hcnNBvgg60Q5Y1P4G799pHE/anHpN85RgpnQp8cTzRj4NZbM7LR8JIktUnZYmR
         SlaXIbLF7lRvKfbm0EfgJv5Q3CwhhB9sGmQYfZtNnETOnPcgI48jV2fpcPip1Na1DBGd
         stXGzWHqOTGRcoGaqYljPf/aFvgtDX1bsUsHZH55Og3k4+o6VqOryxPvnrbJwfGr8jxu
         s3DLv9YmZb+iSCz5oYgt/DgIzT2KGvMHKd8xShNrQzQ6BCXE6QlAMplofL8TvoqMUgjn
         IzBw==
X-Forwarded-Encrypted: i=1; AJvYcCVgTgS63DwkvTUL5cz/MmvPAXqWi7Z1Y2ua1lOfbxdZZkwaRWHn+89+aCScVVAxAZNfmWOs2e9Nh9uKg6xi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6B1ZQO4OAKGCbz544S2tv2m3HurKW/r0Fn1J1aiMclH4hR361
	daPQH9p4g1JOQmESexqcDRgZGVJjMmHAkKrW1AwsA9oPoyIXGEKEOpcOJdrjvLU=
X-Gm-Gg: ASbGncuUutVpv6hw5uBnNcx/QFhdphS5uxkWLfyUj8FT11E+6t79JOjaoxxmshhe/tf
	XiJeQzaSSU2tOzXBQbv3WpivZif7Ovnn0IV0f4qiGx2FsIQIoSjUkA5zVtEhy+5Pnjj0XBBTGS3
	tQEmzeOok4YDfsFDdsJqKNiKZmwC9JcQVyc7tF1Qaakd1tfrCT3S7ebyI5BU+7c4w5bKlKkbyM2
	HUvqwhOoTR0X22UXmtE/nj6vcgwt8XKysZukSZt9r0JPNrHgGsNxUJKhtkDuxCl08hremRra6Y1
	vQ28WDMSGuUpgKaEcRnu
X-Google-Smtp-Source: AGHT+IHARRPgtBiXaISnt02k7n8Gr2Bjdt3zLx+dH3o80K74/hdBIWUb0D0UCp3EPsTKIibObESgyw==
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38c5194a22emr20047292f8f.15.1738646910508;
        Mon, 03 Feb 2025 21:28:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1cf571sm14428897f8f.82.2025.02.03.21.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:28:29 -0800 (PST)
Date: Tue, 4 Feb 2025 08:28:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vger.kernel.org@desktop-gl3u3cj.smtp.subspace.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix coding style checks and warns
Message-ID: <3b241200-70f0-45f9-8e89-ac5442f52218@stanley.mountain>
References: <Z6FB0Idzrz_XSNWY@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6FB0Idzrz_XSNWY@DESKTOP-GL3U3CJ>

On Mon, Feb 03, 2025 at 02:23:12PM -0800, Ian To wrote:
> Coding style issues were present in the file. Unnecessary parenthesis,
> missing spaces, and exceeding line limits were the most prominent.

This needs to be split into several patches:

1: add missing spaces
2: delete unnecessary parentheses
3: split up long lines

> -	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
> +	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
> +	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
> +	    DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {

The DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS should be indented one
more space character.

	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {

> @@ -1696,12 +1707,12 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
>  		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
>  
>  /*
> -
> -	for (i = 0; i<9; i++)
> -	{
> -			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
> -	}
> -*/
> + *
> + *	for (i = 0; i<9; i++)
> + *	{
> + *			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
> + *	}
> + */
>  

Just delete this code, don't change the format.

regards,
dan carpenter

