Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2A70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 17:32:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id 1so4794827qtb.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nV2M8/c+10AGjw2yP0rJTp7y36CrYygcmUernbLPOs4=;
        b=S2lThKmRbSi4ET8sSkfgwAosLA9Py1DDkaOQYihAN3a8vGnnb+juWQb6b7WZxNC6n7
         e2kpy/3DMJhEatfnsDmottKR/DgES7P4lQrtY0f8ycC+Cy5HIHDrJOi/9ZMe/bIKLHKo
         l2gdfwD9yzea+JaVVpRGQMLAO3iz25KvRNBC3s09gu06TOXbgFwLhtlzt7AiguJXa/P/
         kUxpMpZ+8gLyA/OaVNNYWpFSVjzIqMEt360rEuBOPDCirjUVzzfcboTbWVJCDhb7ZVUN
         AHRr1UbdD4bVeBfrcgbXSYJ4nl6Xfx8MjWGJioh6Jf2PDfpHaTrnLUiJijBhYNwWpeiK
         KwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nV2M8/c+10AGjw2yP0rJTp7y36CrYygcmUernbLPOs4=;
        b=LAZ6FuEOB1z0uO1uLPLl6vSXEa2nqEf6r+JjWPwoArajLNAzUUVp6UPpZJiq6dYwMx
         2+GZzMHcVUOOnDcyN5cvP5I0WLbAHhYq2stAOQ8o19GoMRp1/jaIjJHNPdq5N5E5p7Jg
         s95nm8aIsuwgk8/7vtXR6i01//vmOz03Rw+2cpiYBEQCiRVhThQ1yVon6oMY6gMQZ8aS
         /3f7tlHg9lMNx+YQ3UnxrRu+HHOEgcTrh+dgjqoPtOE2Ls/VfykRugTQJvE0GjPz7oIK
         QnD9R+PKAj1ZSiQmrhuPILqGuWwoMoL8NR1LkLrGkURwG1ru8yC+1LZagdrQzTLT2pYw
         7b/w==
X-Gm-Message-State: AOAM530otHHzVYdeRCME8JjouVQrOxW5Qp+XAmcqwq1NWJ1c3cqIJnYE
	Pf+p85kl2PV1YJ0zHVkRjeA=
X-Google-Smtp-Source: ABdhPJxju2Zub0/ScOfP492j8V3l/UzG+PDDdW9HutBRWqwujNSFTMaYvzVTSJ26X1StA9Ui2ccUGg==
X-Received: by 2002:a05:622a:1701:: with SMTP id h1mr13790042qtk.86.1617989525749;
        Fri, 09 Apr 2021 10:32:05 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id k126sm2247988qkb.4.2021.04.09.10.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:32:05 -0700 (PDT)
Message-ID: <d61f00228802cbc49531424d3446745c9b27afc7.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/2 v3] staging: media: hantro: Align
 line break to the open parenthesis in file hantro_hw.h
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date: Fri, 09 Apr 2021 14:32:01 -0300
In-Reply-To: <09b7bddcba779ac1ed0c71cebf206f9bb4009f47.camel@collabora.com>
References: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
	 <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
	 <09b7bddcba779ac1ed0c71cebf206f9bb4009f47.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em sex, 2021-04-09 às 13:45 -0300, Ezequiel Garcia escreveu:
> Hi Aline,
Hi Ezequiel,
> 
> On Fri, 2021-04-09 at 09:24 -0300, Aline Santana Cordeiro wrote:
> > Aligns line break with the remaining function arguments
> > to the open parenthesis. Issue found by checkpatch.
> > 
> > Signed-off-by: Aline Santana Cordeiro <  
> > alinesantanacordeiro@gmail.com>
> > ---
> > Changes since v2:
> >  - Rename the commit messages properly
> > 
> > Changes since v1:
> >  - Send patchset without the cover-letter
> 
> Why did you remove the cover letter? What was wrong with it?

I got confused and as I used the same message as commit for the three
files - cover-letter, patch 1/2, and patch 2/2 - they were sent in only
one e-mail on patch 0/2, and the files modified weren't marked as patch
1/2 and patch 2/2, so I though it was wrong and sent v2 in a wrong way.

> Thanks!
> Ezequiel
> 
 Thank you!
Aline

