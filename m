Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB86D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 07:15:25 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x26so5511026pfn.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xQE1x5Wlwo0FkTtk1ID3OZqFs74eCdmYBQNxjWcjwgo=;
        b=qcKNudJvXRZGAb6RMTkLyyjO6OXwMsp0WiJOh0k225yb162e+0nVK7PkEXi2HJuEDP
         GnM7NOnF+yIF4f8kD5yIsZIBBux3GJ/t5tWw12Q9TnHb+W027qCYfkToYVss6ms1FTQW
         KVXD/ubqTm9esBiKWYRVnF344XyRhp/DFM7gxtNLE3iW6d9pMWiXScWSeoT+3Qq6nSER
         5pJ/GTCueomOAmDG/d/LaSfX9G/Ub0nKctmBvwDRxs365q9hY2XCxW1BlK23VLQOk9y+
         KF40+Qwh3BiI76aK+Ld1tT4NvvI/SkOVVxTHyynrpPYJPHTgq2LW59t4XEDWa031c/No
         2TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xQE1x5Wlwo0FkTtk1ID3OZqFs74eCdmYBQNxjWcjwgo=;
        b=ew7z9mvnWJ7BHHPfoCrKEHWekwbryJTXtXATuy5H4ct5hfag1rnpkB6mzz6o5xGUHZ
         m1XINn4EMgzcNLHJgCCkB34ZG9eXnr9AGfAAsEALXyVws5mUseK2ZJh1T1YaJWjfVzDf
         BJqI98ojIBLx48hN+hQVNHtn33vTpplmutM9PNtKqUdzzDpc3iDusulNI5pp0EGvugNW
         RaJ1LY8gRo8+S+NuQ7uIP/OnDMGV4B7mISHgTs8UHsDxeUStxG+7n63wEKppupAGiPKr
         FEKlcXlD7dxJW5cixYdR1u6Vx0E0wgDM+17+6vODrTMvRsEjQes172kQiIZ9iDdEe1rL
         BkkA==
X-Gm-Message-State: AOAM531E9hSvOAq3wnUgKBtcvTFH5EHe7W0GzUXO2fzoaWdzEzw/FEdx
	iv8DrMe1Puno0uuWcMSOztg=
X-Google-Smtp-Source: ABdhPJzoeFNegPROiZUCkPiphoW7Hrg9bxg2xwnfw33qrrc+B6UkpFtMMh4cRXqTW2vUL/vnqOk+Pw==
X-Received: by 2002:a05:6a00:1585:b029:203:6bc9:3ca6 with SMTP id u5-20020a056a001585b02902036bc93ca6mr1658045pfk.79.1617779724531;
        Wed, 07 Apr 2021 00:15:24 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id i7sm19631273pgq.16.2021.04.07.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:15:24 -0700 (PDT)
Date: Wed, 7 Apr 2021 00:15:22 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <YG1cCtbvINJ52tGT@localhost.localdomain>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <YG1aVx3UuXR2JrC+@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1aVx3UuXR2JrC+@kroah.com>

On Wed, Apr 07, 2021 at 09:08:07AM +0200, Greg KH wrote:
> On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> > Changes in v2:
> >     - Removed type information from variable names
> >     - Broken up the changes into smaller patches
> 
> Your subject is very odd :(

Sorry about that, I overlooked the fact that I reran format-patch. The
subject should be:

[PATCH] staging: sm750fb: Convert camel case to snake case

Should I resubmit?

-Pavle
