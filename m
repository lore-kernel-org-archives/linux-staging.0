Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7A3597B
	for <linux-staging@lists.linux.dev>; Thu, 20 Mar 2025 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458687; cv=none; b=ctR+NQevcoJn51UpajG3JZpaIpVXer0sguCkxIsSYLR0lnzZnmP5D8SfgDrXmHDGrLzFfjqG2h3HThRpefPyChTK/MDerpwAXrHsOOY6ngngzfXneOr51RHAb8jElAe5kbNPat7RmVosQXh0S3sVsSyGiu1wO3izLzVbfJYy+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458687; c=relaxed/simple;
	bh=h4z+dIBpmf2izwGwuMDiHo+OLqgnEXNtCiW0C4T7hwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KquNpDX65eVezOJxnLHsjyyfl0jMMtEOQCDpqj/nWC+NUyO4W85EnmrnigTpfXX2dv2sv1UPGyHkQ4rlcvv+N5VqUyp6MRnVPIknQUM8hHoppv4dCqpobKLnIbdX8lN7++b4j8m0746JgxFhtKx4qtaRxe+bBzKCk9QnnPNER7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1cnoh8y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1cnoh8y"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so3413305e9.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Mar 2025 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458684; x=1743063484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zjVQ5SOz+jm8u6D48pQ2cGM9HKLDE1RuGZARc2eKPlQ=;
        b=I1cnoh8yozAby9Ld8Ia0+u383xzoFwRMInA/ISgHGujD6KzKxRSCoFxhAYytUYB3j/
         6OqCHAdSd99YVD2aCy14XNNZv/ssDrJSW/A94gxyVZ4hb3ei+acwj4i1dNwZenJB+cEH
         PcGXOb7+O21vyfSKIr7GxNI/KzWCK7qs/KTokjr9i21H0zsUgQOiZ1ZOYsdwJG0KU+zt
         Yyq3mP5iV2cluS0q1LBTv5FHT61kSPuVkxQCOtEkIiM5DhsUAYMZjSCxsp9w3Jo32ySy
         TNDhvHtS+InoSZfOr2X0n9iIpTVqkyW+DRDrQU6Ne3mDRWJt6bxBiBD4t2zMYXMExeJE
         tVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458684; x=1743063484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjVQ5SOz+jm8u6D48pQ2cGM9HKLDE1RuGZARc2eKPlQ=;
        b=n7O9dRIRlZkZspNv+2SSKZcUT0MuOgWZZpGcbs3PDKF60XMiYyFAmIST80Lhwpqhpm
         K8eYWazl8qesdrv9zrF3fTuS9IXLOoFtRjZ3+zVKBNeZh8+Oj+1Af3C7AQz1QhYj38mB
         /WRUXjyT8LgC+H7uYr/zFoWlpOBcNq5kX6I7owctMQ6tmZLunNdGeq31pN1cyHb4fonH
         4/2fUSfndktcT+KlnGXuZUkQ+M0JOZGEl71jXaQszOPX1iWLBYnyOpFMVVbQPFDunO3W
         ExiyZL5DIP3cVLhXjyGhNG2u8sMsqXsJRfH9+8Q1XSjxCZ9V5cKbB/DstSDwvluhad+Y
         fVXg==
X-Forwarded-Encrypted: i=1; AJvYcCW5MftQEiVpN5ATgwo9dxZZQIvnbqq9Da++0iVWLMxPn0f3XgJkfa9KSCIgmFKi9PDqWAVqKbaY97G8NDTo@lists.linux.dev
X-Gm-Message-State: AOJu0YxgD2wMQso2Fgxik7ZPKKNy4T4qyOVqUVdPD3WMbB/JWCrm9vMe
	GoOY85RSk9Af1gxdpRlCk9a2fr2/Kxonzrr1pHT/A7yeX3d9yHDQzraBpgr4
X-Gm-Gg: ASbGncuzzWyu0r1rWw8lN+LfUirJUrKXyvS4NGgyzUl97W3ZKy6/k3HFJ1iuoxFg2wl
	D32gEofkhsgoL7rZvqc0TIqTFHzqV43N7etsTRHUfeKd9fTFYB24itdbMiRXpRFvBe19ANxexDt
	ePlrwjP1DU8NFdn+CeSZfOqm5Kq8oYP2zbfmyXAkYe1WjMJ/uwsi0c4epr6mYTnrLk4HC3fG8YL
	qvL6g9iwF+nIOsrglKPj6WebBy7DWrIa+uBDCace87ozXMCVpq1cFFc9y+3iAdO6Mz3VUvRaJdt
	TMvWZoXvRRxMfBlggDoyb1owjXq9xXVxHowbaxOplKqxn6l0viJBLW14YECa
X-Google-Smtp-Source: AGHT+IGgIm07Ipnj4FQkYOCqmmroZDk4enzX0nHBxCLPbW6TYwFUSSA2fsm9mL6oryT4dBL9wlwrHw==
X-Received: by 2002:a5d:64a8:0:b0:391:1806:e23d with SMTP id ffacd0b85a97d-399739bc113mr4512519f8f.6.1742458683554;
        Thu, 20 Mar 2025 01:18:03 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm23245424f8f.62.2025.03.20.01.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:18:02 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:18:00 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Michael Rubin <matchstick@neverthere.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/20] Removing typedef for gpib_board
