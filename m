Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C07A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 08:14:36 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id g126so9606177pfb.3
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 01:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e8k4niv2qxe2czoHlTxRFyZx/OzemwbGQXpmgfLUwKk=;
        b=InEZlaJiCTywsFh4q0qQtJ1lIvFewS4ursq2YyRdhUsW+1KoTxurL88xLnon3lZFMg
         2dwP4zMadUz1wUb3QAVNrfbWCGJUOEBkgcfKIx9zYWV2WaVm9HlCYuKWafdq5Y/q0aTX
         +SbGNqe5i/PxS9HHlGg5+zLdZXRX4E103EklQgDBTcZrtuMvnfE+CH1m8Vv9zplBOr8e
         uyavXrHJj3ZIb9YTqMrbto7RdZCRI9FEjh4UguvSkleEexfLtqeHxj2CjiRJU7CNNjBn
         Chj5D6ooeno7IpzbJsSDDakn6vewlQUzI14hxMfPKnZemA+je1SkQ0Ws9dm5VfCBo+n2
         bcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e8k4niv2qxe2czoHlTxRFyZx/OzemwbGQXpmgfLUwKk=;
        b=Oa7uSzLlX9ULaMyrZSfVfVxFr/WPqwXg9KEqz/WrzsxSvarhxYi8xG8Tgqq5GvYxSJ
         wX4Iohm7Ma2OO1xm1DqmAAbbpWlsGDVUPrxP9Qe44nt7bUYDaxjhg5fR4nBGqVz1C3Et
         T0i2yPHywgVkttUlmgzRIL8/RMPafaG3DMmL0V3HGs/s0UOfSNXAZoF7UvbAiwbPJudF
         9yXySXfeTtW8nbmZN2TTHC9PCHI3pAqh+qHtyRCwMomuHi0nVO4fUN3OXTtwZBWzX5l7
         z9i59XOvzIVgHh1ay3xZ7q/xr04DMVzUZLCGFdnF+ZJ5VfLKgGvR9bGiBAgqdvow3PWd
         H/Zw==
X-Gm-Message-State: AJIora8YIaCQNzfPgiFTbkgYEh25IlfMvf1mQMBrBnW9+cNVr+ajffAk
	N3IvqMXPCSOGUW/kNsvdBXo=
X-Google-Smtp-Source: AGRyM1uxZ0wSW+q5pg5KKMeSoo9+tXDBz9FGE9U5C+xO03r/IJbQRYhA8osPYTxUu749ZipXBeHPFw==
X-Received: by 2002:a05:6a00:1a0e:b0:52a:cef3:b4a1 with SMTP id g14-20020a056a001a0e00b0052acef3b4a1mr1956752pfv.23.1657700076405;
        Wed, 13 Jul 2022 01:14:36 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:5ee1:7060:fe1d:88a2])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090a384f00b001ef81574355sm957834pjf.12.2022.07.13.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:14:36 -0700 (PDT)
Date: Wed, 13 Jul 2022 01:14:34 -0700
From: binyi <dantengknight@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com, Coiby Xu <coiby.xu@gmail.com>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: qlge: Fix indentation issue under long for
 loop
Message-ID: <20220713081434.GA20416@cloud-MacBookPro>
References: <20220710210418.GA148412@cloud-MacBookPro>
 <YsvZuPkbwe8yX8oi@kroah.com>
 <93dc367b01cdfbb68e6edf7367d2f69adfb5d407.camel@perches.com>
 <Ys1Chwsa6e9EjRNs@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys1Chwsa6e9EjRNs@kroah.com>

On Tue, Jul 12, 2022 at 11:44:39AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 11, 2022 at 01:55:24PM -0700, Joe Perches wrote:
> > On Mon, 2022-07-11 at 10:05 +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Jul 10, 2022 at 02:04:18PM -0700, Binyi Han wrote:
> > > > Fix indentation issue to adhere to Linux kernel coding style,
> > > > Issue found by checkpatch. Change the long for loop into 3 lines. And
> > > > optimize by avoiding the multiplication.
> > > > 
> > > > Signed-off-by: Binyi Han <dantengknight@gmail.com>
> > > > ---
> > > > v2:
> > > > 	- Change the long for loop into 3 lines.
> > > > v3:
> > > > 	- Align page_entries in the for loop to open parenthesis.
> > > > 	- Optimize by avoiding the multiplication.
> > > 
> > > Please do not mix coding style fixes with "optimizations" or logical
> > > changes.  This should be multiple patches.
> > > 
> > > Also, did you test this change on real hardware?  At first glance, it's
> > > not obvious that the code is still doing the same thing, so "proof" of
> > > that would be nice to have.

I don't have access to a real hardware, so can't provide a "proof" of that.
I agree with Joe that's the same logic, and it compiles ok. But I
understand if you don't apply this patch, it's more safe with some
testing.

> > 
> > I read the code and suggested the optimization.  It's the same logic.
> > 
> > 
> 
> I appreciate the review, but it looks quite different from the original
> so it should be 2 different patches, one for coding style changes, and
> the second for the "optimization".
> 
> thanks,
> 
> greg k-h

Thank you for the review. I sent a patchset, following the instruction
here:
https://kernelnewbies.org/FirstKernelPatch
And I didn't find a good way to send a patchset by mutt in a single
command, so I run "mutt -H PatchFile" several times to send it, and I hope
that is okay.

Best,
Binyi
