Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F50347BDC
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769623; cv=none; b=JNvUgOPuotOKKZfF/JgG138ap6QpfkFoaqJrwNrRna4tw4+bVjSFVJizx+t33XPz4tJ8h6kMgwqGUq3e6xSrllIWBEKDGr/Q4XfEH/vnU/h6M1ICg+/YqbdqtQ3nw4VMmLCOh0pMHC9nUTZvYUdWjmRauNAdpcRSFj/RRw3oUS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769623; c=relaxed/simple;
	bh=0hxTFyH+Drg4XaXLMhTbZXnKpypzLiKD23jnn0z2jCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwdQhhNnGuL/7TLUhu59I1i/HsgF43ZuaD6TfxxJG4OU0+ThmOF2q7ugUufiCppgMfhc5moDXwP7cZjD/y/Q2WPiFu3rBVGWG14Rwn0EIDHAAgPuEcIaLNgrHPrtUUr71HD1fkpDeZqjndZEQzDV/nHgM0u8ob1e1ZSdxSGqTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTPIhPOQ; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTPIhPOQ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d2945e6adso17863101cf.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769621; x=1776374421; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVE6D+Iu3Kbd4mpOkdy6mcb9DFuU9PqxrvHU9ZryM0c=;
        b=JTPIhPOQ922/tDA2wu9ezU4Il+BRPBwA0fQKUcNpJxYfgYOjg6emoDI9DebURGajdt
         BMGg+RGxCfrMHSWlsHMYHroR6frpZrHAUSR6N2lUjF0L+9PVt+6EBIxmPaMMeInkq2F5
         VA/eRgPsdkLJJzCeGJLkayleITFeCF+DhrTqdTLSC93LBct8Mv97nISrpOmn9an+xtr2
         CZ+1sJWOHwdHP8VCqwyUnov0Gy6NfkfYdjKVSZisg1uphxfcPFT5SnG+8nOhHcgt7pxw
         kTPfthiErpLhvwFyT+6GOMW79sV6U4aQbTz6Ws4xICta8ABErI3JNo9uT/8DkfzhnjwF
         ulmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769621; x=1776374421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVE6D+Iu3Kbd4mpOkdy6mcb9DFuU9PqxrvHU9ZryM0c=;
        b=S5Z1ue+79LpE76Rm1mPop2e/AE1eyQaESoqc6sRVfGgwAtRKBvtw8qjGcJc945wbrS
         bMeaNTbEeSA/LrWd0F6ZXMYQf31T4SxsWXXdp783ByaVEIoJ2MlV9ubB5zW4xOO/lXCo
         QDUDET4kXt3GXd+w3PBEuC/ff2JbFk9LLoh4Kgbt/jGcwxtE2nIkwtYh29Uxnwr20tkT
         PE4M9LUgUEa7VjkNuyQ6CjMu3FS2ZEiImjds84vW/9Fht3ZuxWyU0nLIlTu4mEmbUf+u
         Hnb+EU0z7FZb+WFSwqt7kn/8YAavM686/bglvK/gLgXy3Hl/Ma7CQeEJSDlc1+FoOasA
         hHJw==
X-Forwarded-Encrypted: i=1; AJvYcCVidLuwdObb/xWN7MeIMsOEaBS676pYRVmNH9qPO9jiIg1r4o4/C9XPeJHm0z3u63kmnDm/Wn0yMJ51dTog@lists.linux.dev
X-Gm-Message-State: AOJu0YzCVyIi0TgZBPLJXTVqXocGpiEUDmV/YUrDvjQr1urCI423C4bj
	aOc7bSN4bm9U6uNFd9iaaWai2bp6Aq2Kxq7gRMXkaSp3aqKyZy7kAryk
X-Gm-Gg: AeBDieugKo4uyrK71GyGgOJh0n3yXyoucNJgznjLv4RCODzd2g+uWUTafs+3jucJqOY
	KhrSEYbT/0LuCklAAvtpHm/Jiv0P+/MI8rYk3NyHqunS5H1f7Gp1IH3EnPfEs53OLAcmPjlGHEp
	RaNGb0HPZUb2dnBHvclj4nCUd2vpmu1h70UnWFltia0XqFmIDddgUh3/wLJyWme7TRGull8Ge2W
	SJgoqG/9ECtPPiAvfmcNhaY1KJtEkKcyC/DIRMmB2O/CZ0QFOwIgXk1TSVU6ylw6QPmxOuF5TAT
	65jwhKehuqNU2hCG47ALzqXvQx8dlAPbVk4IWzRaZN/aH79jPaAhJ6g3mA4VS91y0vQ6dcRiQZq
	uKCoXHaSw0ae5VjUzXrVudgOQi/Yv5ycfb0RPEEMFmHRth07LKmTIUSiG38OUl7YCDeSAZwjPsH
	C8ywCuvF3m+lYJAdLHQzFIqqpwLyzBZNDzRCwGTtJkM4aUo5K7reHYO5Kw+rB/0FJ1Aa0BXg+md
	iU=
X-Received: by 2002:a05:622a:1449:b0:4ff:c17b:5ab0 with SMTP id d75a77b69052e-50dd5b15992mr13568771cf.9.1775769620811;
        Thu, 09 Apr 2026 14:20:20 -0700 (PDT)
Received: from localhost (mobile-130-126-255-6.near.illinois.edu. [130.126.255.6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd53f2d79sm6046731cf.9.2026.04.09.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:20:20 -0700 (PDT)
Date: Thu, 9 Apr 2026 16:20:19 -0500
From: Akhil <boyakhil978@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: rtl8723bs: fix comparison to false
Message-ID: <adgYE4va2Eg3V4HG@Akhil>
References: <20260408174011.115915-2-boyakhil978@gmail.com>
 <DHOO0ZO6AXHN.31AC1MJ5PUKES@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHOO0ZO6AXHN.31AC1MJ5PUKES@linux.dev>

On Thu, Apr 09, 2026 at 03:41:06PM +0200, Luka Gejak wrote:
> Hi Akhil,
> I am also wondering why did you decide to resend the patch as it 
> impplies it was sent somewhere else, but I don't see it anywhere on 
> mailing list. Did you send it only to Greg?
Yes, I accidentally only sent it to Greg, I realised this and resent it
before I could get the response from Greg's bot. The content of the
patch is exactly the same.

It took me some time for this reply as I was understanding the correct method to reply, let me know if anything can be improved.
