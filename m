Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A43FC1
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 14:19:51 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id a21so11255043pfh.5
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4BEOSYks7kKTIJey8qCXq/FjaQ8h7AUNhWZJcjwIWNU=;
        b=s3mgcInIvBRJt3ELH3xZBXGzK/FWLP0b1agTD5IFB07W2zkrGVSwD6+s5KGtPPCcAH
         wfQ2XlLNwOp1AoD/FyOaGmxG2N/Vf/LyiQgFvFBKfm5SPcRbtK+5ItneaG1qMy0j1VIU
         yGK1xHngjTzKWUI09kNloMPdT0jA2QhwpGDsFlA89ciQJTMAcX9boHGWdfVKeTtlQ9ab
         iJObsOQw0woXiyVXDi+WMCAixC/6bItB/sizFmTeLsgkuTVqmf8Rbef3EmlEIXDgTtAZ
         g+NIkB1yPcxAHWJ4mz+nxNGI6tLmg9G+npu7SFaFc/WmOLFZjuvutELn849ztvd6vjIX
         lNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4BEOSYks7kKTIJey8qCXq/FjaQ8h7AUNhWZJcjwIWNU=;
        b=g7b/AXu3rHZZllFhROYcu5v0+Ts/f8ctxZ7n+dONzGhupx8FjuDfri4R9segQXnlff
         E0atZCD5ABle3goMeq+kNtk2XJUelZjY0JMp5j//arM2ZfZIDFPIGoVpLaCQ2/jmNkms
         XbID8w6ZOcIE5iORGjcFCV0j7cu42i77d2GaeVrYfO0mP/Bbj9LGJpWFe6d0+oRIMyGw
         BpJiKqSN1vkJyI2hOU7mKErt0o495MdB+c7DwpFEJLCmRMWbf80UgNXUa0sgVvWkT8gs
         kwRMDlHA1Fon2DMP1hbbY0+Wjz5a57n1eebwLQMtdiotcF/gFNo+/PNR33UPOkGW9Zgl
         IcEA==
X-Gm-Message-State: AOAM530VAZ+IsZ33KgMwIBrdA+tznvKFMlb5FGidDUyqS1zl1rXQO9E7
	bc05//oXRK9yiUFO8i/bYCpjfsPrh8Q1i5/Z
X-Google-Smtp-Source: ABdhPJwjuaXP2lPOjBb/KDrb1Toq+PIpVlVKfOj2NxKzLN7RwywoHZDi30NsZBUBx8fzGGLmXqxQzQ==
X-Received: by 2002:a63:496:: with SMTP id 144mr23544336pge.353.1629555591510;
        Sat, 21 Aug 2021 07:19:51 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id r17sm12992641pgu.8.2021.08.21.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 07:19:51 -0700 (PDT)
Date: Sat, 21 Aug 2021 19:49:49 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] staging: r8188eu: incorrect type in
 csum_ipv6_magic
Message-ID: <20210821141949.55l7zcjifbxv6pao@xps.yggdrasil>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <8bc15e51751c26fd19428f3b4976b7495feecd34.1629360917.git.aakashhemadri123@gmail.com>
 <58069e38-a457-9fcc-0a9a-6bfe8723a178@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58069e38-a457-9fcc-0a9a-6bfe8723a178@lwfinger.net>

On 21/08/20 04:38PM, Larry Finger wrote:
> This patch is correct, but I prefer that you use be16_to_cpu() rather than
> ntohs(). I think it makes the code easier to read.

Sure Larry, Will use be16_to_cpu()

Thanks,
Aakash Hemadri
