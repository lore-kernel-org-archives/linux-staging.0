Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEC418DF9D
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772917475; cv=none; b=hffJHZqR3sSj3Wu6NM+nhAQxa0ok+6hWvXWOed3depgdwzauN5R6pxmIFPFzWRBK7JED0kgBkvuEodWcdRQZvrPd/QFKhSZ47TF1M6+mKqbkTiSktLOoIQ/8lCJ75fpNPPwR7kF9Atk11ITl5y6JbNBNo1CWtP7n1ceF0avKF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772917475; c=relaxed/simple;
	bh=Adpf5avf2QfFHKSA0d3Du40uWSWQ7I6ZqoGIBSBkoXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLbTfNS+9mATnneyFyaa0pkBcgCEBfPV2Ai3Ft3dSgafi+XxZ6EtITezKZNbsx1qwEkLD7J/0XgQluNtGgB+Fr3ge/3T3aJiJlb1VIYobSlK/tpEhM3REtWFaODUFI8smFgXjDo1nvvxzZlVw9dkS+biZgF1dzS8Qc/hcirZwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csvK2yDm; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csvK2yDm"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be19f05d7dso3117170eec.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 13:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772917472; x=1773522272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPdbwovxerSjT/ojrWEbDVuDl8NEMcqqgw+5IiHu7CU=;
        b=csvK2yDmjJrFaHp6Qq/exhk02CAR4YPOc10buN0GxedEYjJ8vCwH/h6rFeoPbXj35T
         c3rrX3OpWR7n7123VrNoJQGivC/njDhczEFFMxkO1VVNDglGboIPy5zVqUZWTSZELkOn
         d3xe5msgsMutOuMYCPRoVBT5FIykFqXDYZX38BrodQLVG8vpXlokBhVOsZV4SkWs/2oE
         wDrR3hS/CSkPbxn7JXHydsrpb9B0ucQkJF6DX/ZrRZThGt2IVRJLLrsyvudQDHkgNkI0
         ddVgSGgMdfd5dFQ4z7oSoOZ4G4RJRjMdv5oHzTG+gv/7K3RNfBshMCFzKuSmz+m0kkCk
         Xxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772917472; x=1773522272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPdbwovxerSjT/ojrWEbDVuDl8NEMcqqgw+5IiHu7CU=;
        b=kbKkLYo6HgMuCvoAD9+Rpb9LdFLwElHmZ6l32JGdLZ5q75phvAkIuoKijvh38DZYvg
         eI0gJTSjy1RZIzfSNnQgIonoh12OfiMD45sCf3m820rjB8l1j8AmoYG2mqERmuO5EGAS
         wzCAFsRUytbb/5Hc+HFm24dbvyh5AJ9tzkX+0gpbCm0CpSyWFvPjquZHaHY29uybthgR
         1rIXf0i33NZKx7Ycq8JuxHgUi42melas2j5b9PqEaG0k6W6AJeU5doYBK5ERs67sNScy
         s7nTrkPyz35AjEHYdOxXSqu7x2wVZERmPnRQs7kIgG1jglgKUkHZTjN/W/JkXtQCjN9Z
         ttYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFJU2JDDrahoP4gp5VLbS1s/31hoeCwaCUu3JNhV4lL6xtxTHQF7k8caSVk4/JN5lnMPdoBjuREd7XDS8X@lists.linux.dev
X-Gm-Message-State: AOJu0YwXxIg8VbKAe8wfV/X6zeXBxp7elynk3YsSoIcbJK21erY22nM5
	kXb1PFFSuIzcDjjQTw0hlAL7WTnZ/VG7vRWxkaGOe95I1k0CWvMMilvK
X-Gm-Gg: ATEYQzyELj/ShbIqWN+jV4leR+HRL4TndvgMGDKjyZpoWB8ft/t9NeHWL/3QvTUziCF
	l0dC4VIrpil4xofdYZjwDbN00MF7EhCwCRFst2jDSG/nqGIZFk3dvbT0DBM7Zuml4vBK9sZaJI4
	4ycFNoPaefUqSUKv484EG3E1uNeTxrPfNT67qPuzRQC6oJNfBzhjdSRCFMhtpHnwgba0fa4II/O
	YNOYVMf3BgzVBSQIKD6tPEb4V1egJLldihaxhK2wR4relNv0Il78acN+d1uR0q0cAC5iTCdlbIb
	+WDSziIsEZ0IJ5ktyLZkEIfCZ9mYEtgNIs+c+ZIG2tZSKQqB3LUxBqBU0uLYZMB4PCtzSBtsyjD
	O7s16Wg2a0o+ixrfIPPeeusXQR4cCeH1AKD9ue6yl72oYRFivDgDp/pMt5eYjmXKVIDNais1psp
	9mLarGmdkgJ270RyR5Tf+U5aLL4k3QvhU=
X-Received: by 2002:a05:693c:2c81:b0:2a4:3594:d54e with SMTP id 5a478bee46e88-2be4e04c52emr2609567eec.27.1772917471800;
        Sat, 07 Mar 2026 13:04:31 -0800 (PST)
Received: from localhost ([2804:30c:966:7b00:fd18:61b8:43a7:4049])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm4699773eec.17.2026.03.07.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 13:04:30 -0800 (PST)
Date: Sat, 7 Mar 2026 18:05:06 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH] staging: iio: ad9832: modernize ABI and remove dds.h
 dependency
Message-ID: <aayTAmJ4x5_965Gg@debian-BULLSEYE-live-builder-AMD64>
References: <20260305210347.120446-1-rougueprince47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305210347.120446-1-rougueprince47@gmail.com>

