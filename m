Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A619AD90
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521389; cv=none; b=SmR/r6qBXgFKF+zMf5fyW6loGfnjCQPeiJP/Tb657339VTMHfg4TGZ6s/ir9yI+bEArDlrwE70yLlunJFRrTEN3UEy4IsaqkAKvVAIeQDqvrYdUBoeB8FUAeLHPC/IFmLKBrg4fx04PSUWvtMpBnntaz+fxP6q+8hRcN2lw8S1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521389; c=relaxed/simple;
	bh=66s51uy+/lRLbRCHamQyRPzSwgeCumtZMf6fvcpIyvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxzlLfOh9zUIWj7Yq9WiiAGSuuZhfu9QB1SX9e2iDKHeww1/U5XNO2FeVbTW+qU56fQfUb/NDUY6DEMw3QlaLj7tgIfO7lzSBayTjQULYRDup/4DVnCtDwJwKEjb6VkEK20dOXuVXOBLgDF0H7WZeulcDXs1H8YymAf9cWdeSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff30fUy8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff30fUy8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15b33f7b23so119091966b.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783521386; x=1784126186; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54E1QPCYQXbgOxCylcqW/jRu8+pAGbvN61J6tJxQpAk=;
        b=ff30fUy8IPCWjD9Ku9ykPl9tp00POib2hkhCfAB/65pxLdeUx2U2dil82N1fA0hLwQ
         MbNQLMKe/9edgIAVNXtYzVu+1ZsLnzVWbROe9uSWVweO5sZOYSFTj3RxwdtG7OtD1a6v
         y9X9GBAWiKVR1Mq4bf9prWfnrGt55x9N/lMCrNviZ6WQ8QUKMldYMpEMebYbBtPzA24y
         LRTQ5jPHzcaBMn2X/6A8tfQ65o0T6MVeJZf9sscjBQGb0BWr5ayH0N1N8kV7nAmMbTo+
         A1se7L7zwYGtW3bHGyKGdAg0fnLZBoLj4XSYslpAU4dykRk0t2knEw3jp3cxmYEcHNFp
         lWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521386; x=1784126186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=54E1QPCYQXbgOxCylcqW/jRu8+pAGbvN61J6tJxQpAk=;
        b=JkBO7LxWYlree9KfoHKfUnePqEsRJdWU9dlvO3gYzvtzlrfuKEVFNgLuKQu/5K8ClM
         cKaioTceZpl+3lRCXAxG1XmO2AGJ4576iGyQJWSBcuSBj09Rrnrp2tT1aajJf0otYztR
         F7JWoOClVHY2kQ9ifFHTffeNURAepKVeQwZ0n5V+/t2ZlE2rKz0NyunRdfCGkgpAO8D3
         OQ+vzUA6ycD+LtA0SxWTZRZ87DxWJbip3SGm5OC5A9vA/o+XRF6ZWTqirR+PKIcs4rK/
         fVtnahOIHUF1XlOiMsiaRXJCIyCT4s/gBnwd9+MTvR1HJ5uLP0ajDDC6ldcrOwt/uVVd
         a5Yw==
X-Gm-Message-State: AOJu0YxYlp/pMk01hFLigLY9G18b5QT+P14wN8YyVXXYx77kVt/+UuS8
	DFHwI0uImJB0D6DxUxehVtoDsmglluMmlIh/W99TgTK5qVnyP3Vf2UIlhlVxGQ==
X-Gm-Gg: AfdE7ckezN82U5C8e00gEtX16Ua3yG36DeHg45JE7bNWMxgQewLGCo5c5fLqb2BzSTy
	5+DvrR2sGnhPTg/SwpsWfArTvpxV0sd7Xb9TsiwrQHqLeOY76isGBwXY/N/peNAq78759GGlCIS
	CWu1cy95OcMsHBztw0/5dd+8ryIIIJuT2SFVZLNZwYZweL8R0HSLwZzgNRZsUY9xuqIK7cYiXZX
	+PocjWyn8QRd/D/0hKUhSQ8MOLwkM1FwDoUPUGset4oNA8jz8680BYZW7KdkiAblXuMa7kfZ3PX
	FqhLX2v2uNRkgJwUzoDjhx+kQf5LbBVVOlu986TBXNx9/z3guLlF03jzD4IQDvit3ifYMLw70e9
	IFI8g2iLAztAgw6lOnzWedVq/qewcAeF9jFNxvnkulL8CX/lNKlaTBTMaiHzmUc6wA5BZN4a9gy
	RLvJ3uxlYopL1i7zQq6uKM77iEeV+cVFbqHGoahVek5ulUz74D96HpNkgvp7BkkwQkWg==
X-Received: by 2002:a17:907:3c8e:b0:c12:a362:5cb4 with SMTP id a640c23a62f3a-c15ce16554bmr137993666b.61.1783521386430;
        Wed, 08 Jul 2026 07:36:26 -0700 (PDT)
Received: from fedora ([102.78.186.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ddb9e1d2sm25366166b.52.2026.07.08.07.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:36:26 -0700 (PDT)
Date: Wed, 8 Jul 2026 15:36:23 +0100
From: Jad Keskes <inasj268@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
 with named constants
Message-ID: <ak5fovHVro3YTh9m@fedora>
References: <aiGMXBNQ0TbIGbpP@stanley.mountain>
 <20260604151828.242801-1-inasj268@gmail.com>
 <2026070714-presume-spider-a28b@gregkh>
 <ak5bkRTGALDhBMAL@fedora>
 <2026070820-unclog-busboy-dad9@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070820-unclog-busboy-dad9@gregkh>

On 07/08, Greg KH wrote:
> On Wed, Jul 08, 2026 at 03:17:02PM +0100, Jad Keskes wrote:
> 
> <snip>
> 
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.
> 
> thanks,
> 
> greg k-h

Apologies, meant to send that to the list. Resending:

Yeah, that info is from the out-of-tree driver Dan linked in the TODO thread.  
REG_TBTT_PROHIBIT has the same hold/setup layout as rtw88's WLAN_TBTT_HOLD_TIME / WLAN_TBTT_PROHIBIT.

REG_BCNTCFG — check rtl8192cu in the tree. Same register, same 0x66 CW byte. 
Production writes 0x660F, test chips write 0x66FF. Only the AIFS changes.

