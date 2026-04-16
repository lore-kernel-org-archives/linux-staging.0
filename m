Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28579394476
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374404; cv=none; b=LHDsS+wFbnEd169hj8CPex9rwyhpewRlmCmqVaRfoQV7T8uKwzsW6qbYylwXu7cVuGepkh2Pdq3BG7d7m/BI0qyslRJ0i0tvsc83K2EN+j3s/VLdAJw9p7/FfNmqckDXFxYoqXCpvU+O2QeCBOWxEeALTkmdw0a9xu6muxrzmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374404; c=relaxed/simple;
	bh=VHtF7CE3q/wy5vzdJ/EtjoUiYyfjCwo7Js8hD/IKvBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0ffEZuVpRpu0dMjQbrVqtY6QJE8gvyVzJUrSXRYQwSbQUVDHOlm96ESAo2+4nofq0DajQFJVE/hxZcR/W0GzaksFSypfoYhMRQ+tFm2zCoFH3b4sU9FA72m0FHwF1inS+dpJ0246kG76zHGuu4BB9ptAhW4dilHQ4kNIqJceW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAoUHypm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAoUHypm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso16305e9.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776374400; x=1776979200; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2uW1n39EkbYnhmpWm78u6mtacB6MzGeEndluD+Ii8w=;
        b=kAoUHypmudB6EmciZLpGSVQ/2YeUw5LGVKKSyyDY/nX5gnJD1mdII9LK2ndx9gR3WM
         AfPHcTii6wg/joluPFnN3YjvIz9XxtpWVwln6hsylMv7uMhaUbS3ST1QwgObuTKee5Dv
         dSEK/qag+d94mtcu5/48Bd4nuVf2OGZRskaLiXR6fkT+Y0ytABNavIjGAx4kmx5pBW6a
         81kW3mqNJAhgj9WmZ5/MxhzmWnRrSjDPJbSX0OB0ZT8POwQa2tf5oLiCvaqBR8K6OzqC
         Da+62xNGSOxCKN6ziaVIdtNc8Hs6rSkpGqIcormZmpSsTbpvhew9lUTXWyXJ2NVWwXzr
         /FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374400; x=1776979200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2uW1n39EkbYnhmpWm78u6mtacB6MzGeEndluD+Ii8w=;
        b=OHOObBnjPffJ7zqzwYbDU6b0baOAAT0vHlrvvuKyJSvhfKnceLJZwcwHJUz/Ly5JGG
         mIfpAK5+7y/7fudDqc47jjNudW47KXUHtHMbjHHHNj2fSwPa30i77n/0nXyBbEcsMsXu
         HzFEU0AV/uvQqhRlp3U0xv+PTAGOs1OxtWFMQ58M47KGJaABbIpBiQwKQBsWd8eJuEja
         EYVhP/XsbX/YwkQf638t4OBrUROCEebPCvIjuEPM6y/Z9TFKL83e8Btv27lmTQwEpbCe
         iL94/sxKQVhDD1ih8hqK5RDCjghUUX72r7Zf3A1eRTxb5/ugr4TNHPYyR/Ib3yRP9d97
         f4FA==
X-Forwarded-Encrypted: i=1; AFNElJ990dZhCJ18Y3LMHadPVuoTPVzy8HXHWOyhkZEgPv9ZEt0ySVx3iRuB3reQQK0kt3uaj6GLT/0HDVVnlKR6@lists.linux.dev
X-Gm-Message-State: AOJu0YychV4C71WHFFG9bsCMxsOEoig+Mca4Fi+DHvurOkOP0O86IDJW
	AbPUcH3YbIRAwXX0wmL6/+xRNS1rPhWD/40UPkgplaJmo2CadEBzZfyX
X-Gm-Gg: AeBDieuRcvqH+JCATFTsj+3UL9XFxnz5/JGtgLZ8RDzdtnS0U1L/G3BuqHxM1SjJHcP
	UyT8Qb0WqGfIggKsZPe6IqKRnk5ja0j+ZpLVdPy/urVbcCRFFgi6RAB0cGjgG/O6MDaGxLzRzAZ
	2gJvpgenzCSPhIEIx2suBYfvtoGF7MqBvS6SMxE2JlNi5rnHIq/qEguBrmnEPmCWu+EVo89fSP+
	1NB2KU0uHz6f7s6DgLK0JcoWeAgisiPUWxx8gZigvfry4NbXVdj3vM/ftKw2e3bgZfegXKZNLz7
	gVN2WtIETdGOzRiSKZtKWJJgH+p0k+OX1iMlZb18neJCIMSdxcZwJfLsgOYjDAY49qkpnNlKvws
	z6AOymzMwk5uDMhF2zU63a5m2QYKtvHZ0961NX6jyj0fwb5kVGbXGF13YXYeoDLKSYRvUIoH61y
	eEEiUZoHki5KLIP+5JKWIry/zBIhosUw==
X-Received: by 2002:a05:600c:c0c8:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488fb78b8c5mr2081115e9.25.1776374400436;
        Thu, 16 Apr 2026 14:20:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e39dsm86498485e9.9.2026.04.16.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:19:59 -0700 (PDT)
Date: Fri, 17 Apr 2026 00:19:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Maksym Pikhotskyi <mpikhotskyi@gmail.com>, gregkh@linuxfoundation.org,
	ethantidmore06@gmail.com, starpt.official@gmail.com,
	straube.linux@gmail.com, sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in
 rtw_aes_decrypt
Message-ID: <aeFSfICuzePSwN_l@stanley.mountain>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
 <20260416195338.324428-1-mpikhotskyi@gmail.com>
 <DHUVD5N4JNX9.20NSTUBQJJNTC@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHUVD5N4JNX9.20NSTUBQJJNTC@linux.dev>

On Thu, Apr 16, 2026 at 10:42:07PM +0200, Luka Gejak wrote:
> On Thu Apr 16, 2026 at 9:53 PM CEST, Maksym Pikhotskyi wrote:
> > The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
> > Invert the guard, so it returns _FAIL on invalid pointer.
> >
> > Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
> > Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> > index a00504ff2910..f467cb5b1dca 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> > @@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
> >  	if (prxattrib->encrypt != _AES_)
> >  		return _SUCCESS;
> >  	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
> > -	if (stainfo)
> > +	if (!stainfo)
> >  		return _FAIL;
> >  	if (is_multicast_ether_addr(prxattrib->ra)) {
> >  		static unsigned long start;
> 
> You should Cc stable.

The bug isn't in any stable releases so no need to Cc stable.

regards,
dan carpenter

