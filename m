Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51F3321B1
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057890; cv=none; b=m4MikMvaqtNCuSYVUA/0lhHfYvbP9+i69u4XeQmpN0V6jbAKds3vXp8ZcZakvy5sU4NTbwD4UulymjiEvVMaYGVL/oKqfQLnZsXg2sjWCTdrbZH3oYw0DuWSxRg5YeUcyESzUSLzPEWssdfRy7DsSMOQKu1Yv5vz/9uGta5nJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057890; c=relaxed/simple;
	bh=Yo/yTzvUAok7/QhwMz7HSgV+S3pkD2mUS2UTGE6ohpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4sd37UMaexOfNTRMZFaLRPfzEKZCPXYykUOMPa3S3DdudWovEgyQIwfsBV2Kb15Kkqa6TG5J20SRJDIYubxzIhLVBHkJbFvI7eRVsrhymHragzpZcz1ctL+212U5NTxMIckXC14YPDhkfvHBMdXY1S21p4St8muW47VHvjdjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsyFVh4j; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsyFVh4j"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5351215f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761057886; x=1761662686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Av8IBfMMjsKBIGxFlj4opsN+fg29ZutLmUYj6SO4efM=;
        b=HsyFVh4jYb91W9XGw+TnWtYi10qbv4y3KBS+rnaWYVlozcNGjYlhBD0idK3pngLxkh
         1Nd8P9H6U5xvf5XqJJka55foj18Tt3imZdkbnK+NGlUfHiN7IfNTli7d1Xuvq+TqWTXz
         fLv1vaWRJ9y57x5Ikf3t+T+DsWKzR+J/LXtap/r3OB+gZ1pVXjIMgT+x8y+L0GX0+wPe
         joy7iPZ1I9D6/62z8HqyzFV4DhQgc09bjb2Trz7tunEAed2jSXHrXC5G+A19XuzLid4b
         mEW0kaB8QCx8NZrgIPLmufiLbuL+2R25SrMRlmhCaZbRTcTyRecsdbRgHxAzhNCirdam
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057886; x=1761662686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av8IBfMMjsKBIGxFlj4opsN+fg29ZutLmUYj6SO4efM=;
        b=oSCAZlmxIRfvzzfs6GQqgFkjlsq2/QGHH9JOhkKLWeEWIteLm1jyPJvCgaRLiU/jk8
         ActPOHLuPIfdfmnqmSLSKBlLo7VqxQo3ywLnZpku9suNNWiozhS199fPPiT7Xm+I2XJt
         6fbzZejTSLWTEVUFsImGWEFKZAHsLvqsCU23qJ2QW6LiNNnQxNHeUnK9HUY70ySPTELU
         lBqc/0VNvxbb06L6+XNt3UTKtnm4aRNasFE7Lg9Heqb1rKRUFfJhfc2jMhtU2P5mAFrM
         TSSwd7N+vGzcPOhJQInDLePwyJ7UrExqaMzpgRd6R/oHJVqAdJyWOjnLHYYQ27yB6caX
         L8xg==
X-Forwarded-Encrypted: i=1; AJvYcCXCdIoyoi5EAeLEuc3875dXldSTLTtNFqWUemRMMMSqypwS2QWDQ4pfQQNNOc5ZlM0FxL6xL+l97GBUXKQe@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3TktGz+P//NPh0QLIoHOi2vLSnx60LWELcdS4Nf8TF93bqyrr
	FTV+hP7cb5O1HeDtowBdQgIstdy+XlAFcxH5n7+jb2C//dW/rnZtvVebD9miV+9dim8=
X-Gm-Gg: ASbGncv/Oku4n0KDRSmNzlusHYgUqnYOqRkaJQlZs3H2gAZVNQ84MZR7554G6QYGTUs
	/q8dt25wHiC7k3hdi6C1PgPQW7tUEzL/DXi2DibW/6Mcs/qpJ+QSxP7qEYfQhiBLpBUZ91+c5If
	0UhbT2obcVF9EFaC+nJYSn+G/YOSEQvYHlyrR75HfpcrWPRClR8JDKHTaN9wDPULgkLrxiuCqm0
	jltk2jlYsc8ugXfYhlxer2CHdHZ3eZBHcGO40jubXwwqOYMgIJ5bluHHtcIqsc6EN9S1m8/GSYj
	+W9VbuF0UEL1zEHewWm9A0ToABtADX9ZRwuv6dFHUUdmvVyYs9SrJNmAipt3tiJvqNCspBTxN+5
	sWFvhJdoh9RAItZh/jasRgchX2+mqRRYS9XavKvVTSyDQ1pc/YeuDHAzRXN8HiQQWfj/EQ9R2Qy
	eVnf3kxoDl/OAhcH/m
X-Google-Smtp-Source: AGHT+IEj6KQ2OldPtJ0vcIryoXBwJzXD4c3WjkM1sfYaEvF/TzOoY0b7D67FkyFfjXSNRbghQYD5MQ==
X-Received: by 2002:a05:6000:178e:b0:427:241:91c2 with SMTP id ffacd0b85a97d-42704d963cbmr10663718f8f.30.1761057886177;
        Tue, 21 Oct 2025 07:44:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4715257d972sm204171605e9.1.2025.10.21.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:44:45 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:44:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: use ether_addr_copy() and simplify
 NULL checks
Message-ID: <aPecWlXhip0Xn345@stanley.mountain>
References: <20251021143739.35948-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021143739.35948-1-dharanitharan725@gmail.com>

On Tue, Oct 21, 2025 at 02:37:39PM +0000, Dharanitharan R wrote:
> From: dharanitharan27 <dharanitharanr05@gmail.com>
        ^^^^^^^^^^^^^^^
Remove this.

> 
> This patch addresses multiple checkpatch warnings and coding-style issues in rtl8723bs:
> 
> - Lines 120, 212, 215, 249, 255, 256, 261, 262, 263: Replaced memcpy() with ether_addr_copy() for MAC/Ether address copies, following kernel best practices.
> 
> These changes improve code clarity, align with Linux kernel style guidelines, and fix checkpatch.pl warnings.

Wrap your lines at 74 characters.

> 
> Tested by compiling the module successfully with:
>     make M=drivers/staging/rtl8723bs

Move this under the --- cut off line.

> 
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> Signed-off-by: dharanitharan27 <dharanitharanr05@gmail.com>
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Delete your second email address.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

