Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2903FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 08:26:41 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id s3so12720859edd.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 01:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=plkFbsG8fVa9CmkZK2Zfujgljkhb65tfZXNdzCcMUbQ=;
        b=ONTos8thIS3Rsw3Ml0sVEhTeBFWbxF9pLiCXAgij9nntDCbA5c2hYAOf+2VcLAQevm
         92rfUmtzpfN8Xuyej/roBMbmkPDisrs7tgIa31/aY9srdE8wGRpxG+lDhlJf5Htx0Qho
         euRD6Miiao4LP+dh19UgQPL/1dKXDfTzkN7684I7IjvnNEBRINe5SrZswL1nQvlnlRf8
         fn4RCfWnO8Nm36V/ZwPGH0xLFhWZVuLziHenr+bXwCHXAkbOxFU0LA4sTxs893V/mc4+
         Juc7FBgMuYE7qggyDbXoqgw2B9K6fm9aIzYfsFM1qEnqwyDv/SmyirDfBcKTO6BUi3M+
         8uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=plkFbsG8fVa9CmkZK2Zfujgljkhb65tfZXNdzCcMUbQ=;
        b=GVvq+4qiF4gz6QzS1kRc9UumutxDrEHfQBhbSEQBc35imVL0X4MVgbSVo9M5KLpH5X
         TWTzrw6O46Iu946fj4+Fm3YHX4U3onx7NgGMZPf1U/Pv8hV77iUqmEZx60jp1/Ml+Tq7
         B2GY88D0qPncdIWy//aAtATC/6NisePn7n0YEBvCxa3OlRbAMusz0wVSWgfB0SLZDCpE
         K/zM7udUxwmSfUi1quplg+Ev/JjO5BdfHJ0fWyLb8yu/R5OggpVWz1dbmwqHkaPqGTt5
         TeuehcevZS9wQTuvY65GLb41LXtgxD4ycH2Vsbw1uacHiipGcHYL3qN82oVnTWAumPrN
         AVxQ==
X-Gm-Message-State: AOAM530dWOgIPdEIBt6+/MsfrIj94ib4O+YTkQ7fxuDoT5D6FM/j2Fmz
	5kDwhPalYW+/Y6YXTMPyr9M=
X-Google-Smtp-Source: ABdhPJyDGcDcFSHABBXq0N86Iw0ZJluaX2DN9WQVwXKsSJSnR4pwTNT5RKte6PZ7ZwROV35l0Z/RAA==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr36105122eds.166.1629707199676;
        Mon, 23 Aug 2021 01:26:39 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id d16sm8773785edu.8.2021.08.23.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 01:26:39 -0700 (PDT)
Date: Mon, 23 Aug 2021 13:56:33 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Larry Finger' <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
Message-ID: <20210823082633.5bofcovr7bvtohde@xps.yggdrasil>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
 <4be5c5fa-c3fd-8c86-e904-8e2e60173380@lwfinger.net>
 <05aafb94be1b4e609250313709cd668d@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05aafb94be1b4e609250313709cd668d@AcuMS.aculab.com>

On 21/08/22 09:30PM, David Laight wrote:
> Modulo anything that really means it should get_unaligned_be32().
> 
> 	David

Thanks for your reviews David!
Will make this change!

Thanks,
Aakash Hemadri
