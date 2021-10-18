Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB782C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:10:49 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id d3so67382035edp.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ler5K+pi/RWyNTk3cRDoyW3msmkIcvt+niCNYs4vhI4=;
        b=j25VgagUB0XYzVEYEMPeJiO/TxQgx4vUjZ1vJzNTVYzzFxwNpZiHYbYIZcYCiKmY86
         dw4KLo07GDBDzw9E0ktxZ0tNoL4N/SX4LmArkhZRBhleZMXKofuyAoZrzrDV3xQhEUVV
         9Zt99t4HAWrrY5Goet+JLrN8RbxgU/S4Ch86gZT6lhTr65lyuTcHFZt5TdOPxUhGqs2f
         umFOeDIraJH9RwWWWPXJKpNdidiaP6tQ3FV9S4RpXwPpqTCYNyaD+mgun9Xe/K9U4xz3
         9UElWEdASnaELeZdpJ79gH4gFChkkRBSDsPF6QbnBe5VRbPK42v36XCgQcz8iJhWbT3Q
         x4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ler5K+pi/RWyNTk3cRDoyW3msmkIcvt+niCNYs4vhI4=;
        b=pmklmBxTnOhlmj0ewUe+KmeiPof+409gdis9igeYXPX7J/cl/OdW5VZvhRsZJjHlT6
         9Itf3dvijfAVCU3qsvo1hHLPiM9JZLwuLeGae1cmRUjhS+hWlsNBpUWSu5u7sz8EgDmE
         Vw2aRnzugrOvXC/yz/fEMEMJ4riYyI+8zFLblnUyhaAomfvsHqpmFni5vGuSZmcuGSUg
         xkKf3qm8xRfAtv/uhnV6QHewBWCLggtkw8KwK9AM5YL8o525g+NNWMtGWuMk5iC8Fstr
         usuya5+wg6+mqt3ot0nKXyLlynXYo5RjEScHpRym5Q7jqGDEyoV4xDetvY/3wuK2wS+I
         i30g==
X-Gm-Message-State: AOAM531FVbQRnoG1SoMnAmWj2ZMT0/v7+78e9L3gKKriTF8t4XeXhi3r
	0mJRLWoFDtgD8hoInwgxvTUjxAIgpaGY9u4adNc=
X-Google-Smtp-Source: ABdhPJy98YOgiwxqoJsGmmJSOytB8DDjqipDtrX/LGPiIMliZzf5JlHUV9Y9vtMJzLjKrx3epk62PT68fO06WMeJ7k4=
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr41868843ede.238.1634544648018;
 Mon, 18 Oct 2021 01:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017162337.44860-1-kitakar@gmail.com> <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
In-Reply-To: <2170cfdf-767f-969c-f241-4e61bfafd1f5@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 11:10:11 +0300
Message-ID: <CAHp75VcuP4NTYYL6FreW-bdB549T1WNwty74PUFm+LYLeLkdhA@mail.gmail.com>
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Patrik Gfeller <patrik.gfeller@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Kaixu Xia <kaixuxia@tencent.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nable <nable.maininbox@googlemail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 10:51 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Just adding some folks to the Cc.

A hint to the newly added folks, there is an archive of the Linux
kernel related emails located on lore.kernel.org. The quite famous
distros already have in their repositories the `b4` tool that helps to
access that archive. So, after installing that tool you may download
the whole thread as a mailbox or as a bundle ready for `git am` just
using the Message-ID value.

-- 
With Best Regards,
Andy Shevchenko
