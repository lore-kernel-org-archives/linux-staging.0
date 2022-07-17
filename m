Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A397A
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 07:02:03 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id l11so15597638ybu.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m2k/JR3F1DIpnnVtJSGtxlTMBCpRYAZf1oh0tWs8Csw=;
        b=Anlvgkcr3PBMA/4iJWZVfnHLySKkbvnlcoSLef0QtwPCUVZ0oByx6slzVKSNgQe2tP
         wRhFYGEVc9a3gPzGq4dkgszzMzpRh00OOWsgdv2walxOMJNLf4MLzqHiR4fRPtEevIBd
         mREq77SrkC/UNse+s98bOpM0BUuQVLY3oY4AMXB0Tm8v4j1pPucX15n5/kRhn0dFNcYq
         8KaG28Z2tAK3gGcebnC7owpeFgANVMgbtgofxU4AAZnRDPNMeaQu1x5Zm1E/g72tsiEp
         rsPUHBtYrBzWf4f6aNs44t3Bh3iclK9vjusFy4WEEA9xRg4smWR7BstBtLqYIxNssOAe
         N6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2k/JR3F1DIpnnVtJSGtxlTMBCpRYAZf1oh0tWs8Csw=;
        b=jS1KiVsVIGuAeKFfC3Lqrk7Y8sSdTOo2XQObdvdRBBNRsTIchK4eEOXmJBiIiBLNtp
         eW5p/gj/SwPctkT/p0s8Nsa/5yJZ784e1a4RwGspawcl+4KOqF024PJ4+7ZTF2IAJHpf
         G011wJjBo9RNB1dLF+7LgEU1mWIudBLvg/lgqgh9qtjK5gmYx4yRiBRNhN5yvy1jq9KE
         Q4Gp0vvAAbDTCuY0WntoSDD/j9CtWuGm1wnqH0zonhg5wYD8SKdaZtCHuGul6gaNtLhK
         QIqc3e+T3gjsoUj3v+wENfZ3uXPxzKWjMN+HMjOTwo+2/OTGiYudsZS9zsW6TP7vZLeY
         P15w==
X-Gm-Message-State: AJIora+lFI2aFqlc8ORbMkXel7NcUlLzb8Ejw2xXfxLPJqg1Xb03Y3NG
	9372Sdianf5+CoBqZLvU2bfHYjkSSvp+ZPdNCUs=
X-Google-Smtp-Source: AGRyM1sjplFK40itoMhjbZy2q+kcddH0mWzHjzm+zj6pO77K0jQjxh5kI8a3vwLcdZf4+SGyoUJ65JHt7y9rekNQdUs=
X-Received: by 2002:a05:6902:140d:b0:66e:ba97:77f6 with SMTP id
 z13-20020a056902140d00b0066eba9777f6mr22419233ybu.38.1658041322151; Sun, 17
 Jul 2022 00:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMhUBjmX0BDh-35GQxf3-fXFa8_EKfh2fwYKZDgH4NzGGQHiSg@mail.gmail.com>
In-Reply-To: <CAMhUBjmX0BDh-35GQxf3-fXFa8_EKfh2fwYKZDgH4NzGGQHiSg@mail.gmail.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Sun, 17 Jul 2022 00:01:51 -0700
Message-ID: <CAA5qM4B5NAGH1ewpo_cAStYj8cD4bKpcTingQiaGcF2sCo9cKQ@mail.gmail.com>
Subject: Re: [BUG] staging: rtl8192u: Found a bug when removing the module
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 5:16 AM Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> Hello,
>
> I found a bug in the rtl8192u module.
>
> When removing the module, I got the following warning:
>
> [   20.407360] remove_proc_entry: removing non-empty directory
> 'net/rtl819xU', leaking at least 'wlan0'
> [   20.408609] WARNING: CPU: 4 PID: 451 at fs/proc/generic.c:718
> remove_proc_entry+0x2e1/0x3e0
> [   20.412316] RIP: 0010:remove_proc_entry+0x2e1/0x3e0
> [   20.420050] Call Trace:
> [   20.421178]  rtl8192_usb_module_exit+0x4a/0x63 [r8192u_usb]
>
> I think the problem is the misuse of the proc entry, but I'm not
> familiar with the driver, so I'm reporting the bug to you.
>
> regards,
>
> Zheyu Ma

Thanks for reporting. Looks like wlan0 is renamed to something else
later after proc fs files are created.
Could you test the following patch?
Thanks!
- Tong
