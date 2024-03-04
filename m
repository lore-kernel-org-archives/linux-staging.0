Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFC33CF
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709560558; cv=none; b=o454MrYTij/UlS2NqXyRcEP47167OuXH/nWvXZdtsdWe1lR+ZUY/mv5MFt5xKNWqI49q/Qmsl5prONtOV5AkZB2/Av3x1cNwPE7jO5Icl+cKsM9iyXfDoGatIjV18DOEA+WKsBax1hgUg6LnRT4EsTowjGLO/b9AN408CBGZ0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709560558; c=relaxed/simple;
	bh=T8gzbEfslMiLzx1Qi8ScQ7hrgdpd/A0ARX/sB5jFeTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fecMUIGMTSD352DkLGVS/UZWJSvm6Uv1DNt8PK/RR1q/Jgj4U5inptw1u181x4YnDo8YyNSF6Q4YBbc0HqkyenUKh922Eqxeu82nxtQ5r3nRzXrzYxHxpBX6xRjyrp5oSpk9AahhCR/KxHXnLmxifn2Gs/XFTJWrIJsdj/ZQNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFwMkDnR; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFwMkDnR"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so3218885a12.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709560555; x=1710165355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d4H05t1CCSjg+RowIMLE2wT8S1vJe25ZBnWc088y5Uc=;
        b=gFwMkDnR8M/ugoaOXKhBUHFcXp3lsmLRdeQcEHSdgPv5atqbkZGL2iXwCJN90kn7TY
         ozdBGAJePYTA9yU1DFk0RYNUl8vp5dGI6SdocKyce19H31x9MNeyFrXaDwaVTbj/IQIL
         HxiJ58DJtwXWE8aLgSpkO96E9D/ccz3n5l0BTnY1tUj1mJldd9IjGS65TfXETZrzFo3G
         rVrQR8jftlp99g3vdmdKaVf7y4HTvFAwJbrKNb/YdRHiUrRly9csjrrq2Un2FkaYmlnX
         6Ece8ELMmn73swF6O8qhTtzEIC7hxaB4Cc8HEVDw3G6xweeGkx2iplzUyl2Uzlg6BlmV
         ULjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709560555; x=1710165355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4H05t1CCSjg+RowIMLE2wT8S1vJe25ZBnWc088y5Uc=;
        b=u4Nv0Th1FGpUl+QhPgAb1YorTkCe/iX9BdOaiHbMPE5E3JyWS8xqX7PpshodXgGH4W
         HoubQSH/toweXREUnfnjt8aUxefZx3ZUs0QVBXaNVmlCMihO7xMmHhfUf6I8vLxpjb4U
         D7qlj+W/ALyq7mwTcSkveekoc0P9SbZH4OpJymrkmKqumRaSR6U+5DHkAa0Roec/RXmE
         IxqdCPKqyNMHvXuaXimn1PDsrqv63NsPppwUSEnVMl3MxEgqzM144wLC2zWqIuOOtG0U
         I2bvTgy6nyoBib2QzH7r2N3ftj19GM/TobiL1MqySDK1ZT/PIP4KUpKHICkek1D/ensB
         KFvA==
X-Forwarded-Encrypted: i=1; AJvYcCVX4CEmjZMfgYA6ZAq+cC+zAOkHY1gYpLJ99OQgr1nt3FgKmBOjfxa5uOcq0MzAtlCKDULoFTYMtjiZA+ZJuGFIUzidSSWHk8ODtd/u9A==
X-Gm-Message-State: AOJu0Yz6eSKpCalM+Ibr5viOsYXTbF8jskdT+CRgPDt9k05Umw6Ot9pM
	aar2ifBJ+WBPFoaDIm1NASxLOMvzsEhPXyC+zJMgOk7hMCfkuPHK7giaN6J64E0=
X-Google-Smtp-Source: AGHT+IF85YJjopTqTCdjeejvTzNMLEGY0IvFqR2q6bQ2NaIPpBFEKXYQgW6P1SyI36EXJZpcezEayg==
X-Received: by 2002:a17:906:3b17:b0:a45:47c6:84d8 with SMTP id g23-20020a1709063b1700b00a4547c684d8mr1748521ejf.13.1709560554991;
        Mon, 04 Mar 2024 05:55:54 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709067d1600b00a3d2d81daafsm4928426ejo.172.2024.03.04.05.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 05:55:54 -0800 (PST)
Date: Mon, 4 Mar 2024 16:55:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com
Subject: Re: [PATCH v2 0/5] staging: Fix parameters alignment
Message-ID: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
 <20240304124006.26819-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304124006.26819-1-dorine.a.tipo@gmail.com>

On Mon, Mar 04, 2024 at 12:40:01PM +0000, Dorine Tipo wrote:
> Hello!
> 
> This V2 patch series addresses inconsistencies in parameter alignment with
> open parantheses, enhancing readability and maintainability of the code.
> The patch series includes updates to multiple files in the staging
> directory. Each patch focuses on specific functions or sections of code to
> ensure comprehensive coverage of the alignment improvements.
> 
> Patch 1 fixes the parameter alignment in cvmx_spi_restart_interface() in
> octeon-stubs.h in the octeon driver
> Patches 2-6 fix the alignment of parameters in various functions inside
> card.c in the vt6655 driver
> 
> Changelog:
> - V2: Modified subjects to be unique for each patch, as requested by
>   greg k-h
> - Fixed the warnings in the patches as suggested by Philipp
> 
> 
> Dorine Tipo (5):
>   Staging: octeon: Match parenthesis alignment

Do the octeon patch as a separate patchset.  It's a totally different
driver.

>   staging: vt6655: Correct parameters alignment
>   staging: vt6655: Align parameters with parenthesis
>   staging: vt6655: Match open parenthesis alignment
>   staging: vt6655: Fix open parenthesis alignment

Combine all these patches into one patch.  The rule is "one thing per
patch"  not "one line per patch".

regards,
dan carpenter

