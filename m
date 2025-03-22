Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87951FCFFB
	for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742649615; cv=none; b=HDnncatZKb56vKI4M87pTSES1fr5zbfPC38QocvCpX957vOZCRuGanqFmU1vy+q2fnPv8clkhggUa3c58smFFkyQy5IwQedKEU7RUqyeqxGUc30TfKrGUdoQQx65zXCAmUwz+ozuqMkOerBfAKy3OrfmzD4mHqgb94eKMiMCmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742649615; c=relaxed/simple;
	bh=gU66PZIjoL0vfIa5/SPWENmJ3tbY3g/2K5m2f5e3WXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLEVvcBXHizQI94EuII9Qwtl6A5HUtQ/He0c6bamMv6XUuWhwj5Pgtnsha1ld5FZHHT+kDcTdzdReVQGaSr3Aatz4YFcotVxu6V8zR00qBwsKYDCom1WXgLaGi82e9p363Tlw8ROQB+glavL+R/t26ELriR2ESvr1ljYfecTal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+jZSV0e; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+jZSV0e"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224019ad9edso72372315ad.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742649613; x=1743254413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4tDxSmnhnc08HaMIT1ctnJ5ExmMVePI21NkKL7vi+w=;
        b=F+jZSV0e0AC9KCJAEZe9NAsJ0jsGuyrtM8ozwiNnDCy0C0KdmGX29Q55Yyl8pbmyJ/
         rwS1CFVQdEy1w8f3RkfXiYT+WZmA3rYBbLO3ltpRM0ZmuuvSrHvl8+XqG15du81BED7M
         V64LXGP/+3hlQDhDFDsARJvSVT26MaHuks2qVJoEz0zzCsqQNnWo4OUjOVC3/euqveSu
         SgjupVtawkxilhTZzid/3ApsNXjwhp05/tRVK81yWMeKO5MKgindKK0XSdoqMFfRIg8a
         Lc7T/T/aGXEArETmhzvT5/QWrp5aXVH4WnQrXLUeHM2oDYW74VekYwZqAO3IgMSl8DZT
         pXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742649613; x=1743254413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4tDxSmnhnc08HaMIT1ctnJ5ExmMVePI21NkKL7vi+w=;
        b=OPeJrql1ciisUzfR0Fegy5UvUxh7PVgsZ2r0kCMO+ACSjrq4YZUuc9c44moXnrg1xI
         UFhWxC5fOdmmPIvDQ913RzvWZXFtCHleLe70Ae9BpBbmvFImXhyGs+D7yootx3LqF7Qt
         nzUhAGlcdG9LZrWlJGUc4fdf2s3PgsZojHkVc9erZXU7BKQQUTOTKZN43kShCwqgGScg
         dMHOxnzWu8FNjCj63x/H+yxl9LQOWPFsbEzeRbs200gZep2EgINrsHYs9FKo0xw5JtPq
         LUeuuLZsyfik9USpjC337EEMlfFvwy0UK9Lbtum5soTfWjmr6qW5bmGKa5y1Bl4eYsh8
         6chQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6KwR1nSPLDyID+vANdxmd2Pj53eEcgorkUBhdg+Ru+WroAKoOPghvHjHDpGXRil3Lh2fwsxZmcXr9nyEF@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/CihAg/cE8qpwbAoM6VWaktJ5zLOhAx73/+Wv6bQQxVo7TxuU
	JRyn9GgEhBLryfo5GiuFy3OUpmWVM6qZza7aip9g/W9ZhB2gZEP3
X-Gm-Gg: ASbGncvm3xEodEDKh69cxGinGUKXI9CsG5mkzFzArS61VEe712SnBrEBlYeTp/SW3v+
	2eZ2GQzUMUpjvHkFewjlYAV8tjRyAfNZokioQVM3DdlNUWvs5rlYPJukFTFWIDIGlsN/5O42qe2
	lhH4ihiptdj1ND5gKID/8Sdipv0AxUfBNHrtpla0a5T8EP2tfIdB846Aye/RxNsQO0NZ9dApSej
	NqqinlAocyeeEZNdFtxjdlinyF2VtNslBsscRL0C9H908ZoEmdJ0yEwb8z/3N89MCvMS97xX6+S
	M4nswn/lpKDzbAJDX6TrNpCgI0aFBpk2Akb7yCFeAR4fOWRZg9c+jl0EPtppYVvM
