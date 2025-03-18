Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A819ABAB
	for <linux-staging@lists.linux.dev>; Tue, 18 Mar 2025 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742272934; cv=none; b=H2OhISULoEAMLVdroM1Wa+ODIw8hLTanwPgO3Sb8pqAuXt3kaCinW3CCto/z41JhC6OQOmgEGAh+o8YkC1lDupxMFVv2C1PkdLaRhrprnLyuAYoJmEsJYi//liiud/ZGZxOxL+lbR9i9lDC9niA8phiTcBYYdOdkX/Xd22LZSKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742272934; c=relaxed/simple;
	bh=iQeGbfmACJygU63Z8hCYAaLR8JTprex+qf/AS3eC/XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2JG+Im3PCzeItoPdhtg1AXNVdWs5QCe+K2KQWS4tMEnmC011rtKCGMRgUArLjkriObQbi4cdlDzJAtnuwlM13Qli+wc7N19MVN9gTKzgbI90oK8Gou0oHnhnTHkFZ5MVQdalFGRZdHSepTKL+e/V05LuTmW3lqOlWh8Yd8iXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSxQ2kZe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSxQ2kZe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so5282187a91.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Mar 2025 21:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272932; x=1742877732; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sAkJtd4zJibaWCNnF3jCBBXYULTrH5ymd8dXqKbHixc=;
        b=lSxQ2kZeLdXyQJiSFyB5I2Z7yB8vlw5UJ+vZTArOqSXX95T+ZZecEtjaWyV2orVWw7
         AtYo6ic2uDNUaPBFtZLOECWp1aniOGGxFETneUsIL15Y1AtfugIHekTgyz0KNy1qaP1l
         b0URYWbJEoq92V3E3AXHIOQhATWikdH2Oc8OKYk5cEqtZvkjr9zy5rlFvZ27lm5ek7Nc
         zy4fJw4/nn4pfLQ+9v+QWGuKJLSjwBGIgcb+fTM01j2Qn4Xa4WIGusXV7yD+/QvMMW+/
         tnt2KBYRdWteBMHWu/jhhiHKxrnx/htgo7YPKy5r2UcTuSmC5Ibi/UKKxtRz2Xifwq3o
         EWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272932; x=1742877732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAkJtd4zJibaWCNnF3jCBBXYULTrH5ymd8dXqKbHixc=;
        b=CTe/9R/hjI4WSB5WNLgu/S3G5S9L6Gp698nAmeCnr7IfCcwergkxFKvaqDXxdwlvRM
         LEe2cjc1XBr9V1eMN6uEfuVT2wF5VH9WZMXMNUFMudIZf+J949Ll5cWyE+FLXgrGZ69o
         jDWVlQjNGltl4Wl2nkSMIRMBraXmb8YArg425oxZq1uwKhCEZRzM9VBq6Fkn5BH4EZwl
         ncatnkRRZBiU0Oue8Kwm1j7Dkm03d5FRw8V5+nLqOweog9VVMtDRE/+VSjdbitT5ADoR
         WJLSkn/z7Es+B/VkeXZexD1CR1BPgp/ppjPKq43KPQU76cLk1cU7J5+kf3fUnYZwQAmf
         cloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmNTYTVRCAleWkYIF8EXO373ZGlDTzzxtJv7+QvRty4L8ggmIXe4+GG6oz6aHgFo0qls+gBgi3+vl/CLAc@lists.linux.dev
X-Gm-Message-State: AOJu0YwGiNNmcVZ9/IhaEkG/bOYjV2WRXJPWOV72S2TFtR4GucIhq9d+
	DCJEW70rgB2/pcJRXXKqjnoNbdCWtP+iMdyj8nBTXcZ3+8FwBq3QpEvKqzzLXAc=
