Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B99173
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 06:52:18 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id i8so4684754pgt.13
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R1MbqjjHlpwAkbujyAZzAl4HorX8RJtW6RCBhq0VRmY=;
        b=YGZ+fwK7uqgnP0cbS69isHiEPZLNAEUtfGVRtBCLnZ5PLeTKmf6u3zi1tDvyhu8GAQ
         6n9orQGMOmMPhW0HXwEZeIc+Anb2vxbXdrNIlWYJabmqm7X4v1WGQLGsi/4I9HCM7hdi
         GQhd6gsSYJd5w/MV1lpxTdSLbonKNKQDrw2Su3mQmODioS10xcI8yoteiU84uD7niwEr
         sZf0CqAEZzZWj3R1iNXNoAzlAxMouhS73dSJ/mUHOPNkdTpcmz2MW8qiregTvN1Lt6Mb
         n5h82aaGl997KWtEtv7b65/DE7Rg09jh2cif807kcbKgEIHV5zai3X3DueheuOuxJjFn
         gnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R1MbqjjHlpwAkbujyAZzAl4HorX8RJtW6RCBhq0VRmY=;
        b=XJvWzkewuLeqVTCkQSbeZd8ZupJBaG/3VBIKI727RDQj+vV11uXGnDY5M9ndjZOCeS
         aEupN3TptQCTOh7peUrcIq/OFFfkz4vytrJirxJ4o1Px8sEpVudnlPrFC7iwUV7TU4gJ
         y7+qYVZZlaEVk7ErEkt3VRlgUA3I6IbG2rw9RLT/e8YGGOSnzGdXaLcbwkMg+sg4lwIi
         vP3MS/IMDBxzLry6aBGywbgUaI3EM56HasxqCVuIWTTGT++IyPXvD5zRCa6GEdEWd3IW
         qbah3uUWSrRpd2o3RMymL4oxQ52zNutgKXvmR3GtGEL0Zwz/XtqrNdmTjmuefn6OR0UB
         DIpQ==
X-Gm-Message-State: AOAM530uLKLFUhfhUAbVIDBdsnoDteCJWFwee8/NlNKXc5itGLX+Gn5h
	AH5BmY5/61urQTFz/6wcj/s=
X-Google-Smtp-Source: ABdhPJySAFJK6FIQ6td62XvHq169EysjllUEfbwhF5Wjwe6eFzSfyCJUAsyXZAyybo1q4XAiC2E60A==
X-Received: by 2002:a05:6a00:892:b0:4ba:12d5:1d4 with SMTP id q18-20020a056a00089200b004ba12d501d4mr64311542pfj.46.1641538338089;
        Thu, 06 Jan 2022 22:52:18 -0800 (PST)
Received: from nlap2 ([171.78.146.184])
        by smtp.gmail.com with ESMTPSA id g9sm4688248pfj.123.2022.01.06.22.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 22:52:17 -0800 (PST)
Date: Fri, 7 Jan 2022 12:22:10 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: r8188eu: change functions to return void
Message-ID: <20220107065210.7utcwjenvcspydyk@nlap2>
References: <cover.1641490034.git.abdun.nihaal@gmail.com>
 <9db6b08837bd6354c8e07a4b1c4bca662091f945.1641490034.git.abdun.nihaal@gmail.com>
 <Ydct2sBt6aB+MChS@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydct2sBt6aB+MChS@kroah.com>

Hello Greg,

On Thu, Jan 06, 2022 at 06:58:50PM +0100, Greg KH wrote:
> On Thu, Jan 06, 2022 at 11:11:52PM +0530, Abdun Nihaal wrote:
> > Some functions in ioctl_linux.c always returns 0 and their return values
> > are never used. Change return type of such functions to void.
> > 
> > While at it, align function arguments with open parenthesis to fix
> > checkpatch checks.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> 
> Are you sure that checkpatch allowed this change?

Yes, I ran checkpatch on both the patches and found no errors, warnings
or checks. Is there something that needs to be fixed?

Regards,
Abdun Nihaal
