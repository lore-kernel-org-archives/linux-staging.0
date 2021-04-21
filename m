Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6871
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 17:10:50 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id mh2so43040058ejb.8
        for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rkwiaa+jDirhSShgjwe6icAk4sFKZ5EO8zRW1jIFg44=;
        b=DsDkE0eGwAkD3YmuxAcuy1TVhxXhwELGxCW2xA2E4g2uydgtItcJNYoH9Sa58mIvvF
         QybA/NKXi81EHOrwzVNacmnzawvR11PDtRhfgLGd8C5TmnBHTzFw/2AVC6RfyrCmNKna
         M/mpe1xHHKnkaWeHcWhkeOWhwLfMCIq36kWufAu9eIU2cyilL/CMEsCXA3hjRtH3Hz8L
         5/4Wd7kFie2NDNoPnyqodl+d6H5whYRXLuQn843retaqEt5vp/Bg1R3rJgEDDSsIAJWv
         nGmAmXeKhophjawX8YjH3WAdfalFEF5Sm24lajzgzj/ILVocLJyexA2HEDXMtUkF5bcr
         B4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rkwiaa+jDirhSShgjwe6icAk4sFKZ5EO8zRW1jIFg44=;
        b=Kob9hQGuxmuk1g4qs2TkZQmM7Jf9Zpw+UPpOmf09fjnWoWYOw2geK2gGDlRmdpXgxy
         qtJGjMBFbH+W1R+FIDF06K/wlSAa6bwX6+0BASQUdaIeE65cOpUw4gIpG1bgF8GpTpb4
         V2WEV1iIjrXJjQ62xG6Zi/4oRPuGJafpg5ayKv2wLmGV4KVHk8N0LrWKda7lB1aZMBaJ
         QnCB9Z/ZP2W5g+eH0qangC6aHvVY2yR2StTr2AUk/h5X2mxDVym9TfZDog7OtQ6BWuea
         CcjpkgMNcC88bCiQz1e5v7Wq2MHAxtDwMSLNm8Qsk4fzIgKr98U9Gir/wpsarsNPTjFx
         +UCw==
X-Gm-Message-State: AOAM532kA4PY6zZALABGUUQzakhtH7o0im3D7JvgeTYkbJwhVaFf69Ff
	B80cqcJ8Yw5c0T174mENjQA=
X-Google-Smtp-Source: ABdhPJxyXGyiyR0G9YsfYYLPW+LoFsrJ+5akqfwUQh7rQhXfA32oUMLzR/q7nluYdZEEogQZrk5UBQ==
X-Received: by 2002:a17:906:28c9:: with SMTP id p9mr35058595ejd.111.1619025049289;
        Wed, 21 Apr 2021 10:10:49 -0700 (PDT)
Received: from agape.jhs ([5.171.81.3])
        by smtp.gmail.com with ESMTPSA id dc24sm66566ejb.123.2021.04.21.10.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:10:49 -0700 (PDT)
Date: Wed, 21 Apr 2021 19:10:46 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210421171045.GB1414@agape.jhs>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> Reformat code comment blocks according to the coding style guidelines.
> This resolves different checkpatch script WARNINGs around block comments.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes in v1:
>    - implement following changes suggested by Fabio Aiuto                              
>        a. Corrected commenting style                                                               
>        b. Similar style implemented for other comment blocks in                                    
>           the same files.                                       

If you want to tag me you should add the Suggested-by: tag in commit message
before Signed-off-by tag...

$ vim +485 Documentation/process/submitting-patches.rst

thank you,

fabio
