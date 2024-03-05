Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA04CB58
	for <linux-staging@lists.linux.dev>; Tue,  5 Mar 2024 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631711; cv=none; b=dwiBiV7o24YLMfWCOJ7jgIx3ebsK4yztMF8baPqBK2TJm+RdKOuNTjZIDg3SM91yrIG0yJ5O7Vd69URQprRzk9CYZFZFQb9cVu/II4Vi7LzaweNqgKaPg22Mn7Mv16rrTkqxr2Fx/snAPr7zXLtK57YSNZ5RDH0ZQWDf20LFrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631711; c=relaxed/simple;
	bh=LY5SFQtEbeuj0zVJko+1QT4Nsms8b091YtukXSVCqzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aptA1XIaD7GDGBnI9X8vSiJfPD5xuWWAsoa99WCPqGrV8sZsyUn/Wm/2S6ipnbs7bYd6edsdoYqExjVCDjl1eDOsV7f3vhuPmWISjt/aesBwqX5eoZAzVXBFY0fM645U7rnV/GhS+uTXwA7hiaea1x/6+RaMS6ffyw1v7XbcFAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8AVqktX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8AVqktX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a45606c8444so215731466b.3
        for <linux-staging@lists.linux.dev>; Tue, 05 Mar 2024 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709631708; x=1710236508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vz+UY5APDUxWQCr2wiHM0zqwhIBwjwIOhYDGnLV7NtA=;
        b=b8AVqktXAkyR5qh7hiYYvOu8Izv6kHadVhE6hQoOvPOGlADpmVThvifHOVl5kK92E/
         xl7kxxLFJesnfGP3SRG+CjjnJDkswxCaQmMBrew6RN0XY9DLlyxWqcwAiB30TbNZ7nVN
         7iVHJ45NcUdRPmnFiRCZgVCZlMGsPXJWbzkX8/c+m2umfEl9i6fR1Xn313JZg/1wI68f
         VyLYzdfycdqowe85uiuoMpMqqCo84tNkk/Kzo5wIhQdiyVYEx3jD5r6Pf3aTjEMIK5nw
         SMd4fFKuV/Gp8hdxNwNq0g2J86ScmeOPDZTM1PbZ9pEYH5BLf6jBqFJ1mmpvz3rRNYTO
         dZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631708; x=1710236508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vz+UY5APDUxWQCr2wiHM0zqwhIBwjwIOhYDGnLV7NtA=;
        b=Ttbvk8RQgQ2FoRGuld37JOmaO4jsZkNExRL2U3cAqCr8IHm+Q4VOTD3bbrmmWz5ads
         5G1CbC7H0gysyRU8F8hjruLRg4f9+IgqXJareI+EoVRsdMAXBB0rwu5vGw7zzIuXwAAk
         TKhDRjuVqPeExQPrUYdkDbhGcfBT7YY30znjK//eCGLhC2bZ42BS1rKOzXWezR6S2e9a
         EGdSO9xQk9lzgzYsQQ7YPwSQwpKtD3kzkGe2fGOENxGTU61n91UHySg1YHScQ6LeOocD
         qZX8qFVAlQrkwM3x0jLNfjg5IZnr+Y5ZgALbDpmlkyOREkRtCNrB49QM8Hi7outuoe72
         0frw==
X-Forwarded-Encrypted: i=1; AJvYcCV5G/Iw3MOTuUmYR9S2jVgwbOC7K4H5gPQCj9cTRoF0aqj8Q1Wa9oW2sv0ypqJWvz/Ls4mEaI/nEFi5TP5o2b0e3RJTbNcgY0jKkjzm7g==
X-Gm-Message-State: AOJu0YyZADSxRu/EXwpmoReo+/xI5tI5qoqWT1K72IzbigR9tFFbbqfQ
	Y00UxwJ3u0JwPLqjC1ERjWaLyGmN0SLtjm94wEWUOIxd/YLlfOItsNSZD5HUZpQ=
X-Google-Smtp-Source: AGHT+IGqPGePAmS+wYabGhc5tjnzYVcM1JlFLrh8q+iowdoS6xakzfCCJ1A47yD5kheF0luSC3DHWA==
X-Received: by 2002:a17:906:3811:b0:a40:bff7:6e73 with SMTP id v17-20020a170906381100b00a40bff76e73mr7463992ejc.36.1709631708265;
        Tue, 05 Mar 2024 01:41:48 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gl11-20020a170906e0cb00b00a448fab02easm4688703ejb.37.2024.03.05.01.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:41:48 -0800 (PST)
Date: Tue, 5 Mar 2024 12:41:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v5] Staging: octeon: Match parenthesis alignment
Message-ID: <20d2859c-07c6-466f-a48d-4c96b414e25f@moroto.mountain>
References: <20240305051411.6431-1-dorine.a.tipo@gmail.com>
 <20240305092310.3594-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305092310.3594-1-dorine.a.tipo@gmail.com>

On Tue, Mar 05, 2024 at 09:23:10AM +0000, Dorine Tipo wrote:
> Align the function parameters to silence a checkpatch warning.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
> Changelog:
> 
> V2: Fixed the warnings in the patch as suggested by
>     <philipp.g.hortmann@gmail.com>
> 
> V3: Reworked this patch as a separate patchset as suggested by
>     <dan.carpenter@linaro.org>
> 
> V4: Added a changelog at the bottom as suggested by
>     <gregkh@linuxfoundation.org>
> 
> V5: Fixed the commit message

The v4 commit message was fine.  I was reviewing the v3 commit message
which was messed up and proposed a sample commit message.  But yours
was also fine.

regards,
dan carpenter


