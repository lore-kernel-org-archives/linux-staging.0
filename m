Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7EB5B5C4
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6q48ixB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-332ed02ccd9so2598023f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701181840; x=1701786640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLEYkHRJMT3OqT04CWYEA703zQvHqSolyT21WNnk3PQ=;
        b=v6q48ixBMWpZHm+SpsA/exOTnxX8HD1s+DYSFLuITGXfcGjlz6QTJGK6akNp/nJ6AS
         Gg0FWZ0hqG0YCmNSHUukLkdAHXA0lIp9rc36ThgJN7xvRiHTZ07b60H8QFihf9XygOOT
         5eB/RM7VMPDVu5dja/HaKqGeKgd9eb17f2WTHSfP0zBMXcn+Jo9pzmBW/nH1pl6WRMXS
         /HQcGyOTT2yXWNcAyoDdl+6P4fiJEtQahwtX2WcVMKeAZYh8Zq/kMlQf8KoqGYqVs67/
         m7DrBkpM8lC/T5qjHfaf8ULs5yO86AIsisol3vwirvbeKKUd0zFx+cBXWxu9ZK9jkXKv
         hBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181840; x=1701786640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLEYkHRJMT3OqT04CWYEA703zQvHqSolyT21WNnk3PQ=;
        b=rE7U4GDa0zian9AhrTdTTZehzg0e22IMDFujgTR9dShSWmMJhnVHBYxDZOaZvLKGiX
         TcuoULS89BzAKljgljwmleA/DY9sK2ubWjHPtXFwOJ2L5SLv+1Swfwov59aB8VEyD8W0
         ay8/u/ePq0ygvAunv/2WLX08s7ibXHB0CvIW+5SQGi4xxCy1YEdQPn+C1/In8302gHVu
         ohioSlyWM9nvRdAtlHMCEaNTmL5loSaQuIYO/lTj6QV64qHLp1ATgjrc8JW9gs4gHkfy
         QLn+D+IafIiMGibPzM6PRbQ2tMAKTeCl8k9w+FK83UIpUnVYW4Hnlcl7hOqedEMJ/4d7
         GACA==
X-Gm-Message-State: AOJu0YxUecnuuQlFm9eK29cjju6hS38TByw8wF+iRREDVd8UAnudsBP9
	vnXeIkh1P9jHG2UBGnbnPrQ8TQ==
X-Google-Smtp-Source: AGHT+IFRSBdeNgBVBzXbX04M5CydoBRX/3/68FCyYlI2YkiakrnnEFYTLggv//rdjN95vH2IOP4Azw==
X-Received: by 2002:a05:6000:543:b0:333:875:27f6 with SMTP id b3-20020a056000054300b00333087527f6mr2795165wrf.60.1701181840487;
        Tue, 28 Nov 2023 06:30:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d568a000000b00332f95ab451sm8493636wrv.58.2023.11.28.06.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:30:40 -0800 (PST)
Date: Tue, 28 Nov 2023 17:30:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8192e: renamed variable nMcsRate
Message-ID: <acc04154-6604-4cd1-a6cf-58d89d6798e0@suswa.mountain>
References: <20231128142027.15617-1-garyrookard@fastmail.org>
 <20231128142027.15617-2-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128142027.15617-2-garyrookard@fastmail.org>

On Tue, Nov 28, 2023 at 09:20:25AM -0500, Gary Rookard wrote:
> v2: Renamed from CamelCase to Snake case the variable nMcsRate, and
  ^^^^

> additionally removed the Hungarian notation of (n) that [v1] did not.
                                                           ^^^
Delete this stuff.  We are not going to merge v1 so we don't want to
mention it in the permanent git log.

> nMcsRate -> mcs_rate
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8192e compiles.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is taken as a given.  Don't put this in the commit message.

> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>

This commit message is kind of bad.  A better commit message would be:

"Checkpatch complains about the "nMcsRate" variable because it is
CamelCase.  Rename it to "mcs_rate"".

There are a bunch of ways you could write the commit message but my
proposal is acceptable.  If you want to mention Hungarian notation you
can.  "Plus it's Hungarian notation and Hungarian notation is rubbish."
but that's not necessary.  If you're going to rename the variable then
we just consider that you're going to look at the context and the
surrounding code and pick a good consistent variable.

regards,
dan carpenter


