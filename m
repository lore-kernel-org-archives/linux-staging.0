Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B5F72
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 19:40:12 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id x188so469214pfd.7
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VfLCGaOV2wAJvv6o64cTzjS19Z38bR4c8NNaoufspPA=;
        b=E/h6rdIsTCLVfZtWslWRMtGS6ovDjPY3DC/jf4LLhXi/JTNHx5WeLdEA1PyaRI7bmU
         MsUu0zRgyNDO6mfFTTS66Q4PuMMN1gajuPfi/V+83U13ZUMMQzMseGbYKEnM+BReZZZb
         4CRe92LAjV5QJ+6KwOBfLLdKRGP8rVMjdyxJyYWSfQ3mfjqliHAWthCqwyAU9tC9NV05
         2tOCIpSRvdO/WJcpKFSduBXji+NVb4f8w+7EYY0zHcpMULBj7ACPb/mwaDHQkO0tmBxS
         JWX/EWca6IHbH6rHkiM0W+gjwHASomDd8MtuzRlsSgTP1BM50tmWUOsJaMTgzYg55Lr+
         ckIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VfLCGaOV2wAJvv6o64cTzjS19Z38bR4c8NNaoufspPA=;
        b=BC67pgTTg8z6z2UsJE+elCx0bOADAJ7xW3I22wIpxVvojgbNxYrOPJ50XkZNcD19hX
         sZ1unBVV21dJhWbokI4wL37S5lYK5cjV9VV/JvqcjQ7PCCG80qONS5xX4cl/j8PYC//d
         YXx6p+ApGQj/YWeNUj1VvwJTfkmIaeWr9a0JG4b1Z/Ab2tVyJ3uv4hjuj6wIgj1hdbuh
         mBp2BsTap+OcETA8XeznzDeCK9BQl4lxJJpCguhOLlzax50Edlp0eGp3hmMCP+fO8rvu
         xJ5LgQlRqcMz5vFSjgUaj4cLaeeRwBORhYSB9dEr81FqjCDeghGxNz0YgW5noaN9DSB6
         +ckQ==
X-Gm-Message-State: AOAM531iGDzg4NoEEFPfEje3OWTY67CiEpMa0KbgLbLcjHCXTo9vVBBQ
	xrwfPahccQcS7XBdHFnzoXY=
X-Google-Smtp-Source: ABdhPJx3mWS6Cw2Wndc9jYPUSJj4ufeF4GrrLNChiOeOgxouJt7uqleK+xoiH/ZjFOxIVYcSDxvJyw==
X-Received: by 2002:a63:4422:: with SMTP id r34mr18228607pga.275.1621021211978;
        Fri, 14 May 2021 12:40:11 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id h22sm4649955pfn.55.2021.05.14.12.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 12:40:11 -0700 (PDT)
Date: Sat, 15 May 2021 01:10:05 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ7SFVInaYgJLywS@fedora>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com>
 <YJ5/tqFfcjxOLsF0@fedora>
 <YJ6DrLiMsdkG5loA@kroah.com>
 <YJ6H/WsojYcN/bLO@fedora>
 <YJ6Jf+Z1ReVgDt64@kroah.com>
 <YJ6TUAowTI75h/sl@fedora>
 <YJ6XpUMliWQOS8MB@kroah.com>
 <bccbec1a0ffbf6c31b5e6a78cedd78cd64f2b8fe.camel@perches.com>
 <88d7da63-d03c-7fa3-a881-aff8e7b4a618@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88d7da63-d03c-7fa3-a881-aff8e7b4a618@ieee.org>

PS: Thought I should clarify why I think it might help. The macro
definition for gb_loopback_attr, calls other macros, but since these
macros are not in all caps, (I apologise if they follow some other macro
convention that I am not aware about,) it makes them look like function
calls. And I know it were lazy of me to not look at the individual macros
themselves, I think it would be a lot clearer if there was a way of knowing
that these calls are infact to other macros and not functions.

Adding declare_ as a prefix to all of them certainly helps, if only a
little, in that regards. Functions are not used for declaring things,
and since the gb_loopback_attr macro itself would have declare_
prepended to it, it would certainly give a hint to the fact that the
calls used in the definition might similarly be macros.

Once again, I do accept it was my fault that I sent the patch without
looking at those definitions more closely, and not considering that the
developer who wrote it must have had a reason for doing so. I just
wanted to clarify that renaming them might actually help.

Regards,
Shreyansh Chouhan
