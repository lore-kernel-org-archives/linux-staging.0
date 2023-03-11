Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46627B;
	Sat, 11 Mar 2023 09:21:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g3so7158618wri.6;
        Sat, 11 Mar 2023 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678526482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UEFJUf/50XPFbZEbBNrHNelwsNaADqXuPbC30RmvYQ=;
        b=g/ZsSoibFZdSKaHfzXOViB3vtB61x6tuHDtI9yXxIdNkrPofn4FGnLgiHOybo8L0sy
         mceXXWdzVsgBjjNs8ben4OHGwaF5xMgctEC1JA0MAhRA7345mHy2CzGZNWzLBaoft9yi
         nYhUI+dAFek2sLzyDv56pfweGsN7Bvbgk13oxUqMiijhEJ1+IqpF7XKkIAhjkPdGHo3R
         rk77YIk3/t7IXwOEsB12xD04NIzuQ1aRrTWhPVNNyAapShlSUThLMigGNhhcthij/ddL
         aoy8QniqhC/cQm9/aAcORfuTzv/y8JHA0LpAJjCQeW8nOmnSz+7+aih/YddoqfrQQBE6
         Mmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678526482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UEFJUf/50XPFbZEbBNrHNelwsNaADqXuPbC30RmvYQ=;
        b=UJW/z2iDaU9KJES9S7DH/8TPG5adgv+YGiuYA+3khRu33LokaFiRtPOHHLJqDO/Nae
         Txlt3S8oVEfb1MOSZoVnQCWOl6QjR9Sa5ZbwkDit2wvuoGWqGQl17zJr4fot18MjrWVz
         QWUEcNd36Y8VP3eHFN6O6R29qGpdfwZwIshVbrXs6j2I0XIVQGXA6K1jpw6RuBZDwFen
         2EqR2DgZDHPWx+QyhiaiIApdf4MfotBMTSwS+GPi8ymsb6HIxVFSrG5jqNAfom4x86rR
         Hr3KrIdXokD1vCMFQX6oY4UBH30F8goTY09/iYXiSqyHtXAowajyl7QTkX1fty3jruxD
         IRdw==
X-Gm-Message-State: AO0yUKWB06+4gMzj2hSc1tnIfqLw7oWJZIIsxni0ZuzHn2hztthwJDX7
	IaFxm7Mm70Ig7HmTxEzQds0=
X-Google-Smtp-Source: AK7set+t2FM614grpTygcTYixhja40uodoYHqbuI6lhG5n5TuBSgKsfYCR87cgp1yI6dgos0nf7FJg==
X-Received: by 2002:a5d:5447:0:b0:2c7:a55:bef2 with SMTP id w7-20020a5d5447000000b002c70a55bef2mr15780331wrv.46.1678526481777;
        Sat, 11 Mar 2023 01:21:21 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id a14-20020adffb8e000000b002c561805a4csm1974358wrr.45.2023.03.11.01.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 01:21:21 -0800 (PST)
Date: Sat, 11 Mar 2023 14:21:18 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <ZAxIDlfL/+n4Pkyo@khadija-virtual-machine>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
 <alpine.DEB.2.22.394.2303062202500.3050@hadrien>
 <CACcTnM5GR0ZM5WBaL+BDEK_0QJGr6h2t4tnsnjerHta_nq6Tmg@mail.gmail.com>
 <ab0fd80-22c-d982-2f4-6fa5f43f858@inria.fr>
 <CACcTnM4OHFiGrEez6dMzd4jO4YuQZzqpUK86UBMzhd+nFDWezA@mail.gmail.com>
 <e06f57e6-2a3a-7fde-742d-9d5dd8dd49b0@inria.fr>
 <ZAtUVBbyMw7ine2e@khadija-virtual-machine>
 <alpine.DEB.2.22.394.2303110954590.2802@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303110954590.2802@hadrien>

On Sat, Mar 11, 2023 at 09:56:06AM +0100, Julia Lawall wrote:
> 
> 
> On Fri, 10 Mar 2023, Khadija Kamran wrote:
> 
> > On Tue, Mar 07, 2023 at 09:13:49AM +0100, Julia Lawall wrote:
> > > There are actually two similar issues in axis-fifo.c.  You could fix them
> > > both at once.
> >
> > Hey Julia!
> > I have a question. Should I send the two fixes as a patchset of two
> > patches, and should I send it as [PATCH v2]?
> > Thank you.
> 
> The two issues in axis-fifo.c are very similar.  They could be in a single
> patch.  And that patch could be the v2 of your previous patch.  Just note
> that you have fixed another instance of the same problem in the message
> under the ---.
> 
> julia

Thank you Julia!
I am sorry about sending another patch before this one got fixed. I
misundertood and wrongly assumed that someone else had fixed it already.
Sorry about the confusion.