X-Google-Smtp-Source: AGHT+IHDzu+qDrJOQOQlCsVGujdFP7L17ORFTahxosCFINpmHzjhjtz4m4kTJ6I37qsCqO77Nez/Cg==
X-Received: by 2002:a17:902:d491:b0:224:1074:63a0 with SMTP id d9443c01a7336-22780e0305dmr124616035ad.34.1742649612801;
        Sat, 22 Mar 2025 06:20:12 -0700 (PDT)
Received: from localhost ([2804:30c:b31:2d00:277c:5cbe:7f44:752b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3030f5d7fc6sm4048828a91.20.2025.03.22.06.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 06:20:11 -0700 (PDT)
Date: Sat, 22 Mar 2025 10:21:11 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z965Rz8NuXhbHrgy@debian-BULLSEYE-live-builder-AMD64>
References: <20250319045212.72650-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319045212.72650-1-simeddon@gmail.com>

Hello Siddharth,

I think the proposed changes look better now.
Still, some additional comments inline.

On 03/19, Siddharth Menon wrote:
> Refactor code to use the FIELD_PREP macro for setting bit fields
> instead of manual bit manipulation.

The word 'refactor' by itself isn't very appealing.
Instead, maybe promote how the patch improves code readability saying something
like 'Use bitfield macros to clearly specify AD9832 SPI command fields and to 
make register write code more readable.' Use that exact text if you want.

> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  This one compiles and loads without issue
>  Should I eliminate the use of FIELD_PREP to avoid bit shifting
>  alltogether?
Not sure I'm getting your question here but some bitshift will be inevitable
due to the structure of AD9832 SPI command. The difference is now the shifting
is done by macros declared in bitfield.h. That makes it easier for us to focus
on aspects that are more specific to the chip in the IIO driver. By the way, I
think AD9832_PHASE and RES_MASK could also be declared as a mask, but maybe that
change can be made on a separate patch.

>  v1->v2:
>  - removed CMD_SHIFT and ADD_SHIFT
>  - use GENMASK
>  - store regval in an array and iterate through it
>  v2->v3:
>  - add missing header
>  - refactor code in the previously introduced loops
>  drivers/staging/iio/frequency/ad9832.c | 58 +++++++++++++++-----------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 140ee4f9c137..9a27acd88926 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -16,6 +16,9 @@
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/unaligned.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -65,11 +68,12 @@
>  #define AD9832_SLEEP		BIT(13)
>  #define AD9832_RESET		BIT(12)
>  #define AD9832_CLR		BIT(11)
> -#define CMD_SHIFT		12
> -#define ADD_SHIFT		8
>  #define AD9832_FREQ_BITS	32
>  #define AD9832_PHASE_BITS	12
>  #define RES_MASK(bits)		((1 << (bits)) - 1)
> +#define AD9832_CMD_MSK   GENMASK(15, 12)
> +#define AD9832_ADD_MSK   GENMASK(11, 8)
> +#define AD9832_DAT_MSK  GENMASK(7, 0)
Use tabs to separate mask name and definiiton?
#define AD9832_CMD_MSK		GENMASK(15, 12)
#define AD9832_ADD_MSK		GENMASK(11, 8)
#define AD9832_DAT_MSK		GENMASK(7, 0)

>  
>  /**
>   * struct ad9832_state - driver instance specific data
> @@ -131,6 +135,8 @@ static int ad9832_write_frequency(struct ad9832_state *st,
>  {
>  	unsigned long clk_freq;
>  	unsigned long regval;
> +	u16 freq_cmd;
> +	u8 regval_bytes[4];
Prefer reverse xmas tree order. i.e.
	u8 regval_bytes[4];
	u16 freq_cmd;

>  
>  	clk_freq = clk_get_rate(st->mclk);
>  
> @@ -138,19 +144,15 @@ static int ad9832_write_frequency(struct ad9832_state *st,
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
Use ARRAY_SIZE() when possible.
	for (int i = 0; i < ARRAY_SIZE(st->freq_data); i++) {

> +		freq_cmd = (i % 2 == 0) ? AD9832_CMD_FRE8BITSW : AD9832_CMD_FRE16BITSW;
> +
> +		st->freq_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, freq_cmd) |
> +			FIELD_PREP(AD9832_ADD_MSK, addr - i) |
> +			FIELD_PREP(AD9832_DAT_MSK, regval_bytes[i]));
Strange checkpatch didn't complain about that. Would expect the arguments be aligned
		st->freq_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, freq_cmd) |
					       FIELD_PREP(AD9832_ADD_MSK, addr - i) |
					       FIELD_PREP(AD9832_DAT_MSK, regval_bytes[i]));
although code now exceeds 80 columns by a few characters. Not sure which version
would look better to Jonathan.

> +	}
>  
>  	return spi_sync(st->spi, &st->freq_msg);
>  }
> @@ -158,15 +160,21 @@ static int ad9832_write_frequency(struct ad9832_state *st,
>  static int ad9832_write_phase(struct ad9832_state *st,
>  			      unsigned long addr, unsigned long phase)
>  {
> +	u8 phase_bytes[2];
> +	u16 phase_cmd;
> +
>  	if (phase >= BIT(AD9832_PHASE_BITS))
>  		return -EINVAL;
>  
> -	st->phase_data[0] = cpu_to_be16((AD9832_CMD_PHA8BITSW << CMD_SHIFT) |
> -					(addr << ADD_SHIFT) |
> -					((phase >> 8) & 0xFF));
> -	st->phase_data[1] = cpu_to_be16((AD9832_CMD_PHA16BITSW << CMD_SHIFT) |
> -					((addr - 1) << ADD_SHIFT) |
> -					(phase & 0xFF));
> +	put_unaligned_be16(phase, phase_bytes);
> +
> +	for (int i = 0; i < 2; i++) {
Use ARRAY_SIZE() here too.

> +		phase_cmd = (i % 2 == 0) ? AD9832_CMD_PHA8BITSW : AD9832_CMD_PHA16BITSW;
> +
> +		st->phase_data[i] = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, phase_cmd) |
> +			FIELD_PREP(AD9832_ADD_MSK, addr - i) |
> +			FIELD_PREP(AD9832_DAT_MSK, phase_bytes[i]));
Would suggest to align with the first cpu_to_be16 argument here too, but better
wait for Jonathan's opinion about this.

> +	}
>  
>  	return spi_sync(st->spi, &st->phase_msg);
>  }
> @@ -201,7 +209,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  			st->ctrl_ss &= ~AD9832_SELSRC;
>  		else
>  			st->ctrl_ss |= AD9832_SELSRC;
> -		st->data = cpu_to_be16((AD9832_CMD_SYNCSELSRC << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
>  					st->ctrl_ss);
Not sure about this assignment with mix of FIELD_PREP and non-FIELD_PREP value.
Maybe have 
				       FIELD_PREP(AD9832_DAT_MSK, st->ctrl_ss));
?


>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -214,7 +222,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  			ret = -EINVAL;
>  			break;
>  		}
> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
Same would apply to these other cases.

>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -227,7 +235,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  		st->ctrl_fp &= ~AD9832_PHASE(3);
>  		st->ctrl_fp |= AD9832_PHASE(val);
>  
> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -238,7 +246,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  		else
>  			st->ctrl_src |= AD9832_RESET;
>  
> -		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
>  					st->ctrl_src);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -396,7 +404,7 @@ static int ad9832_probe(struct spi_device *spi)
>  	spi_message_add_tail(&st->phase_xfer[1], &st->phase_msg);
>  
>  	st->ctrl_src = AD9832_SLEEP | AD9832_RESET | AD9832_CLR;
> -	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> +	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
>  					st->ctrl_src);
>  	ret = spi_sync(st->spi, &st->msg);
>  	if (ret) {
> -- 
> 2.48.1
> 
