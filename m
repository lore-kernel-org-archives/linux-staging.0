Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4B11DF72F
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975568; cv=none; b=or1yHZjbdR+gLUzZvy+0eXbHq30QTdN8AG2tx7z0j0o7xRxeUG0bQSA0ltOv/r7ShKSCJ1vB6LRf77SmbUsXV/Zfq5AjdxOzfZbGdBYW4sKdrTFuBhjjEjBepAI+qy/i9n7Atx1twlNRy0r+M8BCfCFOX3PJGw+vnsYwvN5+OVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975568; c=relaxed/simple;
	bh=6j/q5jZeNYIJaSJBIbNYp8UldWBNDl1RRgHXzxLCPuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS2JFNO4LcM5GmXeBaH4jimB4dAEQvxAW6QPcgjAPSinFGQUa3MpbmTONo4ZqUy66s+/4ZM+saRAN3jIWOCKqBY4KthxjMLJys1kuYj9iS9GuBu958fWkc0UqbYXKCtIwtUSB6XqrurU5LPSMu9rQHxFAMhyHPWYhryLQYlIsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0BBb2yF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0BBb2yF"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso103561366b.3
        for <linux-staging@lists.linux.dev>; Thu, 07 Nov 2024 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730975565; x=1731580365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+Td2/TyRkFUos1mmxN0m9Ig3oWF9OrCgQ+Z1MZuehQ=;
        b=C0BBb2yFD8S0CfBlIjDraJLoScckMc98hL8ruw2nAVKYSAJVqQPzKLnAacOJtLFJi0
         Ti3FaikL2MJ6DlT16i+LCK+FqpESyru1HcavhaEy7NuYWv8ou6ECQdZJSd9JyQ4ee36p
         PMmvCvkY/QhmhgteqF/JEuIKOHmG6vBlqHlvRCLZ2+uTLN50p8fI5zSVhXZdVriI5Hm6
         ELWMnqWUHIjjZz8HAIyk5wfPsTNW2yajlyZmOAwSf6r3TmwlrSGpuCkmKlkJlKjT1qO2
         gwmClALJJ/01M99kEOX00mFWV6TUYEBxqKbl+HnPND9hlHlz30Nynkdw0LqflHdGoPbd
         MrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975565; x=1731580365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+Td2/TyRkFUos1mmxN0m9Ig3oWF9OrCgQ+Z1MZuehQ=;
        b=Lkzr9XdeFHXcAxqIeDVD6LiP9vpUObo4eZz41HFcZINB4R/9wwFtDS5pejZy1RL0Ye
         mFwxu9qbRYvjXQVBP3OK+OK+MAj+MTyprpucuJl6R6c2nxOvheKGQI+P/AK/OIUsSpzR
         3/BwrMUlRDBCwrUYvuqwrEJiHj+W1BdSzBkGBuw9CZObnBGE/zw/0kAWU+rWsHSKAeql
         TbIeu/k1owaYAxqmqDy1cpd2C2J9y1xQGUgPAtdoHhjLz7EiCRvF8tzra1FbDQcNYXIF
         pYqFS3qPUt5AS3bLCoXZgFMPuWVD8qkJAFsxq/OL4ywVtbUKhZfulBwFi0mSSh/cLrDG
         rEww==
X-Forwarded-Encrypted: i=1; AJvYcCV+Akrl/Kfz3LofFAcrpWw2VtIjBhRPGRR23xpn34NkIacJyb5L4HpCCoXXwXjOlja319yQMTfkmJ9JyVcV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6gZVGvgZWphh2k7cGLyrtEOZ3V1nV1Ymp1CsJuzlZLUraGrJT
	4nkFt2tn0pJ2S6WSXOkgUpVVXIaGL6bg8NlsVIesq7iDda4/uvR4GjS1YUShLpc=
X-Google-Smtp-Source: AGHT+IFvw+FygKnAy8Ch/kBDfr35WGGevKEtvuhSueC9z6MRjETciD3o758OcY1MT1zwUgt49IrSQw==
X-Received: by 2002:a17:906:7952:b0:a9a:123d:3f1a with SMTP id a640c23a62f3a-a9ee74a204fmr42451966b.17.1730975565240;
        Thu, 07 Nov 2024 02:32:45 -0800 (PST)
Received: from localhost ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c7c455sm612174a12.73.2024.11.07.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:32:44 -0800 (PST)
Date: Thu, 7 Nov 2024 13:32:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, daniel.baluta@intel.com,
	shubhrajyoti@ti.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tanghui20@huawei.com, zhangqiao22@huawei.com,
	judy.chenhui@huawei.com
Subject: Re: [PATCH v2 1/2] staging: iio: ad9834: Correct phase range check
Message-ID: <333c54f3-3d4b-4038-94a9-ce8396b452ce@suswa.mountain>
References: <20241105140359.2465656-1-quzicheng@huawei.com>
 <20241107011015.2472600-1-quzicheng@huawei.com>
 <20241107011015.2472600-2-quzicheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107011015.2472600-2-quzicheng@huawei.com>

On Thu, Nov 07, 2024 at 01:10:14AM +0000, Zicheng Qu wrote:
> User Perspective:
> When a user sets the phase value, the ad9834_write_phase() is called.
> The phase register has a 12-bit resolution, so the valid range is 0 to
> 4095. If the phase offset value of 4096 is input, it effectively exactly
> equals 0 in the lower 12 bits, meaning no offset.
> 
> Reasons for the Change:
> 1) Original Condition (phase > BIT(AD9834_PHASE_BITS)):
> This condition allows a phase value equal to 2^12, which is 4096.
> However, this value exceeds the valid 12-bit range, as the maximum valid
> phase value should be 4095.
> 2) Modified Condition (phase >= BIT(AD9834_PHASE_BITS)):
> Ensures that the phase value is within the valid range, preventing
> invalid datafrom being written.
> 
> Impact on Subsequent Logic: st->data = cpu_to_be16(addr | phase):
> If the phase value is 2^12, i.e., 4096 (0001 0000 0000 0000), and addr
> is AD9834_REG_PHASE0 (1100 0000 0000 0000), then addr | phase results in
> 1101 0000 0000 0000, occupying DB12. According to the section of WRITING
> TO A PHASE REGISTER in the datasheet, the MSB 12 PHASE0 bits should be
> DB11. The original condition leads to incorrect DB12 usage, which
> contradicts the datasheet and could pose potential issues for future
> updates if DB12 is used in such related cases.
> 
> Fixes: 12b9d5bf76bf ("Staging: IIO: DDS: AD9833 / AD9834 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---

Fair enough.  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

