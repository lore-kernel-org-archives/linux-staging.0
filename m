Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3EB71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:12:29 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id sd23so16097658ejb.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cOAyiIpTL0MPS3HVlPhA17Z4KssVa29gOz8MIS/lLK4=;
        b=ReVQZ/tKm2GnT7ScEH9ClWtZBQDCG5i9KRPiqdu7rubKxmPXOyvG9goxkqig689jRp
         +6nnEPWj1qeORcIKvKahCIlDU52THgQVQNABsQnaKYAxNrJ8FDgZ6cQVlrfOUQ9O4n6W
         ZZX4OC0ZdpLgxs0x/Ru1TiWMafgZvU5+FeEBUxOOrK5XvHQCYcv+8k8ZlhtIFvhy4hPU
         TLWnNH1Nh7MTpj7UelhnYFV+/+2m+cuvgM/awVGc2xkPZYytcgHSD00w8P0MCfgdqg3D
         dJ+dPiqiZTPV0qbzU1V0VHTuM9DOkQSHN19amopX79h2JyMDpfWY8mtTqu4HODNK0Y0C
         w21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cOAyiIpTL0MPS3HVlPhA17Z4KssVa29gOz8MIS/lLK4=;
        b=fYWZIk4JzkurNKxSifVSRjTBnl4zQyKAMrnjox6h5O1RVJFCbwIqpC6FR3SE2LreBa
         JtvgJbMaXTNbgfj/GdvgKt/+NkYLzMC/0j9OFAikNDQrjC1jLotSJuZyqJwWLgFTkdLM
         XqSqXpTo7TjnyxQDsxZtAGffhf7CjwNBKB/ds07abpcKtUV7PgJxtdrC0WL/luW0YnWB
         dx9zBtzMVkxWN9vG+1FPRphI7TyQ9efsxzZ1Kea02YPAuHDrcLpHZm2e5Lmv+5GTo2An
         69E7IX8yb7kQaPv6G2LU1IjNVPYUznHjhDjd7U8SALdGgCvUJwNgOm7dU0vqk3rrAQkH
         Rh2A==
X-Gm-Message-State: AOAM5300kKlH+rvDdIG3EvABxm9YcIiKHqC3B66pGPNTTUPvpVqkRnKp
	NE7ASbqVUqAshPmvl/s4YLI=
X-Google-Smtp-Source: ABdhPJxlaZO9nKzhGpRnRp0ThPh3RNrJ7SHbgJrXoc9b947qKLB6dXoR2hwOJ6NN1cDcBqtT8frAbg==
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr14642441ejb.231.1618305144069;
        Tue, 13 Apr 2021 02:12:24 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id t11sm7389296ejs.95.2021.04.13.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:12:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Remove camelcase
Date: Tue, 13 Apr 2021 11:12:22 +0200
Message-ID: <4613100.Flf31UX1ZZ@linux.local>
In-Reply-To: <YHVKwEX8CvV7brRg@kroah.com>
References: <20210412210258.8061-1-fmdefrancesco@gmail.com> <YHVKwEX8CvV7brRg@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, April 13, 2021 9:39:44 AM CEST Greg Kroah-Hartman wrote:
> On Mon, Apr 12, 2021 at 11:02:58PM +0200, Fabio M. De Francesco wrote:
> > Removed camelcase in (some) symbols. Further work is needed.
> 
> What symbols did you do this for?  What did you change them from and to?>
> 
> Be specific, and try to do only one structure at a time at the most,
> trying to review 1000 lines of changes at once is hard, would you want
> to do that?  :)
> 
For sure, if I were you, I wouldn't be reviewing one thousand lines of code 
at once :) 

OK, let's work on one item at a time  

I'd place each change in a patch of a series:

a) one global variable -> one patch with subject containing the name of the 
symbol (beware that if not 1000 lines you'll have to review 200 lines or 
more because that file is huge and its globals are used hundreds of times);
b) one or more local variables -> one single patch containing the name of 
the function where they are used;  

In the while, I'll remove also the trailing "p_" that stand for "pointer" 
(as Julia suggested). 

The above seems reasonable to me. Doesn't it?

Regarding what Matthew wrote about making use of  
drivers/net/wireless/realtek/rtlwifi/btcoexist/ I cannot work on it (too 
much time commitment would be needed, I suppose), but,  if someone else 
can, I won't do the above-mentioned tasks because they would be useless.

Said that, I'm not sure if removing camelcase in this file should be done 
at all.

Thanks,

Fabio
>
> thanks,
> 
> greg k-h




