Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319702F8BE7
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724379; cv=none; b=Jv79Q7W6Pm//+XtlLOrzUsoWEJ4SCnx84OGaAK30DqmmL5VFDSthqcrcak/GUqH3+2P7/Nm+Fdhnqa9EitKhveaOHp1b5FssWA8l0yTvpa/pNReXVlvy5laruTpPJhNSPIeHHzFYNGJikQkz3reEOmmbcIRhUVmuw6j7h9TB7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724379; c=relaxed/simple;
	bh=CL4PHcoykLMbZZNjSNvXFDOWdnWPySZb6ACVQlOfyvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVU7tj42wmim9F0FOaW8chSE8qNtjbBFqeGbowWD3ELVt0TqN1DsRbzojSduUm+PGU47Y+bQXmnlhgI0QXKSs0OZUVIFXNpAeN3dVnR7JsQCH30VGQ0GsWmQGDh/YXZD1XfN34aZETfaMhIBbOYGgE7g3rVPfkSZez7hFYFfDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Va4JndSr; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Va4JndSr"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e96e5535fcdso4752243276.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1756724377; x=1757329177; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJinoXYbXnzNjHDgh/TK+DIXPD7XvP744ic5UKGRCZE=;
        b=Va4JndSrg/v/eTPtOaVxNimPWl1c/XY3/PQawAHN8r6UlyEr5yUg1eZ7jMkVVL+sl+
         bXnfaC9X06eSQiy9APGo4TJMkA3JPkYbPbKYloHNuGR4gdNkRXBS4ktAmnw5IpAq4nvX
         KHphQmC1MqRoTIB5FIOhViJwiA5j5s0Vof3YPmAStqbjEpMaQGMsGY2prJTIeghdBizm
         Xlcc6CLKMR+laFotC5d8rKk1CQiJXkVXT+KEch+n7Kx+9XqwSrHCBuDHmFjkvKcwpGS1
         hdv2r9qkVK1bBHNsOfdkNVNnNtaBoX24Mbi2gN8K8eY0WqUKTQKrMNsWhhQrO/x3eX9D
         /jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724377; x=1757329177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJinoXYbXnzNjHDgh/TK+DIXPD7XvP744ic5UKGRCZE=;
        b=UAo5U9HdeRuyEeGI7RhmtVcvipje0Uhz1/AOQGK3OFKP9Vkl871HKGV2+4Y67nZQ0o
         QR07VaoRHh/MhQvaVGMnR39goBcyCmTRLAiMu49HshOcgaNSnD8ad9Tj7oh5kZOLB4FL
         LsQ/h32PsiVDyGZaDzLZVyIbnQPmdwDfK2orjO43iL+WFyDCArn73g6T8TFAI6m9TSGe
         aVo9NZLMS1M61GxNHEwpG75lHOYZa9Pu70Fzm0FcRrY2pOQn/v2CTMaW7OxZ53lRi8fs
         u3ovqS9RalvgxYc0d6JB9KUahJq8wVTuoyuaBEBV4+H2NKVE88x6KOfFEXRmowHalxGL
         2Svg==
X-Forwarded-Encrypted: i=1; AJvYcCU96iJGgBpTweku2CJxHUxoGDq14dgpkYAJZXXdJk2y+i5W8qwRc38FB6tdDFoMMZG/k7++rnl4SH+hH599@lists.linux.dev
X-Gm-Message-State: AOJu0YwI+7gzNLcyacMYZQUlUatnFC282SvOU51ZRFtJrtWQgQ3fv4lz
	/6GzBbiXmnqtXgKcfw6ZalvUaA5DL+MIR/UGdVjJTir8DsUCIMRe8+YP9o9WLn2EpsgSqYXFasX
	ekcpvMoEk4ZOzuK8tdMyHsoP6Wsobkk3ljxXZhrqTOw==
X-Gm-Gg: ASbGncvO/zL/B/1BByV+KKkoDNbLNqokilkT3KR9BqIKRDHiKxmkKGLDm9xPp5tZBPc
	Oc5/MrUoKfHHXnsFMLDCgM9gY73HwqCAxo8w0rnskojNXePOKEOPjSWbCM55k15uIbFry0VjVXP
	H7xT2UFxUlu9dt5/xGGSvPTzIiPSVaWR8/vmOqY2aiOq9ssf9lv44+W5qp+Ri8lhIQ0cxCEsddq
	LqRMeMVgN5ycMPKWGuc1paDym6kYY0Mep4gbcaC3ZjKoV9iHA==
X-Google-Smtp-Source: AGHT+IG3E5X8rSS4MCzpFL4c7/+B+nTiuZn7QkYnuaa8FdJ3F1U3keZEV+jrL6NCLwW8aPKh0SfR0DXjN6ikye0mpJc=
X-Received: by 2002:a05:690c:338f:b0:71c:3e81:cca2 with SMTP id
 00721157ae682-72276337a67mr91487627b3.1.1756724376904; Mon, 01 Sep 2025
 03:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com> <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
In-Reply-To: <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Sep 2025 11:59:22 +0100
X-Gm-Features: Ac12FXx_JRISJwP0UMdGitDY4fzYmnwpQn6tyyu_Q6GUhjhAClChc8Uz64aD8Lo
Message-ID: <CAPY8ntDz9duSU_TcqE5CPYYCmSTnvm=RgwG56qQ0xe07uzWFLA@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

On Wed, 27 Aug 2025 at 20:18, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Jai,
>
> Am 27.08.25 um 08:24 schrieb Jai Luthra:
> > The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> > that is already upstream. So drop it from staging.
> AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2
> bcm2835-unicam.

The Pi v1 camera is Omnivision's OV5647.
There is a driver in drivers/media/i2c/ov5647.c, and that is supported
on the Pi via libcamera.

It does look like we have a number of downstream patches to that
driver that I ought to upstream - always something to do.

  Dave

> Personally i'm fine with this, but this must be clear in
> the commit message.Did you already talked to distributions like Redhat &
> OpenSuSE about this step?
> > This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> > the MMAL API (this driver is one of them).
> AFAIU this drops the only one user of VCHIQ MMAL. So please explain, why
> we still need this API and how this should be tested?
>
> Best regards
