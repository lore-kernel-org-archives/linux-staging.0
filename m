Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F929CA
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 09:55:40 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id l15so4512264pls.7
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 01:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zFGzcYvSOCyKFk85uoXR06gkzPo3qnZX3+iKg13B8Qs=;
        b=fDe/ventyNhPXmnvbmLfT4xlloglwiYf+RpthMcLc5Pk0UbdbKiFlxNU4w/Jh12lz3
         0GMloo5wHSewYXABHYpnjgtrrGYLHoA0U+/1jqqXl8CcIsjy/LsqYalDEq2nNvZNRfaI
         cPgJfiyHspv4A+To9wy3XiGLfDfQYp7xI/Jq3BLwe/KqNCQ5oDws67Dttp7pUejRQIoW
         bwwZha9NFeQa6kotkd8fOF5d7wKrnnV+I4fn5f5lYh9xzTgf+In4zfETcKd40j+QN+w7
         aELX/H1EMfQOHx67fD4xZecWSzmw+l+37UeM49PHuuE7pMpaaBxOQPzFIeRbQeh5B383
         t6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zFGzcYvSOCyKFk85uoXR06gkzPo3qnZX3+iKg13B8Qs=;
        b=AeySyMqC6acZ15SVE56qY0BZLjFZ84duQUTPZ4ZV+jWoX3QtH1druKl4wdkZr1kCTo
         dwyYrL+QmZG1vKdPrTAAIMimujyzi9hi+DGkW6eXAjqrHu7G1WwKrNp43jbkdTy/LUgz
         d+mx48+tejdHsjkYQjOE+T/s9f1Rc9HM+Brrm9+h9OiLm5TP3DIIFQVZm2iZ7wguTR5+
         tFTYUr4CpXgdMo8gOM2sw4hHp4unxpOUmpzaLz+Mtsimuz9v0VV/9/iDdIuk8Hm8lbD+
         J3nUtHSnT2pKYRV+U7j9XFVQ3ZxTrl77E7Nl8ZLKk+pPTdY8hAO5GRNcPFmPdc68eGYd
         CZ/w==
X-Gm-Message-State: AOAM5300I+Rgjl+j3MyXwKygnMWan+eGRx4JnZk4jwUJlP/dVXpKJh68
	yAH/FGptEi+ipLQNWhkp+vQ=
X-Google-Smtp-Source: ABdhPJxO1HqtsaEul2VvPlXMzFWkpde4PUaL57aUmXCzXUP4g3slVu5RUBEc82gJdiJHoSSSFqUQ5g==
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr14742426pjb.75.1641549340245;
        Fri, 07 Jan 2022 01:55:40 -0800 (PST)
Received: from nlap2 ([171.78.146.184])
        by smtp.gmail.com with ESMTPSA id s7sm5635783pfu.133.2022.01.07.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:55:39 -0800 (PST)
Date: Fri, 7 Jan 2022 15:25:32 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: r8188eu: change functions to return void
Message-ID: <20220107095532.gosbmlwdmnljxbxp@nlap2>
References: <cover.1641490034.git.abdun.nihaal@gmail.com>
 <9db6b08837bd6354c8e07a4b1c4bca662091f945.1641490034.git.abdun.nihaal@gmail.com>
 <Ydct2sBt6aB+MChS@kroah.com>
 <20220107065210.7utcwjenvcspydyk@nlap2>
 <20220107085852.GQ7674@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107085852.GQ7674@kadam>

Hello,

On Fri, Jan 07, 2022 at 11:58:52AM +0300, Dan Carpenter wrote:
> You're not allowed to end a void function with a return statement.

Sorry, I didn't know that. I'll fix it.

> Checkpatch will only detect these if you run it again with the -f
> option.

Thanks. I'll make sure to run checkpatch on the modified files also (not
just on the patches).

Regards,
Abdun Nihaal
