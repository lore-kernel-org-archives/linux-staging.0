Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E24EA8
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 03:50:50 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id lh8so9411314plb.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681617050; x=1684209050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1EV7rnGqgJooE9h+THqYmlRcBxwugQCSpvoxAvYNE/A=;
        b=QaOHvAewGQw2YCpt8SdVomtjueUEB4Rf9npQkKcK1CwjYD5Tl+Nm8qVhTe3PVWbutt
         BASIhdjxVHTKQwBxQEqWLZirgs8ezoU1p0PnMPzcWoKjVWngE9SwCvdVUO3C/rHJJPHw
         VJKrPTBNYGieAYQdvUsBqJNE9Q4ADFiHwqthEfvrkixBAciL4BOIbOnmRHh3JS7ntuPQ
         vXkpBp4SLgKdMJNmYf6xjFmI0cLtozC/6lFcsPoblypTNN//GshPVErdwzpDpAjiYGmX
         HjfqfHLMCylQ60BLI8qPG+VFRTcl3BicUVpyoAvajkg0GbxtnBUOzHB56DeoD82n7ZZ7
         PMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681617050; x=1684209050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EV7rnGqgJooE9h+THqYmlRcBxwugQCSpvoxAvYNE/A=;
        b=h1s76WJP6zGVaTPgHYIDh6GYErotu92gdAwc0kPzg4szB4+CPBypUTG4feM1SawyvL
         P8uyUVRb7mWh4qKLvkAbpaiZxLypCezIs+5d8qxHD8blDVwsaH1whSwPF/RL3h220d3H
         XxDc8rQYA3Aq/JlRafDqw8isVRGrTPlF6N4QM6XGw6f659PurwO7IxUCbSY8QwOWrL+M
         tfdcTIXTYrKs66ur41sZtZVSxCnGGP+BALpoTcp/SON2+JrnxTr6Qo+pXOp3m5obpIsZ
         OHAVHPz0feW83CCfekM8/y+9qGsP9iPHEyYrCKZ3DbACsUMmaZ9AdvugzxYyqlxcdqEZ
         8xWw==
X-Gm-Message-State: AAQBX9cFllIRIcNTbogCj5IFYrrq/SU/pOBDZqzDRHMGtSSRFlwblVil
	bHNYN4hqCIMkp2xm5CuttCm/A53ElpMPpA==
X-Google-Smtp-Source: AKy350ZE81+STyKF0GnwRNnbKMaXqxVv54pCFm7VyRJzQ96AFcqUKVg5XTm1jFGnDqNJSJsz+DIW9A==
X-Received: by 2002:a17:903:1d1:b0:1a6:c12d:9027 with SMTP id e17-20020a17090301d100b001a6c12d9027mr2481121plh.56.1681617050357;
        Sat, 15 Apr 2023 20:50:50 -0700 (PDT)
Received: from sumitra.com ([59.95.146.80])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c24100b001a0667822c8sm5308585plg.94.2023.04.15.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 20:50:49 -0700 (PDT)
Date: Sat, 15 Apr 2023 20:50:46 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix alignment to match open
 parenthesis
Message-ID: <20230416035046.GA267177@sumitra.com>
References: <20230408165151.GA261885@sumitra.com>
 <2023041516-lushness-neurology-a728@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041516-lushness-neurology-a728@gregkh>

On Sat, Apr 15, 2023 at 05:54:24PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Apr 08, 2023 at 09:51:51AM -0700, Sumitra Sharma wrote:
> > Fix alignment to match opening parenthesis as suggested by Linux kernel
> > coding-style. This issue is reported by checkpatch.
> > 
> > CHECK: Alignment should match open parenthesis
> > 
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> You have sent a lot of different patches for the same driver, with the
> same subject line, but yet doing different things.  I am totally
> confused as to what is, and is not, the latest versions, so I am
> dropping all of these from my review queue.
> 
> Please resend them all, as a numbered patch series, so that we have a
> clue as to what to review here.
>

Okay. Thank you.

Regards

Sumitra

> thanks,
> 
> greg k-h
