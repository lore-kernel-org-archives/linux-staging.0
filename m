Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451862459FB
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197089; cv=none; b=R+j63S5nHoDpR++f+gGYs0nUB1w89TJkDRTdvWatq5OoLiRw1+fJOYS1PrYizZfLDlTPQ8zPS8gc7yvg036YHMpdl2eRlLd65z3G79hwShG4FahjYS20Lb8MT77ipVBxqk54z7wshRMN58Z2WC7jRQDDRU1ydyIQ+XIo1JoqthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197089; c=relaxed/simple;
	bh=ik9ItygRr9yIPW2Mc/PZYhjH6z8YDKHWGfbwtOGw0G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXyWp8NjzQyuJDIGTjzmDtaCTmw24dHMqcLbtYgxqGkXb/fYY/n4pyyBjEjMifZJshLkjOddPmGkhZ+726feXpEpVtNKfO/T6T3RDcakM4f9kkrD4bB5dYSKgB5GNcLHae/lQzZ3Zhl80nsegVRE4ORiPkBzWivKV0n9a7p5lTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahs8ym+T; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahs8ym+T"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4414970f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744197085; x=1744801885; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hUKCIZwdAKFsLiLYa1VO4wMgsObAoyYESjSHJd2mFE=;
        b=ahs8ym+Tjg4eNDH/hc4Wa5LbUNuvO9Ag13MbyHHH/4ZL5H2n+vkQVkxJ7DZXuy+oRh
         IsZt7H2jv8spx54boLbnYgCf3qSulMOmCLvFJjV2Ojs1Az/q0Zz6F+KvxUCYQqaRgxnN
         BAijdUmeywkH5yaQvPc26+vbeoV3hTOewxFfoUwasp8v/zZW43MCAK/cc/1n8TREF3Gs
         yvZaqFSGLC+Wps2fgsB1g3sm5Q1Dd+LX/jyG2qELnkFX3UoHPp3gFa21BpNmTwtE0HuY
         2khnzsy5Mc0Zw6c3Dy+WMmDqONpC/bW+WWT5knoyn7nM8N12fvulqjGykFJTSwLTlQCY
         CAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197085; x=1744801885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hUKCIZwdAKFsLiLYa1VO4wMgsObAoyYESjSHJd2mFE=;
        b=eJ66DicU9vVUUTvl9yHHh92bMFVFUvddQCahczW1/ZMaJdtwgUxDAywMa2lyRo5R5o
         q/Essw08R9jEunIYed1lUmhsVxefLrg6V9mg8bVbJnHO67qR9sLVnVL1H7BRYvsJodUk
         midn3s9OkbhXsebPvtMvs2CHh4GP1g0uzWzcUJZycF8wWmtfzYUpsSvZz5k05O7tjV7i
         d9nfxRo/pvf/fb3dgqm8w37Nzi5HAQ5uzsOUEyTjp1S5ZLmSf/SzAmWRukdfm1KMUsRh
         C+DgK7CtcUWxRRPyTp8JLOIgmCn7bTaAEtZhJyPO7qVD9O+Ld/ae+4qvhaknq0ec5dQW
         woqA==
X-Forwarded-Encrypted: i=1; AJvYcCX7hp+9tHAw/tNCesiiXmAQ1YtdalxjXswm9+bcuIM3dtGxvel0MXFjtizdd+b3gKIizoAxmb+kR9H2X1v6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5pmuXJa+puPNLFzNAp4NcXkyIPXGua+KRaqK0UnI7M2IcRBCh
	iLNQiredoqSP8vu50KHryCcp+lnBPFffla1wIjUSWYy99RVCJ45VFNz+13Es+2A=
X-Gm-Gg: ASbGnct6s3QPt6ORXJuLTqsWLxepAsu9XWwNrgQOcmvwJUfUeCRwv3FOXkLixC9txyq
	qw0p5BNcQVGfgSmFPlDNOgsf4aczvYC8ebPHXRwKAanuEjCCzs/UQtcpEQbedk8Wrf//XezTyvm
	NwvIVnq/8ta7txcDb+/qMYPGXZ1ErOAIrHsK0wjBuPz6sDa+m6WlkcMHbUVEQkdQr5NZjcPdIkp
	FYHVqVaP+OKVmf3ISxlxZPvcs69fjq80HiQlweCgIcHl7kZwDl6+QZMMAg8D8iIVCX3kfEfkPvS
	LX6K8ftjdD+mgQUwUBV5ymsEXXoFpcnCgSuU6Jc3M5wkDA==
X-Google-Smtp-Source: AGHT+IGXax2LtMxOpUGA9r+oCr9bPGcaXFt/3GzRkKF3FDOJvk1Gx+REYad/Sskufy4uK+n2UYFvKA==
X-Received: by 2002:a05:6000:4009:b0:391:4684:dbef with SMTP id ffacd0b85a97d-39d87ab6243mr2104415f8f.17.1744197085566;
        Wed, 09 Apr 2025 04:11:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f23158849sm13409175e9.0.2025.04.09.04.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:11:25 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:11:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Erick Karanja <karanja99erick@gmail.com>, gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
Message-ID: <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
References: <cover.1744192642.git.karanja99erick@gmail.com>
 <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
 <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>

On Wed, Apr 09, 2025 at 07:04:18AM -0400, Julia Lawall wrote:
> > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> >  		}
> >
> >  		if (offset < EFUSE_MAX_SECTION_8723B) {
> > -			u16 addr;
> > +			u16 addr = offset * PGPKT_DATA_SIZE;
> >  			/*  Get word enable value from PG header */
> >
> > -			addr = offset * PGPKT_DATA_SIZE;
> 
> I'm not sure about this one, due to the comment.
> 
> julia
> 

I feel like it works.  I wish there were a blank line after the
declaration but that's something for a different patch.  Both of
these are okay with me.  Try to be more creative with the subjects
next time.  (Just put the file name in the subject because that's
the only difference).

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

