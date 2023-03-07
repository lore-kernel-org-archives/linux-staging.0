Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609822577;
	Tue,  7 Mar 2023 08:14:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cw28so48975210edb.5;
        Tue, 07 Mar 2023 00:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678176859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pr+26vzgDeJLqQAilu40dzjhbxI+5AdQEIXA0XhigQ4=;
        b=I40usB2+N6+NwnCF8DcVqyFjns5MSIbiMdgHHJjiRu6kZIbAmwQmv4RYdcx+dAS97T
         hP0UPRRUB0mdPsF6x+tukcJ7ptBXN4DBVk5iJQf5MTSjZf/O9aM1hjLokwfoMV0ana73
         zstvzYMro2PYHN3hxpUWRl5SoxJ4dHG0B3ugTZSHFCVI/GiFV+aVK1gw8/jCUHm/DcLj
         P+blCXHyd187Vt0W4+VKH5OfcF2uUS6CNfbeCafquLFIrXgxybt6VcC52RB0m4KAdzlr
         hJWEozAScLCnpDXw0DGATMX4ngvvN07k8WOmXbCgyfDDHrKF6Qqh4bn0k1QTd4+nrxyY
         rMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+26vzgDeJLqQAilu40dzjhbxI+5AdQEIXA0XhigQ4=;
        b=bGmdr+i/RVBd4S91G4rhYaPR7tbNRYGFtPXgoI6ko6ATdHO2XxtK8M1CIFo+B92HnP
         gsXw4PXL+MSnoXhHG4MRZ5wcmhZMMu34CBmq7VXlzKpcKcbL0d4/lXlzh1fu2dRsaauj
         5C6wS74A1C9Y81+7UAfhIAfJY9H6rc86XPKYlalkbutOH4DsLsQL5TU2Q/0XP6VTPuTt
         4U6I+QKbKRbXZt4imtIV35cSsxdDKE5r7MHSGQfauTOASWL5fqPYwsUTZa03XQQ6i1ZW
         3FrZ8veUAvtDKXHXv9mB0z6mlhCydbLBKX3QHz3Nl2/hcbM76xtrO2lT/CFES6TZcjS2
         2GgA==
X-Gm-Message-State: AO0yUKUk1VPNJgk6yCMi4SkVWlp0ZYMhuyIUyl5vLAO5KTaiOaWfyr5S
	Dh5sYO+wKq4rZL5EpeZCtA16vKXRpZk=
X-Google-Smtp-Source: AK7set9LaU77Vnz/a360K5BNHzMQ6d+5u3gkBAh7Qemwh4uPH0gs17KtV+U0lChgGtgbfwmmDXvDfA==
X-Received: by 2002:a17:906:328c:b0:87d:eff1:acc8 with SMTP id 12-20020a170906328c00b0087deff1acc8mr13535611ejw.48.1678176859560;
        Tue, 07 Mar 2023 00:14:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b008ef42f9cf48sm5660380ejd.82.2023.03.07.00.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 00:14:19 -0800 (PST)
Date: Tue, 7 Mar 2023 11:14:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Khadija <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
Message-ID: <2daec4ed-9553-466f-ac42-315545b9b0be@kili.mountain>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
 <alpine.DEB.2.22.394.2303062202500.3050@hadrien>
 <CACcTnM5GR0ZM5WBaL+BDEK_0QJGr6h2t4tnsnjerHta_nq6Tmg@mail.gmail.com>
 <ab0fd80-22c-d982-2f4-6fa5f43f858@inria.fr>
 <78d1ea82-ef18-42b2-8a8e-27ee3c7ad55f@kili.mountain>
 <aebfe9ab-3fec-d718-6e7-1cddac2b20a4@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aebfe9ab-3fec-d718-6e7-1cddac2b20a4@inria.fr>

On Tue, Mar 07, 2023 at 09:07:37AM +0100, Julia Lawall wrote:
> 
> 
> On Tue, 7 Mar 2023, Dan Carpenter wrote:
> 
> > On Tue, Mar 07, 2023 at 08:49:55AM +0100, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 7 Mar 2023, Khadija wrote:
> > >
> > > > Hey Julia! Thank you for the feedback. I will make the following changes and
> > > > resend the patch:
> > > > 1. Correct the patch description that is right under the subject line (make
> > > > it precise and imperative) and make sure that it does not have more than 70
> > > > characters per line.
> > > > 2. Adjust all the arguments of wait_event_interruptible_timeout so that they
> > > > are lined up. All of them should begin right under ( .
> > >
> > > The problem here is that the ( is really far to the right.  My opinion is
> > > that the position of the second argument (ie the first one that is on a
> > > line of its own) is ok in this case.  So you can leave that one where it
> > > is and line up the other one.
> > >
> >
> > I kind of like lining things up like this.  I think if you can't align
> > things with the parens, then it's nice to at least use two tabs.  It's
> > not kernel style or anyone's style explicitly, but I kind of like it.
> >
> > It doesn't make checkpatch happy.
> >
> > I guess I probably wouldn't bother sending this patch.  To controversial.
> > I'd just move on to something else.  It's not like there is a shortage
> > of stuff to do.  One idea in this file is that you could use
> > sysfs_emit() in sysfs_read() and get rid of char tmp[32]; buffer.
> 
> Dan, the problem is not that the argument is to the left of the (
> 
> The problem is that the last argument is indented exactly as though it
> were an argument of the second argument.  But it's not.  You have to count
> the parentheses to see that.  It's very misleading.
> 

True.  I get that.  I guess any change which fixes that is worth
applying.

regards,
dan carpenter

