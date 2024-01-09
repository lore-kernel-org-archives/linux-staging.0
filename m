Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862019471
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BpTEZ7uJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33748c4f33dso2527675f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jan 2024 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704786224; x=1705391024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dtqvmt2LlI2/NxoW9oV+Gr8OtAnzTTpRonCDnUCu5xU=;
        b=BpTEZ7uJeGV3DWTPHrP5ri8H6Pq5nilnpm+AUk2nZnNmQBNOoaG2yCRY8d4PUsF09f
         TtkzxlCbPv1K8jfjC/+3aEztFGiMnPq6jgNCIPiSAlBhi+URSbYIicjFNUgfh8y9WWfa
         tjNtN6xweyxaNAhMg1SV1IeSmgIyZeOKv4uXaR1QZCRPHI/VntfNpLo+bLyIqv+Uch3+
         e+ifcs2h5P5UEGI2iKM3NiSVzXNf5Cn9VGdWothd74oDN71u5NyWZvpHfsoF5794fiEm
         QdL9oT/AZAbJEP3lZMATPouGBeK12bm1KnHYZEfhem+JUvpEhJHdKR2eo94gYTd0JVH8
         96hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704786224; x=1705391024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtqvmt2LlI2/NxoW9oV+Gr8OtAnzTTpRonCDnUCu5xU=;
        b=bfNIghbbRg7q9kRnVheUhvIpE9BH471ucOsGnge5KZYJOXqXNZ7HVPVBWYjKCTax9G
         yc1btSAIuwaGEv/UGK/l1Q2d6g618GL5ACOnM9NqP+20wI3dxurlAwWnFPWlib1Anlrw
         GxaJ/9XufjTsTt1TnBLHU8T+S4GbkwaUVZCHulS94eoOwHi952Hzyzj/dwtK4gk+yaEI
         0fhc0IGB+1IlF0wdYb37qFBOJGI/oBhH57UTgNtZ/Qn4FQggbp9I0S4dvXD7RJ7xWTj+
         /G5L+Tx1LI2j++xomDzX50rz2jcdjOzvpI8dpCXJAtFhL/F9FuvLahus1W0PHThYZaOM
         77hw==
X-Gm-Message-State: AOJu0Yziu2BeAt9UbiR9qNVoRwMp1B9CawtkxgJGZw17sswYEXYHAjcV
	zHJ3HkDpHNBupzO5b6w13zrTT1HmiMdTbA==
X-Google-Smtp-Source: AGHT+IG7Nk2aL/69dtQY6CrepYPAGA02tI1+qyjVIE5/xP6gbGJ3UPA3RAF5aLXklp4kBcxPPTlwSA==
X-Received: by 2002:a05:6000:d86:b0:337:453f:4afe with SMTP id dv6-20020a0560000d8600b00337453f4afemr277953wrb.26.1704786223794;
        Mon, 08 Jan 2024 23:43:43 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id h10-20020adff4ca000000b0033668b27f8fsm1639974wrp.4.2024.01.08.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 23:43:43 -0800 (PST)
Date: Tue, 9 Jan 2024 10:43:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: rtl8192e: rename variable is40MHz
Message-ID: <2273e640-0e30-468f-804f-c5699e5225dc@moroto.mountain>
References: <20240108032233.4280-1-garyrookard@fastmail.org>
 <20240108032233.4280-2-garyrookard@fastmail.org>
 <897a8bb4-a1d7-46ab-96cf-fd5ba447d2d8@moroto.mountain>
 <87edesvtrx.fsf@fastmail.org>
 <62836460ae502097ca8307bcee85a5ae3634e1acc74af843ffc466c28d1a0b95@mu.id>
 <871qarcmzt.fsf@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qarcmzt.fsf@fastmail.org>

On Mon, Jan 08, 2024 at 08:25:55PM -0500, Gary Rookard wrote:
> >>> This should be is_40MHz.  It's metric.  M means Mega.  m means milli.
> >>>
> >>> regards,
> >>> dan carpenter
> >> --
> >> Okay, stupid me didin't give it to much thought that way,
> >> ...wow there's more that way then just mine
> >> Good catch!
> >> Regards,
> >> Gary
> --
> There's only mine that I can find, I'll fix them up
> and resubmit them.
> 

Thanks for this and for looking at the surrounding code as well.

regards,
dan carpenter

