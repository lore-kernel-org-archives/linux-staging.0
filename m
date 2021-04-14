Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16226D28
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:51:07 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id z15so7542975qtj.7
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hGtfqo5Bo6cc29ptmRB3Rcvg0AUrNYFdCJJIvwgoZk4=;
        b=W+wbeZWbrNkJ38iJZGGqvLcGCG5QfT2PDdv9szoQGjlZ/ht5i0k77xTd0wfuWKrnE/
         vsRJXOeXLzndtAMMkqApYdqssKzVxMCNE7v7tfVZmcESZ+e3IOk8lxHGQr8ZL6Fkt+wT
         CDHuURFLWlKMpEOVQ77UMNYx1O48RWV7C3DP3gBXyjcLiIchh0eiyVH0zRU7hMBYHwaF
         U3GA4SiW2Qz3tbK7hRAQj9G0N1Pz4OTqoH2C8JJKmEcxgXYqsgSXHvqhG8XYRA+V8zeP
         JiehTHXsjqiwCPNZwhNzjQ6LIgFoieaBa9ASFNv5cpRPaGP6rqOoH0oHQAsh5NcQCUzz
         R5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hGtfqo5Bo6cc29ptmRB3Rcvg0AUrNYFdCJJIvwgoZk4=;
        b=kcXqz/3ff55ckMnjpuocDaE/9Vw3DRw0IG2SMmVJfKVuRALwjK2iNxQeHWjucJztwX
         uvqKJQl9zPeE8wYQqA7v7ivT3sJvCD0U5bsUVs/SD2UWJVTy8Il2UovFuxjQxSz5Arwq
         4gnQs5s7V+oGSdMDPfMCgJ7dkSP5hOmztvY2e7YA8uERf921+zxiUBFLdW/8MhaNzPzS
         4A3LWj6dTFqbTTOjlIEyAhrYhA3/POFg8UfSMVtMTFZgRLYCb+T5K+ysLGWJqXbMW3qs
         cof49LVbT7OirsXCF6Psrt7d+buV61OhXWcGrMpiqTdLDo68qe3UF/NglMhvFzRJdq0O
         fa7Q==
X-Gm-Message-State: AOAM531nPIglusWIIk9EGUs5bStuKKjyPNo5QgNfckzHBRhOa8XxeUAj
	qWdqG0Qgo2/A7HMtC9NYQfA=
X-Google-Smtp-Source: ABdhPJxxLl/SLPnQiIUj5qukT/Wp0of+NZJZ40B76pC2bad/th4kkBgMUo80bs8aBHs5wqj6Wt9YFA==
X-Received: by 2002:a05:622a:2d2:: with SMTP id a18mr21067960qtx.146.1618411866781;
        Wed, 14 Apr 2021 07:51:06 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:e514:d03b:27b2:153? ([2001:1284:f016:a037:e514:d03b:27b2:153])
        by smtp.gmail.com with ESMTPSA id p10sm8688096qtl.17.2021.04.14.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:51:06 -0700 (PDT)
Message-ID: <1ae81e5c2380cf928579d5c62360bdd03a6bbc67.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2] staging: media: atomisp:
 pci: Correct identation in block of conditional statements in file
 atomisp_v4l2.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall
	 <julia.lawall@inria.fr>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Wed, 14 Apr 2021 11:51:02 -0300
In-Reply-To: <20210414144502.GW6021@kadam>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
	 <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
	 <20210414143011.GV6021@kadam>
	 <alpine.DEB.2.22.394.2104141638140.25259@hadrien>
	 <20210414144502.GW6021@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em qua, 2021-04-14 às 17:45 +0300, Dan Carpenter escreveu:
> On Wed, Apr 14, 2021 at 04:39:20PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Wed, 14 Apr 2021, Dan Carpenter wrote:
> > 
> > > On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro
> > > wrote:
> > > > Correct identation in block of conditional statements.
> > > > The function "v4l2_device_unregister_subdev()" depends on
> > > > the results of the macro function "list_for_each_entry_safe()".
> > > > 
> > > > Signed-off-by: Aline Santana Cordeiro <
> > > > alinesantanacordeiro@gmail.com>
> > > > ---
> > > >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > index 0295e2e..6d853f4 100644
> > > > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > @@ -1178,7 +1178,7 @@ static void
> > > > atomisp_unregister_entities(struct atomisp_device *isp)
> > > >                 atomisp_mipi_csi2_unregister_entities(&isp-
> > > > >csi2_port[i]);
> > > > 
> > > >         list_for_each_entry_safe(sd, next, &isp-
> > > > >v4l2_dev.subdevs, list)
> > > > -       v4l2_device_unregister_subdev(sd);
> > > > +               v4l2_device_unregister_subdev(sd);
> > > > 
> > > 
> > > It's really more common to use curly braces for list_for_each()
> > > one
> > > liners.
> > > 
> > >         list_for_each_entry_safe(sd, next, &isp-
> > > >v4l2_dev.subdevs, list) {
> > >                 v4l2_device_unregister_subdev(sd);
> > >         }
> > 
> > A quick test with grep shows 4000 lines containing list_for_each
> > that
> > contain no {, out of 15000 lines containing list_for_each in all.
> > 
> 
> Huh...  You're right.  Never mind then.
> 
> regards,
> dan carpenter
> 

Ok then :)

Thank you all,

Aline

