Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292017AE43;
	Thu,  7 Mar 2024 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709831589; cv=none; b=PWr+jZHvSdiF51AZOLtn7c6ddgsOy0jL6g1Xj/AoEbdvpmLrlevnaSkX9vQ0LvdsqRtnRLQh6PXFiJ/N4dQTbcruiRlud5jc3w+4+TYmpJBWnLUgYd/B55Ta4RtsME/xsR6OObfGPuakDSaFpHStgPR+CZ5sXt7IK7PeB7NrblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709831589; c=relaxed/simple;
	bh=IemQKWw+AkdDkX4GLnmolc7QeKDVOzOZBih5Kebambk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rYaHoz//YIVfhWJqqMw5scA4ipzeX7cB0MKsU2AJ2rczOAjMVMuIw1RJ05b4OzzpgeFdMnCajkr/wRpVgNrtRotuCJ2ojW5KBe3uOlhlQLqyoUnB7k7Z80od6x0Xk62HeQ4Cp0Jd1Hm7aqOPcIZSHt1KvzBVnsKfdkLRo/tzpcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kkUGxwNX; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kkUGxwNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kCqR9xPQwiVVwGVXU3TT2g9a1IiGdC1On1bTImSIMB0=;
  b=kkUGxwNX17MeAH3OAevuTxTT+JGaqv2GQJ9SRre1OLBmCQ0hgpMtImmw
   Ns3IC7TqsrhzwGKE7WsKSugGL0aWuXifYNwZtUZFxzhZDkq9GoniV1up/
   p9U6BXMUm4guCK5WJ9AeJ8bQo8PM8TyG1V0cu4UtYCjBWZvy7NcYEhJhq
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,212,1708383600"; 
   d="scan'208";a="81563670"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 18:12:58 +0100
Date: Thu, 7 Mar 2024 18:12:56 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v3 0/8] Rename variables in sm750fb driver
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403071810390.3161@hadrien>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 6 Mar 2024, Dorine Tipo wrote:

> Hello,
>
> This V2 series addresses the Avoid CamelCase checkpatch warning by renaming
> the variables in sm750fb driver to use snake_case.
>
> Patch 1 renames variable sii164GetDeviceID to sii164_get_device_id.
>
> Patch 2 renames variable sii164ResetChip to sii164_reset_chip.
>
> Patch 3 renames variable sii164GetChipString to sii164_get_chip_string.
>
> Patch 4 renames variable sii164SetPower to sii164_set_power.
>
> Patch 5 renames variable sii164EnableHotPlugDetection to
> sii164_enable_hot_plug_detection.
>
> Patch 6 renames variable sii164IsConnected to sii164_is_connected.
>
> Patch 7 renames variable sii164CheckInterrupt to sii164_check_interrupt.
>
> Patch 8 renames variable sii164ClearInterrupt to sii164_clear_interrupt.
>
> Updates since V1:
> Incorporated feedback from <gregkh@linuxfoundation.org> to fix the
> warnings in the patches and create a patch series for the same.
> I have also compiled the entire kernel and it compiled successfully.
> (I understand this is not sufficient and would be happy to run further
> tests. Should I run kselftests on the module?)
>
> Updates since V2:
> Incorporated feedback from <dan.carpenter@linaro.org> and reverted the
> sii164GetDeviceID since it breaks the build.

Hello Dorine.

Thank you for your efforts.

However, I don't understand how you can just change a variable reference
and not change the definition at the same time.  So I wonder how any of
the patches can compile.  Are there some ifdefs that mean that the code is
actually ignores?

Do you get a .o file for the relevant file?  If so, do you see any ifdefs
in the code that might affect the code you changed?

julia

>
> Dorine Tipo (8):
>   Staging: sm750fb: Rename sii164ResetChip
>   Staging: sm750fb: Rename variable sii164GetChipString
>   Staging: sm750fb: Rename variable sii164SetPower
>   Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
>   Staging: sm750fb: Rename variable sii164IsConnected
>   Staging: sm750fb: Rename variable sii164CheckInterrupt
>   Staging: sm750fb: Rename Variable sii164ClearInterrupt
>   Revert "Staging: sm750fb: Rename variable sii164GetDeviceID"
>
>  drivers/staging/sm750fb/ddk750_dvi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> --
> 2.25.1
>
>
>
