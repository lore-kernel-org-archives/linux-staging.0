Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE623C503
	for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827464; cv=none; b=g5ERlBkgMPOTAHuhblw/SbWK7WGYNEXbO3L9JXF6jFiexVaxd+O+1QINEFgjbmBHRytav4gswsz7OSdMQKBATYOWNVvMuSpkcllJ859u6XYInvsxRieGBDGSiGAdJQoUILWaKXVnKPhBh0oGueLCdscDAEbEmov71peAU+AF3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827464; c=relaxed/simple;
	bh=qcQtkeH6/tM2xUlisial8/6XUL4ycOWoDtS8uvilLw4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=p+J03sTF3udQmRXpxhCFIVQp+ovierbQtHW3B0BFAX+W1N58C9zqtOhfEDuSZxEY0RoKgyOLpfb4aRgDeZ2qQ6Hww25TOdvUSproya/ifKdzvHvPRywdGGzWxpmhDPXeq/bsPx2r6LK/5MYssva4Wgnd3wG9BCiTk0zrdHGBm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=qe+D0Fim; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="qe+D0Fim"
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gQ4C52NCfz9sJ2;
	Tue, 26 May 2026 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1779827457; bh=G7iBtbjg2uatkVEsxmQ8Z2QnSNE8lWO8CArC3nodSJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qe+D0Fiml+6dnobQa6Ek/gjFZESZSbJX51HpHWtPCDll8wF937+tTL1b2uxkhp/xJ
	 iB0QoCh9bSKRMSCrakZTRSDDleO1UWOkFqfptQoGB0BasYHOkBMepKJPEW+AUTLWnd
	 O3u5qVW8J+koPP7KdddMSM1CIWoKE8PGGwdQxzBg=
X-Riseup-User-ID: CE33B557F9E4490FC29B27A0FB3BBC0C95897F3EFFB9FE11010CA93D7C5C4802
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4gQ4C450Lmz5w1G;
	Tue, 26 May 2026 20:30:56 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 26 May 2026 20:30:56 +0000
From: eamanu@riseup.net
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: sm750fb: fix CamelCase variables name in
 sm750
In-Reply-To: <2026052623-cause-region-02e3@gregkh>
References: <20260526131631.1237672-1-eamanu@riseup.net>
 <2026052623-cause-region-02e3@gregkh>
Message-ID: <b69100263ea16141b31a7dc240ccdc91@riseup.net>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

thanks for your reply

On 2026-05-26 13:20, Greg KH wrote:
> On Tue, May 26, 2026 at 10:16:31AM -0300, Emmanuel Arias wrote:
>> Replace CamelCase variable name with snake_case:
>> - pvReg -> pv_reg
> 
> Why are you keeping the "pv_"?  What does that mean?

Sorry, I'm trying to start contributing in the kernel. I run

  scripts/checkpatch.pl --file drivers/staging/sm750fb/*.c 

And the output was:

drivers/staging/sm750fb/sm750.c
-------------------------------
WARNING: static const char * array should probably be static const char
* const
#36: FILE: drivers/staging/sm750fb/sm750.c:36:
+static const char *g_fbmode[] = {NULL, NULL};

CHECK: Avoid CamelCase: <pvReg>
#758: FILE: drivers/staging/sm750fb/sm750.c:758:
+       crtc->cursor.mmio = sm750_dev->pvReg +

CHECK: Avoid CamelCase: <setAllEngOff>
#863: FILE: drivers/staging/sm750fb/sm750.c:863:
+       sm750_dev->init_parm.setAllEngOff = 0;

total: 0 errors, 1 warnings, 2 checks, 1171 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or
--fix-inplace.

So I tried to change pvReg for pv_reg and the same for setAllEngOff.

> 
>> - setAllEngOff -> set_all_eng_off
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> The test robot told you to make this change?

As I understand the test robot failed because:


   drivers/staging/sm750fb/sm750_hw.c: In function 'hw_sm750_map':
>> drivers/staging/sm750fb/sm750_hw.c:43:13: error: 'struct sm750_dev' has no member named 'pvReg'; did you mean 'pv_reg'?
     sm750_dev->pvReg =
                ^~~~~
                pv_reg

> 
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605171049.KbaBnrJV-lkp@intel.com/
>> Signed-off-by: Emmanuel Arias <eamanu@riseup.net>
>> ---
>>  drivers/staging/sm750fb/sm750.c    |  6 +++---
>>  drivers/staging/sm750fb/sm750.h    |  4 ++--
>>  drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> What changed from v1?

So, in this v2 I added sm750_hw.c.

Please let me know if I misunderstood the workflow

> 
> thanks,
> 
> greg k-h

Cheers,
Emmanuel
