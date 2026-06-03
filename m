Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6752874F5
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 03:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456706; cv=pass; b=XvEObxpRJd2xgDuYDDEQ70a3Pia5Jupdcz29AWTJEIzquYeVWCw9LEcx09SKA7vl4hcNoBKCNR02ZsvvHFVhdRnyetV/exiKeMV6t7irgcpNyETiyuVBJ/NiRAQdTxrNcd+xhKq1H8Re82XClURK6FgzyI7gZeVRguVc7Sa9uJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456706; c=relaxed/simple;
	bh=VBM3j+6OONSH9M6Qrf537IqCXxFKe0SpiILA9+eTceo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1DUMzT4IfijwnlLIzYjWYVX2++N+e78XYl3tIu+47ycP9tgHP8622C53l1Oofwgy7SWse0EvNkCJJcAlIS8FzDSuFvMywtadC3lcW8jqxPnZHE07B3wxsAXHQbCexldYEpMOs3mWGDSB1Al5TM+8oEupmO4DTEZESLbu/umtVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD+Op2pg; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD+Op2pg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf18c30bb2so40217135ad.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 20:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780456704; cv=none;
        d=google.com; s=arc-20240605;
        b=Bk3cywPk+IAjM0JlG+LvtiDWayGESG0aKxeyCtnrrZ2ycE/zUHYOg/FhU4t+gvrXYc
         SnWQpqVE3/6JvbtUoJ9iLgueCwHIz4EexJF9icEPJSZZdrKbol6FJ45cxZmEujP0gdMb
         SI9LXxTuWlTrAy/VVep0CCAn+95TKS9OlAjG9MMIKDO/PPY+x3hV2XnG5J0s5vwbVXAA
         bAcGbpauncX8rU6Y4HpX9xDW3uzUH/ILIerRxlvgrzkiO5ZBNmOdOsQUJ/m5wb5UlXaK
         rIZcHf+fnrbEWT5mSDJfniO4wQIhnO0AEQpFBq8bhAPMlNQ4wRHP2gHK2ZLJPAGfq3ks
         mIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VBM3j+6OONSH9M6Qrf537IqCXxFKe0SpiILA9+eTceo=;
        fh=obFgUCzG+IG8NGzVPcgbolkJFs5LtMz39JMUxtx2leo=;
        b=G26a01kGnZRb5EQW3BTXGW3qdXaLiWCsuWiCMkNmenPgScX6QkxXQICefAh3IvzFlI
         vG7n3h6FMupGNjHndzcBOcdKNCYv1Xh5tABeWpvj/UMuiwLpRgNrd5CYIZieJbVp1dbX
         U5K0pbnGNewMUtr7N2eMpJD7MVUsgNbX5VDqgT56MjnDZl5TZaD9xuwr908x4EqDxdcL
         cCMVB8SOnTBR7lEa4Ez3+h9tBmeydzLLS11fUU9yZhxc72B+4aAR5sAS7/BmQDcCSCzZ
         vog5fteGuNeVmZFmS8c3nJVt4A4QGOm6yn4NKwb0A/y7rIW4RGEgIUFo8J7EL+3DdL6K
         JFRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456704; x=1781061504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBM3j+6OONSH9M6Qrf537IqCXxFKe0SpiILA9+eTceo=;
        b=RD+Op2pgc3cPXfhO0KZQYknufnaE3Ioc/Nb0L47qOqS0rc99PNlXyptn+rh+QpKoG2
         PXBjJCW+s2JIwiWAagSjoRCGvAkgAAgxcVj6fg74HITrHVFq/3jLC4Fv8KJy6hGESqaH
         nR2hhBF3RJLB+pyURaUpH60tlhInCqoCf48INHmrAO42+Dao4liV4XRIQFJsPHgaiC5W
         SkGcsinDkwDklGOgs4axG0E7ESVnXyCJZj0F9SigF3cOS4js5/YUPaYxKBWTd3KlB8PL
         zlqdZ5/i2Bv16lth0MBtOTjX7HSyY/hAZjPDVNHFZZtbraFlYcL9wdrPUtF6JQTmo7E0
         kTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456704; x=1781061504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBM3j+6OONSH9M6Qrf537IqCXxFKe0SpiILA9+eTceo=;
        b=czy4OlKyM8Z1snhMvVKzI7ME5kpP2S+8uh2wkILGFjTRJDsuyOwUUOLiCcAQlYCBF6
         hjOg+XjaN2P8Afnxaq41lj3thfFurh35eZHD9jCEqGbmuzuifADFHeVyXcmfhqPi4Wu6
         BNJX+C6MZL5bBwAIrIOxMH6Lu9D7SlFqYpWKGtIxK1YJdfqiIaOloCeVoTzwTVlBTlNL
         RxAOVaFh127AGOxVHDToKkDz0LzEgLNAq3JJckKC2eP0/C7pLvN+WnuMRiGshwA+V5fe
         tgj4ky97j+R3y2WAudViGO29E7/Dz/CKTzKrtkmjRy4Ejlx7j4pcNAP1nj7rgUOz0+PG
         qipw==
