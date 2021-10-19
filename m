Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26C2C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 12:58:31 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so2615477pjb.5
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cRLj0dV+xybjU6BvJI/d2YVe/BL8SIs28mcM3ps/fT8=;
        b=R86cUnmkW5XYV20qN9VwZoUlESxhEQV5xEqlQfGbll3FizqrSnpSzmY5piDPRf8Ive
         EHxV4UTFDEC/igQ+DWpoflZiV3D0HFRa3l02JAWortJvDvg1q+bZ5Zz6w1/Gi4ioQWI1
         XB9jTB7ClFsSAuNSkrPwOIxrkA0z+d+vw7me8uqxdxBzlxuajlk2YQF+aU0Gj+a5DOFG
         URGyR5UXUogiUR3TrpWeU7sAC8Fq5ezPIVBgrnYY+NdhVaahMXRNrgpbgKZQSRY7sA0P
         MuXuy2yt5kWyG7Dt4CYt4enxG8xo4QjWocQZa0F/tIgwk1+l6GF53sqKU86ZvDBUKX72
         agpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cRLj0dV+xybjU6BvJI/d2YVe/BL8SIs28mcM3ps/fT8=;
        b=eY5NmowXgCMq6P2hRVcSc1owuOFJ+D9WaRizf2kP2Jbz/DtQwI3GHmSYnFH54CgEqI
         F12/i5qkIu7+VAaDkPe2tlTczcOC4KTfZvZFS60I/8IdlCOYHyswCUv5WwrYmPj2RH3n
         OqInAnU0fsUMMQiNMFRy1QAOijtEjuMYmFnYaJ9yWsmJVU8cBNJ8+5E+8RU/qAe8X2ZZ
         faDZDSxi9iBAEQzaTe0mhIJ8zCZQK22VtuMTQKMNrgzSPsM98ainrQ80CI/NTXkT+KiH
         ngJaLtgRrEqmuaLCSCJLtNUTvjZzEr76dvpcra60GNTB67YHP3Bus2hDdyFvcJpMtzms
         4iHw==
X-Gm-Message-State: AOAM531DzE4qdJ30G4g11NdqqBdJc2fF2/27AkpL7WvxdbhV+pxy+Hd5
	ZlK5N0QwntF+c2pGsDtmjrA=
X-Google-Smtp-Source: ABdhPJxKuD+xlD/uQj6A8Qk0A5EMuTkQopG7W58ylG30ezZKwhPIhzEqfw3ixqd1iGPc+yWIROJEbw==
X-Received: by 2002:a17:902:c94f:b0:13f:4b5:cddd with SMTP id i15-20020a170902c94f00b0013f04b5cdddmr32736918pla.58.1634648310972;
        Tue, 19 Oct 2021 05:58:30 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id qe17sm3305993pjb.39.2021.10.19.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 05:58:30 -0700 (PDT)
Message-ID: <919e6e09bf258b48dd8819ec43cd13ab48489aa7.camel@gmail.com>
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede
	 <hdegoede@redhat.com>
Cc: Patrik Gfeller <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann
 <arnd@arndb.de>, Kaixu Xia <kaixuxia@tencent.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Nable
 <nable.maininbox@googlemail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Date: Tue, 19 Oct 2021 21:58:20 +0900
In-Reply-To: <CAHp75VcuP4NTYYL6FreW-bdB549T1WNwty74PUFm+LYLeLkdhA@mail.gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
	 <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
	 <CAHp75VcuP4NTYYL6FreW-bdB549T1WNwty74PUFm+LYLeLkdhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 11:10 +0300, Andy Shevchenko wrote:
> On Mon, Oct 18, 2021 at 10:51 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > Just adding some folks to the Cc.
> 
> A hint to the newly added folks, there is an archive of the Linux
> kernel related emails located on lore.kernel.org. The quite famous
> distros already have in their repositories the `b4` tool that helps to
> access that archive. So, after installing that tool you may download
> the whole thread as a mailbox or as a bundle ready for `git am` just
> using the Message-ID value.

Ah sorry, I failed to add people to Cc who I should have definitly
added.

And I might have sent all of the emails to people who I should not
by blindly using `scripts/get_maintainer.pl` for the first bug report
with `--cc-cmd`.

Sorry if that's the case for some of you...

Regards,
Tsuchiya Yuto

