Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522110780
	for <linux-staging@lists.linux.dev>; Mon,  7 Aug 2023 15:13:46 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76595a7b111so329656085a.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Aug 2023 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691421226; x=1692026026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uur4kbHWMbvbwOkDXCymcrT3HOQZL6Apml/tJhcRoXI=;
        b=KCndBI6wgPbEZIS4Q5OE6/jTs7/9XSLveGSEG9MJEm8Or3aRhjTyLdRhirnLYB+hrQ
         GiD/IFY6BdrQIkIu+6vyCwF5dDW033hjzqY9T/vfA9GxWwracFnrU1u+h/XbGuqGJZa3
         BL9N7D8o9hU105TCsdbxVoQVyDhx3Gb3uPF3diMWYOKi7hUktGtq/an8rNImHV+k4YkD
         EVbhx5Agi4PJrYoMVCqVBSWTRMkt9i/1/mkBJaFJc5fYEPIGiT6Hbxe6HYu+XrHftLjW
         RrhddGms1rRy3FAQNCmTwXpYWji1wzutDlhYF6tjp7iSs6WKRbpyadfXqOnS4zt+6B54
         KzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691421226; x=1692026026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uur4kbHWMbvbwOkDXCymcrT3HOQZL6Apml/tJhcRoXI=;
        b=et7StyEoPLynKX0cMIKD2ewYcHjEe7VLhd/cHuN7pUmL5XWxoQhbO+FzQVT+WqbCE4
         OceOd/yVSR6i/cZlYNH5sE6nNr2QHJggkgY4bYruHx6wW0L0U/y9p0R0LQoumkm74TcF
         NZSeIsh9o+n/HpxboqXIxfqas3bBcXPtlqgDNMfzcOIDEEXwhpizigVaOhaUEZ4uGCHy
         04eOWqKUOxfDIld/zceGBKUW5ankpWczp5OnbavijjUcPGNSWlXkPK4k4OGCR27Ww7K+
         xe9h++m68M/u9xqty0uAKrHLft9RGHjF9zwbVE/7uPrKXP0VtMCxHNkk6e0Q31yBvqfO
         rDwA==
X-Gm-Message-State: AOJu0YxCDb8DUqckLANDbyR95+eYFrUB8v65El3THCdig3Z7KkrDNMCU
	pWAsHPIRoUjFozpYw6vywmE=
X-Google-Smtp-Source: AGHT+IGzWGavyM5RHvSarI9BxLEm18ljH6FzqkXabSCDqDt2ehE8J3z7jezUd7h4TwClDHjg69abgA==
X-Received: by 2002:a05:620a:b5a:b0:768:535:5950 with SMTP id x26-20020a05620a0b5a00b0076805355950mr10720544qkg.68.1691421225593;
        Mon, 07 Aug 2023 08:13:45 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id pa35-20020a05620a832300b00767b0c35c15sm2618353qkn.91.2023.08.07.08.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 08:13:45 -0700 (PDT)
Date: Mon, 7 Aug 2023 12:13:40 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZNEKJH3mEoOwV6eF@alolivei-thinkpadt480s.gru.csb>
References: <ZM1rsu0M22HHtjfl@alolivei-thinkpadt480s.gru.csb>
 <2023080510-vacation-support-7afe@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023080510-vacation-support-7afe@gregkh>

On Sat, Aug 05, 2023 at 08:14:33AM +0200, Greg KH wrote:
> On Fri, Aug 04, 2023 at 06:20:50PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Alignment should match open parenthesis
> > as reported by checkpatch to adhere to the Linux kernel
> > coding-style guidelines.
> 
> This does not describe the changes you actually made in this patch :(
> 
Hi Greg,

Thank you for your feedback. Don't get me wrong, please, I'm just trying
to understand it now, but honestly I don't know what is wrong with
it this time. I described exactly what I did in the code: ran the
checkpatch, which identified a lot of "CHECK: Alignment should match
open parenthesis" messages, fixed them all according to the coding-style
guidelines and comitted it.

This is the same thing I did previously for the file
drivers/staging/vme_user/vme_bridge.h in the commit
7d5ce25fb4c3cc91d16e27163dc141de0eba213b, but now is the file
drivers/staging/vme_user/vme.c and commit
a1f0b0a8ba9a496504c2e3d4b37cee388e78f0ea. Different files,
different commits, similar fixes for the same warnings,
and same description.

The only thing I found strange is because instead of starting a new
email thread it ended up in the same email thread as the previous
patch. Would that be the problem?

If not, would you mind, please, to explain to me what would be the most
appropriate way you'd like me to write this changelog?

I really appreciate your patience and help.

Thank you.

Regards.
