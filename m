Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E43DE446
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749124; cv=none; b=hn6BCAu2P28xfcqpvY01gmsOc/WXckce8ssRElqS1kvw2DEZlJPHzvXlNySOh5i47Rj2rdNBrI7drJjfJjMvkRdcjwII1aBZChMKqh5Z/5jyLhLcLYNd3eSWPiXuqBGjcHLBFDeb01ZStBR7CrvFT6aljGEajjSzCQH8WoH+FW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749124; c=relaxed/simple;
	bh=09CoTliJM0nyVjP3hQHtDfOxZrT+Op/MGS31EN2IbG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPofZmoJJhm2Wj9992XtlgOshbQOa/nl/rKJfmZ9PpvTCQ7opUFfmDl/voeC4EyNh6FO3MoFFdxYTxTtA9trQ/NdnOuNdtCzE9jTwdc0GLiqgpZeaiDlzVE0PAJV7v+V2KKfqLZKRCKyb+x6Mtu6VvPBRgh+cY3YGjKvcc46ARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMR9PBBx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMR9PBBx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso52092665e9.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778749121; x=1779353921; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3qt/7vR/Iml6VkS9noPU/Zo5QB0R48kOuliLAld6I0=;
        b=SMR9PBBx1Vdo7FWx7X5tooSL8MTTH2KTfHHut/DtOmLVRPwsDNphggmjHaWbZYxR9Y
         5OzTk8xQ01iZ5v4rAnieFm9DrqHMMVVL5JF/5f7xDVkOYJrmlJz0jJdEgeSzygqQ4jaF
         egvgkcFTKnK8bmVC11oamL2kOBS1ZXRAA2iwzQD5Q+JZraXxWdvjBxArq6L/zBwg0+rx
         dF+QVYpvh3rTdhtkja/0WB4KQDNy9Qa4zuCy4TGRwLdmjhmA9GsHLU87C+xM4iUNF3ZO
         fOCyyP/mZhW4kK4x3lA4ZJvz03d30GAvqbsRtu/K0bYdJ5sJoAdNAxSgnuB7D3dpVeb6
         GWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749121; x=1779353921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3qt/7vR/Iml6VkS9noPU/Zo5QB0R48kOuliLAld6I0=;
        b=moAS5dplDUTJl6g4fUVKLy8BIHlIojgr/h9A9amLfZC3dct95EgCik/jwpQwwAbcmz
         dEWoVJ3Kgo/VR2ATLE9lylMhD7lZurJSk7pvtJvTRoL2BAYeOruMbHWSkn1+QG93Zd6m
         oRzhVAWW9UNhOXB4t9sJy6fdCG3g5XqH17H9HIGEr8Nr1xmNYnhYePNqexdiS5HavNWx
         kOQ86p4tkiMjS1/u+EOiXOPFaptmslpqa5vIg3QmxNswlLmqVaKB6SXhbWzRvtXfgmHh
         GKInGD1XorBLMMWUtaoJSe4KY+Jadxlnr9iSpITDos+0v+uJdK2IZr9yOMCkMDXNC//O
         eWlA==
X-Forwarded-Encrypted: i=1; AFNElJ/gwO0hkQPNtNyxbwBM0vvRiBCSBeAysUjd7kqV+qc7NU8zcceimD28q359AcorYRHkGEFxoPdHupvL4bjM@lists.linux.dev
X-Gm-Message-State: AOJu0YyS4KqW96iePz5K58BDIc5dba1YjB+umeCDirflv0DLX7AnCvAx
	H5XCMtTZhDaNplHhv3T85/0N676SqqopN8Ms2QzlBP81yB9OW8xNgtYq
X-Gm-Gg: Acq92OGJAhXPZgoluQWljr3Q0fRxbbC7HvUP9dJNr0CQZfNaMUrYSnUVAAsDU2X6Yti
	Kw8S35wKUSk/j1laiaRC3iLLq9dakH9iTrVlg0IatxtEiGDafEdFikQEPiJlUPiXM4J+qaAqIlQ
	BFPPSaWYauH6JhLVS2uDIelzq2bG6Rh690q746REUX5O/Sl6eOu1FTMtiqDNArd2t40608pbp88
	gXldRirMBZI8WYLKCO4Fp6fO03jZHVfiD/0Yos9HjaLFQRa1NYHQfL0xBkiuRuQstGwo6WDD/fe
	YymF9ZM0UtHBXIE7kDr70o4J3PMvGVzrqqqMksnCRL2Ou691ZmEP1B9y6IaCqFmkyb+Bia+/a6F
	uWVnjLsbBympZqCVNNb+sREoyAzw/uL9SE85qpUDdzLUM/qYoLmSSa0JxRL8gRqS64hYWNd6zz+
	6kkSTPdqwDII9/nnNBR+AZSHj8X3PoDQ==
X-Received: by 2002:a05:600c:4c23:b0:48f:dedb:bd8b with SMTP id 5b1f17b1804b1-48fdedbbeb5mr7442475e9.18.1778749121354;
        Thu, 14 May 2026 01:58:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd648a7e5sm50841925e9.3.2026.05.14.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:58:40 -0700 (PDT)
Date: Thu, 14 May 2026 11:58:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: propagate errno through hal xmit
 path
Message-ID: <agWOvYdEQvHFLXhF@stanley.mountain>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
 <20260514060323.24895-6-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514060323.24895-6-dennylin0707@gmail.com>

On Thu, May 14, 2026 at 06:03:23AM +0000, Hungyu Lin wrote:
> Propagate errno values from rtl8723bs_hal_xmitframe_enqueue()
> through rtw_hal_xmitframe_enqueue() by returning the error code
> directly.
> 
> Also update rtw_hal_xmit() to explicitly map the boolean return
> value of rtl8723bs_hal_xmit() to _SUCCESS/_FAIL, clarifying
> the return semantics at the HAL boundary.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

I was onboard with this patchset up to this point.  The "Also update"
part legit confused me when I was reading the patch.  I don't see how
that's related.

The second thing which confused me was that I was expecting the patch
to update the callers of rtw_hal_xmitframe_enqueue().  It turns out
that none of the caller check for errors.  This can be fine in
networking, in an xmit error case we pretend that we succeeded and
that the network ate our packets.  Very normal.  However, when I'm
reading the patch I want a comment to say, "None of the callers of
rtw_hal_xmitframe_enqueue() check for errors so they don't need to
be updated and this has no effect on runtime."

regards,
dan carpenter

