Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FC7A
	for <linux-staging@lists.linux.dev>; Tue,  1 Mar 2022 01:04:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bu29so24443847lfb.0
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 17:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
        b=avIYh8aQ2dDobwKAVUmxzj/7dS14/rGtEVGY0pMiaJUsHbP3qIU6kno3XMfBz/RlQM
         DBr9tOtZ8iqO/uKNwSujAwo9mle8zBl2HT1HDuvvvRH+Bqr8BYPzCJojUUOk2VYbR5wW
         hMzIeM3di7snjNNfrAaBZvtX47IfluwYB/RPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
        b=dMIpw/mY8B3cS+P1G+K3ONgVBVu4dz2JIdGhEgtFXIZDd3FimLxzVCCoespd+RpyEs
         HeNGk2cz95YBE6pqpve1qFOlaZXjfWJ6tec4j+Dxbpe7JRpGoOZy4lQ3EzvXtCddJkZc
         BIWrmio7SAfQmQFeco/AJlPXaG4vAA7Y90xPdlG+JFBGDMG3OKT3YgzIHf/eXUUwF6zu
         P8myTwjrdJObRtJUJjBtjxz1AYdugt32iMe4WpVeQwah5ccBu3eHSWofjqKHNoG4ORDS
         izt2kOib9bxX7AmNpdOsLZYPSX0ElP8hp6zq45NbBYAeLJnzvwXn2FXcbocMbmmo6JNp
         XcwQ==
X-Gm-Message-State: AOAM533LKbC4OBfqLOVA8dgbKyFu/BpM6iwqFEbaDmK+8Cc19w0ennW5
	YAbZqgJecGQmXkiav8WjnUM/Py5nCECOLCX/vII=
X-Google-Smtp-Source: ABdhPJyVAcf985sWbIqPY1Rhioc8OpVH2sXygwm2ti3SjsJz2v20+iZGzf7mYr58zarry/2eaOCaWQ==
X-Received: by 2002:ac2:539b:0:b0:443:db38:ac87 with SMTP id g27-20020ac2539b000000b00443db38ac87mr14607792lfh.247.1646096662885;
        Mon, 28 Feb 2022 17:04:22 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id q11-20020ac24a6b000000b004442220bb76sm1216405lfp.145.2022.02.28.17.04.22
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 17:04:22 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id v28so19761312ljv.9
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 17:04:22 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr14803965lfb.449.1646096282839; Mon, 28
 Feb 2022 16:58:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org> <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org> <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:57:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 4:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, except that's ugly beyond belief, plus it's literally not what
> we do in the kernel.

(Of course, I probably shouldn't have used 'min()' as an example,
because that is actually one of the few places where we do exactly
that, using our __UNIQUE_ID() macros. Exactly because people _have_
tried to do -Wshadow when doing W=2).

                 Linus
