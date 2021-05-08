Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B072
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 11:32:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id m11so23867lfg.3
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PXAa7ncW6tnQNSCVmINwjOAXmzqHMKlEEaaWFcl+Zig=;
        b=sPUbSjRETuhU1bfQmElfOC8xI1jqxOeo727f0En4w3gRQCDqhkU0fR2gOC7DAu+5DV
         w0ZQWlSEH6VTyTQx2zWBMlxoBcGVRawJuZd5DP6Lk7h4wLHN3bZ2nPJNaBz1IidvbxnG
         DesFThsHa7xq2omfQaJh43yu9DRxjsBKttN4QhKDw9IC5x3xC2ngffQGj2ZJQ7driXKM
         aNR1fCZZcxPG8bod4Zraf7Jh83oXbG7hf3Hus99ggnxoIpSvGW7K1OuMCa54sSDCipwc
         ULhsDzXM4xYh/7crNbBImG4dDYscEphdJHP6vzpjq6be0aWuQ2j1cH05dqQeDM/XLNTB
         4BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PXAa7ncW6tnQNSCVmINwjOAXmzqHMKlEEaaWFcl+Zig=;
        b=id9k8SuqW/XlKcnqbgT3dVRNQdjJumYpEiwrs6WoPxYNpLwAL1qFkwlNF6i9+ppcxn
         QXtbfa4j7dwsjghDsYI7ajAir9ogcdqO/XjzLSfvw/qPQ+EQtJXBKluo4a0zmQXUKHSd
         OhmmM6g5Z7+G2b5T6/T1XGPQSR0DMmE1tyJLJgmNvs9XO1lOeC8laiS4UvqoAsKgZwao
         7DlqKerGbhHudwIoHMxN8iaz/y8vdgiLXA4eeE1QShGy+SjRhiwm/JvmiuxHW9InVXOq
         tSRljHmsO9L7qqkJa7LsjXO1/6xKnRFbvFYpwXVYcrO+PPxFHGftsn75uULaakuWMuAo
         EHNA==
X-Gm-Message-State: AOAM532HQ+kG5UuM8aSVl3pv9vZqBmoI6l0QJMk5eNID5PJLfyq5cKZr
	hkT9PQ7pwfXTVDv7g7Noow6v1LSpfv+lP610
X-Google-Smtp-Source: ABdhPJyEgioyenwxZoCGG+r6LrzxG1yPLmEV5JjlAUjlK+TN8vTgsFK6s5swlQsTZyMzZ5/uclhsHw==
X-Received: by 2002:a05:6512:3e12:: with SMTP id i18mr10122lfv.154.1620473545722;
        Sat, 08 May 2021 04:32:25 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id s4sm2278568ljp.114.2021.05.08.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 04:32:25 -0700 (PDT)
Date: Sat, 8 May 2021 14:32:20 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: code cleanup
Message-ID: <20210508143220.0b92bc37@gmail.com>
In-Reply-To: <YJZuviLa3SRLWASk@kroah.com>
References: <20210507075458.GB3@paasikivi.fi.intel.com>
	<20210508105129.2698-1-paskripkin@gmail.com>
	<YJZuviLa3SRLWASk@kroah.com>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi, Greg!

On Sat, 8 May 2021 12:58:06 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sat, May 08, 2021 at 01:51:29PM +0300, Pavel Skripkin wrote:
> > Breaks are not useful after a return, they can
> > simply be removed.
> > 
> > Also, dropped the individual return statements
> > after or inside switch cases
> 
> Almost always, when you say "also" in a patch changelog, that means
> this should be split up into two different patches.
> 

I thought, I could add this to current patch, because It was suggested
by maintainer, but, I guess, I was wrong :)

> I recommend doing that here as well, this should be a 2 patch series,
> right?
> 

Thanks for suggestion! I will also remove returns at the end of void
functions as 3rd patch in serie.

> thanks,
> 
> greg k-h

With regards,
Pavel Skripkin
