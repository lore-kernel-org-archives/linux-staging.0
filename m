Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE52C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:07:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r18so12815267edv.12
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rM9NY4I7mI4nZ2MNkYcLXR3L+zVnN6b+7Y3yv0OyjZI=;
        b=jU+9M9H/0g1ULVbJGdo2l/3xkFN0Nw3awGK7GVs69EmuvxucviVjlpbYfTZiPmhSjX
         J8oEUeL2ECOGueqVQsPhvaHf0nGh7QwmEiCDax2o6KR2l4kuzBfoEHi9IJNGBOUhtY4j
         eWeD5uA7rdqIhaI6aw5qCStyW8KBwHbzbfsaE+pUuTGSdc2DwprA34a3tPHu7F50w1hj
         lewnCtupFvur2BnBBfJ6zjPI+4RH75XR5hNv0jBI6DrJ6sLnHPPCA4h6LQ2KfpfFljho
         zWrLIuqATP1eyKOMjxKTzZvKO8i/VbWPBIBhmPXZWs6NzK2D7QS1jSeFnIJ8+Aznq8KR
         px/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rM9NY4I7mI4nZ2MNkYcLXR3L+zVnN6b+7Y3yv0OyjZI=;
        b=ZLiQc8ccdeUF3aTe+/LVxUjp33aIubOG7ck853nDfc4KGONmPuFtDz1HOoq0oX+45g
         96NO9su0SxoP4S5dEm6I16P0Y2SVK59dc2VjNmUC/+jveDzvAHAWulWpULSqZkilSjtF
         FTiHrv1KxDKs78Cboi6lOXuqQrZaXn2S4ZzAdckP6mb7K7Q+onMwf3mEbG8Tzqo+jcxL
         S6WHsx1EFdyw62zxW83FxzBEV9qx7+l+38YlNb15eRp1W6kz0b67aWjLmcRKH40YKB3m
         YAQBSiYnBa6mZSbgDDJRGoLWkE2drIv9pwhCNDLSWdrY4Ug24v9qcg2I+VArubjQrbN9
         igJw==
X-Gm-Message-State: AOAM530ekPhpqCuND9laceQtA3ekAcANF28XXaMC+WAIa4GJyhWLobyu
	To7uTfk5Z3VvTFjz9DTYknQ=
X-Google-Smtp-Source: ABdhPJwk+lr2KfJQUZgHtsXDlQEGdz7dfEZ7RgZ7lOzpho2+46UC08mJDjnjDD8+qJtqdln77PZGhw==
X-Received: by 2002:a17:906:9414:: with SMTP id q20mr39051862ejx.241.1634648861058;
        Tue, 19 Oct 2021 06:07:41 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id r26sm10050317ejd.85.2021.10.19.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:07:40 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com
