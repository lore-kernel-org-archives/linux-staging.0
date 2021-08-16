Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914772
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 19:17:09 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id g9so6679833ioq.11
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/+MKdii1IDE6z5360eIsjg/aP/1dfVNP9biAfPiNoYo=;
        b=cCNZeUPU1VrkxHZgHMBleWCTSjnKIMMob9uqsqkHVWWedQXZwm9ng7P/SZ9TPISQxi
         s3+DIxdnrkEjJhjMmWrxSMOATpwVGW+kFagHYClctuedhIAFM1yg6OF3quyb4jfC0Y9E
         kxmi/aSuDB3f/9XMEyX5eUQ2BkPQ2uUk+ISYuLxp2oGORi5QINu0Wu43X7bgAJLuXHFH
         c4I8QIb542ZYwuhk993tcX0k3SPuYM7veR2Qc7YXTte5+69TAparPZawdXjSSwpJcbk0
         SH35D89IrMToeJQmjevaA35Vm73Sc4GKzMHa7Of3rNnKf1hbrN1zqfOZN/q3GUHLf4cw
         uIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/+MKdii1IDE6z5360eIsjg/aP/1dfVNP9biAfPiNoYo=;
        b=qXbv9+WeZttMo6enAoHI4AXKepSUxhsncGSMho0FUWrOeqTN1PMPw8VEpHeVi7emmt
         JG6HNTI6N/wqLUXACIKpx5WkUwkWOpDGZQIGYECdQzZAKzkMTwpF9USqOwwJTv6vi4kw
         F480n6DzdFVNt59r4X7aWFbDnOM0g2e1H5KFiqgBc3DouzyH3EeMiDPVWTgTfHwUUfbx
         te5yxN58jMWKAAXL8PapG9fjXVxCfumCnVf6286sdir6EFtnWVjXn0tqR2YAJYggG2rj
         4yXkhk+lMO2c42Kq6x6OB0j22IJDvcAlN72m41ryiHo2uKheqmKDwDBw9NCI5h9geqmU
         BjlA==
X-Gm-Message-State: AOAM533YUDWWe6ONlkJYdTHAmwCzyOXtFMn3H0tmnXwNGiZOZGJtl89o
	Ht/GFpVfFDyIlRN15nR05yKRDw==
X-Google-Smtp-Source: ABdhPJwMRrvHuzBd1qQ8CgOtUcS3oRSF++rwfPlSPoAdYCv8MXqSPknWRI7bRhGjH3/p/gCnSDHh1w==
X-Received: by 2002:a02:84c2:: with SMTP id f60mr149130jai.133.1629141428769;
        Mon, 16 Aug 2021 12:17:08 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id h8sm108032ile.39.2021.08.16.12.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 12:17:08 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
 IDR to XArray
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org> <YRp9rnCardsCukju@kroah.com>
 <20210816150653.GH1931@kadam>
 <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
 <20210816183639.GF7722@kadam>
From: Alex Elder <elder@linaro.org>
Message-ID: <e37b5a51-29ed-2a91-6285-aaa8885e0b9c@linaro.org>
Date: Mon, 16 Aug 2021 14:17:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210816183639.GF7722@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/16/21 1:36 PM, Dan Carpenter wrote:
>>> There should be a Fixes-from: tag for bugs found in review (not style
>>> issues) but when I suggest it then people just say to use the
>>> Reported-by tag.
>> I think things caught during review aren't normally worthy
>> of specific mention in the commit message (though maybe in
>> the non-committed part under "---").  I mean, that's what
>> review is for.  And in the case of what<lkp@intel.com>
>> does, that's effectively a technical aspect of "review."
> I'm not talking about stuff like intending or naming schemes, I'm
> talking about real bugs like missing error codes or NULL dereferences.
> People do count tags so we might as well add them for worthwhile
> behavior.

So you're saying that things caught during review *should* be
given credit, as opposed to acknowledging the credit for catching
it only when the bug slips by the reviewers, caught after commit.

I understand that, and I get your point about the incentives
(which take the form of tags with acknowledgement).

As I indicated earlier, I'm all for showering credit on everyone
that helps.  But I still think doing so for input taken during
the review phase is too much, and full of fuzzy cases (how do you
judge whether a suggestion is worth acknowledging?).

I think what you do with Smatch is outstanding, and you deserve
a lot of credit for it.  But like checkpatch.pl, it would be even
better if people used it to catch things *before* they ever went
out for review.  That option would give *no* credit to Smatch for
catching problems early.  Yet catching issues as early as possible
is a good thing.  Should we acknowledge checkpatch.pl when it
tells us to fix something it finds; if so, which of them?

>> So I don't think "Fixes-from" (whatever that means) or
>> "Reported-by" make sense for this type of update.
>>
> Earlier today I forwarded a kbuild Smatch warning where someone had
> used "sizeof(0)" instead of "0" but because the patch was already
> applied, that means I got Reported-by credit.  If the kbuild-bot could
> have reported the bug before the networking people applied it that's
> more valuable but I get less credit.  It's a perverse incentive.

It's a perverse incentive for you as Smatch developer.  But I think
the better place to put an incentive is on getting people to avoid
sending patches at all until they have used tools available to
automatically find issues before they get out for review.

> Also I sort of don't like the Reviewed-by tag.  I see a lot of people
> adding Reviewed-by but I've never seen them point out a bug during the
> review process so that seems pretty worthless.  But Fixes-from means
> that person knows what they're talking about.

That's not a problem with Reviewed-by, it's a problem with people
misusing it.  Are you suggesting that "Fixes-from" would be applied
by the developer, not reviewer?  Regardless, Reviewed-by is *supposed*
to carry meaning.  "Documentation/process/submitting-patches.rst" has
a section that describes what the "Reviewer's statement of oversight"
represents.

I think it would be nice to recognize review feedback.  It's
actually more valuable than the summary statement "I have
reviewed this and find it acceptable."  But I don't believe
adding new acknowledgement tags is a good way to do it.

					-Alex

> 
> regards,
> dan carpenter