X-Gm-Gg: ASbGncv/x16l7U242Srd2L65VO40JFZfTv9Bp13TXIYkZi1560SA1jPI+MYzvtaantP
	/9VNligFYGZw4IBJYjmNoT/xVmKWVkCncLuuSp96F5yu+HP9zxFoM/y7L6w/HdiSoMlQLaaCH2v
	hdiQyJTfU/D7dbsBt4Pz1ouTcz0ylIS6A08XwM/f6pnCFlRYEnosfzypyG+RJaGRJXQNdK2LeGk
	hPXOFcQK1uIf8cXVTpwV9XjYDRTDlgCQWoP4JW7b1CbtrTEquX7uSeCpBVmE/ZCLXkEtrdoevOU
	F4mY4InYLJmxfTYLIMnBbq3umNhfw54LUxmQtvq1iqMVhkq/9oV2
X-Google-Smtp-Source: AGHT+IHG0lDZteyiS6GX2wkjRHSUTe5QCL1t9du2A1xR4Hh+C+W5xwrolvvu2OvrsG/ELvUYNeMnEg==
X-Received: by 2002:a17:90b:1b12:b0:2ff:6608:78e2 with SMTP id 98e67ed59e1d1-301a5b1c837mr1342298a91.16.1742272931801;
        Mon, 17 Mar 2025 21:42:11 -0700 (PDT)
Received: from localhost ([2804:30c:b31:2d00:277c:5cbe:7f44:752b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3015353462asm7054423a91.27.2025.03.17.21.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:42:10 -0700 (PDT)
Date: Tue, 18 Mar 2025 01:43:06 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z9j52jGqft2jvT2O@debian-BULLSEYE-live-builder-AMD64>
References: <20250317173355.157536-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317173355.157536-1-simeddon@gmail.com>

Hi Siddharth,

On 03/17, Siddharth Menon wrote:
> Refactor code to use the FIELD_PREP macro for setting bit fields
> instead of manual bit manipulation.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
...
> +#define CMD_MASK_2   GENMASK(15, 12)
> +#define ADD_MASK_2   GENMASK(11, 8)
> +#define DATA_MASK_2  GENMASK(7, 0)

DATA_MASK_2? Did we already have a data mask?
What about adding the device prefix to the mask name (e.g. AD9832_CMD_MASK)?
Also, this patch fails to compile. Please, apply your patches and build the
kernel before sending the patches to the mailing list. Also, run checkpatch on them.
E.g. 
./scripts/checkpatch.pl --terse --codespell --color=always -strict my_patch.patch

>  
>  /**
>   * struct ad9832_state - driver instance specific data
> @@ -131,6 +134,7 @@ static int ad9832_write_frequency(struct ad9832_state *st,
>  {
>  	unsigned long clk_freq;
>  	unsigned long regval;
> +	u8 regval_bytes[4];
>  
>  	clk_freq = clk_get_rate(st->mclk);
>  
> @@ -138,19 +142,14 @@ static int ad9832_write_frequency(struct ad9832_state *st,
>  		return -EINVAL;
>  
>  	regval = ad9832_calc_freqreg(clk_freq, fout);
> +	put_unaligned_be32(regval, regval_bytes);
>  
> -	st->freq_data[0] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
> -					(addr << ADD_SHIFT) |
> -					((regval >> 24) & 0xFF));
> -	st->freq_data[1] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
> -					((addr - 1) << ADD_SHIFT) |
> -					((regval >> 16) & 0xFF));
> -	st->freq_data[2] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
> -					((addr - 2) << ADD_SHIFT) |
> -					((regval >> 8) & 0xFF));
> -	st->freq_data[3] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
> -					((addr - 3) << ADD_SHIFT) |
> -					((regval >> 0) & 0xFF));
> +	for (int i = 0; i < 4; i++) {
> +		st->freq_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK,
> +				(i % 2 == 0) ? AD9832_CMD_FRE8BITSW : AD9832_CMD_FRE16BITSW) |
Hmm, I mentioned using ternary operator and gave an example usage but wasn't
expecting that particular example to really be used. IMHO, the above doesn't
look very good.
Can you try come up with something that, (1) avoids the bit shifting we had
before, (2) uses sound macro/mask/variable naming, and (3) fits into 80 columns?
Might not be an easy task so probably not worth sending much more time on this
if unable to find a good refactoring for the above.

Regards,
Marcelo
