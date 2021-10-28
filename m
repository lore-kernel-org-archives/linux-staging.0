Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BA2C82
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 14:35:33 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id p14so10546905wrd.10
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=R5vDRCLKxQuuLX1TwFGPbSTqOd5q7X00mWAhulDDMZw=;
        b=d19eLgmUE6YJ9vGgjKB6ybiHXJAI2uxh7hMaJObS1KroNKXF3fMK8rNzbwdq/ZWar3
         p3iy/H1QNY6HeNNiqWNF/v1sHbAILUjCpoG9gpjKRUVbAEVZp9bnbAfjf0GiejwFF7xJ
         MFkehtgenVbAJAFlff2zdRjC3TY3p2lORZa7Li8owlqIn2SX0FQWT6KHEHh7xaWfMbVU
         V3D+fgbGQJsGI9L3LfBY7SxvxxvImD9km1+Qi6fVjfh49WnxXUCY5j+pk+0ocvwPQZ6C
         1Bb0MyzUwEinFPAGgIEzigUOCkoJRWbVB5eZA10P4z9IIS/QaSPN8Rc523d0MbAzzQHh
         PoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R5vDRCLKxQuuLX1TwFGPbSTqOd5q7X00mWAhulDDMZw=;
        b=fU48uXSn4UR82wqajUts+xQIcVXPbry75nYKJj8/8ty+hWiXSegN4pp/vDLESdz+bS
         UOgU435o+jU2X88HMV4pYU5UytkzTcafm0Ol+n1BK6QUldVcDxjnMZMInSoTvEHtiqhc
         6Em1MyAN5XLi+S+M2e/8inQ9ISXjd6Ov8YvJYaYN7ZynNegEW4DLyfniuzaWxCOkAtQp
         hbd4bD/42cffNW1I2VPcPZa2FJ186y/WChbd9spQS4djJvyN/YdigYzyEh0KF5bUq2Du
         SSQuUntkzlie6tr+g1U85CoHiyZOkga87OGlcjt8aFKxcuyeIdHMEgRZMOAgJeXCsFl4
         j+4A==
X-Gm-Message-State: AOAM532BlbnNy6hrO8W6+iiHuWCpLSt4D+4VXMKwOWAzqTm+H4M9HAyd
	DaswkNWIyzOFCOnjgPFMroGERKoh4rr+pz+FziI=
X-Google-Smtp-Source: ABdhPJwz/IS5dO4n4UdN4ULl3moVosoEDMKzH5Z5uYS8lRPkc9YdMTNCa/FeKPIDIfjqA92Ta/3fEA==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr6167781wrz.260.1635431732069;
        Thu, 28 Oct 2021 07:35:32 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id t6sm2025392wmq.31.2021.10.28.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:35:31 -0700 (PDT)
Message-ID: <6d2590b127499ba7ae1e7bc36d71064a5262659d.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH 5/7] staging: vt6655: Rewrite
 conditional in AL7320 initialization
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>, "Fabio M. De Francesco"
	 <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 28 Oct 2021 15:35:30 +0100
In-Reply-To: <alpine.DEB.2.22.394.2110281505170.9518@hadrien>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
	 <948406a3e7d23f1cdf866aa4448d9428bdd32512.1635415820.git.karolinadrobnik@gmail.com>
	 <1683328.aCfAWUeHFl@localhost.localdomain>
	 <alpine.DEB.2.22.394.2110281505170.9518@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-10-28 at 14:36 +0200, Fabio M. De Francesco wrote:
> As far as I know by reading some Greg K-H's replies to other
> developers, this 
> "<test> ? <true> : <false>" style is not well accepted here.

I thought that the expression is simple enough that it can be written
this way. Julia nicely summarised why I think it's a good usage of the
conditional operator. Still, there's no problem in changing it to "if-
else" statement if that's the preferred option.


Thanks,
Karolina
> 

