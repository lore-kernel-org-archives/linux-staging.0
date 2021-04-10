Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8800570
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:02:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 18so9647602edx.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Do6TOYC7++a6IT3LFrIbNRxGi7wBbVzvSmX3FLO0FdM=;
        b=HU+wWxvizyxRF+Ep5QdHxWya1Iq41OOSwWEAJ3CM/e50CLK5mj0KZzaidwqcU4gjK9
         Y2ipiTZ7bLwqlshB9tPJRoxlrCeaS/kyi2vuNjhnLNYtlro+v4fPFIy8sIapQ/hjSxgh
         aGQ1N0ZgVqXQ1YBJPHsoerNgrFIzvlhGZ0+4gGt+UDBfZnN9hUE37O+Qx23GbeLGjotU
         s14JGPwH2fO4KHJNPV/lOfuD8hgPYjQN1JnsEjuBKVVKHRp7K3QZARoPI7c2JSH8stPU
         EGmqx3RnE3HpWTN85ZzS7wGjuOeYiQ/nV2DV3GBRGbdqyMOgVzqCmhWJL9/ikThAXw08
         OO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Do6TOYC7++a6IT3LFrIbNRxGi7wBbVzvSmX3FLO0FdM=;
        b=GY+quPBCfdoDVrW1td4L5CvFfkNxHcREPZWB4Cb402O57+xQKXLvig8fGTnLl8zEEq
         JzMtFHyhuoDswJuzXfwFSGXQdksbwNDvnzXnC0GhsMGq1EAFvdxkEhIM2Wkh0tukRC5u
         CUwJuDoU3U8fdkBfh8j/4lqyfrtVGP3E+wxcnMQyNnJrIy7OzvP9wsRRgUDTf05Nfbt3
         +Nr+4pCPYokGhYkai9rUL2ShrfQopsKVeSa8WflpsG/dpu28mnH1PFnU5+qcq10OTsiM
         Wi3SfT85SRdt7pyu1noZHfR9G6z+PNMb3ytuOLSlpFK2A3BeUF0IhwoXwl5f0hwDJU6X
         HHCg==
X-Gm-Message-State: AOAM5322FAYVWvn5JN3NHJ/9VHhWA7B//on65VsTaJO5Thgjf4r/wQ/8
	W33hvj5BFnQS9Grb8ELXn1g=
X-Google-Smtp-Source: ABdhPJx407YkiJEJt9B4XApmbe8vLTQuoNjU8hFa7bzAs8IAztyiNUNFbJeEGn10/Zb9a14sxT44DQ==
X-Received: by 2002:a05:6402:614:: with SMTP id n20mr21433069edv.58.1618059761100;
        Sat, 10 Apr 2021 06:02:41 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id bf14sm3081490edb.67.2021.04.10.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 06:02:40 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 4/4] staging: rtl8723bs: Change the type and use of a variable
Date: Sat, 10 Apr 2021 15:02:39 +0200
Message-ID: <2186059.xkuF2sVEJi@localhost.localdomain>
In-Reply-To: <alpine.DEB.2.22.394.2104101410350.2975@hadrien>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com> <2763630.ZYQqkGPH9U@localhost.localdomain> <alpine.DEB.2.22.394.2104101410350.2975@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Saturday, April 10, 2021 2:12:28 PM CEST Julia Lawall wrote:
> On Sat, 10 Apr 2021, Fabio M. De Francesco wrote:
> > On Saturday, April 10, 2021 1:37:30 PM CEST Julia Lawall wrote:
> > > > That variable has global scope and is assigned at least in:
> > > What do you mean by global scope?  None of the following look like
> > > references to global variables.
> > > 
> > > julia
> > 
> > I just mean that fw_current_in_ps_mode is a field of a struct in a .h
> > file included everywhere in this driver and that the functions whom
> > the following assignments belong to have not the "static" type
> > modifier.
> OK, but a field in a structure is not a variable, and this is not what
> scope means.
>
You're right, a field in a structure is not a variable.
> 
> int x;
> 
> outside of anything is a global variable (global scope).
> 
> int foo() {
>   int x;
>   ...
> }
> 
> Here x is a local variable.  Its scope is the body of the function.
> 
> int foo() {
>   if (abc) {
>     int x;
>     ...
>   }
> }
> 
> Here x is a local variable, but its scope is only in the if branch.
>
And you're right again: I needed a little refresh of my knowledge of C.

I've searched again in the code for the purpose of finding out if that 
struct is initialized with global scope but I didn't find anything. I 
didn't even find any dynamic allocation within functions that returns 
pointers to that struct.

Therefore, according to Greg's request, I'll delete that stupid 'if' 
statement in the patch series v2 that I'm about to submit.

I've really appreciated your help.

Thanks,

Fabio
> 
> julia
> 
> > Thanks,
> > 
> > Fabio
> > 
> > > > drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:368:
> > > > pwrpriv->fw_current_in_ps_mode = false;
> > > > 
> > > > drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:380:
> > > > pwrpriv->fw_current_in_ps_mode = true;
> > > > 
> > > > drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:433:
> > > > adapter_to_pwrctl(padapter)->fw_current_in_ps_mode = false;
> > > > 
> > > > drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:981:
> > > > pwrctrlpriv->fw_current_in_ps_mode = false;




