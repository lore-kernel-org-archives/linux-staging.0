Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E64F7E;
	Wed, 15 Mar 2023 04:19:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id m2so3373456wrh.6;
        Tue, 14 Mar 2023 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678853992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgH/FkhtXHDcTCLrls07cfG5NNn3lL2m3rwDTTttCR4=;
        b=Ur9v2Pzp/b6bSiROfuYLlWtqmDCGT81iVqQ6+GjBTvxZprmFWzq+bcN6ZJbRLbgcs1
         wpp70tDh4StjMV5C7q124/rIU6/FjJvqOdF+QO/GXFwAvLL48xKPO1IcSCNPvORAUdU/
         Gh2GtKUsSX5ZEMIJQUkTtTeihZNMlfLT16Mcb3lNwVfIGUoFUF9EhPF5Bg+4ugpwXv5K
         ZqXiKCLijwptjOpYCQexGR15KVPfs4Z7tp9yMond7qPp2c2owaq50erGjBfJJuXqkp/g
         QUDAscIf+1rhE4r6RXyEkvy8v1lyL/SYu4cq7hB72lKDVj0yHQAXJBJH/1RjxVQpK1m8
         j1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678853992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgH/FkhtXHDcTCLrls07cfG5NNn3lL2m3rwDTTttCR4=;
        b=l/ri8tD6ORhhNhbR5klgjpgN6H9PvbmIRGb+R0raeREjcu0c/DbmBwk7JgIIKrIx8H
         1ZBtYLqowsoYLLPkm3WenNOArKLts4oaYwp+pF4aVWXrmBT0G9g/Wqcd+cu8IvNK83wm
         loEez9Pk2ZR6Zp6h4reCWGS3UVWfXUHUt+aBWy/CzptmpFUq2689mEttQASRqH7Z/RtE
         V+1IaQJfUqYLMIR0K7mLTsSJ72xirQjfUt+fxkHPpWzNAE5vvIBxSB2ELG1Ym4lryYiy
         nLpEZvsBG3y0dMGNBsm7OEeh/K1UaYhun5njUBOW7R7z8Wq3vSk5XBEFrK5Zc/PenruR
         +u2Q==
X-Gm-Message-State: AO0yUKVEk3EcUmySNJHUvgIxdZJT+nLQZwQdUFW9QtIXfjFc7hjhyiGK
	T4dvgeZVZtF2RA7utywZq44=
X-Google-Smtp-Source: AK7set/+PZ9jJFNyB3eNIUp8DxX3jbnsDjPqSnvkmTioQIhzVqNZLqXBavE1w6QE80ci8U+9+m/a+g==
X-Received: by 2002:a05:6000:100c:b0:2cf:e6e0:70a4 with SMTP id a12-20020a056000100c00b002cfe6e070a4mr1043082wrx.2.1678853992226;
        Tue, 14 Mar 2023 21:19:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b6-20020adfde06000000b002cfe466e894sm3481064wrm.38.2023.03.14.21.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:19:51 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:19:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	outreachy@lists.linux.dev, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: enclose Macros with complex values
 in parentheses
Message-ID: <ba15ff7a-8766-43db-be7c-f971bf6dc8d6@kili.mountain>
References: <20230312133347.120944-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303121507450.2865@hadrien>
 <174e4d14-8b3e-67f7-d901-bd77b054f7c3@gmail.com>
 <alpine.DEB.2.22.394.2303121525270.2865@hadrien>
 <ZBEQYp/z+C/JeR98@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBEQYp/z+C/JeR98@aschofie-mobl2>

On Tue, Mar 14, 2023 at 05:25:06PM -0700, Alison Schofield wrote:
> On Sun, Mar 12, 2023 at 03:25:37PM +0100, Julia Lawall wrote:
> > 
> > 
> > On Sun, 12 Mar 2023, Menna Mahmoud wrote:
> > 
> > >
> > > On ١٢/٣/٢٠٢٣ ١٦:١٢, Julia Lawall wrote:
> > > >
> > > > On Sun, 12 Mar 2023, Menna Mahmoud wrote:
> > > >
> > > > > enclose Macros with complex values in parentheses is especially useful
> > > > > in making macro definitions “safe” (so that they
> > > > > evaluate each operand exactly once).
> > > > enclose -> Enclose, and Macros -> macros
> > > >
> > > > I don't understand the above comment though.  How does adding parentheses
> > > > around the body of a macro cause the operands to be evaluated only once?
> > > > And the macros that you have changed don't have any operands.
> > > >
> > > > The value of adding parentheses is normally to ensure that the body of the
> > > > macro doesn't interact with the context in a weird way.  For example, you
> > > > could have
> > > >
> > > > #define ADD 3 + 4
> > > >
> > > > Then if you use your macro as 6 * ADD, you will end up evaluating
> > > > 6 * 3 + 4, ie 18 + 4, when you might have expected 6 * 7.  The issue is
> > > > that * has higher precedence than +.
> > >
> > >
> > > yes, I mean that but i couldn't explain it well, thanks for your feedback.
> > >
> > >
> > > >
> > > > But I don't think that such a problem can arise with a cast expression, so
> > > > parentheses around it should not be necessary.
> > >
> > >
> > > So, no need for this patch?
> > 
> > No, I don't think so.
> > 
> > julia
> 
> Looping in Dan C explicitly.
> 
> Can we revisit this one?  It actually leads to a checkpatch ERROR.
> So, anyone hoping to get an error free checkpatch run on this file,
> is out of luck.
> 
> Is this something that checkpatch can learn about and allow, or
> should we add the parens here, to dare I say, appease the checkpatch
> god ;)
> 

I think you wanted to CC Joe, not me?

I agree with Julia, but I also have slightly kind of given up resisting
on this one when people start adding unnecesary parentheses.

Fixing the COMPLEX_MACRO macro warning to ignore cast operations would
be a great idea for a small project.

regards,
dan carpenter
