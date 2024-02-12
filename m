Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D63F9F4
	for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707746117; cv=none; b=RLclOsMiw9W3ZRcnkwHIT+8uVU+a2xMc3K1inYlftyKIGGc0v2Zihn7E9uTgA5CgDN0PQEmKDRzXv/OKsLngGMvirTUw7y+RN5+IAXUym119wbHY68Vjf7lOULODtMQY6eJhfdIs79U9mXyevYQT5wTR1qqXJkNlxjTmqBH0OiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707746117; c=relaxed/simple;
	bh=A7CF62CM0SmP/RQtAarmAlFDk0JBcuGbt4p09vT/r9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBjQPR1xOW+s+ri2QBUX1uuQsORCxHhyecneY0qvXgBi/XTafxqB2og3zH6asiuXEYAMesa037du9GF7vE2VbbAQRGCkJF9/6WTH/akZR2+8KxJNbKQfCA93yDMEM9YSK369EjipJSIv3kSuueDgBN6e4eQ1t19Rq9M0+pjE8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg8vlmdN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg8vlmdN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-561c29afb6eso903406a12.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707746114; x=1708350914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0H408okGAfg/chpgekYfx9JZudQHf9tmXBxZ5aIo1g=;
        b=lg8vlmdNCmlrKCV7PoEzOmp9arUGUMIZTN5Gu5vC1xVSoz1hXg9tP17QKSj7r1g4q0
         qXJlVvg8O8+w2WIoo6fKyVAHCp94rlljNDOOfa/vNra8a0UW2b6/qsZlclXBcLRfywwO
         i3YbZeEFAa4KUTJlWUpFLH+2pg0i7VqSNRiKTjuoMeYHrjFBcHhkF0ObNzAlrb4lR6Ao
         0ImgvxTY2Tfnh/1c9XzZWV/VHe7gaDTZjrwRT+9lajDLEFmGJfcODMRftIEMZFJmsWJI
         gCRJlXQj9XFmMfSpP5AC6mP2tneDuavKlaxa1HB0oCVAccQLCx+1T78rdoBg2KWWNXEN
         l2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707746114; x=1708350914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0H408okGAfg/chpgekYfx9JZudQHf9tmXBxZ5aIo1g=;
        b=emlk/ImD3UkozR63Rxj7iBQiAQCYN12wG6Jov+F3Of1f0vl4efuoZCgYs83mK1JtQ+
         kjrAMZirpcSpM6dUd3QOYuS6nNc4MYyZZ5F/FZLzhVYg00NDtwtgXJRdh0rdsl31TyjU
         WyUGQWbjsP53gfuHHbvUE8lc0y2TDmiHiTeZj9M1nLHOIIyH0kVTGJma5V/8buWjQ9Ln
         snZnS1rWcxD2KMJFxvoOS5We/f/VOzwMcZfc254nxQFkOvyjay5fGcfDMAuobnTP0yeE
         EWPoN0+VS+Di7KWkCFdgo5GblEQ+U68p/Sn9usxc9u599lDFDvNFsYHvIhWAJzsrPr6v
         t9BA==
X-Gm-Message-State: AOJu0YwLaB9Sc5vMi1K4tLj1BkLpVkq0V9VXz87DA8RE9q1apedHKsMR
	weKqF9wCuvIisaZGVsdKGUu3I2afPw0ij9ssjrZcFyNmoP1QSp/QX2i4UFZAaSIrUBiKiZjkN4S
	a
X-Google-Smtp-Source: AGHT+IETnL3gImozTuiUtynzbC6bLh97EMSE60Utc5/HsrktVZ2hPhuoH1IZ7mdo6fEzeRkE2O4DhA==
X-Received: by 2002:a50:f689:0:b0:561:85ba:dd96 with SMTP id d9-20020a50f689000000b0056185badd96mr3562213edn.35.1707746113884;
        Mon, 12 Feb 2024 05:55:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeMEykx8W0S83/Sk7edDhPMHvOlfn30LstaMUHO01B1X9l+Ruz7bfR2TM/At/hbeHGMfQgPIp5J5ddnbVTF0khxmV/AJoaa14FL0f3m6jfIk5zG/sCbkQ/tpQvBh2UB4ijI6DRqN4FdaChzkOnDdNmsVt7gLcYHbtKYaKs15w0AvBBhZSr8WLL+SOEKDAcrxWiIVodkGBrZSvRN18BIIsBV5zTOwW7VMqfccvLiigi7j4hHe8oDYaqxyJdbAI=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640205d000b005616db210c1sm2504560edx.67.2024.02.12.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:55:13 -0800 (PST)
Date: Mon, 12 Feb 2024 16:55:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Moritz C. Weber" <mo.c.weber@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: nvec: nvec: fixed two usleep_range is preferred
 over udelay warnings
Message-ID: <e57cb313-77da-47c3-be5a-93725a52707f@moroto.mountain>
References: <20240212133645.1836-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212133645.1836-1-mo.c.weber@gmail.com>

On Mon, Feb 12, 2024 at 02:36:45PM +0100, Moritz C. Weber wrote:
> Fixed a code style issue raised by checkpatch.

Needs Signed-off-by.  Please run your patches through checkpatch.

> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 2823cacde..18c5471d5 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(32, 33);

We only accept these udelay() -> usleep_range() patches if they have
been tested on real hardware.  Sorry.

regards,
dan carpenter

