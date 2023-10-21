Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD017E4
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcqaWVNQ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c50906f941so23662671fa.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697878764; x=1698483564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSwg440wrKhxzi4Nkn3o8cAc4S4zNJPVYbiVkpDxWbU=;
        b=TcqaWVNQtzudiDz/u/MPQRj79vBs4O3eqvAx6FAyV57y1E8ig4/31Ho0OD3VDGufg/
         Si2fhQIcnSkbQPN9DZN91oxA8xPvNAX8fdmmg/6F3ldN8ie9p897+KsQqq9tYpKe3A+3
         1TauT1Nm+ByVGkXbfWbdKa8c+ycVg8oEl72FCqwYQLeGdfddfNMd0Eq7TFVW837LAk/z
         xrzMu8rwjq0IVOVUPeHbIaZe1rE91x94jAaPHnWRQJFWDu81cHUFsu8nnQjXNMx6t2xY
         ovp7/d+O6/HLIgfmUXzQAWaj/Ss03KRLC3WEzy5lP3vCMo2u1Wv+hZF/Of13s3J0uQYi
         7ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697878764; x=1698483564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSwg440wrKhxzi4Nkn3o8cAc4S4zNJPVYbiVkpDxWbU=;
        b=YcMcu8bgpj70IyNma21cyrkb4SEt66bWoPFzYHCj4HOD0DwC6jaetBdIdIsQpD6w7b
         2LG9RgjBVeSPk2xsDh3CwjlH8nDTn+JzxUCHIkuXnZGv4ExR96OYDJVeZ3d1veFwIuOJ
         tuWvdIzvRKSRSdVN0M44LIXndZshkcAJkJTO6fqUUqOKkOcCXagGyOlhH0+l4ubcQ3fI
         7MsaGanL3JWh9ANxdj9c6NYUzk5LbD3fpZapSYsvvS3hTELdKeHdD4xQmOl3M1yv6y4B
         l4L2LeabXSCqT3v1K+BZ3WxKimdRm+ve2P8aNZLqHiHs5ptxSrFmKwr5IjYLGChoCJXh
         zYGw==
X-Gm-Message-State: AOJu0YxGuMUGt1QOHPcLKaNjVSW7uoHFVb2GILv2YmqNN2Pg8pzpIVYZ
	8GsUF+C+CPmlX9hl51sKsby/qD5D9T4=
X-Google-Smtp-Source: AGHT+IFflAxVmB8sFEQDUCHUnmO5qofTQafZCiOyw5fLTsst+5WlUdDVvpWG0V4Q4SIhjuak3ELMvw==
X-Received: by 2002:a05:6512:3b87:b0:507:b15b:8b93 with SMTP id g7-20020a0565123b8700b00507b15b8b93mr3566173lfv.69.1697878763561;
        Sat, 21 Oct 2023 01:59:23 -0700 (PDT)
Received: from HP-ENVY-Notebook (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b00505713722b9sm780928lfr.38.2023.10.21.01.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 01:59:23 -0700 (PDT)
Date: Sat, 21 Oct 2023 10:59:21 +0200
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Fix warnings due to introduction of new
 typedefs
Message-ID: <ZTOS6eaygOA6nRKD@HP-ENVY-Notebook>
References: <20231021081409.67570-1-bergh.jonathan@gmail.com>
 <2023102111-sneak-abreast-8061@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102111-sneak-abreast-8061@gregkh>

On Sat, Oct 21, 2023 at 10:32:29AM +0200, Greg KH wrote:

Hi

>  This looks like a new version of a previously submitted patch, but you
>  did not list below the --- line any changes from the previous version.

This patch is a *new* patch which replaced a previous *series* of patches
so it was considered a *new* standalone patch, rather than a new version 
of the original series. 
  
> - Your patch did many different things all at once, making it difficult
>   to review.  All Linux kernel patches need to only do one thing at a
>   time.  If you need to do multiple things (such as clean up all coding
>   style issues in a file/driver), do it in a sequence of patches, each
>   one doing only one thing.

This patch only addresses removal of typedefs from the declarations 
and fixes up the implmentations that relied on those typedefs. The previous
advice was to not make breaking changes across patches, so this patch 
represents code changes which are as atomic as possible in a single patch
without breaking the build. It does not mix formatting / other changes
with the code change. 
