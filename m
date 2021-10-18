Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2662C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 18:18:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r18so2702513edv.12
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+YBLmXj85kbpmtk6BSnvpxwUKQkX+S8XZPPja9Re74=;
        b=HODlOhu5Jf5oet6rXvGG0Tp+6lBcX0I8UzvD5SSAFTV5Wc5Ai4hvXGemh5kHJ8sI6A
         vfNn3biouY0+TVx/VB3wnzyic0h+25Yf1cAIvmp65iw3G+JetAWIq1epUH/VNpk/x1xF
         JBjNQniXj4e8o+mpJsaI+i7orbNj5tCEJbM+309tWoOzGgRzHRK/KbZhq5B2YRyW2FIB
         SftzUQ2TBUU9FyS4lT13gWwO+M2w355v2aIHmTQlQSa3bEEGRpqCP6r+0ry7Mrzr9Et1
         OUckvM7yF3LyZPvnKw+jG8NJ8JmRJ71q8LzAstLJC0J/KUxCi115eGC5A2P2igK6FvnZ
         NqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+YBLmXj85kbpmtk6BSnvpxwUKQkX+S8XZPPja9Re74=;
        b=5D8ziByxxLRNia9O4TYPUOLbjGGLZ6uDfe6xA3VXTGKVPFCF/GMM5vtrhKnivxc4SX
         ouOjIqbUbAfTj5Sny3VtuvNotBcsuHeAW24alNirDD1rwUtfbMc6OVojB0Gv/woF5qZy
         u+Fcj9AbZ6WBhTPlFYi63dpclDSZYAKnixPl6KiIo6HrPXfKIx2KhGBBrLczjR1jLrRG
         Ut7Jbf2fUWDsRoXXIlf77UVbNDvFNAfGccNQbHZwpJ70GcmfupApQco2Rn09J9GOEZLj
         lXT+m6AcykRXTv9W6SaGbLO7BH3jp8Tqflpyr/u1WLfFUPGT/f5MHb1/OsxrhSflmz5S
         3eEQ==
X-Gm-Message-State: AOAM532Kp38bFWxY4oG9FCbDs/WaDgbcGcfUNS+c9IiZ+zxl5451FIX/
	NOrKtFCyLJ5JEBjVMaXDrRM=
X-Google-Smtp-Source: ABdhPJzzka2RFMjMegJAxLXRoQWsPnNlqfrjIOkYceS8/+Kj2Jz4C0+3gVYMzAVimFgySYBcaM3+Hg==
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr43944932edd.276.1634581135656;
        Mon, 18 Oct 2021 11:18:55 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p10sm9390289ejf.45.2021.10.18.11.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:18:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com, kushalkothari2850@gmail.com
Cc: teddy.wang@siliconmotion.com, mike.rapoport@gmail.com, Kushal Kothari <kushalkothari285@gmail.com>, Kushal Kothari <kushalkothari285@gmail.com>, linux-staging@lists.linux.dev, Karolina Drobnik <karolinadrobnik@gmail.com>, julia.lawall@inria.fr
Subject: Re: [Outreachy kernel] [PATCH] staging: sm750fb: make pointers in array const
Date: Mon, 18 Oct 2021 20:18:53 +0200
Message-ID: <2371688.97nOaecjje@localhost.localdomain>
In-Reply-To: <163460335.XzdQGyDEVH@localhost.localdomain>
References: <20211018164431.26462-1-kushalkothari285@gmail.com> <163460335.XzdQGyDEVH@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Monday, October 18, 2021 6:54:34 PM CEST Fabio M. De Francesco wrote:
> On Monday, October 18, 2021 6:44:31 PM CEST Kushal Kothari wrote:
> > Change the parameters of functions from const char *g_fbmode[] to
> > const char * const g_fbmode[]. This additional const is needed to
> > allow us to fix  checkpatch warning, as well as being good
> > programming practice.
> > 
> > For the checkpatch warnings, if we have a set of command line
> > args that we want to check defined as:
> > 	static const char * g_fbmode[] = {NULL, NULL};
> > 
> > checkpatch will complain:
> > 	WARNING: static const char * array should probably be static 
const 
> char * const
> > 
> > Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/
> sm750.c
> > index dbd1159a2ef0..3d9b4b0efcb1 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -33,7 +33,7 @@
> >  static int g_hwcursor = 1;
> >  static int g_noaccel;
> >  static int g_nomtrr;
> > -static const char *g_fbmode[] = {NULL, NULL};
> > +static const char * const g_fbmode[] = {NULL, NULL};
> 
> You have introduced a logical change (g_fbmode[] entries cannot be assigned 
> any more) and a build error (because there is code somewhere that assigns 
> values to those slots).
> 
> Please, build the code after you've changed it.
> 
> Thanks,
> 
> Fabio

Hi Kushal,

As I wrote your patch has errors, however, if it had no errors it could not 
be taken in any case. I just noticed that you forgot to CC linux-
staging@lists.linux.dev. 

Some days ago, Greg Kroah-Hartman wrote clearly that he cannot take patches 
that are not submitted to linux-staging. 

The "Submit patches" section of https://kernelnewbies.org/Outreachyfirstpatch 
is a bit misleading. However, Karolina Drobnik is taking care to rework it.

For the moment, please use the following command (or some smart variation of 
it) to get a list with _all_ the people and mailing lists you should send 
your patches to:

kernel_source_dir@localhost:~ # perl scripts/get_maintainer.pl --separator , 
--norolestats -f drivers/staging/sm750fb/

The output is:

Sudip Mukherjee <sudipm.mukherjee@gmail.com>,Teddy Wang 
<teddy.wang@siliconmotion.com>,Greg Kroah-Hartman 
<gregkh@linuxfoundation.org>,linux-fbdev@vger.kernel.org,linux-
staging@lists.linux.dev,linux-kernel@vger.kernel.org

Thanks,

Fabio

P.S.: @Karolina, please correct me if I wrote something that is wrong and 
that contradicts the new text you are working on.