Message-ID: <Z9vPOKAFv3Jw5l1r@egonzo>
References: <20250319215924.19387-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319215924.19387-1-matchstick@neverthere.org>

On Wed, Mar 19, 2025 at 09:59:04PM +0000, Michael Rubin wrote:
> staging: gpib: Removing typedef for gpib_board
> 
> Adhering to Linux code style.
> 
> In general, a pointer, or a struct that has elements that can reasonably be
> directly accessed should never be a typedef.
> 
> * Patch 1: struct typing for gpib_board
> 
>   Introduces struct gpib_board replacing gpib_board_t
> 
> * Patch 2 - Patch 18
> 
>   Adopting "struct gpib_board" as opposed to "gpib_board_t" for each
>   subsystem in gpib.
> 
>   *  staging: gpib: agilent_82350b: struct gpib_board
>   *  staging: gpib: agilent_82357a: struct gpib_board
>   *  staging: gpib: cb7210: struct gpib_board
>   *  staging: gpib: cec_gpib: struct gpib_board
>   *  staging: gpib: common: struct gpib_board
>   *  staging: gpib: eastwood: struct gpib_board
>   *  staging: gpib: fmh_gpib: struct gpib_board
>   *  staging: gpib: gpio: struct gpib_board
>   *  staging: gpib: hp2335: struct gpib_board
>   *  staging: gpib: hp_82341: struct gpib_board
>   *  staging: gpib: ines: struct gpib_board
>   *  staging: gpib: lpvo_usb_gpib: struct gpib_board
>   *  staging: gpib: nec7210 struct gpib_board
>   *  staging: gpib: ni_usb_gpib: struct gpib_board
>   *  staging: gpib: pc2: struct gpib_board
>   *  staging: gpib: tms9914: struct gpib_board
>   *  staging: gpib: tnt4882: struct gpib_board
> 
> * Patch 19: staging: gpib: struct typing for gpib_gboard_t
> 
>   Adopting "struct gbip_board" as opposed to "gpib_board_t" for include files.
> 
> * Patch 20: staging: gpib: Removing typedef for gpib_board
> 
>   Removing typedef for gpib_board_t
> 
> Michael Rubin (20):
>   staging: gpib: struct typing for gpib_board
>   staging: gpib: agilent_82350b: struct gpib_board
>   staging: gpib: agilent_82357a: struct gpib_board
>   staging: gpib: cb7210: struct gpib_board
>   staging: gpib: cec_gpib: struct gpib_board
>   staging: gpib: common: struct gpib_board
>   staging: gpib: eastwood: struct gpib_board
>   staging: gpib: fmh_gpib: struct gpib_board
>   staging: gpib: gpio: struct gpib_board
>   staging: gpib: hp2335: struct gpib_board
>   staging: gpib: hp_82341: struct gpib_board
>   staging: gpib: ines: struct gpib_board
>   staging: gpib: lpvo_usb_gpib: struct gpib_board
>   staging: gpib: nec7210 struct gpib_board
>   staging: gpib: ni_usb_gpib: struct gpib_board
>   staging: gpib: pc2: struct gpib_board
>   staging: gpib: tms9914: struct gpib_board
>   staging: gpib: tnt4882: struct gpib_board
>   staging: gpib: struct typing for gpib_gboard_t
>   staging: gpib: Removing typedef for gpib_board
> 
>  .../gpib/agilent_82350b/agilent_82350b.c      |  99 +++++----
>  .../gpib/agilent_82357a/agilent_82357a.c      |  85 ++++----
>  drivers/staging/gpib/cb7210/cb7210.c          | 107 +++++-----
>  drivers/staging/gpib/cec/cec_gpib.c           |  59 +++---
>  drivers/staging/gpib/common/gpib_os.c         | 196 +++++++++---------
>  drivers/staging/gpib/common/iblib.c           |  50 ++---
>  drivers/staging/gpib/common/ibsys.h           |  14 +-
>  drivers/staging/gpib/eastwood/fluke_gpib.c    |  93 +++++----
>  drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 122 +++++------
>  drivers/staging/gpib/gpio/gpib_bitbang.c      |  72 +++----
>  drivers/staging/gpib/hp_82335/hp82335.c       |  56 ++---
>  drivers/staging/gpib/hp_82341/hp_82341.c      |  68 +++---
>  drivers/staging/gpib/include/gpibP.h          |  10 +-
>  drivers/staging/gpib/include/gpib_proto.h     |  58 +++---
>  drivers/staging/gpib/include/gpib_types.h     |  58 +++---
>  drivers/staging/gpib/include/nec7210.h        |  58 +++---
>  drivers/staging/gpib/include/tms9914.h        |  52 ++---
>  drivers/staging/gpib/ines/ines.h              |  54 ++---
>  drivers/staging/gpib/ines/ines_gpib.c         | 111 +++++-----
>  .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  66 +++---
>  drivers/staging/gpib/nec7210/nec7210.c        |  76 +++----
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  70 +++----
>  drivers/staging/gpib/pc2/pc2_gpib.c           |  68 +++---
>  drivers/staging/gpib/tms9914/tms9914.c        |  66 +++---
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 100 ++++-----
>  25 files changed, 947 insertions(+), 921 deletions(-)
> 
> -- 
> 2.43.0
> 
Acked-By: Dave Penkler <dpenkler@gmail.com>
