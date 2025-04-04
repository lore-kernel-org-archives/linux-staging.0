Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17850191F98
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767242; cv=none; b=QrNg6QVTcV/BTkhX5zb+gblHLT4qLxKTb/ezaJtSXCQj42/vadmCeh5Vtx3xONgJXsnQu0idd00FlQZwJixC9Zj3EcnkeyeUTS9AdbOwbpc3w5ohLJ6IoW0RgAHSaMhpprWOw63Kgdr8aEZojGMQwelgg1y3MSvimhYkpjztB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767242; c=relaxed/simple;
	bh=wPPcnnB5KcUF6Z/rHkaL7q8cRxlq5b4nBxTxZ96MBdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcSSfwkw5d2f5C/f6PEfpVd+j2c/0MyQ8yM/xcnH0fA2z02p6Y9A4NB2IvfdfZX6X0QdIyFv+Cg8nkzcruNjxSlhOiRgqiiMKZUAvzIGV88j//eWS1qz0A4HvVBrBx0B4a1dJS/RSqgBSBYYPcAsvBKyEFh39b6HI5PynB6qusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rm5neUva; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rm5neUva"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso14037385e9.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Apr 2025 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767238; x=1744372038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foHY1R4cfF4wZYmB2kM8uswb/b+LSqz8E6rYMWvAhS4=;
        b=rm5neUvaGQimqCdYZcFytymQjidec3EowVPc/xosBczAiXZNZ8+iOkohKf8brmlZFi
         9+TeU0JxolvQLNfPLfl0J1itZztWOoDMdPIaOI43J5bAq8cq/gi+d5YXbHzyQK73FKxL
         pnPLAEyJ+/9hAVQ6J2u53DuFrqdviOd4eEtg3V+4jZSS9ByUgmNnuoQ60EFf6RmO0M1A
         nS0jOe+TFSzARrqspPXU5/xasgBAY/mOBxh3M/uTXWZZff8132LgCp6fyjukrVkfpiLB
         CzLL1qtmLHX0MXoyJjjYDfNE/dLMAZC8k+1gX5KEplazXfK9ubv8CoDc/i7Sfmup/0Tb
         wQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767238; x=1744372038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foHY1R4cfF4wZYmB2kM8uswb/b+LSqz8E6rYMWvAhS4=;
        b=OAtsS+yHAzygsGeBtky/h7nlklWGy0WVUV/mdhKQum+hJyCTaQ526HmiVENxxWkhLg
         g/VqMrysrG/ofgJps8nzOWiXAaEbziiIOQiQ9wrDGiOckh3J/bzEZLeRiqFQKb7+uzNe
         S6DPOWbDMIHIyNbfB8hICfgwWIM5gN/bKsJiUXDFZdHSoILWD/NnhCttMmGnHBe/SgKD
         AvXkEeykjJI1Id6rlIh+Kd9mH4j/LIgmLue6rq0IlbD4FfSisp8VyZQEi6Ss2YaRDf/w
         DAKZqUH2iLNMYXulr3oXV83hXXXWJJOh05M4mRuuFvdsffdsDfvNdLvnafp9R4y6idJC
         gEmg==
X-Forwarded-Encrypted: i=1; AJvYcCUJwV6FIuycKj4OcVmDbs20h3sGA7dGWsf8twP60aMuNuVOECwBvFgttjve9zL6JMRQbMZ60/ZB12u34SMo@lists.linux.dev
X-Gm-Message-State: AOJu0YyOV3ptSaRsBi4eliSIXazuOWN3iEycfUAK8RCWKVCsdOVPMwb1
	AqSoEd13Le5VE2ejCwkq20DU6/CChrx+OTs/T7Cfrz+woCR2RTWqFHwPO7jbNRQ=
X-Gm-Gg: ASbGnctjOh+gO9dKuWD0ix01z8QuRpKqUNYpZrn3+i7xxZse06XJpqN2+epHvK0j8ci
	EuswygjgJM/0UAeR3bB+2GHBbtDZJ971rp/8WTFjwgBFutBb+JLCqCKA+BJjo1BL0R4s/VtxvUd
	GKKRhgZNkkcxw8r7/2RNLb7mjlOkCVPjpMy4E7rscbxYflhqTQ0D7vq9UVDIaCYPkaeQgOuaDZy
	tRwDQnWNQtSOVk1URX4Fjh4YQViV40ZlwtQ3Y0qB6xc+Ql9zY0g/LuoKnA9+0ktuDVi7jyCmldH
	0995sLRzIoSIrg3TzURdWBNq8mC4gayete7otx1zxMg2I/LpQQ==
X-Google-Smtp-Source: AGHT+IEn+z7u+lSPJLWOtn7Q6pSS9JHe2rPVPZmR3y2zmH/SRyuuPhwWUCfFa1TU/icWhcfsVbxRLA==
X-Received: by 2002:a05:600c:3109:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43ecf57edb7mr31256785e9.0.1743767238380;
        Fri, 04 Apr 2025 04:47:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1660bcesm46939825e9.10.2025.04.04.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:47:17 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:47:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andy@kernel.org
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <2aa7d5da-c53c-4bab-8fbf-2caebddc9b7a@stanley.mountain>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
 <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
 <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>

On Fri, Apr 04, 2025 at 01:53:16PM +0300, Andy Shevchenko wrote:
> > Also if the change accidentally introduces a bug, I want it to be a
> > one liner change and not something hidden inside a giant reformat.
> 
> The noisy {] have no point to be left. Now I'm curious, what do you
> propose here?

The patch *must* remove the { and }.  We wouldn't have accepted the v1
patch.

regards,
dan carpenter

