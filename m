Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5113B599
	for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721750539; cv=none; b=VcsTcpQ96zaLo4o4TRsKNNjQrGiIjxYKx4Uaun8wIGkznFbeYj0z7SNYPJI0HtiFBnug7haWRvAh6lnBCKcMly3xDRvRRReHFwLT3zR4eaBugJployGWwbVnsLkPBw4t/z/XcANwGh2eeL1I/7c5JAcLuYFvs+SbGKPZz2Y8xhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721750539; c=relaxed/simple;
	bh=I2o6zpIhUZOrzY8dPi9oJYFDjQRzZnKfkykbXQdQCOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5SHRHtPHfQNQ3XT+V1dPK/L4Pbe21Te0jtt0YAF1a3kolH0tRJMbOZBC+b7UgPcYcOmH054be9IVC5ltchVGklFZUkxBjJ01EghczkFSameEIsh/YzBPTA/Oay4wS9FQMlbL51JbICHnZXEdoqNyzQeRh4e+8ZhJIybRHnQnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L09SYoNp; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L09SYoNp"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3daf0e73a62so1707168b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jul 2024 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721750537; x=1722355337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yARX5xd5laXwhiOFI6NOkFFj4BQ9NNdQqrMRe/s6N2E=;
        b=L09SYoNpeO485vFBrSVuegtkyYFpC31JnWu73MkZdEv3xwRoIxcpfwt/ylVjHPKEh9
         EYuU78NDT1f0gtPsR8YpE1L0adAbMYeZPx/ym5poTiaiVKiYVoF7q9BZQ3jaNbR1Ulkz
         rvQVPKrg5Y9xaeKAtlriSpsRQU/3E00joCs7pc61kn1Ecr4iBz5W41p33/pz2iVvHqwg
         OiMKhBX9PhejZaZvySdh9r4srysIcLnw2aKZ1ayOBXGdxyCvyCk9EHpyoRF/2vtkWW4I
         DAOXiloPMoTz4CCyHjCe1nSF0ff9T8xnYZkOd9WEw3Am5VINsQwsiP5kdl7BtBgt/dPr
         R+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750537; x=1722355337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yARX5xd5laXwhiOFI6NOkFFj4BQ9NNdQqrMRe/s6N2E=;
        b=PCb6xXbnlHSCLM4Aw7I8BMLUUTIWC4a9Ij4RzpDKP05RJbZyCxFdeLfHyX+xu4SxFn
         WoQvGXtMCG2LpGTSFUNIIyvmBOtZpkqH84Q4pnNla3yHQN3uzJmiwDa9D8ctKTMH+Aw0
         jOKu0jmz/tH53hzWFq1CZ72pEMv2tgOFLvPn+Ujtxf3fgp1p5RqtiujqTsl/C8RsS9jc
         TNXJDmfj4ttaMGlJ94rDdLm4W4odWZ8LrBq6WyLg69o7fsMGlAZobNBTucgxyQ+ZML1h
         rcux23utbvSq7TjxbcVN0SU+THfFvTOLhCjiL7OYa1NBVcRI/snlDJD/WIB+mm/Gb+Fg
         e4zg==
X-Forwarded-Encrypted: i=1; AJvYcCWG+ADKd6gJJ4CIjfdy8zXAMsF0xNlARgJW46fflVH5Ezjija5BQSaT8gax2jK9m/7rUe6zpeREOBdGqYw8l2RqAQYj3sHRCHej405k5A==
X-Gm-Message-State: AOJu0YzRjA/lEllvcdVPlawa5KBPXAI8DTWPDuiFsYsUnRdJcnTzmbHt
	wqFxjER1zMSehUOkKBLUV8VfKzU9RSNNOBkPbIohOeZXVC28MYd1xhBX7OzQdqI=
X-Google-Smtp-Source: AGHT+IGLVP1QRk2iV2KPsMQJmzNjczIutXjBGb6VMMvmyHKU5M2FYbeuyN33usKWmc6KvQORnHuCag==
X-Received: by 2002:a05:6808:1688:b0:3da:e2b1:10d2 with SMTP id 5614622812f47-3dafd0b93b8mr4167115b6e.2.1721750537235;
        Tue, 23 Jul 2024 09:02:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae0990cdesm2025235b6e.32.2024.07.23.09.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:02:16 -0700 (PDT)
Date: Tue, 23 Jul 2024 11:02:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cruzer-S <yyyynoom@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com
Subject: Re: [PATCH v3] staging: rtl8712: style fix multiple line dereference
Message-ID: <1894df62-f632-4f7d-904b-65e7d517cf0c@suswa.mountain>
References: <20240721040504.1483-1-yyyynoom@gmail.com>
 <5005ffef-0ac1-4481-a139-fbf3b456069a@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5005ffef-0ac1-4481-a139-fbf3b456069a@suswa.mountain>

On Tue, Jul 23, 2024 at 10:22:32AM -0500, Dan Carpenter wrote:
> The patch still doesn't apply.  Sorry.
> 
> cat ~/tmp/yyyynoom | patch -p1
> patching file drivers/staging/rtl8712/rtl871x_cmd.c
> patch: **** malformed patch at line 132: 2.43.5
> 
> The 2.43.5 thing is the git version.  Not sure what went wrong there.
> 

It must have applied for Greg because he applied it.  I don't know why
it didn't work for me.  I tried using patch to apply it and I tried
git am as well and neither worked.  But it must be something on my end
if it works for Greg.

regards,
dan carpenter

