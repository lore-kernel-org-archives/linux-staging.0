Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88F15E95;
	Fri, 13 Oct 2023 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DE+0a36S"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so658081a12.0;
        Fri, 13 Oct 2023 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697203720; x=1697808520; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nu1H4LZBKYsS6+OEzpbpZBdBf+RzObohI0qR4WVPoqc=;
        b=DE+0a36SXKQD3Iy/IHmRK+DDY9lrVAoGQRbIawkaDX+0QQqpbku+ZoBTUmviv6HHw4
         KyayOqEuyrDS2fjpdI5GNvLXc4YxreSJLQHZkRmopkPKqqxvm0WynNo+rj7EmmtLmJn8
         VyWOv/Aatc6rM9ukwCmmn+dmhm5XGKwkyGYcpFqEGaum7kKez8RlJDQe326Pn2fUNTf7
         G8ksuFvT2Ix6xVVs1wQEtaT3xyv7pO5TwXT7UXNKGoHc/X0/72hcCrliOqS4y+Gt0Am3
         sIWrWNuaanfLsSDJFx9BE1ybIZmVySmqDQHz5pNPeS8kZgtohlipbjbMwh+CDf91bGYS
         8z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697203720; x=1697808520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nu1H4LZBKYsS6+OEzpbpZBdBf+RzObohI0qR4WVPoqc=;
        b=PRccDUwI3T9tLUIFnLRqkyFcuKuVnxI6OCE1R53XsbqrgNkCF1TslnD6XzO16d8vOu
         IAYhqiBks1yQRrnvj6/UA346QCAoc97Uw3flBQGzlmPvV8vxpdVJU1aQctsOkz5HJ1XA
         XdLTiMHaZbscbLnCcg1dcyWSvSdowRUGA5EccPTFIzdIvBQSgJRWXJM1pGNNJHz0Ik/F
         p1DqjMkbx1BKx3w2f9y8lrCZqi964mXAI31UnRDoby66T8afVrk1m1B0N6L7yqgVhNsF
         748rYdc0YiRz9II3Myv00Z1vTKF4QoPPADvASbBRx0fY74R9NkaRPWvSkb3bGbI62/0j
         HkbA==
X-Gm-Message-State: AOJu0YyDl3zHGDNfw3ykCixeLxVhAWNu8HXjEJPbTGbVojFyQMIckqeH
	D+ULIVxdPzTpEU+CK62oqYY=
X-Google-Smtp-Source: AGHT+IEJYovCWvXgqaaiHkZHtiuMbMUnM92EYMOFfSzfvM9khXLAwSVNGYupln1fYCNkdGfuH3CsIg==
X-Received: by 2002:a17:90a:b00a:b0:268:3b8b:140d with SMTP id x10-20020a17090ab00a00b002683b8b140dmr21495491pjq.35.1697203719841;
        Fri, 13 Oct 2023 06:28:39 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a1a5d00b0027d0de51454sm94071pjl.19.2023.10.13.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 06:28:39 -0700 (PDT)
Message-ID: <05a668db-118c-4568-b2cf-49febb04a6d2@gmail.com>
Date: Fri, 13 Oct 2023 20:28:30 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: wlan-ng: replace strncpy() with strscpy()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luke Koch <lu.ale.koch@gmail.com>, Simon Horman <horms@kernel.org>,
 linux-staging@lists.linux.dev
References: <ZSkm34Sy/n2yxBqi@lab-ubuntu>
 <ce6c3d81-d75d-40e7-a6df-7abd4e8250a5@kadam.mountain>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ce6c3d81-d75d-40e7-a6df-7abd4e8250a5@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/10/2023 18:19, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 02:15:43PM +0300, Calvince Otieno wrote:
>> Checkpatch suggests the use of strscpy() instead of strncpy().
>> The advantages are that it always adds a NUL terminator and it prevents
>> a read overflow if the src string is not properly terminated. One
>> potential disadvantage is that it doesn't zero pad the string like
>> strncpy() does.
>> In this code, strscpy() and strncpy() are equivalent and it does not
>> affect runtime behavior. The string is zeroed on the line before
>> using memset(). The resulting string was always NUL terminated and
>> PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
>> terminated.
>> However, even though using strscpy() does not fix any bugs, it's
>> still nicer and makes checkpatch happy.
>>
>> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
>> ---
> 
> It's still white space damaged and can't apply.  :/  Try save the email
> and do `cat raw_email.txt | patch -p1`.
> 

And better yet, use git-send-email(1) to send patches. But don't rush,
as you have sent five versions of this patch today. Please wait for a day
to a week and then reroll.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

