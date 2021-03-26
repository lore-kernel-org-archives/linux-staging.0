Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F270
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:16:40 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id t20so609530plr.13
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJU8eQTrHMk3jqYitTK0s9c/y4olgE5eR7itETLxMTs=;
        b=Pd0ExQXC3mxg2j0U3TrIN62e91Ss1UD89tIF6YsQtKtbQOwyFBGLxDCHiQC4mfcFpB
         CqAuCghwR99X9CaWGfNHYJoacATVqOVye3ARLpHFuOrsK8mOQC+NLSKztkvLgfPD3zRz
         4qUZ9TApnuXmNT+c58G9yi3Hrz2L9N+VdGsyMANuDBh1AdoQA59K5Tymrwr+8YVFNSr6
         iOdxcfmfpohdRQ8vHcK4kEFi7685+YBbDWio7YQwJOMJgT26K6/X66eTIcCHAYG3aG5M
         AIn2xWZR5ZtNJide87rLoxUEr842vXcXk3qe0wNLVRHyxdeo4jZfS5TkZpR/xZPFNXbx
         2TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJU8eQTrHMk3jqYitTK0s9c/y4olgE5eR7itETLxMTs=;
        b=m8oZDPi+A99AdxAG7jydS+7kgdx6eWi8+rXdZQVYGC5ar+jPzRYsevLgvSrIPdErI8
         FZnlmIflPTeJLtBk1nlcCQJ9ekW358RsQSdP4Gp8laxTbhVBk2Z52+GnDcSCRHhBqPI5
         TTwanh1Q/ER7LluSGtNDM2C+GcJrIymwaGXYXQEPmJ7luRRKL8tJGek0YhGQaUZvVIwY
         vUmakc59AA8dgUDowU/pHcgJHSkFWNQ0oo3WqG0V5OqvUtmkzRjPFIBeR7UytO0LLRLu
         mFDVlcKlZf12zqkkmKzkez9QtEmY/VnAmUZoobVid4/KQdv17XoUSTJb3ERysZZ95x+s
         fnnA==
X-Gm-Message-State: AOAM532YBM8KsnZG6YGCfzf6IZVgwMxpsLt8MEq3gL03w0w+kH26ZI0q
	fukHlq0Qu/dAMUqydFGD2Uo=
X-Google-Smtp-Source: ABdhPJxGEMfaZ0tGnNRtBHpxDycvnPtIYnQH7soeehKdm3LHDGp6mAVVr2luWLqKf0DPBBmngmQXyQ==
X-Received: by 2002:a17:90b:3553:: with SMTP id lt19mr12707460pjb.222.1616750199589;
        Fri, 26 Mar 2021 02:16:39 -0700 (PDT)
Received: from localhost ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id d8sm8930729pfq.27.2021.03.26.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:16:39 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:16:34 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <20210326171634.000011f5@gmail.com>
In-Reply-To: <YF2dXIxMOUyLzfnQ@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
	<YF2dXIxMOUyLzfnQ@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Mar 2021 09:37:48 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> > From: "Carlis" <zhangxuezhi1@yulong.com>
> > 
> > Change 'tft' to 'TFT'  
> 
> Why?  What is wrong with "tft"?
> 
I think abbreviations should be capitalized.
> > 
> > Signed-off-by: Carlis <zhangxuezhi1@yulong.com>  
> 
> Full name please.
> 
OK, i will use my full name next patch
> thanks,
> 
> greg k-h

