Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E33CAE95
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776726027; cv=pass; b=k7aH7bifVYRm9DPPiOmKmD1H5yOa1Ut+ZGqftkHMGbgZICCM4H2E9PECtIyUSFLZDx3ynORPctsnFFKEeC3gsv7vcm8d3WbmQ3gyb5I7P6n8PBMxQITuWN7i6ZibyGKGelemQe5MChsCNSMuWvigtsFIdrIwrTOLPW/SMQajcSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776726027; c=relaxed/simple;
	bh=TVDQOUkyn3ZynVKQfq7MLwA2igiid5dkTzbjZEU6SPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXD71fny3mlJn1rR2OjSoqnUfvRP2D2oP+muJXrgCkZiYNd99kWHgkXaNXO59xeHPFZ+kamERaphNSMc+Z1AorGakC04umcL5Rb9QRMNmhC4TCUreSvcUqntwGA+WOzS0vEQ3ot2ndSXCl0wFqHXDA96qNlVzlAU6WNvaV76ZkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+8InlYB; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+8InlYB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba699316b42so301760166b.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 16:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776726024; cv=none;
        d=google.com; s=arc-20240605;
        b=TGhugD9/9UEwWg3s5dEeIS9dGn8Kce+XawJd8Vhf2r9xpbjpjZze0fWguk2pUGsviJ
         cT66g+mcN2N7VUqunTDhaR1SLdrhys+Mx459+38EVuD4PgOt3LYnG04Iu0i4yDhF4eU9
         WLQDP4k9yDuReUwCYzq4P+qlP2Kxtxc+XSf24o54dni+PmSeanuu+vHmgb+nXjh1/zJY
         yYIXDAf9fDutSdFNuf2kJAoVJc1J3ugZ5dt50Z0UGwE9RzlTepTZ73IY+QKh4E7Ri4ap
         OXPAHqJ/N4aoDTUvc8otsg3OBPebuq1ZggyLVLKGhhUUSScrLFwBj90zOg3Ogl9UBqRs
         eHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZJd6RrMc2nkLOrIhDLYYHam791DsQf4dtCofqHSL2us=;
        fh=71OFOcvOz79NwJhkQ8zp5+FlHrxNJXeY93lUBVQEljk=;
        b=b1r5NDeVHixtW+TCK7LwjNECBUzA3podPirTU9+6ph21sCFy3b+k6RqpdFjxPVyPL6
         2jlXUiOn384FChNhOomXoCWLExRGBN5L6/D7eaSgVrDCxknFPSt6isDuUjZ/fDevLeAk
         Bb/YaPAEsUmckEKb6dJ7gsfPoTVZm7+MxD5zaIPjlre+Bfzn9/RlsNmKq8DxLvyHqbOE
         3ELTxAB33a3MInPi490AvTO26/uArT8MlaXLHMfmc3EsrcWqNEcRzY0a8P8A1jLH2+g9
         Otr+THvpq4TNFb6FH4LmS/bCnWFllMgueKt7DBzUDFo0b0p6HCsMX6A7oKq7H+su7xKv
         av5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776726024; x=1777330824; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJd6RrMc2nkLOrIhDLYYHam791DsQf4dtCofqHSL2us=;
        b=A+8InlYBh5wmRogf/+i3nEGtutdUnwQzklbAW3LMhC7xZRw9BF6lt6fFuYUCau8biM
         GpacfucRon+nJeJ+p8l5f/C/YF3CQJ7f3qdww+TAFJbrlhuX73ZMKzwR5PZ/o0MgUiR4
         imhXQZUPgmwDjmzCv/ckEuktCQ0jEhKDe6A40T7YvV1vlynMsfHYziLz9D+Kh3cRIBhd
         IU/9pGXYwSJNOWykhE0y4Uw1M7waCsQz8/HYj4yj224gF5LuXa6xMn8BUNXZl0YTdnVD
         nU98lHzGQgIsQ1iP1l8Hcaz21CmbnPh+yqjnAZ0eZC7eXtbpT/Kk0NE6ftDwmiiM8JmV
         Abvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726024; x=1777330824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJd6RrMc2nkLOrIhDLYYHam791DsQf4dtCofqHSL2us=;
        b=FHHtunlFWSBNDV/HxFe+6pIDuQplky9un/R2CPf/idqNdyEW9NmAvmZXvo+Aqp4Xrq
         hebyUXjcBq7TL2St2P5d+dbil3wSlQFkFfKU2YIqgt6a9KQoVvpWpTy6NFMz99UT4LmU
         KSTimCjgF9o/eNY4p05lhBOpWbyIichNAzQNx8Cy9+uTt4J3VrT/JEuLMu5q/9x4Dety
         5p+FuceRISyO8w7KAXE1BoRCmhnVDZVekuHD/hqA6CBXzS2rea6y3g4zMGbIMTwvC9hI
         xwd77JpUzEgR49ryNurkSPagRaqKUiJw9PNuvioyWuJ5t0bzeQg5cth72M38crP/WB/i
         0gyg==
