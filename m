Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6F17AAF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 13:21:46 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-56368c40e8eso571081eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689254505; x=1691846505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
        b=eshePJRxBGfoEbxv/HATy/LbMrzsCDpyAiPdPWKP2+7M1zJL3N5KwDGRakUw3RzP4p
         q0Cnwz0fdaQ+HyxVhl+a/PdVIYgV40UvVYeo6oku2ew3IT0bTt6UYAHjOIS6Vb6t9Mla
         Zj8EL/FlPFPvHB5g71aE7gFP3zFqlG9d7Fbu8m/nhV/T9INJD8alH0sgU2iXPleyzim5
         lINS3JcD7J0TOIOFW4pf/x8/SEpIIASy3dTyyqXfKshxdSJS0TlF/u7bPTHA+oWf2AYl
         SPCY6gZL7ykEOqi+bfIKlTKf4FRPiV/L6IcHOgev/4QAZK/gwKYWQ5RBFTfBsMThGpXg
         EmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254505; x=1691846505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMl5dn5Xz12gXOMX3oC+kNdFlWhzCPfH45LFdGwDg+c=;
        b=Y/AEjlxb5Cjeofemuqbmpl8K8QJcWxyFOtC0cV7qJt6u74WYn6HAYHAKJXse2E5Qfy
         NCAGnZAnNsgoeitmv5h3WpvHxqcyu0QJunKbZfj/NXqXM0lOzmkB0E6TGFeL1d/jHfOl
         mz92TCHqKdAViVzrU+0QRGkHo2+vfOtzhUW12Rm7rwY2DntEVnlnxrk5vUcA76J3RGqu
         LsO4CKVAghaolx480+hRk13CuU90hlLbL4QWQTrJC5gc9ur/4H182IcXMbQXehjgqYE3
         MnthhxAs3l3QqOESUYyHbPRYt9LTYZAEVGzu2jOQF9962hHkPgmUmJYsOlib1EtndOTW
         aSDw==
X-Gm-Message-State: ABy/qLbmgHrTTYjjmoL9zcojK+wnu6sHDDGlvsjdmdv0QSdrVRIqd8wS
	1ha0BvFdU/OUrKC92FfN5Z1OheaYcWJdCnd0Ix8=
X-Google-Smtp-Source: APBJJlG+0WtfiM+r2sXZzO6HNFK4R91MA9ooy29hXDBdzlOr5q/1lWHuWptQzwph8RqHPwzWZYnIoYS2ozC9kDF6TM8=
X-Received: by 2002:a05:6358:428e:b0:135:5934:2bba with SMTP id
 s14-20020a056358428e00b0013559342bbamr2356344rwc.8.1689254505432; Thu, 13 Jul
 2023 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230713130338.31086-1-tzimmermann@suse.de> <20230713130338.31086-19-tzimmermann@suse.de>
In-Reply-To: <20230713130338.31086-19-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Jul 2023 15:21:34 +0200
Message-ID: <CANiq72mbLmMKph8aiz4apNF9n3MtVO-nhM9rEWYApZbSVAO9Qw@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] fbdev: Document that framebuffer_alloc() returns
 zero'ed data
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 3:03=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Most fbdev drivers depend on framebuffer_alloc() to initialize the
> allocated memory to 0. Document this guarantee.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>

Thanks for sending this! Maybe this would be best earlier in the
series, so that later patches make more sense (since they use the
guarantee), but it is not a big deal.

> + * aligned to sizeof(long). Both, the instance of struct fb_info and
> + * the driver private data, are cleared to zero.

I think both commas may be best omitted (but I am not a native speaker).

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
