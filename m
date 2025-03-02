Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4F208A9
	for <linux-staging@lists.linux.dev>; Sun,  2 Mar 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740912925; cv=none; b=rSQFOxx3u8kKELc9Uea2GxX7dfgvw1iLhRRcqwViZQ5XnEJxg46NuG9acluoEKnmFEW+hvtqki81PnWcsxIF6Rn5LwYGMjhaiXokwCC9nvFQhMf6ue9yW39d6mW5VKyZFbeeoiOTUuByOH1Boiqwn29SJ9y5jVilYzxehL2Bq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740912925; c=relaxed/simple;
	bh=YP9vFesE7FOkWTsjQeuOzqlZhTxpNdth3TwzKIctpts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBGtFXpqpcH2BM+JOc/143GBMDMikPbSFSs4d/CPyyhRf89XT2OuvmnYzg3kVxgNxH2ejRb576JATyb0O4rnN/yxY3YiK0x/jW5Ara96X+r9oEHkmeXI7wVTjo5NWZb6aNQ+41QJDANv4CYlUlI5doN8HRe5Xm8rdhmjeexYp2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qg/OrGqK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qg/OrGqK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso140856a12.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Mar 2025 02:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740912922; x=1741517722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVNL0sPyTN/JB4JKueVcudW2dTNqPhTdzuxyAD7JqBI=;
        b=qg/OrGqK4EA4jHnm1WDt35ARvH11Ol9bkLq0yT8F/GkAeqJIEP7paVkr9vd4soa3pn
         bvyW8h/0DrtsLvQyjTAtCu78bq9SWbmrczOXPeFGqKDNLwvF8KQt5pPGX0nAEMIHqj5l
         HQF6+kKSMJPKbFJX9joqNFR11Ku9fXythGy1kydzI35mUvCc0R2lxK6GWpTQYZ7LHeI9
         F3LjcTZVdgFyqMlIcgyC6yrTZQRnDZm6eDnmGRKJqBgDHvR3LV2IHc9UGjTwkc3BeKl0
         I6+ry2x7vzh9V12qDBCgP788bfABCqPybgkOme6deTQLGOA51mxN87hW2vrtPuwWwaqB
         ua6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740912922; x=1741517722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVNL0sPyTN/JB4JKueVcudW2dTNqPhTdzuxyAD7JqBI=;
        b=S8I0fM/0ojcVMTRz4QsdRsHHyJijbXDmOfEsNwrLN2g/amvicr0unYIw09UQe9L8UV
         XTpwyu8uY89bhNgdyliuKAj524Px8h9i2busGcxMNdiGFktU4CEpTFNCDnb9eDAyxUPL
         RuRHEvEjiwn/1IauDRqczXliIttRwqNtB2Ccfsig5EkJjVukXGDJ6fyawg67cvFcSuvo
         cxvVVToUSYE3uPmbS9yxi/FcR7z7vnFmrI/ENL43ETwcy2hjP8P/pBG7VxThM/nKo2u6
         J8DSJO3k4OARWFi1zyYQrsrnRSqBvMdOrA3jEKY9g2L8Tgfb7zSNsGSKqm5U6sGOQLc0
         tuvg==
X-Forwarded-Encrypted: i=1; AJvYcCVXt8YbSHjQfY36F0zfTjBle/gWbr1HGyj7Xy+Kj4m0qcRl/SxJA/Y+uY6N7lq43gSoPcd7l2YmeCJbn7HT@lists.linux.dev
X-Gm-Message-State: AOJu0YwQwjz17iltoP62BjB5g8CzO2cEtT38rkgdWI1xBgxHONloY1Sw
	F//WxQFHXVjTpGgJ9TEGlfbx4bZI2+FsQNzirAeqOBfKdNahpClv+mlVZt6aAZw=
X-Gm-Gg: ASbGncsUEhBpihO8yAB2cXR/3gnlKR8nqrFrKPV501gDLq5/TDLjqDvfYvzRRcU/t/h
	AN5jFGiSE8gGXtsbthPX6KVfwyk+tdRZJagfiMa0MwdNk86u7xt3JEZDGGHTqe9zl2O3rnavhLM
	sczRovRHRnksN1CX4P6SSM837YYRqaxmqVl3qjLQLpo2ariNtQWOPv4pvhlEc9TWsN0gUQd9uT+
	VMuPloUt0e0T3uY8ltV1WdqwhdhluH8rLequBIZWyMDFKNo7pW6dCLKMvWRdWi16TO2D+SV/jV2
	0II0VL9c/zQUSmLE0BkcpQdBcMVxFh1RnA98HtuPYKvCBClYmQ==
X-Google-Smtp-Source: AGHT+IF5u6hOznuueVO45DvOr3tnpJV+3iyHP7nKiHIBEz75iKNJU9mKeQvZWjwJzKMqMC7qM6j60Q==
X-Received: by 2002:a05:6402:3512:b0:5e4:d13b:e65 with SMTP id 4fb4d7f45d1cf-5e4d6af15damr10563438a12.9.1740912921716;
        Sun, 02 Mar 2025 02:55:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3b4aa46sm5309846a12.1.2025.03.02.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 02:55:21 -0800 (PST)
Date: Sun, 2 Mar 2025 13:55:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-staging@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [RFC] apfs: thoughts on upstreaming an out-of-tree module
Message-ID: <b9c2ce02-dab6-4b4d-b8ca-ac1e7769e0c3@stanley.mountain>
References: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>

If you're going to do a major re-work it might be easier to do that first
before you upstream it.  Once it's in the kernel then you have to follow
all the rules like breaking your commits up into reviewable patches and
not breaking git bisect.  The rules are good for quality control but they
can be burdensome for people who want to move fast and break things.

regards,
dan carpenter

