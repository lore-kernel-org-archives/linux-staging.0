Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C17C
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 14:56:15 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 184so9040851pga.12
        for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wJsCFQid4sHaK/ZKO+qfx/hNEBYaCAv7ipedUinRSCA=;
        b=DmZwOB8yj183zZJrZAw1WK2vDFaNRohRqhiAivoZuMpBDx4rD75d9vSgogfoFOXTyA
         oNOqJux67XmaerADpU2/fXwgugw/2QujGD062CGuRuRWOHGriavWeAyfSmRPjsXYrExA
         3ktfE5K0SpyCx0x6WGvPki69v5wXWD2uEOYcLQXQ51qO1U6JAnvQUQyj5AVtLTsHfTcC
         f0jjVb1O6MdrNnIDy2U1MtQ2xH+PfAOOU8byi6x2hmh1BfIFhx/OiVle9E1mT1zYBVEK
         1ENBT1mwGJGRuiXSs5mRkHP6HEpH1/etrfnSjTlbECIay3MuEXfJUH9ooLD0ctao/0+y
         I3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wJsCFQid4sHaK/ZKO+qfx/hNEBYaCAv7ipedUinRSCA=;
        b=uDnwULkWIjxb9AXtaC+1UtIdZOCGeHyyioOhVwZHvpygYp9j2Ivbl723gVqvRNorWI
         fky8VQd6p45V+BHEsv+lurdQuJDK4Ur332PGkOy9H0Jg2TZTpkZg29vmr7qZuVdsZ78u
         2PgaIVMKHIo4ZLt9V38DCAgc5bDjVyhPTpBUHxcsD7SM/PT4Sxi7i92iCZYjQNJVhDUw
         876tW8czIwWApvgRjlTV53CuZNHaI+C1KvApX89ESpQWZFC7cSqaqI2hodkZGAVZt67I
         pSkvjH8zY6PnPxZqMxewne5kAeDbD1kFdXine7priNrkZme6uQrv2aXsIsVE8eoWtjQw
         ldNQ==
X-Gm-Message-State: AOAM532vXYyU4q/AU5hsBOBDLb5i19TOoW7QA8A9+tpzBojx62ATIy/O
	BcoQvrnogDknhDibzabhLxU=
X-Google-Smtp-Source: ABdhPJxBbi7wAzOxsxQJx2yKTE9EOjkYyRVB0nQ0HCXHa7+Kx6P3rlnHpDEIDoMVIAbd0oJoRk2/sw==
X-Received: by 2002:a05:6a00:148f:b0:51c:70f9:b62e with SMTP id v15-20020a056a00148f00b0051c70f9b62emr13426346pfu.84.1654872974762;
        Fri, 10 Jun 2022 07:56:14 -0700 (PDT)
Received: from fedora ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id x17-20020a056a000bd100b0051be1b4cfb5sm15393657pfu.5.2022.06.10.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 07:56:14 -0700 (PDT)
Date: Fri, 10 Jun 2022 07:56:12 -0700
From: Jared Kangas <kangas.jd@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: vaibhav.sr@gmail.com, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, linux-staging@lists.linux.dev,
	mgreer@animalcreek.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] staging: greybus: audio: fix loop cursor use after
 iteration
Message-ID: <YqNbjINDaEBZktbS@fedora>
References: <20220609214517.85661-1-kangas.jd@gmail.com>
 <YqL6A3pVC8LOqE4d@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqL6A3pVC8LOqE4d@hovoldconsulting.com>

On Fri, Jun 10, 2022 at 10:00:03AM +0200, Johan Hovold wrote:
> On Thu, Jun 09, 2022 at 02:45:18PM -0700, Jared Kangas wrote:
> > gbaudio_dapm_free_controls() iterates over widgets using the
> > list_for_each_entry*() family of macros from <linux/list.h>, which
> > leaves the loop cursor pointing to a meaningless structure if it
> > completes a traversal of the list. The cursor was set to NULL at the end
> > of the loop body, but would be overwritten by the final loop cursor
> > update.
> > 
> > Because of this behavior, the widget could be non-null after the loop
> > even if the widget wasn't found, and the cleanup logic would treat the
> > pointer as a valid widget to free.
> > 
> > To fix this, introduce a temporary variable to act as the loop cursor
> > and copy it to a variable that can be accessed after the loop finishes.
> > Due to not removing any list elements, use list_for_each_entry() instead
> > of list_for_each_entry_safe() in the revised loop.
> > 
> > This was detected with the help of Coccinelle.
> > 
> > Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> > ---
> > 
> > Changes since v1:
> >  * Removed safe list iteration as suggested by Johan Hovold <johan@kernel.org>
> >  * Updated patch changelog to explain the list iteration change
> >  * Added tags to changelog based on feedback (Cc:, Fixes:, Reviewed-by:)
> 
> Apparently Greg applied this to staging-next before we had a change to
> look at it. You should have received a notification from Greg when he
> did so.
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=80c968a04a381dc0e690960c60ffd6b6aee7e157
> 
> It seems unlikely that this would cause any issues in real life, but
> there's still a chance it will be picked up by the stable team despite
> the lack of a CC stable tag.
> 
> I've just sent a follow-up patch to replace the list macro.
> 
> Johan

Sorry about that - I got a notification but thought it was still
revisable. In hindsight, it makes sense that once it gets applied to
a public branch, changes should be done in additional patches. Thanks to
both you and Dan for taking the time to review and catch my mistakes.

Jared
