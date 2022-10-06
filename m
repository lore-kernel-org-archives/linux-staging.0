Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35734690
	for <linux-staging@lists.linux.dev>; Thu,  6 Oct 2022 17:44:52 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m15so3839386edb.13
        for <linux-staging@lists.linux.dev>; Thu, 06 Oct 2022 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gNQoC7Wql533/i6PEr6vVJ6voNwKK6BkxbmL0tsbQvs=;
        b=N75m94E+t6OiU5sjq9WXvskIO2PalAI6t1ATsn6e5nLieEigRrduinFUFF8l+ZdBA5
         txCgP0pTXoUiM05Ws11NN/WhnwYwgZd8jaha2PHWl52NDYY4ZM4VzDn0Tz4s/qAttKqu
         K671b2CiVQMtqVfsTrRyzeHvCoa78AIcJA7mRlSKdF3wTv9RVkU2qUZ8gon/Y1+o9a4L
         tAr9rhL1yUqkVx7FOl6J5pt0LNNU7YjJKufUOTcxBLWSbjrBy8PG59MaQi3FvRrpMHEM
         1VKhlGeAr33LpVVdsLVqGvkBB4/dQWO2zIr+4nJ0Fog43UZY0aoBoeJO13Qus2lEXMXZ
         A8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gNQoC7Wql533/i6PEr6vVJ6voNwKK6BkxbmL0tsbQvs=;
        b=OdrtVGrjvFKYIVi/kY4ZtOQ1RfOsCD1HlmG7CiwCMbkmMiJJrnelvqSP95Dlk8m/F8
         mEq5G4mL9HR3L5NlceObEohlODnW+96uxO0SINpmtgimPqk0jsPLjqMI+PKuQwNRdNGy
         6xO6Dlo0+EwUnUzN0KNteSKT3TFVfDPFbYq3eqlxQcCd3/4yy98/BLlm6LtQQc/Qf1Dv
         /T3hJhKDwd6rJrY+wMWLdOHoT4yLuy4k19mGPI7VvKpSWkVjgHvB9s/p3WnNl8A5kXoW
         f8SPTcCX916vukgqCGNwprzfTzbgDvAiyeoRIAtSlkZHHXafeXkhkl53WI5cRvup7qka
         uZXA==
X-Gm-Message-State: ACrzQf3d79iarh49UR1WXkqENLNu6Qu4cc1g2hYc228GLw/k9RvXVgr+
	tPHUBY9PEuF8itI3xLBCBd8=
X-Google-Smtp-Source: AMsMyM5cTnZjCFVqHBG1q1ZYxN5IVqdeUyVIs+7qSpAmSMnf1GR1/u1FY3znGi5TJjC76f52tycygQ==
X-Received: by 2002:a05:6402:70c:b0:459:7b65:fead with SMTP id w12-20020a056402070c00b004597b65feadmr874172edx.209.1665078290885;
        Thu, 06 Oct 2022 10:44:50 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709061e5000b0078d46aa3b82sm26457ejj.21.2022.10.06.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 10:44:50 -0700 (PDT)
Date: Thu, 6 Oct 2022 19:44:36 +0200
From: Nam Cao <namcaov@gmail.com>
To: Brent Pappas <pappasbrent@knights.ucf.edu>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: most: net: Replace macros HB and LB with
 static inline functions
Message-ID: <20221006174436.GA8933@nam-dell>
References: <BN7PR07MB419563C5B405ED4082D7841DF65D9@BN7PR07MB4195.namprd07.prod.outlook.com>
 <20221005235728.GA118549@nam-dell>
 <Yz7WVCzAviUYstX9@knights.ucf.edu>
 <20221006134230.GA14040@nam-dell>
 <Yz8KKkZ18svZdeec@knights.ucf.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz8KKkZ18svZdeec@knights.ucf.edu>

On Thu, Oct 06, 2022 at 01:02:34PM -0400, Brent Pappas wrote:
> Replace function-like macros "HB" and "LB" with static inline functions
> to comply with preferred Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <pappasbrent@knights.ucf.edu>
> ---
> Changelog:
> V1 -> V2: Resent diff from a mail client that would not replace tabs
>           with spaces so that patch can be successfully applied.
> 
> diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
> index 1d1fe8bff7ee..8a8fbc274b73 100644
> --- a/drivers/staging/most/net/net.c
> +++ b/drivers/staging/most/net/net.c
> @@ -36,8 +36,8 @@
>  #define PMS_TELID_MASK		0x0F
>  #define PMS_TELID_SHIFT		4
>  
> -#define HB(value)		((u8)((u16)(value) >> 8))
> -#define LB(value)		((u8)(value))
> +static inline u8 HB(unsigned int value)		{ return ((u8)((u16)(value) >> 8)); }
> +static inline u8 LB(unsigned int value)		{ return ((u8)(value)); }
>  
>  #define EXTRACT_BIT_SET(bitset_name, value) \
>  	(((value) >> bitset_name##_SHIFT) & bitset_name##_MASK) 

Sorry but I still can't apply your patch :(. I think you accidentally
added a trailing space character (at the last line).

Perhaps it's a good idea to send the patch to yourself, download the
email and try applying if it works, before sending it out.

Best regards,
Nam