Hello Bhargav,

On 03/06, Bhargav Joshi wrote:
> The AD9832 driver currently relies on legacy custom IIO macros defined
> in dds.h. This triggers checkpatch.pl warnings (NON_OCTAL_PERMISSIONS)
> and, more importantly, exposes a non-standard sysfs ABI (e.g.,
> frequency0, frequency1, phase0-3) directly to user space.
> 
> This patch removes the custom macros and migrates the driver to standard
> IIO API mechanisms:
> - Standard attributes (frequency, phase) now use info_mask_separate.
> - Non standard specific toggles (frequencysymbol, phasesymbol,
>   pincontrol) have been migrated to an ext_info array.
> - Remove dds.h header dependency.
> - Pointless frequency_scale and phase_scale attributes are dropped as
>   suggested by Jonathan in
>   https://lore.kernel.org/linux-iio/20251231180939.422e9e62@jic23-huawei/
> 
> NOTE: This patch introduces an intentional ABI changes. The non-standard
> attributes (out_altvoltage0_frequency0, etc.) have been removed. They
> are replaced by standard attributes (out_altvoltage0_frequency and
> out_altvoltage0_phase). Routing to correct register while writing is
> handled by checking currently active frequencysymbol or phasesymbol.
> 
> Testing: This patch has been strictly compile-tested. I do not have
> access to physical AD9832 hardware. I am submitting this as an RFC to
> see if these changes are acceptable, and to ask if someone with physical
> hardware could test thisg and provide a Tested-by tag.
> 
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> ---
> This patch is heavily inspired from discussions in following
> thread.
> https://lore.kernel.org/linux-iio/20251215190806.11003-1-tomasborquez13@gmail.com/

Thanks for making that clear. Still, a change log highlighting the main
differences between yours and Tomas' patches would have been appreciated.

By the way, I'm assuming Tomas is fine with you caring on the driver update?

More comments inline.
> 
> Since this is an RFC please let me know if these changes are acceptable.
> 
>  drivers/staging/iio/frequency/ad9832.c | 135 +++++++++++++++----------
>  1 file changed, 80 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index b87ea1781b27..066a1b9ee8d5 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
...
> -/*
> - * see dds.h for further information
> - */
> +#define AD9832_EXT_INFO(_name, _ident) { \
> +	.name = _name, \
> +	.write = ad9832_write_ext_info, \
Why no .read procedure? I think at least for the
out_enable/out_altcurrent0_enable attribute we would want a read function.

> +	.private = _ident, \
> +	.shared = IIO_SEPARATE, \
> +}
>  
> -static IIO_DEV_ATTR_FREQ(0, 0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
> -static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
> -static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9832_write, AD9832_FREQ_SYM);
> -static IIO_CONST_ATTR_FREQ_SCALE(0, "1"); /* 1Hz */
> -
> -static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
> -static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
> -static IIO_DEV_ATTR_PHASE(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
> -static IIO_DEV_ATTR_PHASE(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
> -static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL,
> -				ad9832_write, AD9832_PHASE_SYM);
> -static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
> -
> -static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
> -				ad9832_write, AD9832_PINCTRL_EN);
> -static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
> -				ad9832_write, AD9832_OUTPUT_EN);
> -
> -static struct attribute *ad9832_attributes[] = {
> -	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_frequency1.dev_attr.attr,
> -	&iio_const_attr_out_altvoltage0_frequency_scale.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_phase0.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_phase1.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_phase2.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_phase3.dev_attr.attr,
I'd try to split this patch into smaller ones.
One for updating the frequency and phase channels.

> -	&iio_const_attr_out_altvoltage0_phase_scale.dev_attr.attr,
One patch for dropping the _scale attributes.

> -	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
> -	NULL,
> +static const struct iio_chan_spec_ext_info ad9832_ext_info[] = {
> +	AD9832_EXT_INFO("pincontrol_en", AD9832_PINCTRL_EN),
Why did you drop the comment about making pincontrol_en a DT property?
Nevertheless, pincontrol_en is another piece I'd put in a separate patch.

> +	AD9832_EXT_INFO("frequencysymbol", AD9832_FREQ_SYM),
> +	AD9832_EXT_INFO("phasesymbol", AD9832_PHASE_SYM),
Maybe I'm missing something but this doesn't seem to follow the suggested ABI.
https://lore.kernel.org/linux-iio/20251221194358.3284acb4@jic23-huawei/
Why did you chose this particular naming for the ABI?

> +	AD9832_EXT_INFO("out_enable", AD9832_OUTPUT_EN),
I think it is okay to change the enable from device attribute to channel
attribute in this case since it's staging and this device has only one channel.
Though, I believe we should call it out_altcurrent0_enable, as proposed on
Tomas' set. I'd also set this on a separate patch.

> +	{ }
>  };
>  
> -static const struct attribute_group ad9832_attribute_group = {
> -	.attrs = ad9832_attributes,
> +static const struct iio_chan_spec ad9832_channels[] = {
> +	{
> +		.type = IIO_ALTVOLTAGE,
Maybe I've missed something. Didn't the previous review reached the conclusion
that the channels should be IIO_ALTCURRENT? The datasheet it documents IOUT as
current output.

> +		.indexed = 1,
> +		.channel = 0,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_FREQUENCY) |
> +				      BIT(IIO_CHAN_INFO_PHASE),
> +		.ext_info = ad9832_ext_info,
> +	},
>  };
>  
>  static const struct iio_info ad9832_info = {
> -	.attrs = &ad9832_attribute_group,
> +	.write_raw = ad9832_write_raw,
No .read_raw ?

>  };
