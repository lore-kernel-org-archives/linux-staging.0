Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A305A5D
	for <linux-staging@lists.linux.dev>; Thu,  6 Oct 2022 13:42:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id m15so2836702edb.13
        for <linux-staging@lists.linux.dev>; Thu, 06 Oct 2022 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Id5u+YwMh8EIQyD6UQ9gBbVQTk4z95mUxG8Ako7JiLU=;
        b=B6IRePY+nYFuAqdFxgcyb61PdJANuXx9HUGsGpgi+Pmszh0jX8m07qNRCvkxVfPmVL
         M2kDeEDe4ch8aaA/RA4RGe2P2aogk7t1DffRMQm9IxjrxU406vv3PYKszf1pGqu6xVKQ
         ExpKaRlmaNNtrQXP0B33HucfdVPBPEDVbnwNF0kVLUc8IzFjwBQLTitIxr5uq+uJsyGe
         qoUot0o8rir3Ga+kDEz0sjCiSZDIDH/gmf1zCYtQVIjwbj7qSfGpc76GeZcGNdOkt9LT
         NUXFyxAKndbUgoVMxYzWeAh0BeIrl8AFfGdxEmlCbTQS9P8qHfOqu5M+cG4B5vzLssJZ
         dyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Id5u+YwMh8EIQyD6UQ9gBbVQTk4z95mUxG8Ako7JiLU=;
        b=Ac7YR8+2OGfpckcxyU3Wa32Fm0nfb+uEP5l/Cx4E1esMp2ulOeIif9C2XcAQ1wK26c
         IJSk36uW8c4bMFqel1xmTf3l7wkN9DKirPgKrYH3cilFRgiaMGJbnmNTzPOCJarL0pkA
         r3YcLOtmjZV4XJQ+B9Pt4JeosjObzPn+/9mN3f/VoKXecRYjeos5PYA7n8tdnEqDCGpR
         GeAZy/8zm5NQk/w4JqLrLLq1QyuLnLlrDT04KQFfW4RwhA67WwAEBo7A7SPgtIEEmSSs
         Nqf/Qqkqgrvboc0Jf0eyMMSkAgvLNh5THtHS1Fy0lABpFd4Te4Xg/st8xhKqXoqf8u7y
         ig1w==
X-Gm-Message-State: ACrzQf14MTpH2jaqfywywL93EoE1hiDnkmj5ipNDq1y+GxlW+zQX3D8B
	wIjS6bOOOhKDjy8VFz7h2II=
X-Google-Smtp-Source: AMsMyM6VnORS5wTcEAbXy82G2/5kyncnh1yDOhSBWYlfTwzQYzzcyASPiE6MIoc7Oxr3hxlet3COgw==
X-Received: by 2002:a05:6402:440f:b0:435:2e63:aca9 with SMTP id y15-20020a056402440f00b004352e63aca9mr4590748eda.162.1665063767561;
        Thu, 06 Oct 2022 06:42:47 -0700 (PDT)
Received: from nam-dell (wlan-247051.nbw.tue.nl. [131.155.247.51])
        by smtp.gmail.com with ESMTPSA id h7-20020a0564020e0700b00459d0df08f0sm1620698edh.75.2022.10.06.06.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:42:47 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:42:30 +0200
From: Nam Cao <namcaov@gmail.com>
To: Brent Pappas <pappasbrent@knights.ucf.edu>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: most: net: Replace macros HB and LB with static
 inline functions
Message-ID: <20221006134230.GA14040@nam-dell>
References: <BN7PR07MB419563C5B405ED4082D7841DF65D9@BN7PR07MB4195.namprd07.prod.outlook.com>
 <20221005235728.GA118549@nam-dell>
 <Yz7WVCzAviUYstX9@knights.ucf.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz7WVCzAviUYstX9@knights.ucf.edu>

On Thu, Oct 06, 2022 at 09:21:24AM -0400, Brent Pappas wrote:
> The 10/05/2022 19:57, Nam Cao wrote:
> > On Wed, Oct 05, 2022 at 04:10:44PM +0000, Brent Pappas wrote:
> > > Replace function-like macros "HB" and "LB" with static inline functions
> > > to comply with preferred Linux coding style standards.
> > > 
> > > Signed-off-by: Brent Pappas <pappasbrent@knights.ucf.edu>
> > > ---
> > > diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
> > > index 1d1fe8bff7ee..8a8fbc274b73 100644
> > > --- a/drivers/staging/most/net/net.c
> > > +++ b/drivers/staging/most/net/net.c
> > > @@ -36,8 +36,8 @@
> > >  #define PMS_TELID_MASK         0x0F
> > >  #define PMS_TELID_SHIFT                4
> > >  
> > > -#define HB(value)              ((u8)((u16)(value) >> 8))
> > > -#define LB(value)              ((u8)(value))
> > > +static inline u8 HB(unsigned int value)                { return ((u8)((u16)(value) >> 8)); }
> > > +static inline u8 LB(unsigned int value)                { return ((u8)(value)); }
> > >  
> > >  #define EXTRACT_BIT_SET(bitset_name, value) \
> > >         (((value) >> bitset_name##_SHIFT) & bitset_name##_MASK)
> > 
> > I cannot apply your patch. I think your email client modified some
> > whitespace characters.
> > 
> > Check this for more information:
> > https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2Fhtml%2Fv4.10%2Fprocess%2Femail-clients.html&amp;data=05%7C01%7Cpappasbrent%40knights.ucf.edu%7C3748a695ff1e438ecd0b08daa72d66bf%7C5b16e18278b3412c919668342689eeb7%7C0%7C0%7C638006110693613730%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=rq2pgVr1dqT2k9hC21LXueqMeIcVyk2Qjvjl1KtkhsU%3D&amp;reserved=0
> > 
> > Best regards,
> > Nam
> 
> I have followed your advice Nam and am now using an email cient that
> leaves whitespace intact.
> 
> Should I reply to this post with the corrected diff, or would it
> be better to submit a new patch with it?

It's up to you. Replying sometimes make the conversation messy, but for
this case I think it's fine. Don't forget to add "PATCH v2" prefix and a
change log.

Best regards,
Nam
