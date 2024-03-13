Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C2168BA
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315099; cv=none; b=Uown9UL9RFCpR5jQIy+k/ZNpE0jIEyK0UCRQZMIf6P7K/dNfkiVGsmgKUzvxi2bBKRTmrYYiABO3elYxEyczecvQ1ZvGGhe2hbfy24lNmEp0SXWmwG1E3i1LI1/G5vk8bxuACcsFoka54V9HKSHjIlybJoOeiCzdUfjvPAKX/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315099; c=relaxed/simple;
	bh=0ulPmN/6zRMPDefW45bWSkdaoWgY//u8/MxBvnfZAZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THGduBVl/HtsMu+GCZf6JIna4Ep/nSg/TsRpcWiTp6EEpsen/KIPHZC0jvlIO9qYvR9ZYWu+GcrT+Grm345gX5sAzupWZz5WJbNcMcjgWRqL9Vf/13CcPEXFNp2EJVH4jSCPFXwKiJNUfgmwQMxNOTLFO1/RlbXnKts1aMLnHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjMblNLa; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjMblNLa"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso570646166b.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315096; x=1710919896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOAwKQmgsPY1H4V2RUkh1YvtW25a6UVBaZMleLqQrNI=;
        b=hjMblNLaey0q9b0+2sCzGaV8UpZQWBE+TU4mgsdMRCxy/wKgqcUFWVkhMiynpPptF9
         j70i0D0wDgulXz8pkcWzG4pQD2lELuEQpuSP+RbxCmEYSe/3VJsqEQwq336Ckc3hohhW
         91CILANIoi+nxfuPJtPYlKZa2XMjgub3PpS+/x/WzOXROL7ydbaT7Nra6OlzUxAPg2V1
         +iFNmV7Ad4/0qQb10KZH+IkFX+9rUknts1UsHxtgsb4aqXwjkZDYThrSFLflGf0Jjr9i
         UBbUCvt5zYIeEbj5H20Uyfack9NoUwIeYvGXKU4iTneVyI4G+/xyPkf3BP6UJgznK6WM
         wHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315096; x=1710919896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOAwKQmgsPY1H4V2RUkh1YvtW25a6UVBaZMleLqQrNI=;
        b=N1vSFyzz7ErtKNOLi3uAZbbFeIOpsc5QX/YIt+Uf15/LfGiMj+Vr6diOFC41U7VnYH
         349Wo0x4wJLL15bXeWjyvtPaTe9jztTQQShpzqcR7wStfd6UiBjH0GOSLvtGcAqwf7oZ
         zqaF55y8FlOZO2sYSlzpk2CTLojo7Co40+qEkWb/VPB5hlb+Vdd5BsaC1d9LwJe193Ex
         VH4+lYmmNiSOi4/MXHBjNZw0fxKTA5LmB697Jq/jZy+nMLrynCdIjQRyoMR1CDWJ9lsf
         MA8emjl22YBFmy8NJrewMWJsESubaEbkwCCd/Rh81VW7NRcrfIzrh1nC5Qn97Rav0EBm
         Aftg==
X-Forwarded-Encrypted: i=1; AJvYcCXlXhrCL8DIkITBsIt/Jw7+xADxEiyaRHYSn5RI3NcnrV29Qf2XfaIvIZX3sIT6IYvBHZIqOiNfJiXdMJFm0QD/WezpcfO5ASPhADrvsw==
X-Gm-Message-State: AOJu0Yy3On4ZNZj9O0GTUiChP2Sd+y7Ro/Xndvg4aG8SAi45xBxTM7+M
	5eqAywqI6W9yWtudUqW4cItMWtSN1epcHgjoFiX+ZRmhsQUTL2g7YZ+M85B2J04OuTvoYsSg8qt
	p
X-Google-Smtp-Source: AGHT+IHCLRlF7VgwA/kF7PNDT1Xh0kGqxJO73kGaHCp1D8H3TRLSo6xlRZXbWd1uFRMKpky9B3cI4w==
X-Received: by 2002:a17:906:f156:b0:a46:4800:123e with SMTP id gw22-20020a170906f15600b00a464800123emr1501624ejb.73.1710315095706;
        Wed, 13 Mar 2024 00:31:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709067d5400b00a46224d4442sm3043466ejp.212.2024.03.13.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:31:35 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:31:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8712: rename tmpVal to avg_val
Message-ID: <7a84be06-e19f-4f60-ab94-7758d5df1ff3@moroto.mountain>
References: <ZfFSDoNPjQypC829@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfFSDoNPjQypC829@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Wed, Mar 13, 2024 at 12:43:18PM +0530, Ayush Tiwari wrote:
> Rename local variable tmpVal to avg_val in function process_link_qual
> to give intuitive meaning to variable and match the common kernel
> coding style.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
> 
> Changes in v3: changed variable name tmpVal to avg_val
> Changes in v2: added a period in message

It's not an average, it's a percent.

regards,
dan carpenter

