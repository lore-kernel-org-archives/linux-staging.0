Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BC16413
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 17:43:19 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a5ac84718dso1916578b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690566199; x=1691170999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+2oB4HmRgFIUjKdC4XEyzbsVfurztpStJ6AGUhKKug=;
        b=oZ67Qs8p+iXOD6+ENrdTy6XIVFAgUMpSvPg7Otw8pXHEWUHB5Tkr/9LkpsN+KEQEoJ
         t/nB/ObofnKO/bhr8jwhkqoH+96Szbm2h/R4znF/Bl7PgTeFiDFACzcbeg5A+cKR6vEz
         cVjfEuiTa/HkP4G7kHKrhDkUPbXlZVaMk/sqjAXD9UFk1HP5q/bhTh0IjqgDQV9p6iVs
         gRMOw3/ioIk1p4+Gf6aDywvJtdmStOkhh1SwNUQY+TrMFWNN5kpRXxXGUXYTiqciJfiD
         X1fxt5Ya511uFAghFaGRfqyl7Wp/pXSKXljvEIcl4gihZ+j2K1lvZ2MaitICJ4kh1WPY
         4f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690566199; x=1691170999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+2oB4HmRgFIUjKdC4XEyzbsVfurztpStJ6AGUhKKug=;
        b=IgYqSqXqgGTfelnR+c8SUa98STsGTwZQGXlM6FRDl0zFqJlEODJEgXLNVI56LIXnNX
         kMhxYTRPHuOaRO1F/5F26Fkmc8mLIurVZo5acT+o0SXjQ5EsT91U3K9ABB5SM3lwQwGO
         VThQBwKgJSJwHOX3ow37NHIh0gZWQgPW/rSaHSc6UnOpY/sB9WIfcQxui/6+Crhu69tj
         j1Vhdt5oW5N4quVkMJBeNHhuXybeB/yJZYqS6OOuz72f5eoMr731sZnmGQu0gZf8a0rw
         ekNjCe7GdaxBYMrTxaEKCgX3rghsArMDUdJMU0nmfQSezWQ2T2DZoDuth5x/ImPRNCqV
         GJ5w==
X-Gm-Message-State: ABy/qLZ/zI4I2cJ/Q3aZK2aP/JLgVHVuNV1EZQxwTH+0z+H2AzDp1/Bc
	yPYtCZCiBlEUFdRM+J10H9Q=
X-Google-Smtp-Source: APBJJlHB1KcYkskKlpURTWN08zgBkNYbIAwRbI0Q1obdriMspy/hpRMxImPRal9DZCAZwqSMngMkPw==
X-Received: by 2002:a05:6808:219a:b0:3a2:a96d:19c3 with SMTP id be26-20020a056808219a00b003a2a96d19c3mr4406619oib.41.1690566198690;
        Fri, 28 Jul 2023 10:43:18 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id e14-20020a056808148e00b003a1e38362b7sm27519oiw.25.2023.07.28.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 10:43:18 -0700 (PDT)
Date: Fri, 28 Jul 2023 14:43:12 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZMP+MPdQ2IjJjFCE@alolivei-thinkpadt480s.gru.csb>
References: <ZKjeHx/zqrNIqaA6@alolivei-thinkpadt480s.gru.csb>
 <2023072729-sensitive-spyglass-ec96@gregkh>
 <ZMKDeyGaPQHm6/pr@alolivei-thinkpadt480s.gru.csb>
 <2023072741-mankind-ethics-b95b@gregkh>
 <ZMKkgItqf8r8BcRB@alolivei-thinkpadt480s.gru.csb>
 <2023072752-stem-pupil-76ab@gregkh>
 <ZMKrcvpu3b15Hdif@alolivei-thinkpadt480s.gru.csb>
 <2354895b-c127-40eb-8f16-b19e4750e1d0@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2354895b-c127-40eb-8f16-b19e4750e1d0@kadam.mountain>

On Fri, Jul 28, 2023 at 08:24:56AM +0300, Dan Carpenter wrote:
> On Thu, Jul 27, 2023 at 02:37:54PM -0300, Alexon Oliveira wrote:
> > > 
> > > I would have thought you would get a "line is too long" warning, that
> > > didn't happen?
> > $ pwd
> > /home/alolivei/git/kernels/staging
> > $ perl scripts/checkpatch.pl --strict -f drivers/staging/vme_user/vme_bridge.h | grep -i parenthesis
> > $ 
> > Nope. I didn't get any of that. Check it out:
> 
> Heh.  The warning is there but you used grep to remove it.
> 

I only used grep so as not to pollute my answer with too long
output, but you can validate the full output by running the following:

curl -ks https://people.redhat.com/alolivei/kernel/evidence

You'll see there's no warning related to this patch.
As I mentioned, there are other warnings that were already there before
I submitted the patch, and I didn't touch them (yet).

> Speaking of long lines.  Could you fix your email client to line wrap at
> 75 characters.
> 

ACK. Done.

> regards,
> dan carpenter
> 

Thank you.

Alexon Oliveira
