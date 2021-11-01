Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBD2C86
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 16:30:50 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z20so66578721edc.13
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YgSSvNsm0Z7aKAqIRScZzvLuuJ1N/g+l4fO8S50yBac=;
        b=KdHxsDLJ3nYJ6rEFuu6y20lSQvJl/+9lyQ/kzVHZvoinyti94cbmslC8LTVxsJ4Hf7
         fRNBPiiPppFTmKubbeEl5fImTL8NYaKF/K/1ehrio8SsP7vz0fbY5EoORH6H4tUoG80G
         oX3ObLjDa+QpG1taiiUC+nUjr++/qoxDNlBo1G5ZaQAt6In8v4AM8F0ZQbA2gxrRr7y8
         iaLqCIyLy2uyewF8ejjVqFeL3J+lvZemLIQPIXae0FLMppc9ZZF+BMF0MsihX4ccRPMn
         JGHcMrNypwFRnC4ccat6rHeBF9fm4qDTIE1QmVZ7+U8iwm7WNNvw3z91M4sf5+Q80qyO
         ybrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YgSSvNsm0Z7aKAqIRScZzvLuuJ1N/g+l4fO8S50yBac=;
        b=ZUZxwcqfXZihmtltbZbi/VJGEnKB+6//aXyK6W/IfKvMGjpnN5+PpifqAdMZq7VDcH
         QgkC+CzQQyPd75wf04CvkE2uZHUGhpCYJWZxvZJxlLwCAneopkyk9e9261jtefLUl3CZ
         rnu2uJ8/O1hrt0JHn1CD4kkU4sLkG/AYK7iHc5r1nbwrYM8FlqMSknZZr+1S7ZJfRmaX
         bWaBzCxscBLo08UWWiHXQxdHFMOmnNODVjRLTnFU9XKJBm+RWQ38x5185TLuUqCJxJqy
         SwrDYTHL2ZKPta0RMTZP0razbw2KiuwjYb0O6DUR9SQWxUMU/E8w5RAKINVqfduh4G9X
         amAQ==
X-Gm-Message-State: AOAM5336/aRqqdkMpjpYLriSlS4W/uZHcGy60qlgYOAR5UcPt1KAzJj2
	RDTjiumB3wURe/9fC72Tgmg=
X-Google-Smtp-Source: ABdhPJxislw1mEA6MJ7mPzLwu32b6iS0P9nZzjWGPETt5rAxv80MXqEjVgyEWzP2Tt0I13bWQSqanw==
X-Received: by 2002:a17:906:6089:: with SMTP id t9mr38872474ejj.323.1635784248600;
        Mon, 01 Nov 2021 09:30:48 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id d3sm4300846edr.0.2021.11.01.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:30:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH v2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Mon, 01 Nov 2021 17:30:47 +0100
Message-ID: <11283844.I1tDBM3C2B@localhost.localdomain>
In-Reply-To: <d1a8eb91-adb9-2163-dc3d-9f86ebdc45e3@lwfinger.net>
References: <20211101142732.5638-1-fmdefrancesco@gmail.com> <d1a8eb91-adb9-2163-dc3d-9f86ebdc45e3@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Monday, November 1, 2021 4:11:26 PM CET Larry Finger wrote:
> On 11/1/21 09:27, Fabio M. De Francesco wrote:
> > Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> > report_del_sta_event(). This function is called while holding spinlocks,
> > therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, the
> > allocation is high priority and must not sleep.
> > 
> > This issue is detected by Smatch which emits the following warning:
> > "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 report_del_sta_event()
> > warn: sleeping in atomic context".
> >
> > []
> >
> I am happy that you caught the error before it destroyed every instance of 
> r8188eu.

I don't think so, since we have run this driver with no problems at all :)

SAC bugs can potentially cause serious system hangs at runtime, but they do 
not always cause problems in real execution as you have noticed here with 
this driver. We have used and tested it hundreds of times with no problems.

> Incidentally, I disagree with checkpatch in that I think that 
> sizeof(struct foo) is more descriptive than sizeof(*bar). 

I agree with you in full, but I felt that I had to change it just because of 
the warning output by that tool. I don't like to have my patches discarded 
because they don't fix checkpatch warnings or introduce new ones. 

> If I wanted to check 
> the resulting value of the sizeof(), the second form requires an additional 
> step. It probably does not matter much to the compiler, but when I have to 
do it 
> manually, the extra effort is not negligible.
> 
> Even though I disagree with the philosophy,
> 
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
> 

Thanks for your "Acked-by" tag.

Fabio




