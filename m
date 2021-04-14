Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984CD6D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:58:04 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h7so15470882qtx.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v51c/LaZHGz9fKWnkerSwcKpValSC/qV8JTGixIM5SM=;
        b=cn8s8OCr+3F8GqNp6ITvplNT0k3fpxjJNSYLkeLRgGq8Vlam3MfjLeeB/Soaq8JlhP
         KFvW2cKkhOG1DPHTO/G4a6EzBpBMQp2r2FN6SxxfjayDv0Kc6HK9zNtKTiX8tTN7tnIz
         5EobMRjU4IOpkZ8AL31Fy4wZeVvk8smb1zNy/AKgEFhDUEAcrNATpaXxSlxdHZuCg4iZ
         ofgUUGIuYeOyC1SyP4npnYht14XurmC8BBYFLjwT8yaILIqhETQbgBstXk2+Kwigh3SD
         ym9G5Gcj6alnVIz0iDNUb5K87077FSl0/idOkw8AbAy30cm0RCqoeraE+d0585sIG549
         rULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v51c/LaZHGz9fKWnkerSwcKpValSC/qV8JTGixIM5SM=;
        b=GUOx1BXqqjkfT8DJrSj6IWWOTjmih3xm787YFcLegEA9O4dexx98BlafT+vmVZnHVJ
         054HFx4wH80HHVmD/tcprgti1pt//q5Ast0D3uiFHhwv89ufjgWnUOFEw8DLLY0qFpFq
         zzHWQqd0G9kku7ZcTc0ZUO2kqxIMdw6ebs/PD3XCSf1PdROP4AHJ9IpsipoBiFaI7CgA
         6KWPJELN5RFf/YZzPNf++2jcsbJq/LXEifq79L9Un6cDJrETTYK3W1CcA1zUneW+uHsX
         PN4QnW7r8gNR5HWBk0h3FRU2Ol/AshpQSa41BCoIQ4oE4h3CjZg3Xwt/jn1YndpwVuiy
         Xlgg==
X-Gm-Message-State: AOAM5330vzNhOGNE1XF0z99IQYuEq/HpvO1zhNuf6VgU/YKTPDcZt91h
	tPNss6uxsZSs9FX93uyS1tlYxVTOr+vAUxJMrmKBRBArfj4=
X-Google-Smtp-Source: ABdhPJzxoKgWo2M/YSohAwFMXF857zmOIZpNKyPjwv25qduayW6pYw/Evbx0liF6sxZXo665uX0qC2nrX3Sx3uRcEOg=
X-Received: by 2002:ac8:6d31:: with SMTP id r17mr6959628qtu.255.1618408683539;
 Wed, 14 Apr 2021 06:58:03 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407140142.447250-1-abbotti@mev.co.uk> <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk> <YG3rUN0fvyA6HCpf@kroah.com>
 <20210414100905.GD6048@kadam> <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
 <20210414132818.GF6048@kadam>
In-Reply-To: <20210414132818.GF6048@kadam>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 14 Apr 2021 07:57:52 -0600
Message-ID: <CAOx9Pej+WV9NOsyYJ+oDUXW3EY+-1gHf1Huy6Jz3xLTN+nCu+g@mail.gmail.com>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 7:28 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Apr 14, 2021 at 01:34:23PM +0100, Ian Abbott wrote:
> > > drivers/staging/comedi/drivers/ni_routes.c:61 ni_find_route_values() warn: 'device_family' sometimes too small '8,11' size = 30
> > >      59          for (i = 0; ni_all_route_values[i]; ++i) {
> > >      60                  if (memcmp(ni_all_route_values[i]->family, device_family,
> > >                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >      61                             strnlen(device_family, 30)) == 0) {
> > >                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > This whole memcmp() is very strange.  Why not just use:
> > >
> > >     if (strncmp(ni_all_route_values[i]->family, device_family, 30) == 0)
> >
> > I think even a simple strcmp() would do as well because all the device
> > family strings and board name strings are null terminated.  I don't know why
> > the magic number 30 is used here!
> >
> > The above applies similarly to ni_find_valid_routes() too.
> >
>
> I was thinking maybe ni_all_route_values[i]->family has an additional
> string on the end.  For example, it could end in "_bar" and we want
> ->family "foo_bar" to match with device_family "foo"?

No that was not my intention.  Looking through the code again, it
looks like my intention was to simply provide some type of a
reasonable limit for the strings that are passed into the function
that come from hard-coded family names that are in ni_660x.c and
ni_mio_common.c where they call ni_assign_device_routes.  Indeed, the
string lengths are (so far) only actually 8 ("ni_660x\0") and 11
("ni_mseries\0" and "ni_eseries\0") characters.  In other words, I
think my intention was to simply create a somewhat generic interface
that other ni device drivers in comedi could use.  There was not a
good reason for using a magic number of 30 except that it was bigger
than either 8 or 11 and was probably large enough to always be
expected to be bigger than any other ni device family name without
being too large.

Spencer
