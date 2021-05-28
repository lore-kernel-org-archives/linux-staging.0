Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AC2FAD
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 08:03:56 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gb17so4007701ejc.8
        for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4lLWmO8FwQ82FYaqkkGlXmgOAPrA+grFImhNRkbcbEk=;
        b=M3AK9Bo9iZoe1Y7iGScRTj4jLRR46tTsrteCVfxnwAUbj4GmiuKyvqw6RzyBaaSrzZ
         vgtM9bZDJsjg1HNvl6yG0z9vvUWdLvvSA3gYibhxTBJPka1teG8v0cbNeBmn3CjzuRe1
         hE06Qx5m88MlTTwjGlDXvVaEUjyR6kBTAz5fTG3DAQ0ihwljOc7B+bi254T24tfrDN3K
         WaX2wIN3FY4QlMmks3KoDWC/o1GsqdWEDkqnOotkHNT+lMmppsxPo8gwAXBUC1FvaQSX
         87fIPSE5If+s/38rz7z9PcUQZdFAZ+nzOFbrG/eTOAEFkCKjPyezEgHLwcfvFUwhX0DV
         rRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4lLWmO8FwQ82FYaqkkGlXmgOAPrA+grFImhNRkbcbEk=;
        b=cbqK8KArrkmYE56ceoD5Jcv2MJMRXgAMv0v+MpXIJM/ehoOHCBH9eERS3FrGdpEU8A
         jtBL9MlPMFTPBtuxrfUzM1/i939YlTfxJyIk7kMUPPv0Y8r4RcmwYnqb+/iUxwLNVVZI
         P0MrX87hOIGeWhH1q+5qjJ3a6hRIdanri6D7TjSLYi/P3xLC5gZE5JTA8kxwdjBskRRg
         syLhqyqQ8ihi2F1IsNRFRl4tP3/mdE2mGOHcRrr0WaM3xa7IMJ4bfM66yglTu9yj7brW
         mmTEH0c15IdqCNoWxetad3FGqRA3vJVoE7Wbzti0KZxdB3dAqQiKwTOChyLEqVCdh3qu
         8BjQ==
X-Gm-Message-State: AOAM530A+f9exuSMTXp5aWpazrTXjgHJIsf9ShSgpMVRlxIitqfB1gPP
	yjlS2chsNKQp+BFCPZ+gzx8=
X-Google-Smtp-Source: ABdhPJzclK3FzZNdf1wQCmZQtJpJQIbhBGX1FQbEoL1OSobRB/RTZLFPwu8a6C6d7T05V7hgr9ANsA==
X-Received: by 2002:a17:906:2896:: with SMTP id o22mr6853101ejd.524.1622189034885;
        Fri, 28 May 2021 01:03:54 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id w14sm2345934edj.6.2021.05.28.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 01:03:54 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: drivers/staging/greybus/bootrom.c: fw is NULL but dereferenced
Date: Fri, 28 May 2021 10:03:52 +0200
Message-ID: <1931377.TGo55UGoA0@linux.local>
In-Reply-To: <20210528033301.soqgwfwfy4ls6a2a@vireshk-i7>
References: <2015099.xVv48VzNit@linux.local> <20210528033301.soqgwfwfy4ls6a2a@vireshk-i7>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, May 28, 2021 5:33:01 AM CEST Viresh Kumar wrote:
> On 28-05-21, 01:39, Fabio M. De Francesco wrote:
> > Coccinelle detected that fw is NULL but dereferenced.
> > 
> > static int gb_bootrom_get_firmware(struct gb_operation *op)
> > {
> > /* lines of code */
> > 
> >         if (!fw) {
> >         
> >                 dev_err(dev, "%s: firmware not available\n", __func__);
> >                 ret = -EINVAL;
> 
> ret is set here.
>
Oh sorry. I entirely skipped that "ret = -EINVAL". Another case where one 
should avoid blindly trusting the output of static analyzers without looking 
carefully at the whole context ... :(

Unfortunately, Coccinelle has a high false positive rate. Just yesterday I ran 
it against the entire driver / staging and more than 80% of the warnings / 
errors weren't true.

It takes so long to distinguish the fake from the real that I wonder if it's 
worth it to run the (slow) Coccinelle, wait for the output messages and verify 
their veracity.

Thanks,

Fabio
> 
> >                 goto unlock;
> >         
> >         }
> > 
> > /* lines of code */
> > 
> > unlock:
> >         unlock:
> >         mutex_unlock(&bootrom->mutex);
> > 
> > queue_work:
> >         /* Refresh timeout */
> >         if (!ret && (offset + size == fw->size))    <--- here
> 
> Since we are checking for !ret here, we will never access fw and this is a 
bug
> in the tool and not the code here.
> 
> > 	next_request = NEXT_REQ_READY_TO_BOOT;
> > 
> > /* lines of code */
> > }
> > 
> > I really don't know if the following change may break something else:
> >         if(!ret && fw && (offset + size == fw->size))
> > 	
> > 	next_request = NEXT_REQ_READY_TO_BOOT;
> > 
> > So, I'll leave the problem to the maintainers or to other people who know 
how
> > the driver is supposed to manage fw == NULL.
> > 
> > Thanks,
> > 
> > Fabio



