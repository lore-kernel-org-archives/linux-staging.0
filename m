Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA67C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:48:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b21so1915786lfb.5
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oOTGeK/fBBSylHFUjJjIrij7LyMZ635R4iqHI9V3GZY=;
        b=J7RUYuRuK3gLqIL3lh93xMbkwaevjEZCFPh6ZVQKhFkbS40MZZZ7DhyVXYQvRe4QF8
         awH8zLfUYrbRhS3brpLGDloe6rXsr9oQcniBE2HEib4md7GR5OsIqqqS1CH2OnvRxkJ5
         F/BOGASxXEe2QMwzKx1zRDlUojaMiqXeGkIp58F6Fti68zsaj5Q6x6oZoFveBnwDQ0Li
         FOm011adxpyaK+qvC+aGqxc6WQkTRdA6ZYEQmEpr7XRvL2++R6VOO3RqZ85JxDJd97nt
         YjGpIYcv57m3au5DE47p05yfhJTyNzLoEiYz9lEGOyyEtHVbVXWIDTTlrZUeT9DMk6zA
         fE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oOTGeK/fBBSylHFUjJjIrij7LyMZ635R4iqHI9V3GZY=;
        b=MJXRaOhzidY4/Ow1HFhJVKM9lfFrrfYRQlyqAdO8hDowLiB59IERMNEbE/TfU9datY
         GC0KCPeXdy/BEdAWWf4jjjW6pabi52ZlZFhk95H2oFHOwjOa/I71p4KWqe0HO49n5XYE
         W7ObbIBro1HErCSuoKeucU8jzSBO2TJJpp+q9rEVLvi7n6Y7v+mbHiQOR8T5UdmJoJ+H
         Q0zXsucxy2jYGeKXohjIATJK5gZdzTiHECKKCp171/glOzzOqEOgVEWvWAxhDyN4d4qn
         F2yZBVuFQpsQs2hOUUi7p3ovx35k/4ny80mQj2hiGkNgawtceY1O3wpvbKqmJP97ZhRa
         juBw==
X-Gm-Message-State: AOAM530vGYhB203xTHfzDVpkBshkoL8oL83/rPPWsBhWmJGKua5nvSv5
	1RY08y6x417tJcqbNnqL8sM=
X-Google-Smtp-Source: ABdhPJyNdDN6cJki6ehM3psvSt8BFf2cT0dipYkWjWJ45k7HSVuu2g4N8PpbG+NTdOXnrrOLTPyIQA==
X-Received: by 2002:a05:6512:3b81:b0:44a:d39c:6c7f with SMTP id g1-20020a0565123b8100b0044ad39c6c7fmr9929114lfv.129.1648986513458;
        Sun, 03 Apr 2022 04:48:33 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id 11-20020a2e154b000000b0024967cd674esm757347ljv.35.2022.04.03.04.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 04:48:32 -0700 (PDT)
Message-ID: <3fb13fee-a605-7f2e-81ad-45148082a733@gmail.com>
Date: Sun, 3 Apr 2022 14:48:31 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
 <1813843.tdWV9SEqCh@leap> <942bbcb6-725d-9b47-5dfe-f105d30ea6b7@gmail.com>
 <7365301.EvYhyI6sBW@leap> <bf1137fa-5051-a834-0c1f-042c5a8074a3@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <bf1137fa-5051-a834-0c1f-042c5a8074a3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 4/3/22 14:41, Michael Straube wrote:
> 
> Hi Fabio,
> 
> wait..
> 
> rtw_set_802_11_disassociate() calls rtw_pwr_wakeup() only if
> check_fwstate(pmlmepriv, _FW_LINKED) is true.
> 
> 
> 	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
> 		rtw_disassoc_cmd(padapter, 0, true);
> 		rtw_indicate_disconnect(padapter);
> 		rtw_free_assoc_resources(padapter, 1);
> 		rtw_pwr_wakeup(padapter);
> 	}
> 

msleep() cannot be called in atomic context:

drivers/staging/r8188eu/core/rtw_pwrctrl.c:379

  	if (pwrpriv->ps_processing) {
  		while (pwrpriv->ps_processing && rtw_get_passing_time_ms(start) <= 3000)
  			msleep(10);
  	}




With regards,
Pavel Skripkin