X-Forwarded-Encrypted: i=1; AFNElJ+iuiTi+pvBsojsMFjywetSNoOxLGo7Fx4BBgUa/Mz00UMfwmULxVl//qWRejPXTmZKkrf7B2D2pnTwMZyI@lists.linux.dev
X-Gm-Message-State: AOJu0YxoTHv9nm5A9oabRLnSQu2Uq07wtBii8QW5F+3IyTAfKRp8rK4R
	l6FP6yTbCrPR3cvUYqGY26csdpgzmAgHpTWymg4ef88EXRlB3v5WMk81644dEes3l4fLRPTB9gS
	Ygc0bjqnFVvGuvSNtINT3my+ib/2UFgQ=
X-Gm-Gg: Acq92OESe79AJVEgaJKMcz7gvF5LBdtTu/d+Cz8yQgxtGgq6VM4dib1rOHt5wZzv4Ft
	U3l5lZDGuyuhAYo+NAfe3ynHAcHt3PjkMMXJcM9EL+EAp1aCRxMl6LMYggujAWLOibEfTSyiFx4
	DUicxGT8teIiBaIGEiAJZUyazuFi/RW4oTLqgdkYN6yfdHbyg3OXWMrEDNfQAfL6k/T2WlXIzfB
	Zyfmgp7jTUebYqKwuCv4kbd0CL9sKjctfwg6dpYxznO2yFzcAjIxE0PBcQ2VnY4u4+R0Vz+8iOs
	LwW+FuCakinwKaAtRmQ=
X-Received: by 2002:a17:902:ea0d:b0:2c1:6020:7398 with SMTP id
 d9443c01a7336-2c163a302f8mr16591355ad.12.1780456704424; Tue, 02 Jun 2026
 20:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602103208.15799-1-dogestad24@gmail.com> <ah7AYukZ5uzW1NVU@stanley.mountain>
 <CAD03fjZQwgvDbBdh6A=1FeGVn4Na29ww2DzG3anuk2sOd0-4EA@mail.gmail.com>
 <ah7Wn3-meqmDLk_d@stanley.mountain> <9372087b-82d6-43a2-bda2-02ba481fbf8c@gmail.com>
In-Reply-To: <9372087b-82d6-43a2-bda2-02ba481fbf8c@gmail.com>
From: Grewstad <dogestad24@gmail.com>
Date: Wed, 3 Jun 2026 08:48:11 +0530
X-Gm-Features: AVHnY4K4FvUiOZbNEI7lNMSYQeiGqDmKuv43TZ4oDGNZYC8AWDUWGJQrv_eAdx0
Message-ID: <CAD03fjZdaFPAy3qr8zM-Nn8wNdRG7Sz6i5+6tNLHx1sbd551Tg@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove driver
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Jacob Feder <jacobsfeder@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 2:56=E2=80=AFAM Ovidiu Panait
<ovidiu.panait.oss@gmail.com> wrote:

> I was using this driver to play around with an FPGA board I have (Arty
> Z7-20), so not for commercial purposes. This IP provides a convenient
> way to move data to/from a custom IP in the FPGA. I am using it mostly
> for testing.

Are you still using it?

> I think there are no in-tree users mainly because the IP it talks to
> lives in the FPGA fabric, and drivers for custom FPGA IP blocks
> generally don't get upstreamed.
>
> However, there is the problem of what subsystem this belongs to. It was
> suggested to be turned into a DMA controller to get it moved out of stagi=
ng:
> https://lore.kernel.org/all/20260227-unboxed-customary-7ce6eda1858c@spud/

This is the main reason i suggested its deletion. it is very difficult to g=
roup
it into any particular subsystem because at a low level it is just a
'dumb buffer'. If we do not know its end users and which software uses it,
it will probably be very difficult to move it out of staging.

> Here are people using it and running into issues in Jan 2025.
> https://adaptivesupport.amd.com/s/question/0D54U00008zRBdISAW/vitis-is-no=
t-creating-a-driver-entry-for-axififomm-43?language=3Dzh_CN
> Someone provides a work around:
> https://adaptivesupport.amd.com/s/question/0D54U00008sLBuMSAW/how-to-use-=
the-axi-stream-fifo-drivers-xllfifoh-xllfifogc-etc-in-the-project?language=
=3Den_US
> Then Ovidiu Panait fixed the bug in Sep by adding the correct
> compatible.

There are obviously some users, but in my honest opinion too few,
too minor and too unverified to justify its maintenance in the kernel,
especially because we have no feedback loop for the development of the
driver.

>I =E2=80=99ve gotten a few emails over the years from people using it, and=
 there is also development happening in parallel on the original github rep=
o:
> https://github.com/jacobfeder/axisfifo

This project has basically ground to a halt now, three commits in 2025 and
basically dead for a year now.

Thanks,
Arihan Bhor


> But I am not sure that this fits as a DMA controller, as it has no DMA
> capabilities. The CPU moves every word individually to and from a registe=
r.
>
> My understanding is that the real Xilinx dmaengine IP is
> drivers/dma/xilinx/xilinx_dma.c and this IP is just a simpler, register
> based alternative to move data between the CPU and the FPGA fabric.
