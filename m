Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5737A;
	Tue,  5 Apr 2022 16:05:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id k21so24102124lfe.4;
        Tue, 05 Apr 2022 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxSv5eyrtE6/qWHKkufe6DV14I2zyM0F7tIcd5vnzO8=;
        b=LeSkYYoDEJNjK8zq0EOP89Hkk3DbuFfJjbUe5+KLYHcUT4m19pDvjujdRTwJ+6G4vB
         8p1DyoVoOyCzKK3e/fxJLLSuxoeIJ8iil2Mcxo3v7StseqwcNFxnHznLz2EhZ1OEYZk9
         /bao3mzDfMSstuCORSfk6Ns0RNTJK0oI9xZbHSil0JJNNqKPU5oidmvsCRPfhXYRRWNj
         ++/rV4cmjyMXE9sqTGedA+0gd2DWodeIB/5zBK/deEpCSPnil+9uYYZi0kVhrhEC3lTn
         eeA/dRf2fw8q6xdthG821zr9lo/+J4Mh/ioMv5Wz6HlDvhXTCgLhQJpWTPo5Aqs4xtts
         k/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxSv5eyrtE6/qWHKkufe6DV14I2zyM0F7tIcd5vnzO8=;
        b=tcgyKvBwO/XOEjPJo5Jec8bRRubc6YL25P8C/3MhDJvMpmr66e0cgj8b1eQgJ/UGAR
         7MhjnwFIy+1KOURe/eJRM8N/mEIlH1pjBXMmT9ADzuHWWBCaAny73rtbkKazLxHqkK+Y
         GIz2HZc5/QEm4SOXtc6Me+QNuZTI/DNm0ryF20HOj7MVuaBrfK0x0vsCyVknayu+cdgW
         dq6at9JkHIy+bCTfWR5dmlVwmfLmsUP8m2d2NyVY/EIjkn66xYU+VcFVRvuLyE5maKRN
         km5sPQsiXPgb4utQMi4sdtCxZZQ73O59rFfyt1UqZ3FmCzMAheDAVchAF1EEDkUCQSsW
         Ptzw==
X-Gm-Message-State: AOAM530WmLJo3GnYEWTQU20IURT3f9a4qsgdbnRot0z/dyWMangHJPCS
	oPnEYS8icjUR8+vHKwkj7w916ozcC7Q3awrxZzY=
X-Google-Smtp-Source: ABdhPJzz/ro4Lc6Ay7slYv/xbuptHLjWeC6GRfWxUOV/UMs/OUe1EaXf8ASQ22RGz1VdFmZ7e0Do10pbasFb0tTipmQ=
X-Received: by 2002:a05:6512:3fa0:b0:44a:f66c:8365 with SMTP id
 x32-20020a0565123fa000b0044af66c8365mr3181106lfa.152.1649174734013; Tue, 05
 Apr 2022 09:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220405150912.GA625670@euclid> <YkxdasBGZ3m2Yu66@kroah.com>
 <CAMWRUK7c-hqiz+KEFkqBuvu1syCwSnF4UZzbkPFw-VWABm9qOw@mail.gmail.com>
 <CAMWRUK7Jgs3evt3bC0pnRkbRw3CS1XCULPi8NzjgGh7aLTFKCQ@mail.gmail.com> <YkxnJvJyo75c/3yk@kroah.com>
In-Reply-To: <YkxnJvJyo75c/3yk@kroah.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Tue, 5 Apr 2022 12:05:22 -0400
Message-ID: <CAMWRUK6Hamw9bg8-O+xqP0DKy=zcbXHaG4RQtqXo3keFj=KJyA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix indentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy linux kernel <outreachy@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 11:58 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 05, 2022 at 11:45:29AM -0400, Sevinj Aghayeva wrote:
> > On Tue, Apr 5, 2022 at 11:19 AM Sevinj Aghayeva
> > <sevinj.aghayeva@gmail.com> wrote:
> > >
> > > On Tue, Apr 5, 2022 at 11:17 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Apr 05, 2022 at 11:09:12AM -0400, Sevinj Aghayeva wrote:
> > > > > Adhere to Linux kernel coding style.
> > > > >
> > > > > Reported by checkpatch:
> > > > >
> > > > > WARNING: suspect code indent for conditional statements
> > > >
> > > > You are also removing unneeded comments, right?  Please explain that as
> > > > the documentation link the bot pointed you to showed.
> > >
> > > I specified that under the --- line:
> > >
> > > v1 -> v2: Remove the comments that became irrelevant with proper indentation.
> >
> > I think I misunderstood the bot's response. It looks like you
> > triggered it because you wanted me to write a more complete
> > description of what the commit is doing. I thought I received it
> > because it was the second version of the patch from a previous
> > patchset (the last bullet point in the bot response) that didn't
> > include v2 in the subject and a v1 -> v2 after the --- line.
>
> That is one reason, yes, but you also need to update the changelog text
> to say everything you are doing in the commit.

Got it.

>
> > I can do a fresh patch with a complete description and no v2 stuff;
> > please let me know.
>
> It will be a v3 patch, right?

Right.

>
> thanks,
>
> greg k-h



-- 

Sevinj.Aghayeva
