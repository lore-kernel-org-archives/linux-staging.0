Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095E3A8753
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487821; cv=none; b=mFNLlkOn8nJR8PFLyZ53CGdwRgBi4JayM+60bCtd4HhbmYio7UWmDWpkl4rGTD8hfZSjrpP9qdVQ0GaqyPl62JaIn1eQbTLfe2ORYz6oGnK231vvtzgTOgl/Woo+NUL4c3e0AzZ7k8zaAEx0QV74tyAkeUndgPOfWG8u/UICtwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487821; c=relaxed/simple;
	bh=QlBta+H5mNjq+dbHXbi+7XyTVzhQ/G0m8qgfcGULLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHk8FbYAH3vami9mLtTXVfzpg/ozveaZxo/XxACp+Bg583HghI6h56sg3jNzKnR6YqsQljuqWAFuoHgOLKlMAXPLcuiRmOLC0GmgTxm1NiFIduOiGLuPX+MkLeyDdg+xavnFtsTmnbZyCNG/hmjHmkIUKFLXwWdD29Js+vRaU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SQ4NvnOG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQ4NvnOG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso2974756a91.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789487819; x=1790092619; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=SQ4NvnOGZN48/tkV9NQjMx6onMHFcDwqWyFjOcPjOLQ/3avV/k8RuDSDpNPd0qTL0W
         vuKPdLgk36taJXvymXeaUp2s25Kae03J1urgbm2ZckP+LRMGzds43yXAbNst6nxh1s/0
         nKnrYLbMl68LrudmkqJfPmuKOQiOrgR/z2rb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487819; x=1790092619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=CEsWS34buOj2rZIh9v2xcdy6DJgC7YxCrYR+E21Fz15dOiLW/bOnLvskHViglklb0F
         Axe756g/i1Ewq/SvTD3HcjGeUzlCYgfiiftPOuTP1L/Efi6t7EYzjrVlPdUVGD551yhK
         dMtwg+Do4e9wtHN17a7oAqmgRjoRJWrY13ChkuzeDNam2EmG/a+YfoL/q6USC0lmrY7y
         r+0k3QH6kmaOnqXsXPNrVXAghq2yhfF5TN+vgWcL0OdAiBAPFMK3hI7zKS78yKipSfzy
         1oRp29BQ8zda0xO6qMdkIFrWUxrd1V6uDjXOhS0GEGcR/a1ZEjCwtLIwbhuNbrLP9U4K
         CQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBykga3oLKhfbZiO9Tg6PL/AFgXOgFehWa52nQlRacs1JqpjnIMP0iRuyisuR++WxJyXda184thrw/Xtzuop@lists.linux.dev
X-Gm-Message-State: AFuF++lRvDf1SMBjHlJ50AHtRcjzsq3IfnHQdMcVy5hkTlXnf658SdlF
	ToyPIiHrOcuN+NoPupc4wbTF4BfNPZdZST5BbN+bWmrhUvmvoGPW6y6uot/iEZsHGZeTsjf6y7M
	9pL0=
X-Gm-Gg: AYBFou0Dep6qw1iwPGY7ddbidmGH4/+heEW+WD5zbkNNWa0UwwGOmeEw19utXV3lm97
	SvRLfs/BmIPrQaFipQdpBisQ4/LjmRbJStmTlTZzJDHtguyiHcw8+sF9CQXSKmPbIjIvw+t8QKI
	wFTBKyYu84vvSp2C7Pl2gfGpbCR8X80KfzV8X67e82S+ko09SE3wag0kJ0ivZeuagNAAGEl4C6R
	3YpfSig5yr5QH2DE8uCYrytU005HS2UMLSURHxEpC50hmM1nkx08MUpIQN7BgU76BRx62Cb34fM
	2EOeJrBPiKRaA7AxyEGbnjBOLBMi8Ma6KFPsNFYv9d8Va6OY0IhOh8ipgXc3oVmTwwysKsEmb5n
	jNWFuL2kwnuVGyRGExjm/grKT4tqyJi/z+ylaGCNxD+j71lIkPv26uN0yr7N9RuRnHD1P8lfzys
	jH/4ssxu2/GSlI1Z/GxmeBm9X7Uk4fI5jgP9gdUA/xD0jN3kLvhrAso/I0DRp/AjeGAD0N8KxVb
	75t9udWNA6mbb9909671ujdlH5tVGVEO7gONCdvuj+5X0Y=
X-Received: by 2002:a17:90a:dfcb:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39dec142834mr18152556a91.25.1789487819551;
        Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com. [74.125.228.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfbac5478sm2362462a91.2.2026.09.15.08.56.58
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so2726794b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByderUpYK9+ENGsC81aT5NcBDfECE+l2YWdNaA/KSx05/cl6IiA/9zZq4YevvVlTS0HiR8JfvVRa9uoboiJ@lists.linux.dev
X-Received: by 2002:a05:6a21:3315:b0:3cc:3d08:da2b with SMTP id
 adf61e73a8af0-3db405ca519mr21103752637.15.1789487816474; Tue, 15 Sep 2026
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
In-Reply-To: <aqfyYSagcejWb4xD@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Sep 2026 17:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VOeS6uL0_wTY-nR6d_j0OJAaYWMrSrW2geaFCqxnwzMq5M1mnIaCQWjMI
Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dan Carpenter <error27@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan, Hi Sakari

On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dumitru, Dan, Ricardo,
> > >
> > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > Can you check this
> > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > patch into that, otherwise v17 it is.
> > > > >
> > > >
> > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > that branch yields no warnings.
> > >
> > > Dan: any plans to merge these things to master some time soon? Or:
> > >
> > > Ricardo: could we use devel branch of smatch for some time?
> >
> > Do you know what patch fixes it? If it is easy to cherry pick I can
> > add it to our list of smatch patches
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> >
>
> Commit d12183645a31 ("precedence: silence some false positives")
>
> Sorry, I felt like I was close to merging devel but then I started
> another major surgery to the core and got stuck.

Thanks for the pointer. I have added the patch to media-ci
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351

Now that I have your attention ... :P

May I ask you to look int
https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
in case you have missed it?

Thanks a lot!


>
> regards,
> dan carpenter
>
>


-- 
Ricardo Ribalda
