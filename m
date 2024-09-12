Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403D1AD256
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726153782; cv=none; b=N9nwn5LGPYTdQDoNeO95hYaXqV+OBUQEd3mGkrEQIJ0m2fJ306PH5MgNYcp/uvSYiMnlpn/4HtddkMoOehGt9eKShZJQRDKn56ST3JIXe2ETGuHMciLjN8Mrosu8dTlnnIeljnTUuNuO9OdCVUsgufgAqgXNK5eQUbg3IeMyrgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726153782; c=relaxed/simple;
	bh=jpnq6+i4OOoUnH1u60SSe0DzWX0QpN9JkqbO2mQBiM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZgmjtuWoTf7J1/Un9vM9jQQ/iaWfueS/9u9RLTOX292sBGEVWBP5BiNM7qBL7JFwD4oxmbVBxcMbSZyxsh3CzQO+lVR2lPwLBweieq0W5maEfll7A477+HpaHSflmU0wmWFQaOwug8/Ha9WFHUS+pANJOJlFn2P+3AdcSpSqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7Rf3Hcw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7Rf3Hcw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso139195966b.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726153779; x=1726758579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2FTFSt65RpqX2pKE+PYQ5IJqaSrd1Ivf+eZBs0Jl3Q=;
        b=T7Rf3Hcw+P2uzl5Qi2pNcZr+4EsGKBsZvcI36md+qyQ2WcBdbmbXXvW63jKOnP2o2m
         fdnzKx9Xjm0NPDS05GWurN6t6jTSIgiJJoGHRKpNL6uYJ9dJqZciXRz5cBg/prC3Z0gS
         e7k3OLR0l8RPTWyXYX8WlgRBTxbTY1YRcz/fnaaSSSUcdHi/uKyZ8W/kET/j5wNyVqNf
         8zr7PqjIGh+N5tVOipVicagjI07626jNIVx3L5JEjl3ygs+bErabmIyQZZVmjjR9UR0G
         Bwwe+fJPFMNztQXP67HK1hodbheZ+gAUPECRiKk3raTn31PJ/wlJIl1hAK7VG0mVZblV
         lR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153779; x=1726758579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FTFSt65RpqX2pKE+PYQ5IJqaSrd1Ivf+eZBs0Jl3Q=;
        b=EdhaOXf5H8moin9nb3la9T0wtAOKZsEOzDr/2Uzys9S+PB39oxz8N/XAT6M7FKR/wl
         z0erBLOptLP83rPr3XXYmW0NeHNy2UPAWQaq4AEEtJRFZUhZTF2iWcnxCTb2OaFBeUOE
         r5IqsM9xogb0qjLXHYa/eSHs+c9I8VfnO1rOLssZKOG0fpD27Mzjb4WQ5qJ+Lja07n0a
         dqwe62amu6o1cBPfqipG/pBvirB/IizHjU0Hpo5kcmKzOXFplHgxzPmJAENVNrL3UUnL
         IOERle7XJuPvOUqKeYkh4cMAlZvt3XeBfcuIXWfyHSfOdkLTd37lDPLhdPSBmogTf/UT
         KU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWANHYbDjHiG9SpD4VEqsUOUKXsjk/6Fzig+jXHj3dH/eVDB7ikOvrCT7yyOWiXCKlmGB/K7v18YVgMcZlF@lists.linux.dev
X-Gm-Message-State: AOJu0YwY4hdiYLF6T5ozYBCyCaHOgSFW+yy/rCwAjgdQX5ueJArV18Nm
	5Aa1fdPyfOl8Icvt7WqK27qlnepdO88AOShAw6XUbo7Ohs4XLGo0FgRJMIXgipk=
X-Google-Smtp-Source: AGHT+IFx8uklWz3IvdJl75Nws6S3qWWNNUNkE8Qf8xQTCLyZLWokkWUxAMVluycglpcbiI+lT958kQ==
X-Received: by 2002:a17:907:c7d4:b0:a8d:60e2:3972 with SMTP id a640c23a62f3a-a902943a562mr313368466b.23.1726153779212;
        Thu, 12 Sep 2024 08:09:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d74e26sm763631266b.225.2024.09.12.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:09:38 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:09:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: b1n@b1n.io
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Rename variable apTD0Rings
Message-ID: <9d12ad46-d028-4be7-b8e3-2167e214ae66@stanley.mountain>
References: <20240912145234.75499-1-b1n@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912145234.75499-1-b1n@b1n.io>

On Thu, Sep 12, 2024 at 10:52:34PM +0800, b1n@b1n.io wrote:
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index 32d9cbd55222..32c51d794264 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -135,7 +135,7 @@ struct vnt_private {
>  	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
                                  ^^

>  	struct vnt_tx_desc *tail_td[TYPE_MAXTD];
>  
> -	struct vnt_tx_desc *apTD0Rings;
> +	struct vnt_tx_desc *ap_td0_rings;
>  	struct vnt_tx_desc *apTD1Rings;
                              ^^^
It's weird to have ap_td0_rings and apTD1Rings.  They no longer match.

regards,
dan carpenter

