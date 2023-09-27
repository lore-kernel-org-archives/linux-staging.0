Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D027ECE
	for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 13:08:40 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3231d6504e1so7243849f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 27 Sep 2023 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695820119; x=1696424919; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pb6DmiN9DOuXmTodkw9UpUp8rbwPzi19pk0azXzu3B0=;
        b=UhdjhWQola9ykl+Rcjl6mwjbhjp6SS8WzCGrHX9akDkPhlVaB7gR/FKwt2K4NAEwg0
         X7i4e0UJCXxnCnziOfUrlI4ge7H6LecUQorAw5XaydSoBQnH4L4hAkHRkoEAQgDNsS5C
         hsrZNJbeYdceMVSRtwiO1aH7ras6n+adZVV/s0jFc5j3tRL8HbyNLVAogv0J48FwY3NI
         WBGY4FCWJPhu0qxTU1wP+R+iokbA51KIEyttN015mBGwFCBy0EuW6kBKfmPj33tQNovE
         H/2QkQjZ5KWq02QpBNm58RaBxIx2bdjRBYA8XfssdVr4pGq/kRvTpzwMUVoQI1tp5AOW
         PJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820119; x=1696424919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb6DmiN9DOuXmTodkw9UpUp8rbwPzi19pk0azXzu3B0=;
        b=VxMtLC5UB+5Eh8nL1YJ2eAkP3b7crJyrjLbVoyPwDFAk8Tr8dzIgEp7I0P2BAYSlIK
         HhT1MNHv+JVIYAv0LFf0iD3AVIaKtWtoEzXRTW4TKn2vWLMMbojZBvmeYJ+AFEwZ1C2w
         e6m+qEgZyYvtMXrjTN8PwQoXNeS7J1hXVPrQL8RZqaVXgr7HT40zK1YOM5F9AL+DHE9U
         Tylx3WrnYDKaTJ9LU22PQXQT9+13VafV60ZuQ0aiT521C0pN6rMY9P3oqnSZP0RT74N8
         ng17wvC8HLQc4/QIBVE95uUcgBSlV0wXybpr/FPeD1tDxIWyaYgxOYhVCmoK13F0FMpM
         ZZZA==
X-Gm-Message-State: AOJu0YwYfvPiIgGr9FHQ3LoBmWh+MpRB4IttMnlIWnz6vy6H+kXdkrF9
	vLIyWAa1vVnUmOmoCiISKN24lg==
X-Google-Smtp-Source: AGHT+IFpwsSlugV5jwUjCr6yrXSWMakD4wYMDoTEu9lILmxH0Gr2BZKmEWFisrj5G/OOXsw2/52Diw==
X-Received: by 2002:adf:e5ce:0:b0:31a:dd55:e69c with SMTP id a14-20020adfe5ce000000b0031add55e69cmr1756496wrn.60.1695820118956;
        Wed, 27 Sep 2023 06:08:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm3139370wrn.114.2023.09.27.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 06:08:38 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:08:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3 v2] staging: rtl8192e: renamed a variable
Message-ID: <cb28b28a-64d1-4a38-942a-cac31e0dd48e@kadam.mountain>
References: <20230927112635.27637-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927112635.27637-1-garyrookard@fastmail.org>

On Wed, Sep 27, 2023 at 07:26:32AM -0400, Gary Rookard wrote:
> Hi!,
> 
> This patch series renames the same mixed case variable in (3) different
> files of staging/rtl8192e.
> 1) rtllib.h
> 2) rtl819x_HTProc.c
> 3) rtllib_module.c
> 

You need to do this all in one patch, otherwise the kernel can't compile
if we only apply 1 or just 1 and 2.

regards,
dan carpenter
