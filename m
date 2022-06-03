Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143EE1367
	for <linux-staging@lists.linux.dev>; Fri,  3 Jun 2022 18:08:05 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id n28so11167412edb.9
        for <linux-staging@lists.linux.dev>; Fri, 03 Jun 2022 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=muCBX2nbY4JefuazIeJqH+g1xi4+aaCLBHsL/DP3IYQ=;
        b=Rk1wiLnkm7bKruoU+LkxDS87UBjnoVo/LWHWe/rikK54eH4YIPHiJ9Xx7eYgCndMI4
         76FTZBVbstv0lLj1no8pSDX4z8uicoyPVsuLPPfUfoOv2fPMOUiq+u9H203bdj+f/eni
         OZkDR6/N3Qp6Cso/x5hNTjYH3zg1f2opnZS8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=muCBX2nbY4JefuazIeJqH+g1xi4+aaCLBHsL/DP3IYQ=;
        b=jYoOmNv1PTglg4PTZUXVmZT9vz4OB0GRGyduLfAuWKXOlhptBNImjaYWps3VWi93P9
         t9XOjouaxCmVwy6qAAv6LcwAYrirXAaEzN0IuQ9aFjn1fni/3M50MAl3ZgH3rt/NjPnm
         r7wmYfUmMazjBQs90ZsGUhGRO6pIRAYh4vhNz2IETGnnXi/YPr9urIv193bKDvZaGtCr
         X/DPu5eg0EqVDrXKWGfD1spX9ZtETJV2/3n6u/vKffEQkN+YEaiSOYnr8HXe2BIhAF4q
         JCLC1HkLq+XDeujH1yrmy2HwjpGbAWCvHEVYIAEtXHVDEYVcXZgVQNhOt10Wvs+r/4Jw
         6qCQ==
X-Gm-Message-State: AOAM531rKbvE+0m5/JTUz583+Jg17YJRELhMvNu7tujLe8QdAqwokjzR
	DIUmZMR5uKtCM0Afyl9Uefcag7DUFPk/yp2FejQ=
X-Google-Smtp-Source: ABdhPJwb0fS46vb1gQfTYWP1akKZEaLhUjI6uHXeVZbvkVrEA831ZIkmAPq8JjPyl8RDg8A2/mwvWw==
X-Received: by 2002:a05:6402:1713:b0:42d:cb5e:d799 with SMTP id y19-20020a056402171300b0042dcb5ed799mr12263655edu.34.1654279683822;
        Fri, 03 Jun 2022 11:08:03 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id rl7-20020a170907216700b006f3ef214e27sm3110346ejb.141.2022.06.03.11.08.02
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 11:08:03 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id q7so11369799wrg.5
        for <linux-staging@lists.linux.dev>; Fri, 03 Jun 2022 11:08:02 -0700 (PDT)
X-Received: by 2002:a05:6000:16c4:b0:20f:cd5d:4797 with SMTP id
 h4-20020a05600016c400b0020fcd5d4797mr9325145wrf.193.1654279682232; Fri, 03
 Jun 2022 11:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ypng29bf0vGJ20fo@kroah.com>
In-Reply-To: <Ypng29bf0vGJ20fo@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Jun 2022 11:07:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTkU15iuSVrue_tRhD7=9v2YatrnFNxg=wEpT9-Szd4w@mail.gmail.com>
Message-ID: <CAHk-=wjTkU15iuSVrue_tRhD7=9v2YatrnFNxg=wEpT9-Szd4w@mail.gmail.com>
Subject: Re: [GIT PULL] Staging driver updates for 5.19-rc1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 3, 2022 at 3:22 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Note, you will have a merge conflict in the
> drivers/net/wireless/silabs/wfx/sta.c file, please just take the change
> that came in from the wifi tree.  We thought as I had pulled the same
> merge point from the wifi developers this type of conflict wouldn't have
> happened, but for some reason git flags it as something to pay attention
> to and couldn't resolve it itself.

That "some reason" is because the networking tree made other changes
to the file since (ie commit 2c33360bce6a: "wfx: use container_of() to
get vif").

So both branches had done the same change (the merge), but one branch
had then done other changes on top of that same change.

Broken SCM thinking then thinks that means that "oh, then we obviously
have to take the extra change" (eg darcs "patch algebra"), and make
that the basis of their resolution strategy. It's not actually a valid
model, because it just assumes that the additional patches were right.
Maybe there was a _reason_ that extra patch wasn't done in the other
branch? The extra patch might have been due to particular issues in
that branch, you can't just make the darcs assumption of reordering
patches and taking some union of them (which is an over-simplification
of the patch algebra rules).

Now, that's not to say that git can't get things wrong too when
resolving things. But at least it doesn't make some fundamental
mistake like that.

The git rules are basically that it will resolve changes that aren't
overlapping, using the traditional 3-way model (it then has that whole
"recursion and rename detection" thing, but that's more of a
higher-level metadata thing separate from the actual code merge).

So git doesn't assume any "semantics" to the changes. If it sees that
two branches changed the same code in different ways, git will go
"this is a conflict", and leave it to human (or scripted)
intervention.

Again, it's not that the git model is always right - you can obviously
have changes that do *not* overlap at all, but still have a very
fundamental semantic conflict, and git will happily merge those things
and think it is all good.

So the git model is basically practical and straightforward (also
"stupid", but in a good way - do the common truly obvious 3-way
merges, don't try to do anything clever when that fails). There's no
"theory" behind it that might turn out to be completely wrong.

Anyway, the conflict was trivial, but I thought I'd just explain both
the immediate "why did it conflict" _and_ the more abstract "why did
git make that choice".

                     Linus
