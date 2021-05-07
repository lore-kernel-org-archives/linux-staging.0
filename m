Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135E70
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 09:08:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h4so8383299wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=evCd8kqXEYCoq4dPWZxqKxQRWsbsa5Y9xd6lcogDcKc=;
        b=BSMHP94e6aSCuZBWICaToOiP6qmDSrPhOjZzDiZWW/4kB8GJTGjbedRYj81bPo9O39
         TJ+crma7DWEwjQDnexuoWJcIQqTEa4vhgkUz/60nlMFuLA+n9RBHCBONo30AfQuSmbEp
         Naw+S9Cgs45YBAah9t1PX5YRMo4j8r0KqtUzQuijFYqgAXBqs2Ja6aaH4KYo7HFV7L2l
         +9hW6/JpXQJNSiwhbVljxjAGIPe/dMNYQgqFR3OJxFElzwsAWgX2rJP91B31Zmti0VgA
         xh9Ygw8N2zvTgM3KzAZ75XuMJeANonjAUr/ObKF0jFdJxlDAKtU1GpsMg/r9uXmH2tob
         sxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=evCd8kqXEYCoq4dPWZxqKxQRWsbsa5Y9xd6lcogDcKc=;
        b=cZ2jD98UN3fE2SJpXNtcg0dLvrTP78ENs2aYfOFQjKIqksUsApBiZyYSUiydPX0Sm5
         pEwJejd6ap9f+5bMRDYs7qD0y/tyKsULHTGqQ2fLGyI9RCrJDx1izaIyUBb5C/Z9lpX9
         zsXYPVM50A2LLW5L2doIHqyLS0JX61F2FJgfBoUHIHqeyk7aA++BZ60xFsH1wOxBuTdF
         vFscaJA6g4ic6SLnlpckUhFLjMvwUOg8y3G2bfKBSPtRL0S3t8UamO7jHnUwGs/rIFrX
         suf3qSj9If7NYjqHVRFwj/QBWXLRVj0eVgjya8ARg92bd4B6F1nWKehvyv3Mv9e/YUny
         BAdQ==
X-Gm-Message-State: AOAM53068gPeeZ6//aS6cs0Gbci1ZErIU2HR6kyaw3krvtHhKyJvR7ys
	3RWlmr/DOYTTxwmFhmrdzkyx0S2LxZkK8w==
X-Google-Smtp-Source: ABdhPJxIPCMXdDWaDmaxZcFO4QNiPQ7FpZx8p8Sk4dY439ETctWPp68fAgQmIW92qdJ1z+2entwBUw==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr11189666wrt.164.1620378510579;
        Fri, 07 May 2021 02:08:30 -0700 (PDT)
Received: from agape.jhs ([5.171.80.53])
        by smtp.gmail.com with ESMTPSA id v15sm12783026wmj.39.2021.05.07.02.08.29
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 02:08:30 -0700 (PDT)
Date: Fri, 7 May 2021 11:08:27 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: linux-staging@lists.linux.dev
Subject: Re: Bouncing messages from linux-staging@lists.linux.dev
Message-ID: <20210507090826.GA2106@agape.jhs>
References: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi all,

On Fri, May 07, 2021 at 08:30:01AM +0000, linux-staging+owner@lists.linux.dev wrote:
> Greetings!
> 
> This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> mailing list.
> 
> Some messages to you could not be delivered. If you're seeing this
> message it means things are back to normal, and it's merely for your
> information.
> 
> Here is the list of the bounced messages:
> - 2608
> 
> 

what I'm supposed to do now if I'd want to retrieve the bounced message?

thank you in advance,

fabio
