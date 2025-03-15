Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3A1C84C6
	for <linux-staging@lists.linux.dev>; Sat, 15 Mar 2025 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031712; cv=none; b=XzqvUBevDVS5+4tHnTCxGNLVXNOXmlaGy0EiPeGjqheUuBwqKox6tk689HQ40nt5JHHMhkTbZZTEVfMRpu2N3MXy85bwfOpW/WVpqPkjyk6/QocMoQn5eFWZ7nEfjgc1pAplb5E+RUQZ4MXypFbeNQ2bawcU5PLb5BS2iTHyGog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031712; c=relaxed/simple;
	bh=6F4ZEjbDcZiLLIYSt3jmgj2GxNFjQ0Yxwp2I4wxrw9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjYkB4t+GhYBZWfjQuN22AgpbTEB24crsDALz6PINph3W3N3ByXXkVdddiQgkqNqOKXVYZyUuQhK6UQS3G6FXXwu5gVlZilWZN1XdtSpnal003p9e2ZAKsS5g8VvTuCEAgeLzFEJx/Zc1rPkvbBWv/zCkZjO588HUsgdd2bJ0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNV+Dgje; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNV+Dgje"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39133f709f5so1743405f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Mar 2025 02:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742031709; x=1742636509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FzNAXBvMCkEVkeIQmxTZZJktEMMoSHZ3SJ4jiX/ukqc=;
        b=sNV+DgjeWJeuMerwmA5RJ4gcixs6gzYY5A0UkKXAcVnDwyEJV5rmFDzBR9n99/SzWJ
         t0/WOYEp1eDhwsgeWfyNsMgVBH7zZTiqfXEhO5aKBIOL2/qbLYS/hD1BXKY83jkeXp+f
         nEdoqWFsQ5hq3OJYgIAegZypptH1Pcmi0netlqWscMX7/6kVGoN0a39Y73Vw5Nz8mw2j
         fphE1lTiyV7tZ0JdlwcMpnCwDwbOIByScE8NxwM2xZxkfHEdSV8Sg6/khuvRMJfoARKL
         ov3jm78dSlZs4X0jUI4ml3Gz0r7zPY8NUa5hTX5yfo958NGOekL/lgTWM8kzEK7fxerV
         Xz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742031709; x=1742636509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzNAXBvMCkEVkeIQmxTZZJktEMMoSHZ3SJ4jiX/ukqc=;
        b=VhlLQAb86UiW3acmR1wjefBapLShUBsn82OiLtUJPzNSZP6ClqaBliZ91tnt5Lr7/X
         mKwWR0ysjlliB2uo27BpTeJIPXLBpnemj7KvBG0JwbEoaM4QIz28YtfzggrZsAq59PMz
         0rk34T25+nSk0sxlNZUWH97ER7IeioWBG01Zo54pT7AAO5WXAwImKO1Kz+8FVdVEZXUK
         6Ikcbz/9i4rYMcfqpvLxEPmA91UnSL98vbkwRU+u7AThKcmhIGC9BpHZ7xL3nQum3J2W
         RzO/1wNOjTCcSGWIlrgWiuaooQP2SkvUf1109nNFDCoiyG04q5ojiSaSWKRo9/c+MBa9
         ltPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcENpHcMWnbuoM1RU6pgVi3NVYBGWAk+Ql395/2Ca3Xc6INLlZK31IIOZNs1iNi84OghTpbEMYLuU5zG53@lists.linux.dev
X-Gm-Message-State: AOJu0YyAx/lWG9JwoXiEWvAC28PP6Cj6Udecwbt3PqYv+ol27X4ATJ6a
	98cNi4c0E+ECuG2w4oVfWKSFvWIHj0OCpDVqern1ckVRhYGbnE99a/L8pNAUbw0=
X-Gm-Gg: ASbGncss5W/jXyPn46xlYBMBIvDWNER++kEGipQOF43YuO9Tk8thQrgA1RAafKAlMHY
	/Fi3vEWQZlT3WpjCv9ov88rujztBW9UIW3gSAt1xCMNt3mxmrnAbnJV6rSf1vn82In2EQZoIVdt
	9rW9ntLKby3/D5/6ClawD9JBG9AviHFWBV4FtKdrEZRTSq9l7ZGyfoJCwKu4Nfm4Ei+VADuOXIH
	vfXP0W6EOPWYnpoJjg33V2NQSgKFTLKrUXYb2iR85N/IpshxyvfUAGXDriOkFOiPxaZlUqehQ/9
	L0q7/be0ahs+iXcNnNZn665lGgAXmpdX4dClcIe/HoeHlrgb8Q==
X-Google-Smtp-Source: AGHT+IFTBJSfFex7i2l1+nA+IaHmXgFH0CMrehfzJSLe3f4uOTcDt6OJFbpTBxUtCAJY/pAU7os+/A==
X-Received: by 2002:a05:6000:186b:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-3971ffb1eccmr6108911f8f.45.1742031708881;
        Sat, 15 Mar 2025 02:41:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb318a3dsm8398500f8f.74.2025.03.15.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 02:41:48 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:41:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, tytso@mit.edu,
	ernesto.mnd.fernandez@gmail.com, sven@svenpeter.dev,
	ernesto@corellium.com, gargaditya08@live.com, willy@infradead.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 1/8] staging: apfs: init lzfse compression library
 for APFS
Message-ID: <51af0391-4dcf-434b-8c10-8682ab4a6179@stanley.mountain>
References: <20250314-apfs-v1-0-ddfaa6836b5c@ethancedwards.com>
 <20250314-apfs-v1-1-ddfaa6836b5c@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-apfs-v1-1-ddfaa6836b5c@ethancedwards.com>

On Fri, Mar 14, 2025 at 05:57:47PM -0400, Ethan Carter Edwards wrote:
> +static size_t lzfse_decode_buffer_with_scratch(uint8_t *__restrict dst_buffer,
> +                         size_t dst_size, const uint8_t *__restrict src_buffer,
> +                         size_t src_size, void *__restrict scratch_buffer) {
> +  int status;
> +  lzfse_decoder_state *s = (lzfse_decoder_state *)scratch_buffer;
> +  memset(s, 0x00, sizeof(*s));
> +
> +  // Initialize state
> +  s->src = src_buffer;
> +  s->src_begin = src_buffer;
> +  s->src_end = s->src + src_size;
> +  s->dst = dst_buffer;
> +  s->dst_begin = dst_buffer;
> +  s->dst_end = dst_buffer + dst_size;
> +
> +  // Decode
> +  status = lzfse_decode(s);
> +  if (status == LZFSE_STATUS_DST_FULL)
> +    return dst_size;
> +  if (status != LZFSE_STATUS_OK)
> +    return 0;                           // failed
> +  return (size_t)(s->dst - dst_buffer); // bytes written
> +}

You'd be better off doing a reformat of the white space before sending
the driver.  The really basic stuff.

regards,
dan carpenter

