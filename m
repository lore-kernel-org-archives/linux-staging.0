Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351B173
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 22:12:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id p9so8047086pjl.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JK1mRcn2HByH4E2JRUJGVuJhe+9CP6yUJGUebrttsA=;
        b=ZNBSRX8bhkGG5T5bLXeM04DElb+bgHe+jbY+bW4x4oTBS9/9UCAX61gn2f8p6Z7scd
         rc+WpKhrBtPcXMO9qacHy2VI8KCwe7KYotrgMsD+HuGNvnhpt/o5oxDfg4QwQGLJLDrc
         I14vDCXp7gygG3as8wIf7XH1zS6GnNmMRIrtvEPM/Hqx2TaGJIvZz5+RYYIq1rasrLKG
         +9Vdgmn448YuVpRAWP30hFxMYnqvg7itvM53VJDu+uyG85x7voI1bRNgZtDsVlHH4XWL
         QIPJsVigXF78rW+dCSSUZQD9ddsf9dKHLr20gisiFIEAVpCrJ0WYUWHNb5AKClhrQOds
         UOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JK1mRcn2HByH4E2JRUJGVuJhe+9CP6yUJGUebrttsA=;
        b=jLq7TwyDwld2MTZ5FV0tr9LuCw/ans7mOo3hZtX7M+pBS2ZzU5qX0bVQBiCBJfg2VN
         +yb5AGXw/F7j2H95sNCcFfkN1K6fsV5WlHpnJTtmf5n1Tdbh3h+fKm6e+cyWlzlX52kG
         fzcICNIZJpFhq9dUMB09QgCpyWN4lEgyJvDLg7aiCYmAdGTWIRcNZf9gLNN4256QYaDP
         lKf10iWGG6ExiGmQvJ2gvVauUJPO/Ago/Zya5B+6YY7arH7UYuyfhTKc/8jyUFLZ5DGE
         iJBhaQdVWVRUGMeGGeNPzzQdfiEqzTAMNcasvtRaoN7LK2W2ok35ftnyhCc+SOQbHCqD
         Jvlw==
X-Gm-Message-State: AOAM532Vt4uQb+0lnfxGlSQqkMuHBk2LFc1BndjlZp/L0pWmw59BiEpH
	3sy6U8u9RJen5q7isoDrS1Fg/LIzIrOsIYBphN/kUw==
X-Google-Smtp-Source: ABdhPJxNKrTn9YS3DIlzxQPd0zAPpU+qGdyfLaKWjAsSxBtxRNon+epeJyJ6C3cRciFPCeRG098cnl0FTsUGlyRzgSc=
X-Received: by 2002:a65:578a:: with SMTP id b10mr2027126pgr.208.1626991939409;
 Thu, 22 Jul 2021 15:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net> <20210720090035.GB1406@agape.jhs>
 <08a8b372-8ec2-afcc-cc54-305d1dd74a59@lwfinger.net> <YPfRf8dgFd+u5hzm@equinox>
 <0c2d97fa-e1e1-3564-98b8-37d5b9a1a9cb@lwfinger.net> <20210721182836.GX1931@kadam>
 <ed7b7d93-f754-dce9-ca4f-425e49c972ba@lwfinger.net> <CAA=Fs0nvhxEhJhCTWH_KkYyB3Jz7Pi-t2a+6zL3K=O-_3-sLGg@mail.gmail.com>
 <YPlyZsuRJpkUwWiJ@kroah.com> <e91cf326-f393-4ad5-568a-dbdd7cc759db@lwfinger.net>
In-Reply-To: <e91cf326-f393-4ad5-568a-dbdd7cc759db@lwfinger.net>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 22 Jul 2021 23:12:08 +0100
Message-ID: <CAA=Fs0=bgZj6jtS3NsfB1kk4TX5BuoN3S5pg9jmnkPPVFYYgpQ@mail.gmail.com>
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jul 2021 at 17:31, Larry Finger <Larry.Finger@lwfinger.net> wrote:
>
> On 7/22/21 8:28 AM, Greg KH wrote:
> > If the code looks "better", I have no objection to just adding it to
> > drivers/staging/ and deleting the existing one here, so that everyone
> > can work on this together in one single place.
> >
> > Larry, any objection to that?
>
> I am not opposed to that. Do you want me to supply the new driver as a set of
> patches, or would someone else like to do it?
>
> Larry
>
I am happy to do it. Two patches seems sensible - one to remove the
current driver from staging and another to introduce the new one.

Regards,
Phil