Cc: outreachy-kernel@googlegroups.com, forest@alittletooquiet.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
Date: Tue, 19 Oct 2021 15:07:38 +0200
Message-ID: <1647209.5AoB3rP6bQ@localhost.localdomain>
In-Reply-To: <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com>
References: <20211018150526.9718-1-karolinadrobnik@gmail.com> <84f3c940fedb961e6e7e88d47c3d15e598bc32c3.camel@perches.com> <810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Tuesday, October 19, 2021 12:59:56 PM CEST Karolina Drobnik wrote:
> Hi,
> 
> Thank you very much for your comments.
> 
> On Mon, 2021-10-18 at 17:12 +0200, Greg KH wrote:
> > Also, these are all just fine as-is for now.  A better way to make
> > these lines smaller is to use better variable and function names 
> > that are shorter and make sense :)
> 
> I have v2 ready but I'm not sure, given the Joe's patch, if my solution
> is a satisfactory one. I didn't jump on such refactoring as I'm still
> learning about the codebase/process and didn't want to muddle the
> waters (...more than I do already).
> 
> Greg, what would you prefer? Should I back up with my patch, pick
> something else and let Joe's patch be merged?
> 
> 
> Also, I have a question about the patch if that's ok :)
> 
> On Mon, 2021-10-18 at 22:56 -0700, Joe Perches wrote:
> > Maybe some refactoring like:
> > ---
> >  drivers/staging/vt6655/rf.c | 38
> > ++++++++++++++++++--------------------
> >  1 file changed, 18 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/rf.c
> > b/drivers/staging/vt6655/rf.c
> > index 0dae593c6944f..7beb0cd5a62df 100644
> > --- a/drivers/staging/vt6655/rf.c
> > +++ b/drivers/staging/vt6655/rf.c
> > @@ -680,16 +680,19 @@ bool RFvWriteWakeProgSyn(struct vnt_private
> > *priv, unsigned char byRFType,
> >                          u16 uChannel)
> >  {
> >         void __iomem *iobase = priv->PortOffset;
> > -       int   ii;
> > +       int i;
> > +       unsigned short idx = MISCFIFO_SYNDATA_IDX;
> >         unsigned char byInitCount = 0;
> >         unsigned char bySleepCount = 0;
> > +       const unsigned long *data;
> >  
> > +       uChannel--;
> >         VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
> 
> I see that you introduced `uChannel--` to further tidy up the lines
> with `[uChannel - 1]`. In general, is there anything wrong with
> indexing like `i - 1`? What's the preference here? DRY things up as
> much as possible?

Hi Karolina,

No, there is no problem in using a[i - 1]. Personally I prefer the former 
when 1 <= index <= ARRAY_SIZE(a). If you code "index = index -1;" or 
"index--;" (that is the same) and then you use 'index' many lines below that 
decrement in "a[index]" it may be not immediately clear that you are not 
indexing past the end of the array.

But this is not the point. You may still use Joe's style or leave it as 
"index -1". The point is that Joe is just showing you some different way that 
you can use to accomplish the task of "Fix line wrapping in rf.c file".

He put many different changes in one only single patch. Maybe that those kind 
of patch are permitted to developers who have gained so much trust that Greg 
doesn't need anymore to check "one {,logical} change at a time" (but still 
I'm not sure about it). 

I guess that if Linus T. or Greg K-H. want to put many different things in 
one big "Clean up rf.c" patch they can. This (yours) is not the case. If you 
decide to use one or more of the example Joe showed you you must be careful 
to split changes in a series of patch, according to the instructions you read 
in the Outreachy pages at kernelnewbies.org.

Joe is showing that you can shorten lines with several techniques...

1) renaming variables:
	("ii" => "i") and getting rid of hungarian notation ("bySomething" 
	=> "something");

2) contracting instructions: 
	"uChannel--" or "*data++" - for the latter take care of preceding
	rules or, better, use redundant parenthesis like in "*(data++)" to 
	facilitate readability and comprehensibility);

3) using temporary variables:
	"unsigned short idx = MISCFIFO_SYNDATA_IDX;" or "const unsigned
	long *data = dwAL2230InitTable;");

4) refactoring lines of code (e.g.,
	-               if (uChannel <= CB_MAX_CHANNEL_24G) {
	-                       for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii+
+)
	-                               MACvSetMISCFifo(priv, (unsigned
		short)(MISCFIFO_SYNDATA_IDX + ii),
		dwAL7230InitTable[ii]);
	-               } else {
	-                       for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii+
+)
	-                               MACvSetMISCFifo(priv, (unsigned
		short)(MISCFIFO_SYNDATA_IDX + ii),
		dwAL7230InitTableAMode[ii]);
	-               }
	+               data = (uChannel < CB_MAX_CHANNEL_24G) ?
	+                       dwAL7230InitTable :
		dwAL7230InitTableAMode;
	+               for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
	+                       MACvSetMISCFifo(priv, idx++, *data++);

5) something else that I'm missing and that you may easily notice :)

I prefer to state it again: if you choose to do such kind of works, be 
careful to split self-contained patches in a series and explain each change 
you make and why you make it. Each patch must do only one logical change.
Each patch of a series must be self-contained also in the sense that it must 
build without introducing errors or warnings at any point: for instance, five 
patches => five clean builds.

Thanks,

Fabio M. De Francesco

> 
> I'm asking because when I was reading this line, at first, it wasn't
> clear to me why we could decrement it (example though: "Was this
> modified earlier? Do we need to "correct" it?").
> 
> 
> Thanks,
> Karolina
> 
> 
> -- 
> You received this message because you are subscribed to the Google Groups 
"outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an 
email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/
outreachy-kernel/810a4e29b0c54520a30cae4d37fde0a59ea3d83b.camel%40gmail.com.
> 




