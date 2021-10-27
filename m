Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C742C81
	for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 13:33:06 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id y17so2928309ilb.9
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
        b=DYJlq8deziZIZJjqh4x3V7jJEU6eO+sS5sDmopsCFiuS7lFXanCQKm7N0VRVGZlg6g
         onIelYweU690jMcik5iRC2TwHiHzAg7ona9I/tBh4bR9r6PTVG3y3R88wq0wvbA4ZmFA
         secTWT0tynWT0EMD5Q/u6K4Q+1uEDddm6/DHXTYIovSHWX4PJk8WLq3SQtNB7YKX6ScW
         LEGlCgLH4REMcno9uWkwRwU2/awOTKygiKVLSA0wbAAlgggE01wcuTPUnLR9inBRF8QH
         CYdFu/YGwFIlpCL0Titjt6e00yi5B9+i8jJxrbggP2QfS6BYQjGyIGbOK0pqzGHQzNPu
         7wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZXycHElx2PvePSgfI8q1PAKzVhVZLWU+GWvzXGtf+8=;
        b=MpAIobZCIYP4m0GNlxmGXRSLAW+CW9l1m9mnyqJqvqgRQWi+Q41Ttclqjz8VfKdyhd
         h3F/NKJh1HKQ3KNGAv8lDy9bQcJ1rz7TvnPVjqZdEYx53MdkxEiXRVvWX3qAGB6hcqP2
         3o6tSvJup4crhufq8s2fjtt8NWpkDWUmp3922C95iviPHrsAZXb6O89Xhhs61lufdfra
         ucBXNQ0qMcSPErlSIWjrKrhXw/VtKwcvIgdrypygosMI4oIqoQVnWUyTOm2B3oxpGqOW
         pD2M8n/bYPXtR4QZZJ3Gi3gocnDaWBlVun51FI2rpkSdD5DARngoIV0EcGANUkl60tNj
         pFeg==
X-Gm-Message-State: AOAM531UiiaHNEHSvvA3KI/CuGqGjeX8xDDgOjFTzuINlbWgdgosdP+F
	WACJGNTvfRbSsOaXL/92IgfJXeuE4qH9GY0Brcc=
X-Google-Smtp-Source: ABdhPJyQM7nv4/L/+ZrHrxaFQWe4enGNCZfglV+MKpcO6gFgxgurDRXlVA2+RN1ozDoYfDM5GaAxiy3o0wvCISrJVMk=
X-Received: by 2002:a92:d08a:: with SMTP id h10mr17035457ilh.321.1635341585283;
 Wed, 27 Oct 2021 06:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211027132732.3993279-1-arnd@kernel.org> <20211027132732.3993279-2-arnd@kernel.org>
In-Reply-To: <20211027132732.3993279-2-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Oct 2021 15:32:54 +0200
Message-ID: <CANiq72=fkx0BNz0oPuvVA_uEcE1BF92reKtsCbK1fv-fwx2yNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] fbdev: rework backlight dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jens Frederich <jfrederich@gmail.com>, Jon Nettleton <jon.nettleton@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Lars Poeschel <poeschel@lemonage.de>, 
	Robin van der Gracht <robin@protonic.nl>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 3:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> make any driver that needs it have a dependency on the class device
> being available, to prevent circular dependencies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
