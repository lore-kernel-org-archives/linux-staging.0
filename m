Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573041BA98
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194618; cv=none; b=Dyrz+6WW9dEgWdgBOqM/S5K97Y8XP3pBSvFX81JnmE1GzZmnKKnE4W3hT/JMAQrWPbDlW26ti7Nf9HJ1qVgBSiryM2QxyVQsT4J1qFUt9Wye9OMNKCIAScSX/N2wawvqBN5M9QlreYi/mzrH3vhtVwWz6ibFCpoBB0nVWwOhhRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194618; c=relaxed/simple;
	bh=GYVffwSyA/tW73L1hgZM9lALroKhDjOBd+0Vmma8slA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNGvGYqYO0mSShr8RWhizetli6KZQTqzfULUHC1fST0LGB10QCcwvwOgO3YysbfsflkB7kcttJp+ArGhuXYECxgij5Z9FjGk35Barv4xo6d574GZfuucW6xTCwzzxsRsTuaza7L83Fh+SkYAlmffmwIi4TikMCjc6b8gQZcFM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6IHjBBs; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6IHjBBs"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35d0be18c71so1564030eec.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 16:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194616; x=1792799416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8SJKkat+VQh4F6rl2h/cHjhe4hX3sReiQ/IZr42ROVM=;
        b=X6IHjBBsjZatc5BswiXprBvGr7Pwt5bdJpZgwSTxNa1WEIOFzz0huqx3EoTwWQUAfo
         EzBt2Qm1zKkFxkTPUmYOSsm4kyvidTp2T1cu4GFW5vEY2ZLjPswxf6/7VkDtZ1ptvQW8
         AftuJLdy2p6CogQEg/5jSa+kzUzm1ThWr/CJPuQBOpOMr13BM9tuhULvUfzwPLfun8kC
         6TeF0Y7Br5yO68KBzxkTEIYhtpfGg8wa4hF3oKl9JOIsF4aiJ0xiYJVO79cajsguYD5w
         u17Sfg91KWvzyP6mGkA6SNNdrW4AvLsyfjm5TmOaKudJ25uQ96fxw4bZOB1C8cLtg1lA
         KY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194616; x=1792799416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SJKkat+VQh4F6rl2h/cHjhe4hX3sReiQ/IZr42ROVM=;
        b=bh9jfOIjYjlES/OkPXZdvuTXduhtnp3xx2PCig+6gdCFxtpisyEkEqvlCIfx09+JKd
         qEslZLL0EUwDq+J6QXrJ6Efp4mZvyC1QjOqFuJjxgR6xw6DEkTelos35EczJ7q4t/B6x
         1ZYc+rgh9YDo4Oj4/hccXIPeGFDkimvahMwQ12ZeycTg+yWC+77kWI1uUXAQwh94fRG1
         9Y1oWC2xJgxR3qNY0udbvWaufPprCZ+4NiUkmaIp6ZtljLuqs9seW8FVyNgRwQsGEPo+
         bU7B/l9BafPlkqZhZHCFPe+P/EfXGpM62DGMXixplC2D6Cd8paxBJ9ZO+2M24gCCXL/1
         xyYg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ554Tl9/Z09V3NbDBhgWafL7LP461nORICGZuK6y8YHKoPBvKjUEKz0T9j40JLIlXFVEvivwc6Qp8pB9W@lists.linux.dev
X-Gm-Message-State: AFq9FYJMp9F7vgdIK+rYyLL1EDJLbKyId1CpwuMyOMbP3fwHxmniA5wJ
	5X42v42ulK5bprgsDvLQIs+Yrt5S9RX9bCWG6qEuH8y+it9XnWQlysoM
X-Gm-Gg: AYBFou0aPnDAM7m+jA1XQ51J/DDCgFcORY/pbZSKHc8lg2JvvDe5ce3THBt/xOXWLtZ
	/lX98CfeNTJk/ZDoqCZg40Ay3Yqcl9WKcT/MmMqPtoWIXl0h//+PECvjwXvZ5Rw5o72UJyoL+2F
	n+xoOGDFg9uVGlZk5fY7Tz9tmAHi99lOy3P+Ip+v1PNr0PF8DS6e+/kgd+0zNHmlefVdv1ZsqtH
	vfLY/tYQpHepviTecIGFV/XZ45izY4bWGhovyr4+cxObDHhpDOm6QgrOH2ctTBSMli3BuG+uquc
	j/ynlbTISlFFMYTJJr4mZHT+D6FMgK8BwFHpTRwivZFsKuMqaZXG+x3K7smCmZZvBlDvs5Q7+L6
	DOJvjrmODIi2zKWADf7HG+ilbLOCVnQvIJxb7akn9oE9L+8n6udgdOatXFor7r2KBOd8tyIcsHO
	H2fwytNaGSjhlZDSV+/bZhvh+iHv9ehI/xv5PGKMYKQXKbO4M3VKlqeULNMalr+756pz4LOC2GK
	vQ=
X-Received: by 2002:a05:7300:f0c3:b0:35f:ab1:4792 with SMTP id 5a478bee46e88-3602d6e460dmr5639283eec.6.1792194615855;
        Fri, 16 Oct 2026 16:50:15 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a69d:8570:9766:5ea])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9584342eec.18.2026.10.16.16.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:50:15 -0700 (PDT)
Date: Sat, 17 Oct 2026 05:19:59 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, rmfrfs@gmail.com, vireshk@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: Align function arguments
Message-ID: <atK4JxHU2SmM-HbV@user>
References: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
 <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>

On Fri, Oct 16, 2026 at 05:34:44PM -0500, Ethan Tidmore wrote:
> On Fri Oct 16, 2026 at 1:36 AM CDT, pavankumaryalagada wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Align the function arguments to follow the coding style and
> > improve readability, addressing the alignment warning reported by
> > checkpatch.pl
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> 
> This doesn't apply. Are you using staging-next?

I'm not using staging-next for this patch.

Should i rebase it onto staging-next and send v2?

Thanks,
Pavan

> 
> Thanks,
> ET
