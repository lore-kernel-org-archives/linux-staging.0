Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B447C
	for <linux-staging@lists.linux.dev>; Tue,  1 Mar 2022 19:48:48 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 29so23261510ljv.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 11:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PzY8tILS7/J5BzJfiKLdBDXy8/s4RAHqODI+UdY57jc=;
        b=MSgmT6lRet0jPev3NhT8poLSNE2IuVKHhTmnMdindDPsxNrbDdzPrkBSaT4BauMeD+
         LWq3ALR2NImH9IAbyg/9Mpz0DLX1H3V94a1gLKACC1HvSqM9EwtH2Km4ZUYlkqLoZgsQ
         ZV7jqWBOB7cCGsim0JopuTtvt6tgng/ReKRwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PzY8tILS7/J5BzJfiKLdBDXy8/s4RAHqODI+UdY57jc=;
        b=OebM9F/orEZUZt60yObFmy3yGOB8Wleqz2LqWtup9AZzgItQ0ru8VvcPBZBjxx1e+z
         howtJOhO2Nu071S435pOonE9bh/jpk84X9DgpZ23QFGaBMVngFwuXukPcsJli2yxU2c6
         PqSA+lh6ubNUX5G7Upq5wZNRGvj4xYj2naLZD7HtE4h6pfFqQzmB1zOzLyS1uW17aTdv
         fglmbbw+GxH1AFpSXWtJjUOX/s159CS7anFGWHDTLT+NVm7dUiXNHq0c0TFJ9hzrliDn
         Eh8xQ+wer6OK4xQL+X4CrwlO3+xCxYegvEeDrOZFGV1chqLkrn50G6PItZj1nKKzpQgd
         jvPA==
X-Gm-Message-State: AOAM531ZRloLV1UN1KL/UpzcM2VmsxG6TKBq5UsaAyBIZWolPjMkgDs1
	Cw1KGswpZ32FgyOAP5S90Oxdbm78cDCTamUjFwQ=
X-Google-Smtp-Source: ABdhPJzI/BlcGXmgEB3Ljtcil/fXshPnRqb2Uj9xx6e0Pg1Ai1kUY0mEE9i3IW4TH+Sv5jm/Y9eRuA==
X-Received: by 2002:a2e:8045:0:b0:23a:ee87:6849 with SMTP id p5-20020a2e8045000000b0023aee876849mr18395107ljg.248.1646164126306;
        Tue, 01 Mar 2022 11:48:46 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id e7-20020ac24e07000000b00443970dc043sm1631496lfr.198.2022.03.01.11.48.45
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 11:48:46 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id g39so28630942lfv.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Mar 2022 11:48:45 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr17983151ljw.291.1646163763108; Tue, 01
 Mar 2022 11:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com> <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org> <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
In-Reply-To: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 11:42:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wghQygmASNUWj=LZn5FR5wsce2osyR6EXcfEB_FaX_6Og@mail.gmail.com>
Message-ID: <CAHk-=wghQygmASNUWj=LZn5FR5wsce2osyR6EXcfEB_FaX_6Og@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Mike Rapoport <rppt@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
	linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Cristiano Giuffrida <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net, 
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, 
	CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
	linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, 
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org, 
	kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com, 
	Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, v9fs-developer@lists.sourceforge.net, 
	linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org, 
	linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>, 
	tipc-discussion@lists.sourceforge.net, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>, 
	linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 11:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So instead of that simple "if (!entry)", we'd effectively have to
> continue to use something that still works with the old world order
> (ie that "if (list_entry_is_head())" model).

Just to prove my point about how this is painful, that doesn't work at all.

If the loop iterator at the end is NULL (good, in theory), we can't
use "list_entry_is_head()" to check whether we ended. We'd have to use
a new thing entirely, to handle the "list_for_each_entry() has the
old/new semantics" cases.

That's largely why I was pushing for the "let's make it impossible to
use the loop iterator at all outside the loop". It avoids the
confusing case, and the patches to move to that stricter semantic can
be merged independently (and before) doing the actual semantic change.

I'm not saying my suggested approach is wonderful either. Honestly,
it's painful that we have so nasty semantics for the end-of-loop case
for list_for_each_entry().

The minimal patch would clearly be to keep those broken semantics, and
just force everybody to use the list_entry_is_head() case. That's the
"we know we messed up, we are too lazy to fix it, we'll just work
around it and people need to be careful" approach.

And laziness is a virtue. But bad semantics are bad semantics. So it's
a question of balancing those two issues.

               Linus