X-Forwarded-Encrypted: i=1; AFNElJ/OOiUFMO+cNpO86sQ+3FfI1RH/KEBAtlyXHVcAdJRpBIM2/+TWqQxB8igbRAD3nc+HSxKWkl5LDbehlXKn@lists.linux.dev
X-Gm-Message-State: AOJu0YxXqE/r0GgZnAs7qmuCiUWP/lpQxVddyK+sE5ojZROPe1hd1irs
	hOEqJdJyDOZPhuTNwwvzOhr4yOMQEIHWNOSsO0OortbEJohW22s+XcPZ7cN7w/FmFrxWMH3CMoG
	TpmKsRMYUnLOfHq3VK/xLbx/c4ROXG3PgUJSaI2IRZVpA
X-Gm-Gg: AeBDieuYl1dceEMVFtdQMBM6D6gVu37ODHRHgd+eIiVXcjnfYh2zO4HaoSoz6R9AiN3
	aUBDi6uDVnyrnzAC5cY1fGdSsjt8hccgh2Y9HdMzs+yAKX7zdtfOM/PmqdikylQLrurRxzXciKk
	Z5iqa3PBDHwEp4fZzeOVXgFq+B1Z/hLPAucvXTe5H8E/pPNsf3IybcMytbCL0THloEa/cBq4b9g
	u9MVkjAflRJYPk44mgV0hxG66fsVOFtZb0J7dK+DqdQ00YLBhY+d1/bM4KXfhFpr+x7YhF17I2j
	7LeCfmc48LkFeAo74Q==
X-Received: by 2002:a17:907:6eaa:b0:ba6:61b6:c3a9 with SMTP id
 a640c23a62f3a-ba661b6c641mr459796466b.10.1776726023990; Mon, 20 Apr 2026
 16:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420030543.72423-1-dbgh9129@gmail.com> <DHYBP9790JEK.24T6YKAPUTHXT@gmail.com>
In-Reply-To: <DHYBP9790JEK.24T6YKAPUTHXT@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Mon, 20 Apr 2026 19:00:12 -0400
X-Gm-Features: AQROBzDOu6m3x5gYiw_6gHZapRFuCaonOXxSl17EhxxTapc5ZmiCEIGY5kjkFnE
Message-ID: <CACrCO_X7_q3D1LOcbFTs1hqQtEZ48bL19spnUN_+kh9FX6NhFg@mail.gmail.com>
Subject: Re: [PATCH v1] staging: rtl8723bs: remove shadowed bDumpRxPkt declaration
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Hans de Goede <hansg@kernel.org>, Michael Straube <straube.linux@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Minu Jin <s9430939@naver.com>, 
	Ingo Molnar <mingo@kernel.org>, William Hansen-Baird <william.hansen.baird@gmail.com>, 
	linux-kernel@vger.kernel.org, Myeonghun Pak <mhun512@gmail.com>, 
	Ijae Kim <ae878000@gmail.com>, Taegyu Kim <tmk5904@psu.edu>
Content-Type: text/plain; charset="UTF-8"

Dear Greg, Andy, Ethan,

Thanks for the feedback.

This patch came from an ongoing research project with my fellow
researchers, and I included
the SOBs to reflect that collaboration. After reviewing the Linux
patch submission conventions
again, I agree that these tags should be limited to people who
directly contributed to the
specific patch itself. For this patch, that attribution was too broad.
I will be more careful about
that in future submissions.

I also understand the concern about the patch itself. I will trace the
logic more carefully.

Best regards,
Yuho Choi



On Mon, 20 Apr 2026 at 18:08, Ethan Tidmore <ethantidmore06@gmail.com> wrote:
>
> On Sun Apr 19, 2026 at 10:05 PM CDT, Yuho Choi wrote:
> > DBG_RX_DUMP_EAP redeclares bDumpRxPkt inside validate_recv_frame(),
> > shadowing the existing function-local variable. Drop the inner declaration
> > and reuse the existing variable to avoid unnecessary shadowing.
> >
> > Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
> > Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
>
> Could you explain why there are so many SOB here for such a simple
> change?
>
> Thanks,
>
> ET
>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > index 337671b1211f0..cf5698dda91fc 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > @@ -1534,7 +1534,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
> >                       precvpriv->rx_drop++;
> >               } else if (retval == _SUCCESS) {
> >  #ifdef DBG_RX_DUMP_EAP
> > -                     u8 bDumpRxPkt;
> >                       u16 eth_type;
> >
> >                       /*  dump eapol */
>
