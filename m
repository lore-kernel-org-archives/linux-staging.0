Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36782757E0
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308699; cv=none; b=rUhNdEVNoikwHCQWUuiY3YkCyu2F1mDYvruFEsE399akYLJeRFnSb6PWC//9rJocYn+BdlgkKqMmHhcfGpmxrg0UgS+ASkLkw5Kk6rvSbwT9BXIduPf1d6q/oekwYME8gsXk3eySXAhA7AUQom5myfyvcKDkEdkmcuibpXHFxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308699; c=relaxed/simple;
	bh=Jxf4G1Cw44uD3kmRGCrTIT28JPe1a+FsUG1RBOkcXD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtmkuax789V6MNkJ7qMCKqQAg3wbpmTZrNwEvKQ85pSS1cHkxEFr9EB9FTLvS36u/YjTj72vUn0xhtwB7hePSNZjDkFWpYqcNcBbMiEC+E3seCOnhNnWg/ugTU11rwweVoIHDJBVNemHza0ob+hnqmV3B1avmBk4gpZCr+ReKsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6KtcZOZ; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6KtcZOZ"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b970a97e8eso756617eaf.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308697; x=1718913497; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gIoupV97+6nxLC7sqVzEqH827nnjncr+5XzDw/JAbos=;
        b=S6KtcZOZNaLfQcQI0aRLD/2aOaygmsCA2cD/yHkPecOicqhwer3Ocl17S9ELnupNgM
         ppDXsw6KoAL4XdD+xsYBY+WpeOk9RC9cWKKx2V21ltU9/uzKHLHKeEEGzhfN2n+iUzWc
         cnj1uazpt6UPTHII37/xT/1niADi4HKtZigBw1fBu9GH//ObsVOpQkfEcy/CEPZpKbEJ
         2ZBT/QxVgYISDq1Do+FmpD+oX0cUJIPJE7vF60HhIfImFLkffThvXIgtgvbMmtHuaXQa
         Xp6J9y+uF5l1YdTyO0QgCsUnFblWR2SHnLIGmKJO5DdvGzqzJ6qnEeTVj2WCsx+xFX9d
         +nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308697; x=1718913497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIoupV97+6nxLC7sqVzEqH827nnjncr+5XzDw/JAbos=;
        b=LkU9u+lPwlx4+MXXLDOM2exESgL0mwYyDoCc+NIlZaCKEIBtIjCdAT0u+HDmGnENwO
         jxUJG25JYSdLnf21bL6zqHjqAGW0f5yd8If+vBQy7Jcs0vkqScSZuRRaWJrdc/mwesfr
         7SjlLGhhlkjXCjFdzi3vVlMSsiGAnyk+n9Aq0O1/X5U4Mxt441aw3/xZesV2Q3A/isRx
         bS/EH4wthWvzTmlzpj3m+o/hgqW/issbW4ukd+ekM92DdynIiyESS7p8PL02X9vwK0aK
         e8HRmQRstpx0/XmCzL5kfHlM5089HNkFYZslH0/CcIkeiOigCGupz5woHyBWpXQCqBpA
         3eIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Cfv0BINdkegIiwhivsYzbnLIRi5z5zb8zgJPVt9lieP76yhU+0GGy1/DOZ+5jWrtvrCBs6rK2HzxIkBGO08i/VgUymc80kelBsB2KQ==
X-Gm-Message-State: AOJu0YwpLMkPvtg1Ifvs5BNidVCEfFgGRzCyRU+JtXoTxYTHx6+rmJL1
	+eCZJruOyAkAxFvBBAYH5wUi4WC4Yd+rSgntWgAB3fLMYyxyNXi7vSxdx6cGThxGsK0tO/HcTMv
	cJMeQfamc/r3lbTIAuqS7mq335hM=
X-Google-Smtp-Source: AGHT+IEaDfvC8trFFIrTc3xuGkqGzTAeTKgYCAH89Q4Oqt4WDUyMpWYP7ZdsnvqScltazx1yVoWqZwtPX4Qvvi90t9s=
X-Received: by 2002:a05:6820:627:b0:5ba:71ce:f82c with SMTP id
 006d021491bc7-5bdadbbefb6mr778075eaf.3.1718308697236; Thu, 13 Jun 2024
 12:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1718291024.git.engel.teddy@gmail.com> <ee01dbd2-fe83-46cf-9ceb-279a06ce9aad@gmail.com>
 <c0f2bca8-a7e6-4874-b5fc-98911a7c09d8@moroto.mountain>
In-Reply-To: <c0f2bca8-a7e6-4874-b5fc-98911a7c09d8@moroto.mountain>
From: Teddy Engel <engel.teddy@gmail.com>
Date: Thu, 13 Jun 2024 20:58:06 +0100
Message-ID: <CACP1t+tqj828NsSH85fKsm2QUPy5b9Nbk5RTb=hXg3MNS8CwGQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: rtl8192e: Cleanup multiple issues
To: Dan Carpenter <dan.carpenter@linaro.org>, 
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 20:22, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, Jun 13, 2024 at 09:05:03PM +0200, Philipp Hortmann wrote:
> > On 6/13/24 17:16, Teddy Engel wrote:
> > > Remove some unused constants, macros, and structs.
> > > Capitalize a constant.
> > >
> > > No specific patch order required.
> > >
> > > Teddy Engel (6):
> > >    staging: rtl8192e: Remove unused constant IC_VersionCut_E
> > >    staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
> > >    staging: rtl8192e: Remove unused constant WA_IOT_TH_VAL
> > >    staging: rtl8192e: Capitalize constant RegC38_TH
> > >    staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
> > >    staging: rtl8192e: Remove unnecessary pre-declaration of struct
> > >      net_device
> > >
> > >   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 8 --------
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
> > >   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
> > >   5 files changed, 3 insertions(+), 17 deletions(-)
> > >
> >
> >
> > Hi Teddy,
> >
> > please combine patch 1 and 3 (Remove unused constant ...) . You can change
> > more than one item in a patch. But it has to be of the same kind.
> >
>
> Could you combine that with the earlier patch that deleted
> IC_VersionCut_C as well?  (Unless that has already been merged).
>
> regards,
> dan carpenter
>

I will, thanks Dan & Philip
Teddy
